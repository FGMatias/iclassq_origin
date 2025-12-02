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
		<table id="tblListadoTicketEspera" style="height: 80px; text-align: center">
		   <thead>
		        <tr>
		                  <th>Area1</th>
		                  <th>Area2</th>
				</tr>
		    </thead>
		    <tbody>
		    </tbody>
		  </table>
	</div>
		
		
		
	
	</div>
	
	<footer>
		<input class="form-control" type="hidden" id="txtArea_sino_Roles" style="text-transform:uppercase;" placeholder="id txtArea_sino_Roles"/>
	
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
			$("#txtPublicidad").html(data);
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'120'},		 	    		
		success: function (response) {
			var data = response.data;
			$('#txtArea_sino_Roles').val(data);	
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaareaRolMonitor.app',
		data: {idUsuario: idUsuario},		 	    		
		success: function (response) {
			var data = response.data;
			Construyecabecera(data);
		}
	});	

	 
	
});	    

function Construyecabecera(data){
	var	html='';
	$('#tblListadoTicketEspera thead').empty();	
	html = " <tr style=\"height: 80px; text-align: center\"> ";
	var filas=4/data.length;
	colmax=Math.ceil(filas);

	for(var i =0; i<data.length; i++){
		html =html + "<th style=\"height: 40px; text-align: center\" colspan=\"4\">" + data[i].descripcion+"</th>";
	}	
	html=html+'</tr>';
	$('#tblListadoTicketEspera thead').append(html);
	html = '';
	html=html+" <tr class=\"alt\"> Lista de Espera : </td>";
	for(var j =0;  j<5; j++){
		if (j%2==0) html = html+ " <tr class=\"alt\"> ";
		else html = html+ " <tr>";
		for(var i =0;  i<data.length; i++){
			for(var c =0;  c<colmax; c++){
				m=5*(c-1)+j+1;
				html =html + "<td width=\"25%\" id=\"tbl_" + data[i].id+"_"+m+"\"></td>";	
			}
		}
		html =html + "</tr>";
	}	
	$('#tblListadoTicketEspera tbody').empty();					
	$('#tblListadoTicketEspera tbody').append(html);

}
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
	    	var campo="";
	    	$.ajax({ 
	    		type: 'POST', 
	    		url: 'consultaareaRolMonitorSiguienteTurno.app',
				data: {idSucursal: idSucursal, idArea: idArea},
				success: function (response) {
					console.log("hay registro");
					var data = response.data;
					for(var j=0; j<data.length; j++){
						var sec=j+1;
						campo="#tbl_"+data[j].idArea+"_"+j;
						if (typeof data[j].descripcion !== 'undefined'){
							valor=sec+"=>"+data[j].descripcion
							$(campo).text(valor);		  	
						}
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