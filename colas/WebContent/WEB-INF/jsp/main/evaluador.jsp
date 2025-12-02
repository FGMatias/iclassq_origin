
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iClassQ</title>
<link href="librerias/css/jkeyboard2.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap.min.css">
<link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <script src="librerias/general/general.js"></script> 
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
		.ec-stars-wrapper {
			/* Espacio entre los inline-block (los hijos, los `a`) 
			   http://ksesocss.blogspot.com/2012/03/display-inline-block-y-sus-empeno-en.html */
			font-size: 0;
			/* Podríamos quitarlo, 
				pero de esta manera (siempre que no le demos padding), 
				sólo aplicará la regla .ec-stars-wrapper:hover a cuando
				también se esté haciendo hover a alguna estrella */
			display: inline-block;
		}
		.ec-stars-wrapper a {
			text-decoration: none;
			display: inline-block;
			/* Volver a dar tamaño al texto */
			font-size: 115px;

			
			color: #888;
		}
		
		.ec-stars-wrapper:hover a {
			color: yellow;
		}
		/*
		 * El selector de hijo, es necesario para aumentar la especifidad
		 */
		.ec-stars-wrapper > a:hover ~ a {
			color: #888;
		}
    </style>
</head>
<body>

	<center><img id="logo" src="librerias/imagenes/logo-essalud.jpg" ></center>

	
      
	<div class="subTitulo">
		<h1>¿Desea Evaluar la atención recibida? </h1>
		<br>
		<h2>Se encuentra en la IP:</h2>
		<b><span style="font-size:20px" id="ipcliente"></span></b>
		<br>
		<button id="positivo" onclick="verificarUltimoTicket()" >SI</button>
		<button id="negativo">NO</button>
		
	</div> 

    

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


<div id="modalCorrecto" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="border: 10px solid #144766;">
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

<script src="librerias/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){
    var ipWaitObject = findIP(foundNewIP);  
    // Puts found IP(s) in window.ipAddress
    console.log("ingresa a mostrar el ip: "+window.ipAddress);
    ipWaitObject.then(
        function (result) {
			$("#ipcliente").val(window.ipAddress);
			$("#ipcliente").html(window.ipAddress);
        },
        function (err) {
            
        }
    );
	$("#ipcliente").val("192.168.1.16");
	$("#ipcliente").html("192.168.1.16");
	$.ajax({ 
		type: 'POST', 
		url: 'ConsultaTiempoEvaluacion.app',
		data: {}, 	    		
		success: function (response) {
			var data = response.data;
			console.log("tiempo");
			console.log(data);
			tiempoEvaluacion=data.valor;
			texto= " Espere "+tiempoEvaluacion+" Segundos"

			$("#lTiempoEvaluacionEspera").val(tiempoEvaluacion);
			$("#lTiempoEvaluacionEsperatext").html(tiempoEvaluacion);
			$("#lTiempoEvaluacionEspera").val(15);
			$("#lTiempoEvaluacionEsperatext").html('15');
			
		}
	});   
    

	
});
function count(idTicket){
	var n = 0;
	var l = document.getElementById("number");

	
	nMax=$("#lTiempoEvaluacionEspera").val();

	intval=window.setInterval(function(){
	    $("#nroInterval").val(intval);

		l.innerHTML = n;
	  if (n==nMax-5){
		  var j = document.getElementById("esperaEvaluarTxt");
		  j.innerHTML="Gracias ya puede salir"
	  }
	  if (n==nMax) {
		  fnEvaluarAtencion(0);   
	  }
	  n=n+1;
	},1000);

}


function verificarUltimoTicket(){
	var pip=$("#ipcliente").text();
	console.log("ip del Cliente: "+pip);
	// obtiene el tiempo de evaluacion
	
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
					count(txtIdTicket);
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

function fnEvaluarAtencion(valor){
	console.log('valor->>>'+valor);
    intVal=$("#nroInterval").val();
	clearInterval(intval);
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