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
            background: #fff
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
			color: #D6D6D6;
			font-weight: bold;
			margin-bottom:15px;
        }
        .sedeTitulo{
        	text-align: center;
			font-size:24px;
			color: #D6D6D6;
			font-weight: bold;
			margin-bottom:15px;
        }
		.subTitulo {
            text-align: center;
			font-size:20px;
			color: #D6D6D6;
			font-weight: bold;
			margin-bottom:15px;
        }
        img {
		    /background: #3A6F9A;/
		    vertical-align: middle;
		} 
		#logo{
			width: 400px;
		}
    </style>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div style="text-align: center">
					<img src="librerias/poderjudicial/img/logo_poder_judicial.png" width="100" height="100"/>
				</div>				
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-12">
				<div style="text-align: center">
					<div class="titulo">CORTE SUPERIOR DE JUSTICIA DE LA LIBERTAD</div>
					<div class="subTitulo">CALIFIQUE NUESTRA ATENCION</div>
				    <div class="input_box_container">        
     					<input type="text" class="input_box" autocomplete="off" id="input_field_2" placeholder="Ingrese su DNI" style="background: #B00701; color: #D6D6D6;font-weight: bold; font-size:20px" class="col-sm-5 form-control" >
           
    				</div>			
    			</div>				
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div style="text-align: center">
    				<div id="keyboard"></div>
    			</div>				
			</div>
		</div>
</div>

    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>    
	<script type="text/javascript" src="librerias/js/jkeyboard.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $('#keyboard').jkeyboard({
          layout: "numbers_only",
          input: $('#input_field_1')
        });
		

        $(".input_box").focus(function() {
            $('#keyboard').jkeyboard("setInput", this);
			
        });

		
    </script>
<div id="modalEvaluarAtencion" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="border: 10px solid #144766;">
	      <div class="modal-header modal-header-evaluador-success">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Evaluar Atencion</h4>
	      </div>
	      <div class="modal-body">	
	      	<div class="modal-body mx-3">
		        <div class="md-form mb-5">
		        	<h3 style="font-weight: bold; color: #144766">Usted es el ticket N° <span id="numeroTicket"></span></h3>
		        	<h4> </h4>
		          	<h5 style="font-weight: bold; color: #144766">	Su respuesta será tratada de forma confidencial y serán utilizadas únicamente para mejorar el servicio que le proporcionamos.
					</h5>
					<h3 style="font-weight: bold; color: #144766">En relaci&oacute;n al Servicio que tan bueno considera la Atenci&oacute;n brindada?</h3>		          
					<label>Ud. tiene </label>
					<label id="lTiempoEvaluacionEsperatext">0 </label>
   					<input class="form-control" type="hidden" id="lTiempoEvaluacionEspera" style="text-transform:uppercase;" placeholder="id lTiempoEvaluacionEsperatext"/>
					<input class="form-control" type="hidden" id="nroInterval" style="text-transform:uppercase;" placeholder="id nroInterval"/>
					<label>Segundos para evaluar </label>
					<div class="row">
						<div class="col-12 form-group">
								<div id="number" style="text-align: center">0</div>	
													
						</div>
					</div>
					<div class="row">
						<div class="col-12 form-group">
								<div id="esperaEvaluarTxt" style="text-align: center"></div>													
						</div>
					</div>						

		        </div>
      		</div>   
	      	   	
        	<div class="row">
        		<div class="ec-stars-wrapper" >
         			<input class="form-control" type="hidden" id="txtIdTicket" />       	
					<a href="#" onclick="fnEvaluarAtencion(1)" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(2)" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(3)"  data-value="3" title="Votar con 3 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(4)" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(5)" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
				</div>
			</div>
			</div>				
	      </div>	      
	    </div>
	
</div>
	  
	<script>
		function fnEvaluarAtencion(valor){
			console.log('valor->>>'+valor);
			var dni = $('#input_field_2').val();
			console.log('idTicket->>>'+idTicket);
			$.ajax({ 
				type: 'POST', 
				url: 'saveevaluacionatencionpj.app',
				data: {dni: dni, nota: valor},
				success: function (response) {
					var data = response.success;
					if(response.success == true){
						$('#txtIdTicket').val();
						$('#input_field_2').val("");
						$('#input_field_2').focus();
						$('#modalEvaluarAtencion').modal('hide');
					}				     	
								
				}
			});
			
		}

	</script>

</body>
</html>