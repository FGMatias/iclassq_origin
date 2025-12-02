<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="librerias/css/estilosmonitor5.css">

<title>::ICLASSQ::</title>
<meta name="theme-color" content="#FFA000"> 

</head>
<body style="background-color: #D6D6D6; height:100px"  >
	<audio id="player">
    	<source src="librerias/sonido/llamada1.mp3" type="audio/mp3">
 	</audio>
	<div class="container">
		<div class="datagrid">
		<table id="tblListadoTicketEspera" style="height: 50px; text-align: center">
 			<thead> 
		        <tr style="height: 120px; text-align: center">
		        <th colspan="2">LLAMADO DE TICKETS</th>	
		        </tr> 
		    </thead> 
 		<table id="tbl_mostrar_celdas" class="tbl_turnos"> 
		    <tbody>
		    </tbody>     		   

	</div>
	
	</div>
	
	<footer>
		<input class="form-control" type="hidden" id="txtArea_sino_Roles" style="text-transform:uppercase;" placeholder="id txtArea_sino_Roles"/>
    </footer>

<!-- <script src="librerias/js/jquery-3.3.1.js"></script> -->

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
	
	function run(link, player){
		player.src = link.attr('href');
		par = link.parent();
		par.addClass('active').siblings().removeClass('active');
		player.load();
		player.play();
	}
	
	var element='';	
	element='<tr class="tbl_turnos_tr">'+
		'<td id="celda0" class="tbl_turnos_td"></td>'+
		'<td id="celda1" class="tbl_turnos_td"></td>'+
	'</tr>'+
	'<tr class="tbl_turnos_tr">'+
		'<td id="celda2" class="tbl_turnos_td"></td>'+
	    '<td id="celda3" class="tbl_turnos_td"></td>'+
	'</tr>'+
	'<tr class="tbl_turnos_tr">'+
		'<td id="celda4" class="tbl_turnos_td"></td>'+
	    '<td id="celda5" class="tbl_turnos_td"></td>'+
	'</tr>'+
	'<tr class="tbl_turnos_tr">'+
		'<td id="celda6" class="tbl_turnos_td"></td>'+
	    '<td id="celda7" class="tbl_turnos_td"></td>'+
	'</tr>'+
	'<tr class="tbl_turnos_tr">'+
		'<td id="celda8" class="tbl_turnos_td"></td>'+
	    '<td id="celda9" class="tbl_turnos_td"></td>'+
	'</tr>'+
	'<tr class="tbl_turnos_tr">'+
		'<td id="celda10" class="tbl_turnos_td"></td>'+
	    '<td id="celda11" class="tbl_turnos_td"></td>'+
	'</tr>';
		
$('#tbl_mostrar_celdas').append(element);


	
	$.ajax({ 
		type: 'POST', 
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'120'},		 	    		
		success: function (response) {
			var data = response.data;
			$('#txtArea_sino_Roles').val(data);	
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
	var playing = false;
	$.ajax({ 
		type: 'POST', 
		url: 'sonidoatenciones.app',
		data: {iRolEquipo: iRolEquipo}, 	    		
		success: function (response) {
			var data = response.data;		
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
					var textoAEscuchar = parts1[0]+' '+parts1[1]+ ' acercarse a ventanilla ' +parts2;
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