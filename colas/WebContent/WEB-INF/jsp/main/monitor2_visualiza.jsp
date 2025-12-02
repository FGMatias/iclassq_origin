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
		<table id="tblListadoTicketEspera" style="height: 50px; text-align: center">
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
		<input class="form-control" type="hidden" id="txtidUsuario" style="text-transform:uppercase;" placeholder="id txtidUsuario"/>
		<input class="form-control" type="hidden" id="txtiTipoMonitor" style="text-transform:uppercase;" placeholder="id txtitipoMonitor"/>
			
 		<table id="tbl_mostrar_celdas" class="tbl_turnos">  
	  		   
        </table>
        <marquee id="txtPublicidad" direction="left"></marquee> 
    </footer>

<!-- <script src="librerias/js/jquery-3.3.1.js"></script> -->

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	var idSucursal ='${usuario.iSucursal}';
	var idUsuario ='${usuario.iUsuarioId}';
	var iRolEquipo ='${usuario.iRolEquipo}';
	
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
		url: 'consultaUsuarioMonitorPrinicipal.app',
		data: {idSucursal: idSucursal, iRolEquipo: iRolEquipo},		 	    		
		success: function (response) {
			var data = response.data;
			$('#txtidUsuario').val(data.iUsuarioId);
			$('#txtiTipoMonitor').val(data.iMonitorTipo);
		}
	});	

	
});	    



function Construyecabecera(data){
	var	html='';
	$('#tblListadoTicketEspera thead').empty();	
	html = " <tr style=\"height: 120px; text-align: center\"> ";
	var filas=4/data.length;
	colmax=Math.ceil(filas);

	for(var i =0; i<data.length; i++){
		html =html + "<th colspan=\"" +colmax+"\">" + data[i].descripcion+"</th>";
	}	
	html=html+'</tr>';
	$('#tblListadoTicketEspera thead').append(html);

	html = '';
	html=html+" <tr> <td colspan = \"4\" > Lista de Espera de los primeros 10 Tickets : </td> </tr>";
	for(var j =0;  j<5; j++){
		if (j%2==0) html = html+ " <tr class=\"alt\"> ";
		else html = html+ " <tr>";
		for(var i =0;  i<data.length; i++){
			for(var c =1;  c<=colmax; c++){
				m=5*(c-1)+j+1;
				html =html + "<td width=\"25%\" id=\"tbl_" + data[i].id+"_"+m+"\"></td>";	
			}
		}
		html =html + "</tr>";
	}	
	console.log(html);
	$('#tblListadoTicketEspera tbody').empty();					
	$('#tblListadoTicketEspera tbody').append(html);

}

	var idSucursal ='${usuario.iSucursal}';
	var idUsuarioC1 = $('#txtidUsuario').val();	
	var iTipoMonitorC1 =$('#txtiTipoMonitor').val();
	var iRolEquipo ='${usuario.iRolEquipo}';

	
	//mostrar atenciones
	setInterval(mostrarTurno,1000);
	function mostrarTurno(){	

		var idSucursal ='${usuario.iSucursal}';
		var idUsuarioC1 = $('#txtidUsuario').val();	
		var iTipoMonitorC1 =$('#txtiTipoMonitor').val();
		var iRolEquipo ='${usuario.iRolEquipo}';
		console.log("idUsuarioC1:"+idUsuarioC1);
		console.log("iTipoMonitorC1:"+iTipoMonitorC1);
		console.log("iRolEquipo:"+iRolEquipo);		
		
		$.ajax({ 
			type: 'POST', 
			url: 'mostraratenciones.app',
			data: {idUsuario: idUsuarioC1, idSucursal: idSucursal, idTipoMonitor: iTipoMonitorC1, 
	    		iRolEquipo: iRolEquipo},
			success: function (response) {
				var data = response.data;
				var cadenamostrar='';
				for(var i =0; i<data.length; i++){
					codigomostrar=data[i].ticketTexto.substr(0,13);
					if(data[i].estado==1){																														        
						cadenamostrar=codigomostrar+ "\u21e8" + data[i].nombreVentanilla;
						$('#celda'+i).text(cadenamostrar);							
						$('#celda'+i).addClass( "activo parpadea");
					}else {
						cadenamostrar=codigomostrar+"\u21d4"+data[i].nombreVentanilla;
						$('#celda'+i).text(cadenamostrar);							
						$('#celda'+i).removeClass("activo parpadea");
					}
	    		}
				
			}
		});	    	
	}
    // mostrar proximos turnos
    setInterval(mostrarProximosTurnos,1000);
	    function mostrarProximosTurnos(){
			var idSucursal ='${usuario.iSucursal}';
			var idUsuarioC1 = $('#txtidUsuario').val();	
			var iTipoMonitorC1 =$('#txtiTipoMonitor').val();
			var iRolEquipo ='${usuario.iRolEquipo}';

	    	var campo="";
	    	$.ajax({ 
	    		type: 'POST', 
	    		url: 'consultaareaRolMonitor.app',
	    		data: {idUsuario: idUsuarioC1},		 	    		
	    		success: function (response) {
	    			var dataArea = response.data;
	    			Construyecabecera(dataArea);
			    	for(var i =0; i<dataArea.length; i++){
			    		var areadesc=dataArea[i].descripcion;
			    		var idArea = dataArea[i].id;
					    $.ajax({
							type: 'POST',
							url: 'getproximosturnosArea.app',
							data: {idSucursal: idSucursal, idArea: idArea},
							success: function (response) {
								console.log("hay registro");
								var data = response.data;
								for(var j=0; j<data.length; j++){
									var sec=j+1;
									campo="#tbl_"+data[j].idArea+"_"+sec;
									if (typeof data[j].descripcion !== 'undefined'){
										valor=data[j].descripcion.substr(0,12);
										$(campo).text(valor);		  	
									}
								}
							}		
								
						});    
			    	}
	    		}
			});  	    
	 	}	    	

</script>
</body>
</html>