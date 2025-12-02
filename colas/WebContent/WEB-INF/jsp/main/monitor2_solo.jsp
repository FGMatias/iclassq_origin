<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="librerias/css/estilosmonitorpj.css">

<title>::ICLASSQ::</title>
<meta name="theme-color" content="#FFA000"> 

</head>
<body style="background-color: #D6D6D6">
	<audio id="player">
    	<source src="librerias/sonido/llamada1.mp3" type="audio/mp3">
 	</audio>		
    <div class="card">
       <div id="MostrarInformacionPJ"  class="card-body">
           <table>
			<thead>
		    	<tr>
				    <th> OGU</th>
				    <th> Penal </th>
				    <th> Familia </th>
				    <th> Laboral </th>
				    <th> Paz </th>
		     	</tr>
		     </thead>
		     <tbody>
		     	<tr> 
			     	<td>  
				 		<div style="width:20%;">
				 			<div id="titulo_proximo_turnoOGU"></div> 			
				 			<div id="siguientes_turnosOGU"> </div>
				 		</div>
					</td>
					<td>
			 			<div style="width:20%;">
			 				<div id="titulo_proximo_turnoPEN"> </div> 			
			 				<div id="siguientes_turnosPEN"></div>
			 			</div>
			 		</td>
			 		<td>	 		
				 		<div style="width:20%;">
				 			<div id="titulo_proximo_turnoFAM"> </div> 			
				 			<div id="siguientes_turnosFAM"></div>
				 		</div>
					</td>	
			 		<td>
				 		<div style="width:20%;">
				 			<div id="titulo_proximo_turnoLAB"> </div> 			
				 			<div id="siguientes_turnoslAB"></div>
				 		</div>
			 		<td>
			 			<div style="width:20%;">
			 				<div id="titulo_proximo_turnoPAZ">  </div> 			
			 				<div id="siguientes_turnosPAZ"></div>
			 			</div>
			 		</td> 
				</tr>		 
		 		</tbody>
		 	</table>
		 	</div>
	 	</div>

 	
	<footer>
 		<table id="tbl_mostrar_celdas">  
	  		   
        </table>
        <marquee id="txtPublicidad" ></marquee>
    </footer>

<!-- <script src="librerias/js/jquery-3.3.1.js"></script> -->

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
	var element='';	
	element='<tr>'+
		'<td id="celda0"></td>'+
		'<td id="celda1"></td>'+

	'</tr>'+
	'<tr>'+
	'<td id="celda2"></td>'+
	'<td id="celda3"></td>'+
	'</tr>';
	$('#tbl_mostrar_celdas').append(element);

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
					if(data[i].estado==1){																														        
						$('#celda'+i).text(data[i].ticketTexto+ "\u21e8" + data[i].nombreVentanilla);							
						$('#celda'+i).addClass( "activo parpadea");
	
					}else {
						$('#celda'+i).text(data[i].ticketTexto+"\u21d4"+data[i].nombreVentanilla);							
						$('#celda'+i).removeClass("activo parpadea");
					}
	    		}
				
			}
		});	    	
	}
	setInterval(llamarSonidoXMonitor,1000);
	function llamarSonidoXMonitor(){
		console.log('1111->>'+iRolEquipo);
		var playing = false;
		$.ajax({ 
			type: 'POST', 
			url: 'sonidoatenciones.app',
			data: {iRolEquipo: iRolEquipo}, 	    		
			success: function (response) {
				var data = response.data;
				console.log('data->>');
				console.log(data);
				if(response.success!=false){	
					if(playing == false){
						document.getElementById('player').play();
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
	//verificar nuevo turno
	//idUsuario =110;
    setInterval(verificarNuevoTurno,1000);	    
    function verificarNuevoTurno(){										       
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'verificarnuevoturnopj.app',
	    		data: {idUsuario: idUsuario, idSucursal: idSucursal, idTipoMonitor: idTipoMonitor, iRolEquipo:iRolEquipo},	    		    		
	    		success: function (response) {		    			
	    			var data = response.data;			
	    			if(data==1){}	
	    		}
	    	});	    	
    }
    
    // mostrar proximos turnos
    setInterval(mostrarProximosTurnos,3000);
	    function mostrarProximosTurnos(){
	    	var idSucursal='${usuario.iSucursal}';
	    	
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'19'},
				success: function (response) {
					var data = response.data;	
					console.log(data);
					$('#siguientes_turnosOGU').empty();
					var html;						
					for(var i=0; i<5; i++){									
						html = '<div id="turno'+i+'>'+
			 						'<div><a href="#" class="nombreEspera">'+data[i].descripcion+'</a></div>'+
							'</div>';	        					
					$('#siguientes_turnosOGU').append(html);
		    		}	
				}
			});    
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'21'},
				success: function (response) {
					var data = response.data;	
					console.log(data);
					$('#siguientes_turnosPEN').empty();
					var html;						
					for(var i=0; i<5; i++){									
						html = '<div id="turno'+i+'>'+
			 						'<div><a href="#" class="nombreEspera">'+data[i].descripcion+'</a></div>'+
							'</div>';	        					
					$('#siguientes_turnosPEN').append(html);
		    		}	
				}
			});    
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'24'},
				success: function (response) {
					var data = response.data;	
					console.log(data);
					$('#siguientes_turnosFAM').empty();
					var html;						
					for(var i=0; i<5; i++){									
						html = '<div id="turno'+i+'>'+
			 						'<div><a href="#" class="nombreEspera">'+data[i].descripcion+'</a></div>'+

							'</div>';	        					
					$('#siguientes_turnosFAM').append(html);
		    		}	
				}
			});    
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'22'},
				success: function (response) {
					var data = response.data;	
					console.log(data);
					$('#siguientes_turnosLAB').empty();
					var html;						
					for(var i=0; i<5; i++){									
						html = '<div id="turno'+i+'>'+
			 						'<div><a href="#" class="nombreEspera">'+data[i].descripcion+'</a></div>'+
			 						
							'</div>';	        					
					$('#siguientes_turnosLAB').append(html);
		    		}	
				}
			}); 
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'23'},
				success: function (response) {
					var data = response.data;	
					console.log(data);
					$('#siguientes_turnosPAZ').empty();
					var html;						
					for(var i=0; i<5; i++){									
						html = '<div id="turno'+i+'>'+
			 						'<div><a href="#" class="nombreEspera">'+data[i].descripcion+'</a></div>'+
							'</div>';	        					
					$('#siguientes_turnosPAZ').append(html);
		    		}	
				}
			}); 
	    }
	    
	    setInterval(verificarNuevoLlamadoVoz,1000);	    
	    function verificarNuevoLlamadoVoz(){
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
							var parts2 = 'VE'+' '+data.nombreVentanilla.substr(1);
							console.log(parts1+" "+parts2);
							var textoAEscuchar = parts1[0]+' '+parts1[1]+ ' acercarse a ' +parts2;
							var mensaje = new SpeechSynthesisUtterance();
							mensaje.volumen = 1;
							mensaje.rate =0.6;
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
    

</script>
</body>
</html>