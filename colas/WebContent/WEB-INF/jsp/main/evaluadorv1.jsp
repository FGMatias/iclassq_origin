<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iClassQ</title>
<link href="librerias/css/jkeyboard2.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="librerias/css/estilosmenu.css" rel="stylesheet">
	<style>
        body{
            background: #fff;
        }
        .input_box {
            display: inline-block;
            margin: 0 auto;
            padding: 5px 10px;
            font-size: 28px; 
            width: 25%;
        }
        .input_box_container {
            text-align: center;			
        }
		.titulo {
            text-align: center;
			font-size:30px;
			color: #000;
			font-weight: bold;
			margin-bottom:15px;
        }
        .sedeTitulo{
        	text-align: center;
			font-size:24px;
			color: #000;
			font-weight: bold;
			margin-bottom:15px;
        }
		.subTitulo {
            text-align: center;
			font-size:30px;
			color: #0E3E84;
			font-weight: bold;
			margin-bottom:15px;
        }
        img {
		    /background: #3A6F9A;/
		    vertical-align: middle;
/* 		    max-height: 25px; */
/* 		    max-width: 160px; */
		} 
		
		#positivo{
			background: #144766;
			color: #fff;
			border-radius: 5px;
			padding: 10px 20px;
		}
		#negativo{
			background: #144766;
			color: #fff;
			border-radius: 5px;
			padding: 10px 20px;
		}
		#positivo:hover{
			background: #fff;
			color: #144766;
			border-radius: 5px;
			padding: 10px 20px;
		}
		
		#negativo:hover{
			background: #fff;
			color: #144766;
			border-radius: 5px;
			padding: 10px 20px;
		}
		#logo{
			width: 400px;
		}
		
    </style>
</head>
<body>
<!-- 	<div class="titulo">ESSALUD</div> -->
	<center><img id="logo" src="librerias/imagenes/logo-essalud.jpg" ></center>
<!-- 	<div class="subTitulo">Evalua Nuestra Atencion</div> -->
	
      
	<div class="subTitulo">
		<%
			String IP;
			IP=java.net.InetAddress.getLocalHost().getHostAddress();
		%>
		<h1>¿Desea Evaluar la atención recibida? </h1>
		<br>
		<h2>Se encuentra en la IP:</h2>
		<b><span style="font-size:20px" id="ipcliente"><%=IP%></span></b>
		<br>
		<button id="positivo" onclick="verificarUltimoTicket()" >SI</button>
		<button id="negativo">NO</button>
		
	</div> 

    

<div id="modalEvaluarAtencion" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="border: 10px solid #F0F007;">
	      <div class="modal-header modal-header-evaluador-success">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Evaluar Atencion</h4>
	      </div>
	      <div class="modal-body">	
	      	<div class="modal-body mx-3">
		        <div class="md-form mb-5">
		        	<h3 style="font-weight: bold; color: #144766">Usted es el ticket N° <span id="numeroTicket"></span></h3>
		          	<h5 style="font-weight: bold; color: #144766">Dedique unos segundos a completar esta pequeña encuesta.
						Sus respuestas serán tratadas de forma confidencial y serán utilizadas únicamente para mejorar el servicio que le proporcionamos.
					</h5>
					<h3 style="font-weight: bold; color: #144766">En relacion al Servicio que tan bueno considera la Atencion brindada</h3>		          
		        </div>
      		</div>   
	      	   	
        	<div class="row">
        		<input class="form-control" type="hidden" id="txtIdTicket" />
        		<a href="#" onclick="fnEvaluarAtencion(1);"><div class=frame>
				    <span class="helper"></span><img src="librerias/imagenes/star_amarillo_64.png" height=23 />
				</div></a>
				<a href="#" onclick="fnEvaluarAtencion(2);"><div class=frame>
				    <span class="helper"></span><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 />
				</div></a>
				<a href="#" onclick="fnEvaluarAtencion(3);"><div class=frame>
				    <span class="helper"></span><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 />
				</div></a>
				<a href="#" onclick="fnEvaluarAtencion(4);"><div class=frame>
				    <span class="helper"></span><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 />
				</div></a>
				<a href="#" onclick="fnEvaluarAtencion(5);"><div class=frame>
				    <span class="helper"></span><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 /><img src="librerias/imagenes/star_amarillo_64.png" height=23 />
				</div></a>
			</div>				
	      </div>	      
	    </div>
	
	  </div>
</div>


<div id="modalCorrecto" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="border: 10px solid #F0F007;">
	      <div class="modal-header modal-header-evaluador-success">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	      	<div class="modal-body mx-3">
		        <div class="md-form mb-5">
					<h2 style="font-weight: bold; color: #144766; text-align: center;">Muchas Gracias por su informacion!!</h2>
		        </div>
		        <button type="button" id="evaluar_boton_cerrar" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
      		</div>			
	      </div>	      
	    </div>
	
	  </div>
</div>

<!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>
		
	    function verificarUltimoTicket(){
			var pip=$("#ipcliente").text();
	    	$.ajax({ 
	    		type: 'POST', 
	    		url: 'obtenerultimoticket.app',
				data: {pip: pip},
	    		success: function (response) {
	    			var data = response.data;
	    			console.log(response.success);
	    			console.log(data);
	    			if (response.success){
	    				console.log(data.codigo);
		    			$("#numeroTicket").html(data.codigo);
		    			$("#txtIdTicket").val(data.id);
		    			var txtIdTicket=data.id;		    			
		    			if (parseInt(txtIdTicket)>0) {
		    				console.log(parseInt(txtIdTicket));		    				
		    		    	 $("#modalEvaluarAtencion").modal("show");
		    				} 
	    			}
	    			else{
	    				alert(" No tiene Ticket para Evaluar");
	    				$("#numeroTicket").html("");
	    				$("#txtIdTicket").val('');
	    			}
	    			
	    		}
	    	});
	    }
	    
// 	    $(document).ready(function() {	
// 	    	$.ajax({ 
// 	    		type: 'POST', 
// 	    		url: 'obtenerultimoticket.app',
// 	    		success: function (response) {
// 	    			var data = response.data;
// 	    			console.log("data: "+data);
// 	    			$("#numeroTicket").html(data.codigo);
// 	    		}
// 	    	});
// 		});

		function fnEvaluarAtencion(valor){
			console.log('valor->>>'+valor);
			var idTicket = $('#txtIdTicket').val();
			console.log('idTicket->>>'+idTicket);
			$.ajax({ 
				type: 'POST', 
				url: 'saveevaluacionatencion.app',
				data: {idTicket: idTicket, nota: valor},
				success: function (response) {
					var data = response.success;
					if(response.success == true){
						$('#txtIdTicket').val();
						$('#input_field_2').val("");
						$('#input_field_2').focus();
						$('#modalCorrecto').modal('show');
						$('#modalEvaluarAtencion').modal('hide');
					}
				}
			});
		}
	</script>

</body>
</html>