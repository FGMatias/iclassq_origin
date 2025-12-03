<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body, html {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    
    #tbl_mostrar_celdas {
        width: 100%;
        height: 100%;
        border-collapse: collapse;
        table-layout: fixed;
    }
    
    #tbl_mostrar_celdas tr {
        height: 50%;
    }
    
    #tbl_mostrar_celdas td {
        border: 3px solid #0277BD;
        text-align: center;
        vertical-align: middle;
        font-size: 4vw;
        font-weight: bold;
        padding: 20px;
        background-color: white;
        width: 33.33%;
    }
    
    .activo {
        background-color: #4CAF50 !important;
        color: white;
    }
    
    @keyframes parpadeo {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.3; }
    }
    
    .parpadea {
        animation: parpadeo 1s infinite;
    }
    
    #txtPublicidad {
        display: none;
    }
</style>

<title>::ICLASSQ::</title>
<meta name="theme-color" content="#FFA000"> 

</head>
<body>
	<audio id="player">
    	<source src="librerias/sonido/llamada1.mp3" type="audio/mp3">
 	</audio>
   	
 	<table id="tbl_mostrar_celdas"></table>
    
    <marquee id="txtPublicidad" direction="left"></marquee>

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var idSucursal ='${usuario.iSucursal}';
	var idUsuario ='${usuario.iUsuarioId}';
	var idTipoMonitor ='${usuario.iMonitorTipo}';
	var iRolEquipo ='${usuario.iRolEquipo}';
	var nombreUsuario = '${usuario.vUsuarioUsername}'; 
	console.log(nombreUsuario);
	
	var element = '<tr>'+
				'<td id="celda0"></td>'+
				'<td id="celda1"></td>'+
				'<td id="celda2"></td>'+
			'</tr>'+
			'<tr>'+
			    '<td id="celda3"></td>'+
				'<td id="celda4"></td>'+
				'<td id="celda5"></td>'+
			'</tr>';
	$('#tbl_mostrar_celdas').append(element);
	
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