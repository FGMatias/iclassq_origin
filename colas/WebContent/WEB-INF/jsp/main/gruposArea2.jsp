<!DOCTYPE html>
<html lang="en">
<head>
  <title>::Notaria Tambini::</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <LINK REL=StyleSheet HREF="librerias/notaria/css/reset.css" TYPE="text/css" MEDIA=screen>  
  <link rel="stylesheet" href="librerias/notaria/css/bootstrap.min.css">
  <LINK REL=StyleSheet HREF="librerias/notaria/css/estilos.css" TYPE="text/css" MEDIA=screen>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
	
	.btn-grad {background-image: linear-gradient(to right, #16222A 0%, #3A6073 51%, #16222A 100%)}
	.btn-grad:hover { background-position: right center; }
	
	.center { 
		height: 200px;
		position: relative;
		border: 3px solid #58778c; 
		border-radius:40px;
		background-color:#58778c;
		color: #fff;
		font-size: 25px;
		font-weight: bold;
	}

	.center p {
	  margin: 0;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -ms-transform: translate(-50%, -50%);
	  transform: translate(-50%, -50%);
	}
	.center:hover { 
		height: 200px;
		position: relative;
		border: 3px solid #58778c; 
		border-radius:40px;
		background-color:#fff;
		color: #58778c;
		font-size: 25px;
		font-weight: bold;
	}
	
	#ticket{
		text-align: center;
		font-family: Times;
		font-size:19px;
	}
	
	.modal-dialog{
		width:450px;
	}
	
	a{
		text-align:center;
	}
	
	.row-centered {
		text-align:center;
	}
	.col-centered {
		display:inline-block;
		float:none;
		/* reset the text-align */
		text-align:left;
		/* inline-block space fix */
		margin-right:-4px;
	}
	
	.valid{
		background: #58778c;
		text-align:center;
		cursor:pointer;
		color: #fff;
		font-size: 20px;
		position: relative;
		padding: 5px 15px;
		border: 3px solid #58778c; 
		border-radius:30px;
		font-weight: bold; 
	}
	.valid:hover{
		cursor:pointer;
		border: 3px solid #58778c; 
		border-radius:30px;
		background-color:#fff;
		color: #58778c;
		text-decoration: none;
		font-size: 20px;
		position: relative; 
		font-weight: bold; 
	}
	
	.atras{ 
		text-align: center;
		padding: 10px 25px;
		border: 3px solid #58778c;
		text-decoration: none;
		color:#fff;
		border-radius:40px;
		background-color:#58778c;
		font-size: 25px;
		font-weight: bold;
	}
	
	.atras:hover{ 
		text-align: center;
		cursor: pointer;
		padding: 10px 25px;
		border: 3px solid #58778c; 
		border-radius:30px;
		background-color:#fff;
		color: #58778c;
		text-decoration: none;
		font-size: 25px;
		font-weight: bold;
	}
  </style>
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-sm-12" style="background-image: url('librerias/notaria/img/bg-footer.jpg');">
		<div class="logo">
			<img src="librerias/notaria/img/logo-tambini.png"/>
		</div>				
	</div>
</div>
	<div class="row">
		<div class="col-sm-12">				
			<div class="panel panel-primary" style="border: 1px solid #58778c">				
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 form-group">									
							<div class="row">
								<div class="col-xs-12 col-sm-3">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body" style="border: none; box-shadow: none;">
											<div class="row">
												<div class="col-xs-12 col-sm-12">
													<a href="#" onclick="fnGenerarTicket(47, 'EC', 'ENTREGA DE CARTAS NOTARIALES')"><div class="center">
													  <p>ENTREGA DE CARTAS NOTARIALES</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>										
								<div class="col-xs-12 col-sm-3">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnGenerarTicket(48, 'CC', 'EXPEDICIÓN DE COPIAS CERTIFICADAS')"><div class="center">
													  <p>EXPEDICIÓN DE COPIAS CERTIFICADAS</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnGenerarTicket(49, 'CF', 'LEGALIZACION DE FIRMAS')"><div class="center">
													  <p>LEGALIZACION DE FIRMAS</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnGenerarTicket(50, 'LC', 'LEGALIZACION DE COPIAS')"><div class="center">
													  <p>LEGALIZACION DE COPIAS</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 form-group">									
							<div class="row row-centered ">
								<div class="col-xs-12 col-sm-3 col-centered">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body" style="border: none; box-shadow: none;">
											<div class="row">
												<div class="col-xs-12 col-sm-12">
													<a href="#" onclick="fnGenerarTicket(58, 'PV', 'PERMISOS DE VIAJE')"><div class="center">
													  <p>PERMISOS DE VIAJE:<br>- INTERIOR<br>- EXTERIOR</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3 col-centered">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body" style="border: none; box-shadow: none;">
											<div class="row">
												<div class="col-xs-12 col-sm-12">
													<a href="#" onclick="fnGenerarTicket(51, 'CL', 'CERTIFICACIÓN DE APERTURAS DE LIBROS')"><div class="center">
													  <p>CERTIFICACIÓN DE APERTURAS DE LIBROS</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>										
								<div class="col-xs-12 col-sm-3 col-centered">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnGenerarTicket(52, 'FO', 'FORMATOS')"><div class="center">
													  <p>FORMATOS:<br>- PODERES<br>- CAMBIO DE CARACTERISTICAS</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3 col-centered">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnGenerarTicket(57, 'RN', 'RECOJO DE CARTAS NOTARIALES')"><div class="center">
													  <p>RECOJO DE CARTAS NOTARIALES</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-xs-12 form-group">									 -->
<!-- 							<div class="row row-centered "> -->
<!-- 								<div class="col-xs-12 col-sm-3 col-centered"> -->
<!-- 									<div class="panel panel-primary" style="border:none"> -->
<!-- 										<div class="panel-body" style="border: none; box-shadow: none;"> -->
<!-- 											<div class="row"> -->
<!-- 												<div class="col-xs-12 col-sm-12"> -->
<!-- 													<a href="#" onclick="fnGenerarTicket(58, 'PV', 'PERMISOS DE VIAJE')"><div class="center"> -->
<!-- 													  <p>PERMISOS DE VIAJE:<br>- INTERIOR<br>- EXTERIOR</p> -->
<!-- 													</div></a> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div>																							 -->
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
			<div class=" col-xs-12 col-md-2">
				<a href="notaria.app" class="atras" >ATRÁS</a>
            </div>
	</div>
</div>

	<div class="modal" id="nuevoTicketNotaria">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-body">
                    <div id="ticket">
                        <div class="">
                            <img src="librerias/notaria/img/logo.png" height="60px">
                        </div>
                        <div class="">
							<b><span style="font-size:20px" id="nombreSubGrupo"></span></b><br>
							<b><span style="font-size:26px" id="codigo"></span></b><br>
                            <span id="fecha"></span><br>
							<span style="font-size:8px; text-align:center" >GRACIAS POR SU VISITA</span>
                        </div>
<!-- 						<div> -->
<!--                             <a href="notaria.app" class="valid">OK</a> -->
<!--                         </div> -->
                    </div>
                </div>
            
                </div>
            </div>
        </div>

	<script>
		var dniPaciente = '0';
		var tipoDoc = 1;
		var validaDoc = 2;
		function fnGenerarTicket(idSubgrupo, prefijo, nombre){		
			$.ajax({
	    		type: 'POST', 
	    		url: 'generarticketatencion.app',	
	    		data: {idSubgrupo: idSubgrupo, prefijo: prefijo, nombre:nombre, dniPaciente: dniPaciente, tipoDoc: tipoDoc,
	        		validaDoc: validaDoc},	
	    		success: function (response) {
	    			var msg = response.success;
	    			var data = response.data;
	    			if(msg==true){
	    				console.log("llego aca");
						$("#nuevoTicketNotaria").modal("show");
						$("#nombreSubGrupo").html(data.nombreSubgrupo);
						$("#codigo").html(data.codigo);
						var date = new Date(data.fechaAtencion);
						$("#fecha").html(date.toLocaleString());
	// 					window.location.href = 'regresaratencion.app';

			    		var printContents = document.getElementById('ticket').innerHTML;
			            w = window.open();
			            w.document.write(printContents);
			            w.document.close(); // necessary for IE >= 10
			            w.focus(); // necessary for IE >= 10
			    		w.print();
			    		w.close();				
			    		$('#ticket').prop('hidden', true);
			    		window.location.href = 'notaria.app';
	        		}
	    		}
	    	});		
		}

		$(document).ready(function() {
			var imprimeTicket = '${usuario.iImprimeTicket}';
	    	if(imprimeTicket==2){
	    		$('.valid').removeAttr('id');
			}
	    	else if (imprimeTicket==1){
	    		$('.valid').attr('id','btnImprimirTicket');	
	
	    	    $("#btnImprimirTicket").click(function() {    			
	//    			$("#pnlTicket").printElement();
					$("#btnImprimirTicket").css("display", "none");//oculto el boton
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
    	});

	</script>


</body>
</html>
