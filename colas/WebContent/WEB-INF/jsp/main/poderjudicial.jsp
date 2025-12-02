<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>::Poder Judicial::</title>

  <meta http-equiv="Content-Type" content="text/html"/>
	<meta charset="utf8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <LINK REL=StyleSheet HREF="librerias/notaria/css/reset.css" TYPE="text/css" MEDIA=screen>  
  <link rel="stylesheet" href="librerias/notaria/css/bootstrap.min.css">
  <LINK REL=StyleSheet HREF="librerias/notaria/css/estilos.css" TYPE="text/css" MEDIA=screen>
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">    
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="librerias/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    
    .boton{
    background-color:#b00701;
    color:#f2e7e7;
    border-radius: 20px;
    height: 300px;
    text-align: center;
    border: #b00701 3px solid;
    }
    
        .boton:hover{
    background-color:#D6D6D6;
    
      }
    
    .boton a:hover{
    color:#B00701;
    }
    
    .boton a{
     color:#f2e7e7;
     text-decoration:none;
    }
    
    .text1 {
    font-size:60px;
    }
    
    .text2 {
    font-size:45px;
    }
    

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
		height: 300px;
		position: relative;
		border: 3px solid #B00701; 
		border-radius:40px;
		background-color:#B00701;
		color: #D6D6D6;
		font-size: 45px;
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
		height: 300px;
		position: relative;
		border: 3px solid #B00701; 
		border-radius:40px;
		background-color:#D6D6D6;
		color: #B00701;
		font-size: 38px;
		font-weight: bold;
	}
	
	#ticket{
		text-align: center;
		font-family: arial;
		font-size:19px;
	}
	
	.modal-dialog{
		width:500px;
		
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
	
	@media print {
		#ticket{
	     	display:flex;
	     	justify-content:center;
	     	align-items:center;
	     	height:100%;
     	}
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
			<div style="text-align: center"><span style="font-size:36px">Bienvenido: </span><span style="font-size:36px; font-weight: bold;" id="txtNombrePersona"></span></div>
			<input type="hidden" id="txtTipoDoc"/>
			<input type="hidden" id="txtDni"/>
			<input type="hidden" id="txtPersona"/>		
			<p> </br>  </p>		
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
													<div class="boton">
													
													
													<a href="#" onclick="fnGenerarTicket(60, 'G', 'OOJGU ORIENTACION AL USUARIO')">
													  <p class="text1">OOJGU <br>
														<span class="text2" >(ORIENTACI&OacuteN AL USUARIO)</span></p>
													</a>
													</div>
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
												<div class="boton">
													<a href="#" onclick="fnMostraGruposXCDG(2)">
													<p class="text1">CDG <br>
														<span class="text2" >(MESA DE PARTES)</span></p>
													</a>
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
	</div><br><br>
        <br>
	<div class="row">
			<div class=" col-xs-12 col-md-2">
				<a id="btnKioskoRegresarInicioPJ1" class="atras" >REGRESAR</a>
            </div>
	</div>
	
</div>

	<div class="modal fade"  id="nuevoTicketNotaria" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-body">
                    <div id="ticket">
                        <div class="">
                            <img src="librerias/poderjudicial/img/logo_poder_judicial.png" height="100px">
                        </div>
                        <div class="">
							<b><span style="font-size:50px" id="nombreSubGrupo"></span></b><br>
							<b><span style="font-size:10px" ></span></b><br>
							<b><span style="font-size:40px" id="codigo"></span></b><br>
							<b><span style="font-size:40px">TICKET GENERADO</span></b><br>
                            <span id="fecha"></span><br>
                            <div style="text-align: center">
                            	<a data-dismiss="modal" id="btnKioskoRegresarInicioPJ"class="btn btn-danger btnNextPrevius" > CONFIRMAR </a>	
                            </div>
							<span style="font-size:20px; text-align:center" >ESPERE SU TURNO</span>
                        </div>
                    </div>
                </div>
            
                </div>
            </div>
        </div>
        
	<script>

			function fnMostraGruposXCDG(area){
			var dni = '${dni}';
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			var prioridad = '${prioridad}';
			window.location.href = 'gruposcdg.app?area='+area+'&dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona+'&prioridad='+prioridad;
		}
		
		$("#btnKioskoRegresarInicioPJ").click(function() {
			 RegresarMenuDni();
			 
		 });	
		$("#btnKioskoRegresarInicioPJ1").click(function() {
			 RegresarMenuDni();
			 
		 });	
		function RegresarMenuDni(){
			 window.location.href = 'regresarmostrardnipj.app';			
		}
		function fnGenerarTicket(idGrupo, prefijoGrupo, nombre){
			var dni = '${dni}';
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			var prioridad = '${prioridad}';
			var validaDoc = 2;
			$.ajax({
	    		type: 'POST', 
	    		url: 'generarticketatencionpj.app',	
	    		data: {idGrupo: idGrupo, prefijoGrupo: prefijoGrupo, nombre:nombre, dniPaciente: dni, tipoDoc: tipoDoc,
	        		validaDoc: validaDoc, persona:persona, prioridad:prioridad},	
	    		success: function (response) {
	    			var msg = response.success;
	    			var data = response.data;
	    			if(msg==true){
	    				var prioridad_desc="Normal";
	    				if (prioridad =="P"){
	    					prioridad_desc="Preferencial";	
	    				}
	    				console.log('ingreso 1');
						$("#nuevoTicketNotaria").modal("show");
	    				console.log('ingreso 2');
						$("#nombreSubGrupo").html(data.nombreSubgrupo);
						$("#prioridad").html(prioridad_desc);
						$("#codigo").html(persona);
						var date = new Date(data.fechaAtencion);
						$("#fecha").html(date.toLocaleString());
// 						setTimeout(function() { RegresarMenuDni(); }, 4000);
//	 					window.location.href = 'regresaratencion.app';
						
// 			    		window.location.href = 'notaria.app';
	
	        		}
	    		}
	    	});		
		}

		$(document).ready(function() {
			$("#txtNombrePersona").html()
			var nombrePersona = '${persona}';
			var dni = '${dni}';
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			
			$("#txtNombrePersona").html(nombrePersona);
			$("#txtTipoDoc").val(tipoDoc);
			$("#txtDni").val(dni);
			$("#txtPersona").val(persona);
				
			
			
			
    	});

	</script>

	

</body>
</html>
