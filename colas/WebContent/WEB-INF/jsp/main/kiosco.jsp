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
  
  <style>
  
  	.centered {
	  position: absolute;
	  left: 50%;
	  margin-left: -100px;
	}
  </style>
</head>
<body>  
	<header>
		<img id="img_background">		
	</header>
	<div class="container">
        <div class="row">
            <div id="espacio" class="col-md-6">
            </div>
        </div>
        <br><br>
        <br><br>
        <div id="panelListadoSubGrupos">
        	       
        </div>
        <br><br>
        <br>
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
	</div>
        <div class="modal" id="nuevoTicket" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
					<div class="modal-body">
						<div id="ticket">
							<div class="">
								<span>BIENVENIDOS</span><br>
								<img src="librerias/imagenes/logo_canete.jpg" height="70px"><br>

							<div id="divDocumento" class="">
								<p>
									<span id="tipoDoc"></span>
									<span id="numDoc"></span>
								</p>
							</div>
								<span>ATENCION</span><br>

								<b><span style="font-size:70px" id="codigo"></span></b><br>
								<b><span style="font-size:30px" id="nombreGrupo"></span></b><br>
								<span id="fecha"></span><br>
								<span class="myButton6" >Desea Imprimir Ticket?</span>
							</div>
							<div class="col-sm-6">
								<a style="color:#fff" class="myButton5" >No</a>
							</div>
							<div class="col-sm-6">
								<a style="color:#fff"  id="btnImpresion"  class="myButton4">Si</a>
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
		var numDoc = '${numDoc}';
		var tipoDoc = '${tipoDoc}';
    	window.location.href = 'menugrupos.app?numDoc='+numDoc+'&tipoDoc='+tipoDoc;
    });
    
	function fnGenerarTicket(idSubgrupo, prefijo, nombre){
		var iConfirmaImpresion = '${usuario.iConfirmaImpresion}';
        var validaDoc = '${usuario.iValidaDocumento}';
        var idSucursal = '${usuario.iSucursal}';
		var numDoc ='${numDoc}';
		var tipoDoc = '${tipoDoc}';
		var pideDoc = '${usuario.iPideDocumento}';

		$('#panelListadoSubGrupos').hide();

		$.ajax({
    		type: 'POST', 
    		url: 'generarticketatencion.app',	
    		data: {idSubgrupo: idSubgrupo, idSucursal: idSucursal, prefijo: prefijo, nombre:nombre, numDoc: numDoc, tipoDoc: tipoDoc,
        		validaDoc: validaDoc},	
    		success: function (response) {
    			var msg = response.success;
    			var data = response.data;
    			var divDocumento = document.getElementById('divDocumento');

    			if(msg==true){
    				if(pideDoc == 2){
    					$("#nuevoTicket").modal("show");
    					divDocumento.style.display = 'none';
    					var parts1 = data.codigo.split("-");
    					$("#codigo").html(parts1[0]+parts1[1]);
    					var date = new Date(data.fechaAtencion);
    					var fecha=date.toLocaleDateString();
    					var h=date.getHours();
    					var m=date.getMinutes();
    					var s=date.getSeconds();
    					var hora = h + ":" + m + ":" + s;
    					$("#fecha").html(fecha);
//     					setInterval(fnImprimir, 100);
    					$('#ticket').prop('hidden', true);
    					window.location.href = retornoUrl;
    					return true; 
    				}
    				else{
    					$("#nuevoTicket").modal("show");
    					$("#tipoDoc").html(tipoDoc == 1 ? 'DNI: ' : 'C.E: ');
    					$("#numDoc").html(numDoc);
    					var parts1 = data.codigo.split("-");
    					$("#codigo").html(parts1[0]+parts1[1]);
    					var date = new Date(data.fechaAtencion);
    					var fecha=date.toLocaleDateString();
    					var h=date.getHours();
    					var m=date.getMinutes();
    					var s=date.getSeconds();
    					var hora = h + ":" + m + ":" + s;
    					$("#fecha").html(fecha);
//     					setInterval(fnImprimir, 100);
    					$('#ticket').prop('hidden', true);
    					window.location.href = retornoUrl;
    					return true; 
    				}		
				}	
    		}
    	});		
	}
	
	$("#btnImpresion").click(function() {    			
		$("#btnImpresion").css("display", "none");//oculto el boton
		$("#img_background").css("display", "none");//oculto el boton
		$(".container").css("display", "none");//oculto el boton
		$('.myButton6').css("display", "none");	
		$('.myButton5').css("display", "none");
		var printContents = document.getElementById('ticket').innerHTML;
		w = window.open();
		w.document.write('<html><body>');
		w.document.write('<div style="text-align:center">');
		w.document.write(printContents);
		w.document.write('<a>- </a></div>');
		w.document.write('</body></html>');
	   
		w.document.close(); // necessary for IE >= 10
		w.focus(); // necessary for IE >= 10
		w.print();
		w.close();				
		$('#ticket').prop('hidden', true);
		window.location.href = retornoUrl;
		return true; 
	});  
		
	function fnImprimir(){
		$("#btnImpresion").click();
	}
    $(document).ready(function() {	
		var iConfirmaImpresion = '${usuario.iConfirmaImpresion}';
		var imprimeTicket = '${usuario.iImprimeTicket}';
		var pideDoc = '${usuario.iPideDocumento}';
		if(pideDoc == 1){
			retornoUrl = "teclado.app";
		}else{
			retornoUrl = "menugrupos.app?dni=00000000&tipoDoc=1";
		}

		$('.myButton5').attr('href',retornoUrl);	

    	var imprimeTicket = '${usuario.iImprimeTicket}';
		if(iConfirmaImpresion == 2){
			$("#btnImpresion").css("display", "none");//oculto el boton
			$('.myButton6').css("display", "none");	
			$('.myButton5').css("display", "none");
		}

    	
    	var idSucursal = '${usuario.iSucursal}';
    	console.log(idSucursal);
		var idRol = '${usuario.iRolEquipo}';
		var prefijo = '${prefijo}';
		console.log(prefijo);
    	$.ajax({ 
    		type: 'POST', 
    		url: 'getgrupobyprefijo.app',	
    		data: {prefijo: prefijo, idSucursal: idSucursal},	
    		success: function (response) {
    			var data = response.data;
    			$('#idGrupo').val(data.id);
    			var idGrupo = $("#idGrupo").val();
    			console.log("idGrupo : "+idGrupo); 
    			console.log("nombreGrupo : "+data.nombre);
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
    		   			 					'<a href="#" id ="btnSubGrupo" onclick="fnGenerarTicket('+data[i].iSubGrupo+', \''+data[i].vPrefijo+'\', \''+data[i].vNombreSubGrupo+'\')" class="justificarMenu myButton1">'+data[i].vNombreSubGrupo+'</a>'+
    		   			 				'</div>'+
    		   			 				/* '<div class="descripcion col-sm-6">'+
    		   			 					'<span>'+data[i].vDescripcion+'</span>'+
    	    	                		'</div>'+ */
    	   	                		'</div><br><br>';
    	   	                		$('#panelListadoSubGrupos').append(html);
    	        		}	
    	    		}
    	    	});
    		}
    	});

    	var idEmpresa = '${usuario.iEmpresa}';
    	
    	$.ajax({
   			type: 'POST',
   			url: 'getempresabyid.app',
   			data: {idEmpresa: idEmpresa}, 
   			success: function (response) {
	   			var data = response.data;
	   			$('#img_background').attr("src",data.urlLogo);
   			}
   		});

    	var idSucursal = '${usuario.iSucursal}';
    	$.ajax({
    		type: 'POST',
    		url: 'getsucursalbyid.app',
    		data: {idSucursal: idSucursal},
    		success: function (response) {
    			var data = response.data;
    			$("#nombreSucursal").html(data.nombre);    		
    		}
    	});
    	
    });

    </script>
	
</body>
</html>
