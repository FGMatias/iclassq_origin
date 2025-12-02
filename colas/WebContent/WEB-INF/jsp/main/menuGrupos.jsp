<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>ICLASSQ</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="librerias/libBase/include.js"></script>
  <script src="librerias/libBase/include.essalud.js"></script>  
  <script src="librerias/js/bootstrap.min.js"></script>
  <script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
  
  
</head>
<body>  
	<header>
		<img id="img_background">		
	</header>
	<div class="container">
<!--         <div class="row"> -->
<!--             <div id="espacio" class="col-md-6"> -->
<!--             </div> -->
<!--             <div class="col-md-2 offset-md-4"> -->
<!--             	<span style="font-size:30px;margin-top:0px"><a href="logout.app"><i class="fa fa-power-off"></i></a></span> -->
<!--             </div> -->
<!--         </div> -->
<!--         <br><br> -->
        <div class="row">
        	<div id="divDocumento" class="dni-descripcion col-sm-12">
        		<span id="txtNumeroDocumento"></span>
        	</div>
        </div><br>
        <div id="pnlAgrupadores">
	        
        </div>
        
        <br><br>        
        <br>
		<div class="row">
			<div class="teclado-boton col-xs-12 col-md-3">
				<a href="teclado.app" class="justificarMenu myButton2">Regresar</a>
            </div>
        </div>
    </div>

<script>

		function fnAbrirSubGrupos(prefijo){//'N. P'							
			var numDoc = '${numDoc}';
			var pideDoc = '${usuario.iPideDocumento}';
			var tipoDoc = '${tipoDoc}';
			
			if ( pideDoc != 1){	
				tipoDoc = 0;
				numDoc = 00000000
			}

			window.location.href = 'kiosco.app?numDoc='+numDoc+'&tipoDoc='+tipoDoc+'&prefijo='+prefijo;
		}

		$(document).ready(function() {
			var idSucursal = '${usuario.iSucursal}';
			console.log(idSucursal);
			
			$.ajax({
				type: 'POST',
				url: 'getempresabyidsucursal.app',
				data: {idSucursal: idSucursal},
				success: function (response) {
					var data = response.data;
					var idEmpresa = data;
					var idRol = '${usuario.iRolEquipo}';
					var pideDoc = '${usuario.iPideDocumento}';
					var divDocumento = document.getElementById('divDocumento');
					var numDoc = '${numDoc}';
					console.log(numDoc);
					var tipoDoc = '${tipoDoc}';
					console.log(tipoDoc);
					if ( pideDoc == 1){
						if ( tipoDoc == 1 ) {
							$('#txtNumeroDocumento').html("DNI: " + numDoc);
						} else {
							$('#txtNumeroDocumento').html("C.E: " + numDoc);
						}						
						$(".teclado-boton").css("display","");
					} else {
						divDocumento.style.display = '';
						//$('#txtNumDni').html("<span></span>");
						$(".teclado-boton").css("display","none");
					}

					$.ajax({
						type: 'POST',
						url: 'getempresabyid.app',
						data: {idEmpresa: idEmpresa},
						success: function (response) {
						var data = response.data;
						$('#img_background').attr("src",data.urlLogo);
						}
					});
					
					console.log(idRol)
					$.ajax({
						type: 'POST',
						url: 'listargruposxtiempo.app',				
						data: {idRol: idRol}, 
						success: function (response) {
							var data = response.data;		 
							console.log(data);
							var html='';
							for(var i=0; i<data.length; i++){								
			    				html = 
				    				'<div class="row">'+
				    					'<div class="boton col-sm-6 offset-sm-3">'+
				    						'<a onclick="fnAbrirSubGrupos(\''+data[i].prefijo+'\')" style="font-size:35px" class="justificarMenu myButton1">'+data[i].nombre+'</a>'+
				    					'</div>'+
			    	       			'</div><br><br>';
			               		$('#pnlAgrupadores').append(html);
			        		}		    		
						}
					});
				}
			});	
		});

    </script>

</body>
</html>