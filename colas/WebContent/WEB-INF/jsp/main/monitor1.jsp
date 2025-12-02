<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="librerias/css/estilosmonitor.css">

<title>::ICLASSQ::</title>
<meta name="theme-color" content="#FFA000"> 

</head>
<body>
	<audio id="player">
    	<source src="librerias/sonido/llamada1.mp3" type="audio/mp3">
 	</audio>
   	<div id="video_carousel">
	  <div id="video_background_container">
	    <video id="video_background" src="" autoplay controls></video>
	  </div>
	  <ul id="playlist" hidden></ul>
	</div>
<!-- 	<div id="video_carousel"> -->
<!--         <video id="video_background"  autoplay playsinline muted> -->
<!--         </video> -->
<!--     </div> -->
   	
   
<footer>
 		<table id="tbl_mostrar_celdas">  
	  		   
        </table>
        <marquee id="txtPublicidad" direction="left"></marquee>

    </footer>

<!-- <script src="librerias/js/jquery-3.3.1.js"></script> -->

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
var videoData = [];
var index = 0;
var host = "";
function init(data, newVideo) {
	var playlist = $("#playlist");
	var videoBackground = $("#video_background");

	var hasElements = playlist.children().length > 0;
	
	if (!hasElements) {
		playlist.empty();
	}

	for (var i = 0; i < data.length; i++) {
		var listItem = $("<li></li>");
		var videoLink = $("<a></a>")
			.attr("href", "http://" + host + "/" + data[i].urlVideo)
			.text("Video " + (i + 1));
		
		listItem.append(videoLink);
		playlist.append(listItem);
	}

	if (newVideo) {
		var newListItem = $("<li></li>");
		var newVideoLink = $("<a></a>")
			.attr("href", "http://" + host + "/" + newVideo.urlVideo)
			.text("Video " + (data.length + 1));
		
		newListItem.append(newVideoLink);
		playlist.append(newListItem);
	}

	function reproducirVideo() {
	    console.log("Reproduciendo video " + (index + 1));
	    var url = $("#playlist li a").eq(index).attr("href");
	    var nombreVideo = url.substring(url.lastIndexOf("/") + 1);
	    verificarVideoExistente(nombreVideo, function (videoExists) {
	      if (videoExists) {
	        videoBackground.attr("src", url);
	        videoBackground[0].volume = 1.0;
	        videoBackground[0].play();
	      } else {
	        eliminarVideoActual();
	      }
	    });
	  }
	
	function verificarVideoExistente(nombreVideo, callback) {
	    $.ajax({
	      url: "verificarVideoExistente.app",
	      type: "GET",
	      data: { nombreVideo: nombreVideo },
	      success: function (response) {
	        callback(response.exists);
	      },
	      error: function (xhr, status, error) {
	        callback(false);
	      },
	    });
	  }

	function eliminarVideoActual() {
	    var currentVideoLink = $("#playlist li a").eq(index);
	    currentVideoLink.parent().remove();

	    if (index === 0) {
	      reproducirVideo();
	    } else {
	      index--;
	    }
	  }

	playlist.on("click", "li a", function(event) {
	event.preventDefault();
	index = $(this).parent().index();
	reproducirVideo();
	});

	videoBackground.on("ended", function() {
	index++;
	if (index >= $("#playlist li a").length) {
	  index = 0;
	}
	reproducirVideo();
	});
	
	videoBackground.on("pause", function () {
	    videoBackground[0].play();
	  });

	if (!hasElements) {
		reproducirVideo();
	}
}

function ListarVideos(newVideo) {
	$.ajax({
		type: 'POST',
		url: 'listarvideos.app',
		data: { idSucursal: idSucursal },
		success: function(response) {
			var data = response.data;
			if (data.length > 0) {
				if (videoData.length < data.length) {
					var newVideos = data.slice(videoData.length);
					videoData = data;
					init(videoData, newVideos);
				}
			}
		}
	});
}

$(document).ready(function(){
	var idSucursal ='${usuario.iSucursal}';
	var idUsuario ='${usuario.iUsuarioId}';
	var idTipoMonitor ='${usuario.iMonitorTipo}';
	var iRolEquipo ='${usuario.iRolEquipo}';
	var nombreUsuario = '${usuario.vUsuarioUsername}'; 

	ListarVideos();
	setInterval(ListarVideos, 900000); //900000
	
	$.ajax({
		type: 'POST',
		url: 'getsucursalbyid.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#nombreSucursal').html(data.nombre);
		}
	});
	
	$.ajax({
		type: 'POST',
		url: 'geturltomcat.app',
		success: function (response) {
			host = response.data;
		}
	});
	
