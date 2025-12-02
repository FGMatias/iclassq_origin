<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>ICLASSQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <script src="librerias/libBase/include.js"></script>
  <script src="librerias/libBase/include.essalud.js"></script>
  
</head>
<body>  
	<img id="img_background">
	<div class="container">
        <div class="row">
            <div id="espacio" class="col-md-6">
            </div>
        </div>
        <br><br>
        <div id="panelListadoSubGrupos">
        	       
        </div>
        <br><br>
        <br><br>

		<div class="row">
			<div class="teclado-boton col-xs-12 col-md-3">
				<a id="btnKioskoAtras" class="justificarMenu myButton2">Atrás</a>
            </div>
        </div>
        <form class="needs-validation" novalidate>
			<div class="row">
				<div class="col-12 form-group">
					<div class="row">
						<input class="form-control" type="hidden" id="idGrupo" />
					</div>
				</div>
			</div>
		</form>
        <div class="modal fade" id="nuevoTicket"  data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-body">
                    <div id="ticket">
                        <div class="">
                            <img src="librerias/imagenes/logo.png" height="70px"><br><br>
                        
                            <b><span id="nombreSucursal"></span></b><br>

                            <span>BIENVENIDOS</span><br>
	                        <div id="" class="">
	                            <p>ID: <span id="numDoc"></span></p>
	                        </div>
                            <span>ATENCION</span><br>
                            <b><span style="font-size:70px" id="codigo"></span></b><br>
                            <b><span style="font-size:30px" id="nombreGrupo"></span></b><br>
                            <span id="fecha"></span><br>
                             <span class="myButton6" >Desea Imprimir Ticket?</span>
                        </div>
                        <div class="col-sm-6">
                            <a style="color:#fff" class="myButton5">No</a>
                        </div>
                        <div class="col-sm-6">
                            <a style="color:#fff" class="myButton4">Si</a>
                        </div>
                    </div>
                </div>
            
                </div>
            </div>
        </div>
    </div>
    
<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/plugins/summernote/summernote-bs4.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>

	<script>

	$("#btnKioskoAtras").click(function() {
    	var dni = '${dni}';
    	var tipoDoc = '${tipoDoc}';
    	var persona = '${persona}';            
    	window.location.href = 'menugrupos4.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona;
    });
    
	function fnGenerarTicket(idSubgrupo, prefijo, nombre){
		console.log("pasa por el punto de fnGenerarTicket kiosko4");
		$('#panelListadoSubGrupos').attr("disabled", true);
        var validaDoc = '${usuario.iValidaDocumento}';
		var dniPaciente ='${dni}';
		var tipoDoc = '${tipoDoc}';
		var persona = '${persona}';	
		$('#panelListadoSubGrupos').hide();		
		$.ajax({
    		type: 'POST', 
    		url: 'generarticketatencion4.app',	
    		data: {idSubgrupo: idSubgrupo, prefijo: prefijo, nombre:nombre, dniPaciente: dniPaciente, tipoDoc: tipoDoc,
        		validaDoc: validaDoc, persona: persona},	
    		success: function (response) {
    			var msg = response.success;
    			var data = response.data;
    			if(msg==true){
    				console.log('DNI DEL PACIENTE'+dniPaciente)
					$("#nuevoTicket").modal("show");
					$("#nombreSubGrupo").html(data.nombreSubgrupo);
					$("#numDoc").html(dniPaciente);
					var parts1 = data.codigo.split("-");
					$("#codigo").html(parts1[0]+parts1[1]);
					var date = new Date(data.fechaAtencion);
					console.log("fecha hora");
					console.log(date);
					var fecha=date.toLocaleDateString();
					var h=date.getHours();
					var m=date.getMinutes();
					var s=date.getSeconds();
					$("#fecha").html(fecha+' '+h+':'+m+':'+s);
        		}
    			
    		}
    	});		
	}

    $(document).ready(function() {

		var pideDoc = '${usuario.iPideDocumento}';
		if (pideDoc==1){
			$('.myButton4').attr('href','dni.app');	
			$('.myButton5').attr('href','dni.app');	
		}
		else{
			$('.myButton4').attr('href','regresaratencion.app');
			$('.myButton5').attr('href','regresaratencion.app');

		}

    	var imprimeTicket = '${usuario.iImprimeTicket}';
    	if(imprimeTicket==2){
    		$('.myButton4').removeAttr('id');
		}
    	else if (imprimeTicket==1){
    		$('.myButton4').attr('id','btnImprimirTicket');	

    	    $("#btnImprimirTicket").click(function() {    			
//    			$("#pnlTicket").printElement();
				$("#btnImprimirTicket").css("display", "none");//oculto el boton
	    		$('.myButton6').css("display", "none");	
	    		$('.myButton5').css("display", "none");				
	    		var printContents = document.getElementById('ticket').innerHTML;
	            w = window.open();
	            w.document.write(printContents);
	            w.document.close(); // necessary for IE >= 10
	            w.focus(); // necessary for IE >= 10
	    		w.print();
	    		w.close();				
	    		$('#ticket').prop('hidden', true);
	    		
	//     		window.location.href = 'regresaratencion.app';
	            return true;
	    	});
        }
    	
    	var idSucursal = '${usuario.iSucursal}';
		var idRol = '${usuario.iRolEquipo}';
		var prefijo = '${prefijo}';
		
    	$.ajax({ 
    		type: 'POST', 
    		url: 'getgrupobyprefijo.app',	
    		data: {prefijo: prefijo, idSucursal: idSucursal},	
    		success: function (response) {
    			var data = response.data;
    			$('#idGrupo').val(data.id);
    			var idGrupo = $("#idGrupo").val();
    			console.log("nombreGrupo : "+data.id);
    			console.log("idGrupo : "+idGrupo);
    			$('#nombreGrupo').html(data.nombre);
    			
    			$.ajax({ 
    	    		type: 'POST', 
    	    		url: 'listarsubgruposxgrupoandsucursal.app',	
    	    		data: {idSucursal: idSucursal, idGrupo: idGrupo},	
    	    		success: function (response) {
    	    			var data = response.data;
    	    			var html='';    				
    	    			for(var i=0; i<data.length; i++){				
    	    				html = '<div class="row">' +
    		   			 				'<div class="boton col-sm-6">'+
    		   			 					'<a href="#" onclick="fnGenerarTicket('+data[i].iSubGrupo+', \''+data[i].vPrefijo+'\', \''+data[i].vNombreSubGrupo+'\')" class="justificarMenu myButton1">'+data[i].vNombreSubGrupo+'</a>'+
    		   			 				'</div>'+
    		   			 				'<div class="descripcion col-sm-6">'+
    		   			 					'<span>'+data[i].vDescripcion+'</span>'+
    	    	                		'</div>'+
    	   	                		'</div><br><br>';
    	   	                		$('#panelListadoSubGrupos').append(html);
    	        		}	
    	    		}
    	    	});
    		}
    	});

    	$.ajax({
    		type: 'POST',
    		url: 'listarempresas.app',
    		success: function (response) {
    			var data = response.data;			
                $('#img_background').attr("src",data[0].urlLogo);        		
    		}
    	});
    });

			
    </script>
	
</body>
</html>
