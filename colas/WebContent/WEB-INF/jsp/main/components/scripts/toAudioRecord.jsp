<script>
	window.isRecordingAudio = false;
	var listaDeDispositivos = document.getElementById("listaDeDispositivos");
	
	function tieneSoporteUserMedia() {
	    return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia);
	}
	
	function limpiarSelect() {
		for (let x = listaDeDispositivos.options.length - 1; x >= 0; x--) {
	        listaDeDispositivos.options.remove(x);
	    }
	}
	
	var mediaRecorder;
	
	function llenarLista() {
	    navigator.mediaDevices.enumerateDevices().then(function (dispositivos) {
	        limpiarSelect();
	        dispositivos.forEach(function (dispositivo, indice) {
	            if (dispositivo.kind == "audioinput") {
	                var opcion = document.createElement("option");
	                opcion.text = dispositivo.label || "Dispositivo " + (indice + 1);
	                opcion.value = dispositivo.deviceId;
	                listaDeDispositivos.appendChild(opcion);
	            }
	        });
	    });
	}
	
	function init() {
	    if (!tieneSoporteUserMedia()) {
	        alert("Tu navegador no soporta esta funcionalidad.");
	        return;
	    }
	
	    llenarLista();
	}
	
	function fnIniciaGrabacionAudio(idUsuario, idTicket, idSucursal) {
		var options = {};
		
	    if (window.isRecordingAudio || mediaRecorder) {
	    	onsole.log("Ya se está grabando audio");
	        return;
	    }
	    
	    if (!listaDeDispositivos.options.length) {
	        alert("No hay dispositivos");
	        return;
	    }
	    
	    if (MediaRecorder.isTypeSupported('audio/webm;codecs=opus')) {
	    	options.mimeType = 'audio/webm;codecs=opus';
	    } else if (MediaRecorder.isTypeSupported('audio/mp4')) {
	    	options.mimeType = 'audio/mp4';
	    }
	
	    navigator.mediaDevices.getUserMedia({
	        audio: {
	            deviceId: listaDeDispositivos.value
	        }
	    }).then(function(stream) {
	        mediaRecorder = new MediaRecorder(stream, options);
	        window.isRecordingAudio = true;
	        mediaRecorder.start();
	
	        var fragmentosDeAudio = [];
	
	        mediaRecorder.addEventListener("dataavailable", function(evento) {
	            fragmentosDeAudio.push(evento.data);
	        });
	
	        mediaRecorder.addEventListener("stop", function() {
	            stream.getTracks().forEach(function(track) {
	                track.stop();
	            });
	            window.isRecordingAudio = false;
	            
	            var blobAudio = new Blob(fragmentosDeAudio);
	            var fileReader = new FileReader();
	            fileReader.onload = function(evt) {
	            	var audioBytes = new Uint8Array(evt.target.result);
	
	            	var headers = {
	           			'Content-Type': 'application/octet-stream', 
	           		    'X-ID-Usuario': idUsuario,
	           		    'X-ID-Ticket': idTicket,
	           		    'X-ID-Sucursal': idSucursal,
	            	};
	            	
	            	var requestOptions = {
	            		method: 'POST',
	            		headers: headers,
	            		body: audioBytes
	            	};
	            	
	            	fetch('subirAudio.app', requestOptions)
	            		.then(function(response) {
	            			if (response.ok) {
	            				return response.json();
	            			} else {
	            				throw new Error('Error en la solicitud');
	            			}
	            		})
	            		.then(function(data) {
	            			console.log(data);
	            		})
	            		.catch(function(error) {
	            			console.log(error);
	            		})
	            };
	            fileReader.readAsArrayBuffer(blobAudio);
	        });
	    }).catch(function(error) {
	        console.log(error);
	        window.isRecordingAudio = false;
	    });
	}
	
	function fnFinGrabacionAudio() {
	    if (!mediaRecorder || !window.isRecordingAudio) {
	        alert("No se está grabando");
	        return;
	    }
	    console.log("Finalizo la grabacion");
	    mediaRecorder.stop();
	    mediaRecorder = null;
	    window.isRecordingAudio = false;
	}
</script>