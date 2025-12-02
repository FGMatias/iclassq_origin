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
<body style="background-color: #D6D6D6; height:100px"  >
	<audio id="player">
    	<source src="librerias/sonido/llamada1.mp3" type="audio/mp3">
 	</audio>
	<div class="container">
		<div class="datagrid">
			<table>
				<thead>
					<tr style="height: 80px; text-align: center">
						<th>OOJGU</th>
						<th>LABORAL</th>
						<th>PAZ LETRADO</th>
						<th>PENAL</th>
						<th>FAMILIA</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="tbl_ogu_0"></td>
						<td id="tbl_laboral_0"></td>
						<td id="tbl_paz_0"></td>
						<td id="tbl_penal_0"></td>
						<td id="tbl_familia_0"></td>
					</tr>
					<tr class="alt">
						<td id="tbl_ogu_1"></td>
						<td id="tbl_laboral_1"></td>
						<td id="tbl_paz_1"></td>
						<td id="tbl_penal_1"></td>
						<td id="tbl_familia_1"></td>
					</tr>
					<tr>
						<td id="tbl_ogu_2"></td>
						<td id="tbl_laboral_2"></td>
						<td id="tbl_paz_2"></td>
						<td id="tbl_penal_2"></td>
						<td id="tbl_familia_2"></td>
					<tr>
					<tr class="alt">
						<td id="tbl_ogu_3"></td>
						<td id="tbl_laboral_3"></td>
						<td id="tbl_paz_3"></td>
						<td id="tbl_penal_3"></td>
						<td id="tbl_familia_3"></td>
					</tr>
					<tr>
						<td id="tbl_ogu_4"></td>
						<td id="tbl_laboral_4"></td>
						<td id="tbl_paz_4"></td>
						<td id="tbl_penal_4"></td>
						<td id="tbl_familia_4"></td>
					</tr>
					<tr class="alt">
						<td id="tbl_ogu_5"></td>
						<td id="tbl_laboral_5"></td>
						<td id="tbl_paz_5"></td>
						<td id="tbl_penal_5"></td>
						<td id="tbl_familia_5"></td>
					</tr>
					<tr>
						<td id="tbl_ogu_6"></td>
						<td id="tbl_laboral_6"></td>
						<td id="tbl_paz_6"></td>
						<td id="tbl_penal_6"></td>
						<td id="tbl_familia_6"></td>
					</tr>
					<tr class="alt">
						<td id="tbl_ogu_7"></td>
						<td id="tbl_laboral_7"></td>
						<td id="tbl_paz_7"></td>
						<td id="tbl_penal_7"></td>
						<td id="tbl_familia_7"></td>
					</tr>
					<tr>
						<td id="tbl_ogu_8"></td>
						<td id="tbl_laboral_8"></td>
						<td id="tbl_paz_8"></td>
						<td id="tbl_penal_8"></td>
						<td id="tbl_familia_8"></td>
					</tr>
					<tr class="alt">
						<td id="tbl_ogu_9"></td>
						<td id="tbl_laboral_9"></td>
						<td id="tbl_paz_9"></td>
						<td id="tbl_penal_9"></td>
						<td id="tbl_familia_9"></td>
					</tr>
					<tr>
						<td id="tbl_ogu_10"></td>
						<td id="tbl_laboral_10"></td>
						<td id="tbl_paz_10"></td>
						<td id="tbl_penal_10"></td>
						<td id="tbl_familia_10"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		
	
	</div>
	
	<footer>
 		<table id="tbl_mostrar_celdas" class="tbl_turnos">  
	  		   
        </table>
        <marquee id="txtPublicidad" direction="left"></marquee> 
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
	    '<td id="celda3" class="tbl_turnos_tr"></td>'+
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
	setInterval(llamarSonidoXMonitor,1000);
	function llamarSonidoXMonitor(){
		console.log('INGRESA TIMBRE '+iRolEquipo);
		var playing = false;
		$.ajax({ 
			type: 'POST', 
			url: 'sonidoatenciones.app',
			data: {iRolEquipo: iRolEquipo}, 	    		
			success: function (response) {
				var data = response.data;
				console.log('SONIDO ->>');
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
    
    // mostrar proximos turnos
    setInterval(mostrarProximosTurnos,1000);
	    function mostrarProximosTurnos(){
	    	var idSucursal='${usuario.iSucursal}';
	    	for(var i=0; i<10; i++){
				$('#tbl_ogu_'+i).text("");
				$('#tbl_penal_'+i).text("");
				$('#tbl_familia_'+i).text("");
				$('#tbl_laboral_'+i).text("");
				$('#tbl_paz_'+i).text("");				
	    	}
		    $.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'19'},
				success: function (response) {
					var data = response.data;	
	
					console.log(' de oogu');
					console.log(data);
					for(var i=0; i<10; i++)	
						if (typeof data[i].descripcion !== 'undefined') 
							$('#tbl_ogu_'+i).text(data[i].descripcion);		  	
						
					}		
					
			});    

	    	$.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'21'},
				success: function (response) {
					var data = response.data;	
					for(var i=0; i<10; i++)									
						if (typeof data[i].descripcion !== 'undefined') 
						$('#tbl_penal_'+i).text(data[i].descripcion);	
					}
			}); 
		    
	    	$.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'24'},
				success: function (response) {
					var data = response.data;	
					for(var i=0; i<10; i++)									
						if (typeof data[i].descripcion !== 'undefined') 
							$('#tbl_familia_'+i).text(data[i].descripcion);		  	
					
					}
			});	    	
	    	$.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'22'},
				success: function (response) {
					var data = response.data;

					for(var i=0; i<10; i++)	
						if (typeof data[i].descripcion !== 'undefined') 
						$('#tbl_laboral_'+i).text(data[i].descripcion);		  
					}
			});
	    	$.ajax({
				type: 'POST',
				url: 'getproximosturnosArea.app',
				data: {idSucursal: idSucursal, idArea:'23'},
				success: function (response) {
					var data = response.data;	
					for(var i=0; i<10; i++)									
						if (typeof data[i].descripcion !== 'undefined') 
							$('#tbl_paz_'+i).text(data[i].descripcion);		   
					
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
	    					console.log(' INGRESA VOZ');
							var tipoDocumento = data.tipoDocumento;
							var tipoDocumento_d = data.tipoDocumento_d;
							
	    					var parts1 = data.nombreIdentificacion.split(".");
							var parts2 = data.nombreVentanilla.substr(1);
							console.log(parts1+' ' +parts2);
							if (tipoDocumento==1){
								textoTipoIden=" USUARIO ";
							}else textoTipoIden=" NUMERO DE" +tipoDocumento_d ;
							var textoAEscuchar = textoTipoIden+parts1[1]+ ' acercarse a ventanilla ' +parts2;
							console.log	("texto a escuchar"+textoAEscuchar);	
							var mensaje = new SpeechSynthesisUtterance();
							mensaje.volumen = 1;
							mensaje.rate =0.8;
							mensaje.text = textoAEscuchar;
							mensaje.lang = 'es-ES'
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