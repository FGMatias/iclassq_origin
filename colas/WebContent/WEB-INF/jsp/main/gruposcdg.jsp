<!DOCTYPE html>
<html lang="en">
<head>
  <title>::Poder:: Judicial</title>
  <meta charset="UTF-8">
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
		border: 3px solid #B00701; 
		border-radius:40px;
		background-color:#B00701;
		color: #D6D6D6;
		font-size: 55px;
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
		border: 3px solid #B00701; 
		border-radius:40px;
		background-color:#D6D6D6;
		color: #B00701;
		font-size: 55px;
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
		border: 3px solid #B00701;
		text-decoration: none;
		color:#D6D6D6;
		border-radius:40px;
		background-color:#B00701;
		font-size: 25px;
		font-weight: bold;
	}
	
	.atras:hover{ 
		text-align: center;
		cursor: pointer;
		padding: 10px 25px;
		border: 3px solid #B00701; 
		border-radius:30px;
		background-color:#D6D6D6;
		color: #B00701;
		text-decoration: none;
		font-size: 25px;
		font-weight: bold;
	}
  </style>
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-sm-12">
		<div class="logo">
			<img src="librerias/poderjudicial/img/logo_poder_judicial.gif"/>
		</div>				
	</div>
</div>
	<div class="row">
		<div class="col-sm-12">				
			<div class="panel panel-primary" style="border: 1px solid #B00701">				
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 form-group">									
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body" style="border: none; box-shadow: none;">
											<div class="row">
												<div class="col-xs-12 col-sm-12">
													<a href="#" onclick="fnMostrarSubGruposXCDG(1)"><div class="center">
													  <p>LABORAL</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>										
								<div class="col-xs-12 col-sm-6">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnMostrarSubGruposXCDG(2)"><div class="center">
													  <p>PAZ LETRADO</p>
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
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body" style="border: none; box-shadow: none;">
											<div class="row">
												<div class="col-xs-12 col-sm-12">
													<a href="#" onclick="fnMostrarSubGruposXCDG(3)"><div class="center">
													  <p>PENAL</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>										
								<div class="col-xs-12 col-sm-6">
									<div class="panel panel-primary" style="border:none">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12" style="position: relative;">
													<a href="#" onclick="fnMostrarSubGruposXCDG(4)"><div class="center">
													  <p>FAMILIA</p>
													</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>																									
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
			<div class=" col-xs-12 col-md-2">				
				<a id="btnRegresarAGrupos" class="atras" >REGRESAR</a>
            </div>
	</div>
</div>


	<script>
	
		$("#btnRegresarAGrupos").click(function() {
			var dni = '${dni}';
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			var prioridad = '${prioridad}';
			window.location.href = 'mostrargrupospj.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona+'&prioridad='+prioridad;
			
		});
	
	
	
		function fnMostrarSubGruposXCDG(tipo){			
			var dni = '${dni}';
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			var prioridad = '${prioridad}';
			console.log("revisar menu");
			window.location.href = 'subgruposcdg.app?tipo='+tipo+'&tipoDoc='+tipoDoc+'&dni='+dni+'&persona='+persona+'&prioridad='+prioridad;
		}
	



		

	</script>


</body>
</html>