// 	mostrar celdas
	var element='';
	if(idTipoMonitor==1){
		element='<tr>'+
				'<td id="celda0" width="33.33%" ></td>'+
				'<td id="celda1" width="33.33%" ></td>'+
				'<td id="celda2" width="33.33%" ></td>'+
			'</tr>'+
			'<tr>'+
			    '<td id="celda3"></td>'+
				'<td id="celda4"></td>'+
				'<td id="celda5"></td>'+
			'</tr>';
		$('#tbl_mostrar_celdas').append(element);
	}
	else if(idTipoMonitor==2){
			element='<tr>'+
			'<td id="celda0" width="50%"></td>'+
			'<td id="celda1" width="50%"></td>'+
		'</tr>'+
		'<tr>'+
		    '<td id="celda2"></td>'+
			'<td id="celda3"></td>'+
		'</tr>';
		$('#tbl_mostrar_celdas').append(element);
	}
	else{
		element='<tr>'+
			'<td id="celda0"></td>'+
			'<td id="celda1"></td>'+
		'</tr>'+
		'<tr>'+
			'<td id="celda2"></td>'+
		    '<td id="celda3"></td>'+
		'</tr>';
		$('#tbl_mostrar_celdas').append(element);
	}
	
	console.log("idSuc: "+idSucursal);
	console.log("idUsuario: "+idUsuario);
	console.log("idTipoMonitor: "+idTipoMonitor);
	console.log("iRolEquipo: "+iRolEquipo);
	
		$.ajax({
			type: 'POST',
			url: 'gettextopublicidad.app',
			data: {idSucursal: idSucursal},
			success: function (response) {
				var data = response.data;
				console.log("publicidad");								
				$("#txtPublicidad").html(data);
			}
		});
});

		var idSucursal ='${usuario.iSucursal}';
		var idUsuario ='${usuario.iUsuarioId}';
		var idTipoMonitor ='${usuario.iMonitorTipo}';
		var iRolEquipo ='${usuario.iRolEquipo}';
	//mostrar atenciones
		setInterval(mostrarTurno,1000);
	    function mostrarTurno(){								       
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'mostraratenciones.app',
	    		data: {idUsuario: idUsuario, idSucursal: idSucursal, idTipoMonitor: idTipoMonitor, 
		    		iRolEquipo: iRolEquipo},
	    		success: function (response) {
	    			var data = response.data;
	    			for(var i =0; i<data.length; i++){	
	    				var parts1 = data[i].ticketTexto.split("-");
 						console.log(parts1);
 						var tickettexto=parts1[0]+parts1[1];
 						console.log('ticket texto');
 						console.log(tickettexto);
	    				if(data[i].estado==1){																														        
							$('#celda'+i).text(tickettexto+ "\u21e8" + data[i].nombreVentanilla);							
							$('#celda'+i).addClass( "activo parpadea");
						}else {
							$('#celda'+i).text(tickettexto	+"\u21d4"+data[i].nombreVentanilla);							
							$('#celda'+i).removeClass("activo parpadea");
						}
		    		}
	    			
	    		}
	    	});	    	
	    }

	    setInterval(llamarSonidoXMonitor,1000);
	    function llamarSonidoXMonitor(){
	    	console.log("entro a sonido monitor");
			var playing = false;
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'sonidoatenciones.app',
	    		data: {iRolEquipo: iRolEquipo}, 	    		
	    		success: function (response) {
	    			var data = response.data;		
	    			console.log("timbre");
	    			console.log(response.data);
	    			if(response.success!=false){	
	    				if(playing == false){
							document.getElementById('player').play();
							document.getElementById('player').volume = 1;
							playing= true;
						}
						else{
							document.getElementById('player').pause();
							playing= false;			
						}	
		    		}	
	    		}
	    	});
	    }
		//idUsuario =110;
	    setInterval(verificarNuevoTurno,1000);	    
	    function verificarNuevoTurno(){										       
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'verificarnuevoturno.app',
	    		data: {idUsuario: idUsuario, idSucursal: idSucursal, idTipoMonitor: idTipoMonitor, iRolEquipo:iRolEquipo},	    		    		
	    		success: function (response) {		    			
	    			var data = response.data;			
	    			if(data==1){}	
	    		}
	    	});	    	
	    }

	    setInterval(eliminarTurno,15000);	    
	    function eliminarTurno(){										       
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'eliminarturno.app',
	    		data: {idUsuario: idUsuario, idSucursal: idSucursal, idTipoMonitor: idTipoMonitor, iRolEquipo:iRolEquipo},	    		    		
	    		success: function (response) {		    			
	    			var data = response.data;			
	    			if(data==1){}	
	    		}
	    	});	    	
	    }
	    
	    setInterval(verificarNuevoLlamadoVoz,1000);	    
	    function verificarNuevoLlamadoVoz(){
	    	console.log("entro a llamado voz");
		    var playing1= false;	
	    	var idUsuario ='${usuario.iUsuarioId}';	    	
	    	var iRolEquipo ='${usuario.iRolEquipo}';	
	    	$.ajax({
	    		type: 'POST', 
	    		url: 'verificarnuevollamadovoz.app',
	    		data: {iRolEquipo: iRolEquipo},	    		    		
	    		success: function (response) {	    			
	    			var data = response.data;
	    			if(response.success!=false){	
	    				if(playing1 == false){
							document.getElementById('player').play();
							document.getElementById('player').volume = 1;
							playing= true;
						}
						else{
							document.getElementById('player').pause();
							playing= false;			
						}	
		    		}
	    		}
	    	});	    	
	    }
	    
	    function verificarNuevoLlamadoVoz1(){
		    var playing1= false;	
	    	var idUsuario ='${usuario.iUsuarioId}';	    	
	    	var iRolEquipo ='${usuario.iRolEquipo}';													  
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'verificarnuevollamadovoz.app',
	    		data: {iRolEquipo: iRolEquipo},	    		    		
	    		success: function (response) {	    			
	    			var data = response.data;
	    			if (data.length!=0){
	    				if(playing1 ==false){								
	    					var parts1 = data.codigo.split("-");
							var parts2 = data.descripcionVentanilla;
							console.log(parts1+" "+parts2);
							var textoAEscuchar = parts1[0]+' '+parts1[1]+ ' acercarse a ' +parts2;
							var mensaje = new SpeechSynthesisUtterance();
							mensaje.lang = 'es-US';
							mensaje.volumen = 1;
							mensaje.rate =1.1;
							mensaje.text = textoAEscuchar;
							mensaje.pitch =1;
							speechSynthesis.speak(mensaje);
							playing1 = true;
						}
						else{	
							playing1 = false;
						}
		    		}
	    			else{
		    			console.log("no hay datos");
		    		}
	    		}
	    	});	    	
	    }
	    
		window.onbeforeunload = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "logout.app", true);
			xhr.send();
		};
</script>
</body>
</html>