<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ICLASSQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
<link rel="stylesheet" href="librerias/css/font-awesome.min.css">
<link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
<link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
<script src="librerias/general/general.js"></script> 
<style>
  	.modal-backdrop{
	   background-color: rgba(0,0,0,0.2);
	}
	
	.parpadea {
	  
	  animation-name: parpadeo;
	  animation-duration: 2s;
	  animation-timing-function: linear;
	  animation-iteration-count: infinite;
	
	  -webkit-animation-name:parpadeo;
	  -webkit-animation-duration: 2s;
	  -webkit-animation-timing-function: linear;
	  -webkit-animation-iteration-count: infinite;
	}
	
	@-moz-keyframes parpadeo{  
	  0% { opacity: 1.0; }
	  50% { opacity: 0.7; }
	  100% { opacity: 1.0; }
	}
	
	@-webkit-keyframes parpadeo {  
	  0% { opacity: 1.0; }
	  50% { opacity: 0.7; }
	   100% { opacity: 1.0; }
	}
	
	@keyframes parpadeo {  
	  0% { opacity: 1.0; }
	   50% { opacity: 0.7; }
	  100% { opacity: 1.0; }
	} 
	
  </style>

<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="librerias/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap.min.css"> 

<link href="librerias/css/estilosmenu.css" rel="stylesheet">

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

  
  
  <style type="text/css">
    body {
        color: #566787;
        background: #f5f5f5;
		font-family: 'Roboto', sans-serif;
	}
	.table-wrapper {        
        background: #fff;
        padding: 0px 30px 5px;
        margin: 10px auto;
        box-shadow: 0 0 1px 0 rgba(0,0,0,.25);
    }
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		min-width: 50px;
		border-radius: 2px;
		border: none;
		padding: 6px 12px;
		font-size: 95%;
		outline: none !important;
		height: 30px;
	}
    .table-title {
		border-bottom: 1px solid #e9e9e9;
		padding-bottom: 15px;
		margin-bottom: 5px;
		background: rgb(0, 50, 74);
		margin: -20px -31px 10px;
		padding: 15px 30px;
		color: #fff;
    }
    .table-title h2 {
		margin: 2px 0 0;
		font-size: 24px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 40px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table td a {
/*         color: #2196f3; */
    }
	table.table td .btn.manage {
		padding: 2px 10px;
		background: #37BC9B;
		color: #fff;
		border-radius: 2px;
	}
	table.table td .btn.manage:hover {
		background: #2e9c81;		
	}
	
	#number {
  font-size:50px;
  color:#434343;
}
</style>
  
</head>
<body>
	<div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-4"><h2><span id="txtNombreVentanilla"></span>: <b>${usuario.vUsuarioNombres} ${usuario.vUsuarioApPaterno} ${usuario.vUsuarioApMaterno}</b></h2></div>
                <div class="col-sm-2">
                	<button type="button" class="btn btn-default btn-lg" onclick="modalActualizar()" disabled><span ></span>&nbsp;Actualizar Ventanilla</button>
                </div>
                <div class="col-sm-6">
               		<button type="button" class="btn btn-primary btn-lg" id="btnLlamarSiguiente"><span class="glyphicon glyphicon-forward"></span>&nbsp;Siguiente</button>
                	<button type="button" id="btnTurnos" class="btn btn-success">N° Turnos en Espera: <b><span id="cantEspera" style="font-size:15px"></span></b></button>
                	<button type="button" class="btn btn-danger btn-lg pull-right" onclick="fnCerrarSession()"><span class="glyphicon glyphicon-off"></span>&nbsp;salir</button>
                	<button type="button" class="btn btn-primary btn-lg pull-right" onclick="fnCambiarClaveForm(${usuario.iUsuarioId})"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Cambiar Clave</button>
 					<div id="divAsistencia">
 						<button id="asistencia" type="button" class="btn btn-info btn-lg pull-right" onclick="fnTipoPausa()"><span class="glyphicon glyphicon-ok"></span>&nbsp;Registrar Evento</button> 						
 					</div>
 					<div id="divCharla">
 						<button id="charla" type="button" class="btn btn-success btn-lg pull-right" onclick="fnCharla()"><span class="glyphicon glyphicon-ok"></span>&nbsp;Charla</button>
 					</div>
 					
   					<input class="form-control" type="hidden" id="txtApellido_sino" style="text-transform:uppercase;" placeholder="id txtApellido_sino"/>
   					<input class="form-control" type="hidden" id="txtNotifica_sino" style="text-transform:uppercase;" placeholder="id txtNotifica_sino"/>

                                               	
                    <div class="btn-group" data-toggle="buttons">
<!--                         <a id="btnCambiarClave" onclick="fnCambiarClave()" class="btn btn-success" title="Cambiar Clave"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Cambiar Clave</a> -->
<!--                         <a href="#" id="btnCerrarSession" class="btn btn-danger" title="Salir del Sistema"><span class="glyphicon glyphicon-off"></span>&nbsp;Salir</a>                        							 -->
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover" id="tbl_ventanilla_usuario">
            <thead>
                <tr>                    
                    <th>TICKET</th>
                    <th>DNI</th>                    
                    <th>PRIORIDAD</th>   
                    <th>HORA LLEGADA</th>
                    <th>HORA ATENCION</th>                   
                    <th>HORA FIN ATENCION</th>
                    <th>ESTADO</th>
                    <th style="width: 400px;">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
    
<!--     Deraivar Ticket -->
	
	<div id="modalDerivarTicket" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Derivar Ticket</h4>
	      </div>
	      <div class="modal-body">
	        	<div class="row">
					<div class="col-12 form-group">
						<div class="row">
							<div class="" >
								<input class="form-control" type="hidden" id="txtIdTicketDeriva" />
						   		<input class="form-control" type="hidden" id="txtTipoDerivacion" style="text-transform:uppercase;" placeholder="id txtTipoDerivacion"/>					   	
							</div>
							<div class="col-xs-12 col-sm-1">
							</div>
							<div class="col-xs-12 col-sm-3" style="display:none" id="divDerivaMenu">
								<label>Derivar a:</label>
								<select class="form-control" id="cboTipoDeriva" required>
									<option value="0">--Seleccione--</option>
									<option value="1">Grupo</option>
									<option value="2">Ventanilla</option>
								</select>
							</div>
							<div class="col-xs-12 col-sm-4" style="display:none" id="divDerivaGrupo">
								<label>Grupo</label>
								<select class="form-control" id="cboGrupoDerivar" required>
									<option value="0">--Seleccione--</option>
								</select>
							</div>

							<div class="col-xs-12 col-sm-4" style="display:none" id="divDerivaVentanilla">
								<label>Ventanilla</label>
								<select class="form-control" id="cboVentanillaDerivar" required>
									<option value="0">--Seleccione--</option>
								</select>
							</div>
							<div class="col-xs-12 col-sm-3" style="display:none" id="divDerivaGrupoVentanilla">
								<label>Grupo</label>
								<select class="form-control" id="cboGrupoVentanillaDerivar" disabled>
									<option value="0">--Seleccione--</option>
								</select>
							</div>																														
						</div>									
					</div>																
				</div>
	      </div>
	      <div class="modal-footer">
	        	<button type="button" id="btnDerivarTicket" class="btn btn-primary" data-dismiss="modal">Derivar</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	
	  </div>
</div>
     
<!--     evaluar ticket -->
  <div class="modal fade" id="modalEvaluarTicket" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">EVALUACION CON EL DISPOSITIVO</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
							
								<div class="row">
									<div class="col-12 form-group">
											<input class="form-control" type="hidden" id="txtIdTicketEvalua" />
											<div id="esperaEvaluar" style="text-align: center"></div>	
											<label>comunicar a su usuario para evaluar la calidad de la atencion</label>
											<label id="lTiempoEvaluacionEsperatext">0 </label>
						   					<input class="form-control" type="hidden" id="lTiempoEvaluacionEspera" style="text-transform:uppercase;" placeholder="id lTiempoEvaluacionEsperatext"/>
											<label> Segundos, Espere </label></br>
											<label> si su Paciente finalizo cierre la pantalla </label>
											<input class="form-control" type="hidden" id="nroInterval" style="text-transform:uppercase;" placeholder="id nroInterval"/>
                                											
									</div>
								</div>									
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
								<button type="button" id="evaluar_boton_finalizar" class="btn btn-primary" data-dismiss="modal">Cerrar</button>

							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>

<!-- actualizar ventanilla -->

	<div id="modalActualizarVentanilla" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Actualizar Ventanilla</h4>
	      </div>
	      <div class="modal-body">
	        	<div class="row">
					<div class="col-12 form-group">
						<div class="row">
							<div class="col-xs-12 col-sm-1">
							</div>
							<div class="col-xs-12 col-sm-4">
								<label>Area:</label>
								<select class="form-control" id="cboArea" required>
									<option value="">--Seleccione--</option>																																				
								</select>
							</div>
							<div class="col-xs-12 col-sm-4">
								<label>Ventanilla:</label>
								<select class="form-control" id="cboVentanilla" disabled>
									<option value="">--Seleccione--</option>																																				
								</select>
							</div>																						
						</div>									
					</div>																
				</div>
	      </div>
	      <div class="modal-footer">
	      	    <button type="button" id="btnActualizarVentanilla" class="btn btn-primary" data-dismiss="modal">Actualizar</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	
	  </div>
</div>

<!-- marcar pausa -->
<div id="modalTipoPausa" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Registrar Asistencia</h4>
	      </div>
	      <div class="modal-body">
	        	<div class="row">
					<div class="col-12 form-group">
						<div class="row">
							<div class="col-xs-12 col-sm-1">
							</div>
							<div class="col-xs-12 col-sm-5" id="divTipoPausa">
								<label>Selecciona una opción:</label>
								<select class="form-control" id="cboTipoPausa" required>
									<option value="0">--Seleccione--</option>
								</select>
							</div>																														
						</div>									
					</div>																
				</div>
	      </div>
	      <div class="modal-footer">
	        	<button type="button" id="btnRegistrar" class="btn btn-primary" data-dismiss="modal">Registrar</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	
	  </div>
</div>

<!-- charla -->
<div id="modalCharla" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Registrar Charla</h4>
	      </div>
	      <div class="modal-body">
	        	<div class="row">
					<div class="col-12 form-group">
						<div class="row">
							<div class="col-xs-12 col-sm-1">
							</div>
							<div class="col-xs-12 col-sm-6">
								<label>Número de Personas</label>
								<input class="form-control" type="text" id="txtNPersonas" placeholder="Número de Personas"/>
							</div>																													
						</div>									
					</div>																
				</div>
	      </div>
	      <div class="modal-footer">
	        	<button type="button" id="btnRegistrarCharla" class="btn btn-primary" data-dismiss="modal">Registrar</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	
	  </div>
</div>   

<!-- marcar tipo atencion -->

<div class="modal" id="modalTipoAtencion">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Tipo de Atención</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<input class="form-control" type="hidden" id="txtIdTipoAtencion" style="text-transform:uppercase;" placeholder="ID Tipo Atencion"/>
									<input class="form-control" type="hidden" id="txtTicket" style="text-transform:uppercase;" placeholder="Ticket"/>
									<div class="col-12 form-group">
										<div class="row center-block">	
											<div class="col-xs-12 col-sm-4">
												<label>DNI</label>
												<input class="form-control" type="text" id="txtDNI" style="text-transform:uppercase;" placeholder="DNI" required/>
											</div>																				
										</div>	
									</div>
									<div class="col-12 form-group">
										<div class="row center-block">	
											<div class="col-xs-12 col-sm-4">
												<label>Nombres</label>
												<input class="form-control" type="text" id="txtNombres" style="text-transform:uppercase;" placeholder="Nombres" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Paterno</label>
												<input class="form-control" type="text" id="txtApePaterno" style="text-transform:uppercase;" placeholder="Apellido Paterno" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Materno</label>
												<input class="form-control" type="text" id="txtApeMaterno" style="text-transform:uppercase;" placeholder="Apellido Materno" required/>
											</div>															
										</div>	
									</div>					
									<div class="col-12 form-group">
										<div class="row center-block">	
											<div class="col-xs-12 col-sm-4">
												<label>¿De donde nos visita?</label>
												<select class="form-control" id="cboLugarVisita" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Nº Celular / Telefono Fijo</label>
												<input class="form-control" type="text" id="txtNCelular" style="text-transform:uppercase;" placeholder="Número Contacto" required/>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Correo</label>
												<input class="form-control" type="text" id="txtCorreo" style="text-transform:uppercase;" placeholder="Correo" required/>
											</div>													
										</div>	
									</div>
									<div class="col-12 form-group">
										<div class="row center-block">	
											<div class="col-xs-12 col-sm-4" id="divTipoGestion">
												<label>Tipo de Gestión:</label>
												<select class="form-control" id="cboTipoGestion" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>		
											<div class="col-xs-12 col-sm-4" id="divModalida">
												<label>Modalidad:</label>
												<select class="form-control" id="cboModalidad" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>																				
										</div>									
									</div>	
									<div id="datosCliente">	
										<div class="panel panel-primary">
											<div class="panel-heading">Zona de Interes</div>
											<div class="panel-body">
												<div class="col-12 form-group">
													<div class="row center-block">	
														<div class="col-xs-12 col-sm-6">
															<label>Departamento</label>
															<select class="form-control" id="cboDepartamentos" required>
																<option value="0">--Seleccione--</option>
															</select>
														</div>
														<div class="col-xs-12 col-sm-6">
															<label>Provincia de Interes</label>
															<input class="form-control" type="text" id="txtProvincia" style="text-transform:uppercase;" placeholder="Provincia" required/>
														</div>														
													</div>	
												</div>
												<div class="col-12 form-group">
													<div class="row center-block">	
														<div class="col-xs-12 col-sm-6">
															<label>Distrito 1</label>
															<input class="form-control" type="text" id="txtDistrito1" style="text-transform:uppercase;" placeholder="Distrito 1" required/>
														</div>
														<div class="col-xs-12 col-sm-6">
															<label>Distrito 2</label>
															<input class="form-control" type="text" id="txtDistrito2" style="text-transform:uppercase;" placeholder="Distrito 2" required/>
														</div>														
													</div>	
												</div>
											</div>
										</div>
										<div class="col-12 form-group">
											<div class="row center-block">	
												<div class="col-xs-12 col-sm-4" id="divPlanCompraConstVivienda" style="display:none">
													<label>¿Cuándo tiene planeado hacer la compra o construcción de su vivienda?</label>
													<select class="form-control" id="cboPlanCompraConstVivienda" required>
														<option value="0">--Seleccione--</option>
													</select>
												</div>		
												<div class="col-xs-12 col-sm-4" id="divPlanCompraVivienda">
													<label>¿Cuándo tiene planeado hacer la compra de su vivienda?</label>
													<select class="form-control" id="cboPlanCompraVivienda" required>
														<option value="0">--Seleccione--</option>
													</select>
												</div>		
												<div class="col-xs-12 col-sm-4" id="divCuotaInicial">
													<label>Cuota inicial / Ahorro programado</label>
													<select class="form-control" id="cboCuotaInicial" required>
														<option value="0">--Seleccione--</option>
													</select>
												</div>			
												<div class="col-xs-12 col-sm-4" id="divRecibeInfo">
													<label>¿Desea recibir información por mail?</label>
													<select class="form-control" id="cboRecibeInfo" required>
														<option value="0">--Seleccione--</option>
													</select>
												</div>																			
											</div>									
										</div>		
									</div>
																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row center-block">					
											<div class="col-xs-12 col-sm-4" id="divTipoPausa">
												<label>Tipo de Entidad:</label>
												<select class="form-control" id="cboTipoEntidad" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>					
											<div class="col-xs-12 col-sm-4" id="divTipoPausa">
												<label>Tipología:</label>
												<select class="form-control" id="cboTipologia" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>	
											<div class="col-xs-12 col-sm-4" id="divTipoPausa">
												<label>Tipo de Documento:</label>
												<select class="form-control" id="cboTipoDocumento" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>																						
										</div>									
									</div>																
								</div>
								<div class="row center-block">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Fecha Desembolso</label>
			                                    <input class="form-control" type="date" id="fechaDesembolso"/>
											</div>
											<div class="col-xs-12 col-sm-4" id="divTipoPausa">
												<label>Estado Actual:</label>
												<select class="form-control" id="cboEstado" required>
													<option value="0">--Seleccione--</option>
												</select>
											</div>	
											<div class="col-xs-12 col-sm-4">
												<label>Fecha de Estado Actual STP</label>
			                                    <input class="form-control" type="date" id="fechaEstadoActual"/>
											</div>	
										</div>
									</div>
								</div>	
								<div class="row center-block">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Nº Expediente</label>
												<input class="form-control" type="text" id="txtNExpediente" style="text-transform:uppercase;" placeholder="Número Expediente" required/>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Promotor / Entidad Técnica</label>
												<input class="form-control" type="text" id="txtPromotor" style="text-transform:uppercase;" placeholder="Promotor / Entidad técnica" required/>
											</div>	
										</div>
									</div>
								</div>									
								<div class="modal-footer">
						        	<button type="button" id="btnRegistrarTA" class="btn btn-primary" data-dismiss="modal">Registrar</button>
						        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						      </div>
							</form>
					</fieldset>
		      </div>
	    </div>
	  </div>
	</div>
	
    <script type="text/javascript">

 	//parametros (Tipo de funcion, idEvalua)
    //S --siguiente
    //I-- Iniciar
    //F-- Finalizar
     function derivalistadoventanilla(idSucursal, tipoParametro, idUsuario)
	 {
		$.ajax({ 
			type: 'POST', 
			url: 'listarventanillaxparametroTipoDeriva.app',
			data: {idSucursal: idSucursal, idUsuario: idUsuario }, 	    		
			success: function (response) {
				var data = response.data;
				$.each(data, function (index, item) {
	                
	                $("<option/>")
	                        .attr("value", item.id)
                        	.text(item.nombre+"-"+item.nombreArea)
	                        .appendTo("#cboVentanillaDerivar");
	            });	
			}
		});
    }

    function derivalistadogrupo(idSucursal, tipoParametro, idUsuario)
	{
		// idSucursal: filtra a nivel de Sucursal
		// idArea=Fintral a nivel de Sucursal y Area
		// id Rol, filtra a nivel del Rol
  	
			$.ajax({ 
				type: 'POST', 
				url: 'listargruposxparametroTipoDeriva.app',
				data: {idSucursal: idSucursal, idUsuario: idUsuario }, 	    		
				success: function (response) {
					var data = response.data;

					$.each(data, function (index, item) {		                
		                $("<option/>")
		                        .attr("value", item.id)
		                        .text(item.nombre)
		                        .appendTo("#cboGrupoDerivar");
		            });	
				}
			});
	}

    function formatHour(hora) {
    	if(!hora || hora == "null") return '';
    	return new Date(hora).toLocaleTimeString();
    }
    
    var ESTADOS = {
   		LLAMADO_MONITOR: 40,
   		MONITOR_PINTA: 41,
   		ATENDIENDO : 50,
   		EVALUANDO: 51,
   		FINALIZADO: 60,
   		ANULADO: 90,
   		REACTIVADO: 91
   	};
    
    var buttonStateConfig = {
   	    [ESTADOS.LLAMADO_MONITOR]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        tipoAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.MONITOR_PINTA]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        tipoAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.ATENDIENDO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: true,
   	        finalizarAtencion: true,
   	        derivarAtencion: true,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        tipoAtencion: true,
   	        pendiente: true
   	    },
   	    [ESTADOS.EVALUANDO]: {
   	    	iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: true,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        tipoAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.FINALIZADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: true,
   	        tipoAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.ANULADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: true,
   	        tipoAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.REACTIVADO]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        tipoAtencion: false,
   	        pendiente: true
   	    }
   	};
    
    function applyButtonsStates(item, config) {
    	$('#btnIniciarAtencion' + item.id).attr("disabled", !config.iniciarAtencion);
    	$('#btnEvaluarAtencion' + item.id).attr("disabled", !config.evaluarAtencion);
    	$('#btnFinalizarAtencion' + item.id).attr("disabled", !config.finalizarAtencion);
    	$('#btnDerivarAtencion' + item.id).attr("disabled", !config.derivarAtencion);
    	$('#btnAnularAtencion' + item.id).attr("disabled", !config.anularAtencion);
    	$('#btnActivarAtencion' + item.id).attr("disabled", !config.activarAtencion);
    	$('#btnTipoAtencion' + item.id).attr("disabled", !config.tipoAtencion);
    	
    	return config.pendiente ? 1 : 0;
    }
    
    function ConstruyeFila(item, iApellido, horaEmision, horaInicio, horaFin, listadoBotones) {
        return '<tr>' +
            '<td><span>' + (iApellido == 1 ? item.descripcion : item.codigo) + '</span></td>' +
            '<td><span>' + item.numeroIdentificacion + '</span></td>' +
            '<td><span>' + item.nombreSubgrupo + '</span></td>' +
            '<td><span>' + horaEmision + '</span></td>' +
            '<td><span>' + horaInicio + '</span></td>' +
            '<td><span>' + horaFin + '</span></td>' +
            '<td>' + item.descripcionEstado + '</td>' +
            listadoBotones +
		'</tr>';
    }
    
    function Construyehtml(data, tipoPantalla, idEvalua, iApellido, iAtencion, iAnula){
    	console.log(data);

		$('#tbl_ventanilla_usuario tbody').empty(); 
		var nRegistrosPendientes = 0;
		
		for ( var i=0; i<data.length; i++ ) {

			var horaEmision = formatHour(data[i].horaEmision);
			var horaInicio = formatHour(data[i].horaInicioAtencion);
			var horaFin = formatHour(data[i].horaFinAtencion);

			var listadoBotones = showButtons(data[i], idEvalua, iAtencion, iAnula);
			var fila = ConstruyeFila(data[i], iApellido, horaEmision, horaInicio, horaFin, listadoBotones)
			
			$('#tbl_ventanilla_usuario tbody').append(fila);

			if (buttonStateConfig[data[i].estado]) {
				nRegistrosPendientes += applyButtonsStates(data[i], buttonStateConfig[data[i].estado]);
			}
		}
		
		updateNextButton(nRegistrosPendientes);                                                                                                                                                                                                                                                                                                                                                                                            
    }
    
    function updateNextButton(nRegistrosPendientes) {
    	$('#btnLlamarSiguiente').attr("disabled", nRegistrosPendientes > 0);
    }
    
    function showButtons(data, idEvalua, iAtencion, iAnula){
    	// idEvalua == 1 --> Muestra boton de evaluacion
		// iAtencion == 1 --> Muestra boton de tipo de atencion
		// iAnula == 1 --> Muestra boton de anulacion
		
    	var buttons = '<td>' +
			'<a href="#" onclick="fnLlamarXAudio('+data.id+')" class="btn btn-primary" title="Llamar">' + 
				'<span class="glyphicon glyphicon-volume-up"></span>&nbsp;LLamar' +
			'</a>&nbsp;' + 
			'<a href="#" id="btnIniciarAtencion'+data.id+'" onclick="fnIniciarAtencion('+data.id+','+data.estado+')" class="btn btn-primary" title="Iniciar" >'+
				'<span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar' +
			'</a>&nbsp;' + 
			'<a href="#" id="btnDerivarAtencion'+data.id+'" onclick="fnDerivarAtencion('+data.id+','+data.estado+')" class="btn btn-warning">' +
				'<span class="glyphicon glyphicon-share"></span>&nbsp;Derivar' +
			'</a>&nbsp;' +
			'<a href="#" id="btnFinalizarAtencion'+data.id+'" onclick="fnFinalizarAtencion('+data.id+','+data.estado+')" class="btn btn-info" title="Finalizar">' +
				'<span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar' +
			'</a>&nbsp;' +
			'<a href="#" id="btnActivarAtencion'+data.id+'" onclick="fnActivarAtencion('+data.id+','+data.estado+')" class="btn btn-success">' +
				'<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Re-Activar' +
			'</a>&nbsp;' +
			
			( iAtencion == 1 ? isAttended(data) : '' ) +
			( idEvalua == 1 ? isEvaluated(data) : '' ) +
			( iAnula == 1 ? isAnulated(data) : '' ) +
			
		'</td>';
		
		return buttons;
    }
    
    function isAttended(data) {
    	return '<button href="#" id="btnTipoAtencion'+data.id+'" onclick="fnTipoAtencion(\''+data.numeroIdentificacion+'\','+data.id+',\''+data.nombreGrupo+'\','+data.estado+')" data-toggle="modal" class="btn btn-warning">' +
			'<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Tipo de Atenci&oacuten'+
		'</button>&nbsp;';
    }
    
    function isEvaluated(data) {
    	return '<a href="#" id="btnEvaluarAtencion'+data.id+'" onclick="fnEvaluarAtencion('+data.id+','+data.estado+')" class="btn btn-success">' +
			'<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar' +
		'</a>&nbsp;';
    }
    
    function isAnulated(data) {
    	return '<a href="#" id="btnAnularAtencion'+data.id+'" onclick="fnAnularAtencion('+data.id+','+data.estado+')" class="btn btn-success">' +
			'<span class="glyphicon glyphicon-thumbs-down"></span>&nbsp;Anular' +
		'</a>&nbsp;';
    }
    
    function confirmAction(config) {
    	var defaultConfig = {
    		title: '¿Estás seguro?',
    		content: 'Presion SI para continuar',
    		url: '',
    		data: {},
    		successMessage: 'Acción realizada exitosamente',
    		errorMessage: 'Ocurrió un error',
    		onSuccess: null,
    		onError: null
    	}
    	
    	for (var key in config) {
    		if (config.hasOwnProperty(key)) {
    			defaultConfig[key] = config[key];
    		}
    	}
    	
    	$.confirm({
    		title: defaultConfig.title,
    		content: defaultConfig.content,
    		buttons: {
    			confirm: {
    				text: 'SI',
    				action: function() {
    					$.ajax({
    						type: 'POST',
    						url: defaultConfig.url,
    						data: defaultConfig.data,
    						success: function(response) {
    							$.alert(defaultConfig.successMessage);
    							
    							if (typeof defaultConfig.onSuccess === 'function') {
    								defaultConfig.onSuccess(response)
    							}
    						},
    						error: function(xhr) {
    							$.alert(defaultConfig.errorMessage);
    						}
    					})
    				}
    			},
    			cancel: {
    				text: 'NO',
                    action: function() {
                        $.alert('Cancelado!');
                    }
    			}
    		}	
    	})
    }
    
    function count(idTicket, idUsuario, idEvalua){
    	var n = 0;
    	var l = document.getElementById("number");
		var iEmpresa='${usuario.iEmpresa}';
    	
    	nMax=$("#lTiempoEvaluacionEspera").val();

    	intval=window.setInterval(function(){
   	    $("#nroInterval").val(intval);

    		l.innerHTML = n;
    	  if (n==nMax-5){
    		  var j = document.getElementById("esperaEvaluarTxt");
    		  j.innerHTML="Gracias ya puede salir"
    	  }
    	  if (n==nMax) {
         		grabar_evaluacion(intval,idTicket, idUsuario, idEvalua);   
    	  }
    	  n=n+1;
    	},1000);

    }
    function grabar_evaluacion(intval,idTicket, idUsuario, idEvalua ){
    		clearInterval(intval);
			console.log(" ingreso a la func grabacion");
			console.log(" intval"+intval+" Ticket:"+idTicket+" idUsuario:"+idUsuario+" idEvalua"+idEvalua);

	    	$("#modalEvaluarTicket").modal("hide");

	    	$.ajax({ 
	     		type: 'POST', 
	     		url: 'concluyeevaluacionespera.app',
	     		data: {idTicket: idTicket,idUsuario: idUsuario },
				success: function (response) {     			 			
				var data = response.data;
				var TextooApellido_sino=$('#txtApellido_sino').val();	
				Construyehtml(data,'S',idEvalua, TextooApellido_sino);
			}
			});	
    }

    $("#evaluar_boton_finalizar").click(function() {
     		var intval= $("#nroInterval").val();
      		var idUsuario='${usuario.iUsuarioId}';    	
        	var idEvalua='${usuario.iEvalua}';
        	var iAnula = '${usuario.iAnula}';
        	var idTicket = $("#txtIdTicketEvalua").val(); 
    		console.log(" ingreso al Boton Cerrar Evaluacion");
    		console.log(" intval"+intval+" Ticket:"+idTicket+" idUsuario:"+idUsuario+" idEvalua"+idEvalua);
        	
        	// si el Usuario de Ventanilla tiene opcion Optativa de Evaluacion.
        	if (idEvalua==3) {
    		
           		grabar_evaluacion(intval,idTicket, idUsuario, idEvalua);    	
        	} else {
        		console.log(" entra al Ajax");
        		clearInterval(intval);
    	    	$("#modalEvaluarTicket").modal("hide");
        		$.ajax({ 
    					type: 'POST', 
    					url: 'listarticketbyidusuario.app',
    					data: {idUsuario: idUsuario},
    					success: function (response) {
    						var data = response.data;				     			
    						var TextooApellido_sino=$('#txtApellido_sino').val();	
    						Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAnula);
    						
    					}
    				});	
        	}

        });


    $("#btnCerrarSession").click(function() {
    	window.location.href = 'logout.app';
    });
    
    $("#btnLlamarSiguiente").click(function() {    	
    	var idControlAsistencia = '${usuario.iControlAsistencia}';
    	var idRolEquipo = '${usuario.iRolEquipo}';
    	var idSucursal='${usuario.iSucursal}';
    	var idUsuario='${usuario.iUsuarioId}';    	
    	var idVentanilla='${usuario.iVentanilla}';
    	var idEvalua='${usuario.iEvalua}';
    	var iAnula = '${usuario.iAnula}';
		var iEmpresa='${usuario.iEmpresa}';
		$('#btnLlamarSiguiente').attr("disabled", true);
    	$.ajax({ 
     		type: 'POST', 
     		url: 'nextticket.app',
     		data: {idUsuario: idUsuario, 
         		idSucursal: idSucursal, 
         		idRolEquipo: idRolEquipo,         		
         		idVentanilla: idVentanilla},
     		success: function (response) {     			 			
     			var data = response.data;

				var TextooApellido_sino=$('#txtApellido_sino').val();	
				Construyehtml(data,'S',idEvalua, TextooApellido_sino, idControlAsistencia, iAnula);
    		
     		}	
   		});    					  
    });

	$("#btnDerivarTicket").click(function() {    	
    	
    	var idRolEquipo = '${usuario.iRolEquipo}';
    	var idSucursal='${usuario.iSucursal}';
    	var idUsuario='${usuario.iUsuarioId}';    	
//     	var idVentanilla='${usuario.iVentanilla}';
    	var idTicket = $("#txtIdTicketDeriva").val();
    	var idGrupo=$("#cboGrupoDerivar").val();
		var tipoParametro= $("#txtTipoDerivacion").val();
	    var tipoDeriva=$('#cboTipoDeriva').val();
		var idVentanilla = $("#cboVentanillaDerivar").val();

		if ((tipoParametro==1) || (tipoParametro==2)) {
		    if (tipoDeriva==1){
		    	idVentanilla=0;
		    } else
		    	{
		    	idGrupo=$("#cboGrupoVentanillaDerivar").val();
				// idVentanilla mantiene su valor. tipoDeriva=2
		   	}
		}
		if (tipoParametro==3){
	    	idVentanilla=0;	
		}
		
		console.log("tipo Parametro:"+tipoParametro);
		console.log("Valor de Grupo:"+idGrupo);
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iEmpresa='${usuario.iEmpresa}';		
		//genera el nuevo ticket
		$.ajax({ 
     		type: 'POST', 
     		url: 'derivarticket.app',
     		data: {idUsuario: idUsuario, idTicket: idTicket, idGrupo: idGrupo, idVentanilla: idVentanilla},
     		success: function (response) {     			 			
     			var data = response.data;
     			var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
                        title: 'Exito',
                        content: mensaje,
                    });
             	}     			
			
				var TextooApellido_sino=$('#txtApellido_sino').val();	
				Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAnula);
     		}
   		});
    });
	
	function fnEvaluarAtencion(idTicket, idEstado){
		if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 ) return;
		$("#txtIdTicketEvalua").val(idTicket);
     	var idUsuario = '${usuario.iUsuarioId}';
    	var idVentanilla='${usuario.iVentanilla}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iAtencion = '${usuario.iAtencion}';	
		var TextooApellido_sino=$('#txtApellido_sino').val();	

   		confirmAction({
   			title: '¿Estás seguro de iniciar la encuesta?',
   			url: 'evaluarAtencion.app',
   			data: { 
   				idTicket: idTicket, 
   				idVentanilla: idVentanilla, 
   				idUsuario: idUsuario
			},	 
   			successMessage: 'Encuesta Iniciada!',
   			errorMessage: 'Ocurrió un Error al iniciar la encuesta!',
   			onSuccess: function(response) {
   				Construyehtml(response.data, 'S', idEvalua, TextooApellido_sino, iAtencion, iAnula);	
   			},
   		})
    }


//     function fnEvaluarAtencion(idTicket, idEstado){
// 		if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 ){
			
//     		return;
//     	}
// 		$("#txtIdTicketEvalua").val(idTicket);
//     	$("#modalEvaluarTicket").modal("show");
//      	var idUsuario = '${usuario.iUsuarioId}';
//     	var idVentanilla='${usuario.iVentanilla}';
// 		var idEvalua='${usuario.iEvalua}';
// 		var iEmpresa='${usuario.iEmpresa}';	
//    		console.log("idEvalua" +idEvalua);  

// 		if (idEvalua==3){
//        		console.log(" fnEvaluarAtencion ==3");  
//        		$('#evaluar_boton_finalizar').html("Finaliza Atencion");       		

// 		}else {
//        		console.log(" fnEvaluarAtencion !=3");  

//        		$('#evaluar_boton_finalizar').html("Cerrar");       		

// 		}
		

// 		$.ajax({ 
//      		type: 'POST', 
//      		url: 'evaluaratencion.app',
//      		data: {idTicket: idTicket, idVentanilla: idVentanilla, idUsuario: idUsuario},
//      		success: function (response) {     			 			
//      			var data = response.data;
//      		}	
//    		});
// 		count(idTicket, idUsuario, idEvalua);

//     }
    

    function fnLlamarXAudio(idTicket){
		console.log("entro a llamar");
    	var iRolEquipo ='${usuario.iRolEquipo}';
    	
    	$.ajax({ 
     		type: 'POST', 
     		url: 'activarllamadoxaudio.app',
     		data: {idTicket: idTicket},
     		success: function (response) {     			 			
     			var data = response.data;
				if(response.success == true){

				}
     		}	
   		});
    }

    function fnIniciarAtencion(idTicket, idEstado){
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var idControlAsistencia = '${usuario.iControlAsistencia}';
		var iEmpresa='${usuario.iEmpresa}';
		if (idEstado==50 || idEstado==60 || idEstado==90 ){
    		return;
    	}
		// revisar si se mostrar en la tv
		$.ajax({ 
     		type: 'POST', 
     		url: 'iniciarprevioVerificaenTv.app',
     		data: {idTicket: idTicket, idUsuario:idUsuario},
     		success: function (response) {     			 			
			siMuestraTV=response.data;
			console.log("muestra informacion de iniciarprevioVerificaenTv.app :");
			console.log(siMuestraTV);
			if  (siMuestraTV==0) {
				var r = confirm("Ticket no se muestra en la TV, Desea Iniciar la Atencion del Ticket?");
				if (r == true) 	siMuestraTV=1;
				else  siMuestraTV=0;
			}	
			if  (siMuestraTV==1) {
				$.ajax({ 
					type: 'POST', 
					url: 'iniciaratencion.app',
					data: {idTicket: idTicket, idUsuario:idUsuario},
					success: function (response) {     			 			
						var data = response.data;

						var TextooApellido_sino=$('#txtApellido_sino').val();
						Construyehtml(data,'S',idEvalua, TextooApellido_sino, idControlAsistencia, iAnula);
					}	
				});
			}
		}	
   		});
     }     
// 	cambiar clave
	function fnCambiarClaveForm(idUsuario){
		
		$('#modalCambiarClave').modal('show');

	}

	function fnCerrarSession(){
		window.location.href = 'logout.app';
	}

	function fnCambiarClave(){

		var pass = $('#txtNuevaClave').val();
		var idUsuario = '${usuario.iUsuarioId}';
		
		$.ajax({ 
			type: 'POST', 
			url: 'cambiarclaveusuario.app',
			data: {idUsuario: idUsuario, pass: pass},		
			success: function (response) {				
				var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
                        title: 'Exito',
                        content: mensaje,
                    });
     				$("#modalCambiarClave").val("");
     				$('#modalCambiarClave').modal('hide');
     				window.location.href = 'logout.app';     				
             	}			
			}
		});		
	}
	
	function fnCharla(){
		$("#modalCharla").modal("show");
	}
	
	$("#btnRegistrarCharla").click(function() {
		var idUsuario = '${usuario.iUsuarioId}';
		var numPersonas = $("#txtNPersonas").val();
		
		$.ajax({ 
     		type: 'POST', 
     		url: 'saveCharla.app',
     		data: {idUsuario: idUsuario, numPersonas: numPersonas},
     		success: function (response) {     			 			
     			var data = response.data;
     			var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
     		            title: 'Exito',
     		            content: 'Registrado correctamente',
     		        });
            	}     			
     		}
   		});
	});
	
	function fnTipoPausa(){
		$("#modalTipoPausa").modal("show");
	}
	
	$("#btnRegistrar").click(function() {    
		var idUsuario = '${usuario.iUsuarioId}';
		var dni = '${usuario.dni}';
		var tipoJustificacion = $('#cboTipoPausa').val();
		
		$.ajax({ 
     		type: 'POST', 
     		url: 'saveJustificacion.app',
     		data: {idUsuario: idUsuario, dni: dni, tipoJustificacion: tipoJustificacion},
     		success: function (response) {     			 			
     			var data = response.data;
     			var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
     		            title: 'Exito',
     		            content: 'Registrado correctamente',
     		        });
            	}     			
     		}
   		});
	});
	
	function fnTipoAtencion(numeroIdentificacion, idTicket, idEstado){
		if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 ){

    		return;
    	}
		$("#txtIdTipoAtencion").val(0);
		$("#txtNombres").val("");
		$("#txtApePaterno").val("");
		$("#txtApeMaterno").val("");
		$("#txtDNI").val("");
		$("#cboEstado").val(0);
		$("#cboModalidad").val(0);
		$("#cboTipologia").val(0);
		$("#cboTipoDocumento").val(0);
		$("#cboTipoEntidad").val(0);
		$("#cboTipoGestion").val(0);
		$("#cboPlanCompraVivienda").val(0);
		$("#cboPlanCompraConstVivienda").val(0);
		$("#cboCuotaInicial").val(0);
		$("#cboRecibeInfo").val(0);
		$("#txtNExpediente").val("");
		$("#fechaDesembolso").val("");
		$("#fechaEstadoActual").val("");
		$("#txtPromotor").val("");
		$("#cboLugarVisita").val(0);
		$("#txtNCelular").val("");
		$("#txtCorreo").val("");
		$("#cboDepartamentos").val(0);
		$("#txtProvincia").val("");
		$("#txtDistrito1").val("");
		$("#txtDistrito2").val("");
		$("#txtTicket").val(idTicket);
		$("#modalTipoAtencion").modal("show");
		var dniCliente = numeroIdentificacion;
		var idTicket = idTicket;
		var datosCliente = document.getElementById('datosCliente');
		var compraVivienda = document.getElementById('divPlanCompraVivienda');
		var constVivienda = document.getElementById('divPlanCompraConstVivienda');
		datosCliente.style.display = 'none'; 
		console.log(numeroIdentificacion);
		console.log(idTicket);
		$("#cboModalidad").change(function(){
			var modalidad = $("#cboModalidad option:selected").val();
			var tipoGestion = $("#cboTipoGestion option:selected").val();
			if(tipoGestion == 126 && (modalidad == 23 || modalidad == 24 || modalidad == 25 || modalidad == 27)){
				datosCliente.style.display = ''; 
				if(modalidad == 23 || modalidad == 24 || modalidad == 25){
					constVivienda.style.display = ''; 
					compraVivienda.style.display = 'none';
				}else if(modalidad == 27){
					compraVivienda.style.display = ''; 
					constVivienda.style.display = 'none'; 
				}
			}
			else{
				datosCliente.style.display = 'none'; 
			}
		});

		$.ajax({ 
			type: 'POST', 
			url: 'getDataTipoAtencion.app',   		
			data: {dniCliente: dniCliente, idTicket: idTicket},
			success: function (response) {
				var data = response.data;
				if(data.length == 0){
					$.ajax({ 
						type: 'POST', 
						url: 'getPersonabydni.app',   		
						data: {dniCliente: dniCliente},
						success: function (response) {
							var data = response.data;
							console.log(data);
							if(data.length == 0){
								$("#txtDNI").val(numeroIdentificacion);
								$.alert({
			     		            title: 'Persona no registrada',
			     		            content: 'Está persona no está registrada en la base de datos',
			     		        });
								
							}else{					
								$("#txtDNI").val(data[0].dni);
								$("#txtNombres").val(data[0].nombres);
								$("#txtApePaterno").val(data[0].apePaterno);
								$("#txtApeMaterno").val(data[0].apeMaterno);
							}
						}
					});	
				}
				else{
					$("#txtIdTipoAtencion").val(data[0].id);
					$("#txtNombres").val(data[0].nombres);
					$("#txtApePaterno").val(data[0].apePaterno);
					$("#txtApeMaterno").val(data[0].apeMaterno);
					$("#txtDNI").val(data[0].dni);
					$("#cboEstado").val(data[0].estado);
					$("#cboModalidad").val(data[0].modalidad);
					$("#cboTipologia").val(data[0].tipologia);
					$("#cboTipoDocumento").val(data[0].tipoDocumento);
					$("#cboTipoEntidad").val(data[0].tipoEntidad);
					$("#cboTipoGestion").val(data[0].tipoGestion);
					$("#cboPlanCompraVivienda").val(data[0].planCompraVivienda);
					$("#cboPlanCompraConstVivienda").val(data[0].planCompraConstVivienda);
					$("#cboCuotaInicial").val(data[0].cuotaIniAhorroProg);
					$("#cboRecibeInfo").val(data[0].recibeInformacion);
					$("#txtNExpediente").val(data[0].nExpediente);
					

					$("#fechaDesembolso").val(f_fecha_unix_string(data[0].fechaDesembolso));
					$("#fechaEstadoActual").val(f_fecha_unix_string(data[0].fechaEstado));
					$("#txtPromotor").val(data[0].promotor);
					$("#cboLugarVisita").val(data[0].lugarVisita);
					$("#txtNCelular").val(data[0].nroContacto);
					$("#txtCorreo").val(data[0].correo);
					$("#cboDepartamentos").val(data[0].departamento);
					$("#txtProvincia").val(data[0].provincia);
					$("#txtDistrito1").val(data[0].distrito1);
					$("#txtDistrito2").val(data[0].distrito2);
				}
			}
		});	
	}
	
	$("#btnRegistrarTA").click(function() {   
		var idTipoAtencion = $("#txtIdTipoAtencion").val();
		var idUsuario = '${usuario.iUsuarioId}';
		var dni = $("#txtDNI").val();
		var nombres = $("#txtNombres").val();
		var apePaterno = $("#txtApePaterno").val();
		var apeMaterno = $("#txtApeMaterno").val();
		var estado = $('#cboEstado').val();
		var modalidad = $("#cboModalidad").val();
		var tipologia = $("#cboTipologia").val();
		var tipoDocumento = $("#cboTipoDocumento").val();
		var tipoEntidad = $("#cboTipoEntidad").val();
		var tipoGestion = $("#cboTipoGestion").val();
		var nExpediente = $("#txtNExpediente").val();
		var fechaDesembolso = $("#fechaDesembolso").val();
		var fechaEstado = $("#fechaEstadoActual").val();
		var promotor = $("#txtPromotor").val();
		var idTicket = $("#txtTicket").val();
		var numeroContacto = $("#txtNCelular").val();
		var correo = $("#txtCorreo").val();
		var departamento = $("#cboDepartamentos").val();
		var provincia = $("#txtProvincia").val();
		var distrito1 = $("#txtDistrito1").val();
		var distrito2 = $("#txtDistrito2").val();
		var planCompraVivienda = $('#cboPlanCompraVivienda').val();
		var planCompraConstVivienda = $('#cboPlanCompraConstVivienda').val();
		var cuotaInicial = $('#cboCuotaInicial').val();
		var recibeInfo =  $('#cboRecibeInfo').val();
		var lugarVisita = $("#cboLugarVisita").val();
		console.log(idTicket);
		if(idTipoAtencion == ''){
			idTipoAtencion = 0;
		}
		console.log(idTipoAtencion);
		$.ajax({ 
     		type: 'POST', 
     		url: 'savetipoatencion.app',
     		data: {idTipoAtencion: idTipoAtencion, idUsuario: idUsuario, dni: dni, nombres: nombres, apePaterno: apePaterno, apeMaterno: apeMaterno, estado: estado, modalidad: modalidad,
     			tipologia: tipologia, tipoDocumento: tipoDocumento, tipoEntidad: tipoEntidad, tipoGestion: tipoGestion,
     			nExpediente: nExpediente, fechaDesembolso: fechaDesembolso, fechaEstado: fechaEstado, promotor: promotor, idTicket: idTicket, numeroContacto: numeroContacto, 
     			correo: correo, departamento: departamento, provincia: provincia, distrito1: distrito1, distrito2: distrito2, planCompraVivienda: planCompraVivienda, 
     			planCompraConstVivienda: planCompraConstVivienda, cuotaInicial: cuotaInicial, recibeInfo: recibeInfo, lugarVisita: lugarVisita},
     		success: function (response) {     			 			
     			var data = response.data;
     			var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
     		            title: 'Exito',
     		            content: 'Registrado correctamente',
     		        });
            	}     			
     		}
   		});
	});
	
	function fnDerivarAtencion(idTicket, idEstado){		
		
		if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 ){

    		return;
    	}				
		$("#modalDerivarTicket").modal("show");
		$("#txtIdTicketDeriva").val(idTicket);
		var idUsuario = '${usuario.iUsuarioId}';
		var idSucursal = '${usuario.iSucursal}';
		var tipoParametro= $("#txtTipoDerivacion").val();
   		$('#cboTipoDeriva').val('0');		
		 // tipoParametro=1 cargar los grupos de la sucursal
		 // tipoparametro=2 cargar los grupos del area
		 // tipo parametro =3 cargar los grupos del Rol


		 if ((tipoParametro==1) ||  (tipoParametro==2)) {
			$("#divDerivaMenu").show();
			$('#divDerivaGrupo').hide()
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();		 
		 }

		 if (tipoParametro==3) {
			$("#divDerivaMenu").hide();		 
			$('#divDerivaGrupo').show()
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();
		 }				 


	} 

	function fnAnularAtencion(idTicket, idEstado){
		if ( idEstado==60 || idEstado==90 ) return;
    	
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';		
		var tipoAnulacion =11;
		var descripcion = 'Se retiro sin Motivo';
		var idSucursal = '${usuario.iSucursal}';
		var iAtencion = '${usuario.iAtencion}';
		var TextooApellido_sino=$('#txtApellido_sino').val();	

		confirmAction({
   			title: '¿Estás seguro de anular el ticket?',
   			url: 'anularatencion.app',
   			data: { 
   				idTicket: idTicket, 
   				idUsuario: idUsuario,  
   				idSucursal: idSucursal,
   				tipoAnulacion: tipoAnulacion, 
   				descripcion: descripcion
 			},		 
   			successMessage: 'Ticket Anulado!',
   			errorMessage: 'Ocurrió un Error al anular el ticket!',
   			onSuccess: function(response) {
   				Construyehtml(response.data, 'S', idEvalua, TextooApellido_sino, iAtencion, iAnula);	
   			},
   		})	
    }

	function fnActivarAtencion(idTicket, idEstado){
		if ( idEstado==40 || idEstado==41 || idEstado==50 ) return;
    	
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iEmpresa='${usuario.iEmpresa}';
		var idSucursal = '${usuario.iSucursal}';
		var iAtencion = '${usuario.iAtencion}';
		var TextooApellido_sino=$('#txtApellido_sino').val();	
		
		confirmAction({
   			title: '¿Estás seguro de reactivar el ticket?',
   			url: 'activaratencion.app',
   			data: { 
   				idTicket: idTicket, 
   				idUsuario: idUsuario
 			},		 
   			successMessage: 'Ticket Reactivado!',
   			errorMessage: 'Ocurrió un Error al reactivar el ticket!',
   			onSuccess: function(response) {
   				Construyehtml(response.data, 'S', idEvalua, TextooApellido_sino, iAtencion, iAnula);	
   			},
   		})
    }

    function fnFinalizarAtencion(idTicket, idEstado){
    	var idControlAsistencia = '${usuario.iControlAsistencia}';
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iEmpresa='${usuario.iEmpresa}';		
			if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 ){
	    		return;
	    	}
    	$.ajax({ 
     		type: 'POST', 
     		url: 'finalizaratencion.app',
     		data: {idTicket: idTicket, idUsuario:idUsuario},
     		success: function (response) {     			 			
     			var data = response.data;
				var TextooApellido_sino=$('#txtApellido_sino').val();	
				Construyehtml(data,'S',idEvalua, TextooApellido_sino, idControlAsistencia, iAnula);
     		}	
   		});
    }

    
    $('#cboTipoDeriva').on('change', function() {
		var tipoDeriva = this.value;
		$('#cboGrupoVentanillaDerivar').val(0);	
		$('#cboGrupoDerivar').val(0);	
		$('#cboVentanillaDerivar').val(0);	
		if(tipoDeriva==1){			
			$('#divDerivaGrupo').show()
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();
		}
		else if(tipoDeriva==2){
			$('#divDerivaGrupo').hide()
			$('#divDerivaVentanilla').show();
			$('#divDerivaGrupoVentanilla').hide();
		}
		else{
			$('#divDerivaGrupo').hide();
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();
			$('#cboTipoDeriva').val(0);
		}		
	});

    $('#cboVentanillaDerivar').on('change', function() {
		var idVentanilla = this.value;
		var idSucursal = '${usuario.iSucursal}';
		$('#cboGrupoVentanillaDerivar').val(0);	
		$('#cboGrupoDerivar').val(0);	
		
		$("#cboGrupoVentanillaDerivar").children("option:not(:first)").remove();
		$("#cboGrupoVentanillaDerivar").prop('disabled', false);

		console.log("ingresando a la ventanilla:"+idVentanilla);
		$.ajax({ 
    		type: 'POST', 
    		url: 'listarGruposxventanilla.app',
    		data: {idSucursal: idSucursal, idVentanilla: idVentanilla}, 	    		
    		success: function (response) {
    			var data = response.data;
				console.log('data->>>');
    			console.log(data);
    			$.each(data, function (index, item) {
                    console.log(data);
                    $("<option/>")
                            .attr("value", item.id)
                            .text(item.nombre)
                            .appendTo("#cboGrupoVentanillaDerivar");
            		$('#divDerivaGrupoVentanilla').show();
                });	
    		}
    	});	
		console.log("no pasa");
		
	});

    function modalActualizar(){
    	$("#modalActualizarVentanilla").modal('show');	
    }
    function f_fecha_unix_string(p_fecha){
    	console.log(p_fecha)
    	if (p_fecha != null) {
			var u_fecha = new Date(p_fecha)
			var v_year = u_fecha.toLocaleString("default", { year: "numeric" });
			var v_month = u_fecha.toLocaleString("default", { month: "2-digit" });
			var v_day = u_fecha.toLocaleString("default", { day: "2-digit" });
			
			// Generate yyyy-mm-dd date string
			var v_formatodate = v_year + "-" + v_month + "-" + v_day;
			console.log('linea 1213-->'+v_formatodate);	
    	}
		else v_formatodate=' ';
		return v_formatodate;
    }
    $('#cboArea').on('change', function() {
//		var idSede = this.value;
		var idSucursal = '${usuario.iSucursal}';
		var idArea = this.value;
		$("#cboVentanilla").children("option:not(:first)").remove();
		$("#cboVentanilla").prop('disabled', false);		
		$.ajax({ 
			type: 'POST', 
			url: 'getventanillasxidarea.app',
			data: {idSucursal: idSucursal, idArea: idArea}, 	    		
			success: function (response) {
				var data = response.data;

				$.each(data, function (index, item) {

	                $("<option/>")
	                        .attr("value", item.id)
	                        .text(item.nombre)
	                        .appendTo("#cboVentanilla");
	            });	
			}
		});	
	
	});  
      
$(document).ready(function(){
	var idSucursal='${usuario.iSucursal}';
	var idUsuario='${usuario.iUsuarioId}';	
	var idVentanilla='${usuario.iVentanilla}';
	var idEvalua='${usuario.iEvalua}';
	var iAnula = '${usuario.iAnula}';
	var idControlAsistencia = '${usuario.iControlAsistencia}';
    var idRolEquipo = '${usuario.iRolEquipo}';
	var iEmpresa='${usuario.iEmpresa}';	
	var estado = '1';
	var modalidad = '22';
	var tipologia = '36';
	var tipoDocumento = '85';
	var tipoEntidad = '106';
	var tipoGestion = '125';
	var planCompra = '129';
	var cuotaInicial = '133';
	var recibeInfo = '137';
	var lugarVisita = '140';
	var departamentos = '165';
	var datosCliente = document.getElementById('datosCliente');
	datosCliente.style.display = 'none'; 
	console.log("Control de asistencia: "+idControlAsistencia);

	$.ajax({ 
		type: 'POST', 
		url: 'listarEstado.app',   		
		data: {estado: estado, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboEstado");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarModalidad.app',   		
		data: {modalidad: modalidad, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboModalidad");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarTipologia.app',   		
		data: {tipologia: tipologia, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboTipologia");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarTipoDocumento.app',   		
		data: {tipoDocumento: tipoDocumento, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboTipoDocumento");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarTipoEntidad.app',   		
		data: {tipoEntidad: tipoEntidad, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboTipoEntidad");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarTipoGestion.app',   		
		data: {tipoGestion: tipoGestion, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboTipoGestion");
            });	
		}
	});	
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarPlanCompra.app',   		
		data: {planCompra: planCompra, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboPlanCompraVivienda");
                $("<option/>")
                .attr("value", item.id)
            	.text(item.descripcion)
                .appendTo("#cboPlanCompraConstVivienda");
            });	
		}
	});	
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarCuotaInicial.app',   
		data: {cuotaInicial: cuotaInicial, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboCuotaInicial");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarRecibeInfo.app',   		
		data: {recibeInfo: recibeInfo, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboRecibeInfo");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarLugarVisita.app',   		
		data: {lugarVisita: lugarVisita, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboLugarVisita");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarDepartamentos.app',   		
		data: {departamentos: departamentos, idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                    	.text(item.descripcion)
                        .appendTo("#cboDepartamentos");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarJustificacion.app',   		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.idTipoJustificacion)
                    	.text(item.descripcion)
                        .appendTo("#cboTipoPausa");
            });	

			$("#cboTipoPausa option[value= 1 ]").remove();
		}
	});
	
// obtener parametro de tipo de derivacion DE LA TABLA PARAMETRO
	$.ajax({ 
		type: 'POST', 
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'160'},		 	    		
		success: function (response) {
			var data = response.data;
			$('#txtTipoDerivacion').val(data);	
		}
	});

//obtener el nombre de ventanilla por idUsuario


	//listar los ghrupos
	
	// vbr 20191124 OBTENER el tiempo de espera para la evaluacion parametro 150
	$.ajax({ 
		type: 'POST', 
		url: 'ConsultaTiempoEvaluacion.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			tiempoEvaluacion=data.valor;
			texto= " Espere "+tiempoEvaluacion+" Segundos"

			$("#lTiempoEvaluacionEspera").val(tiempoEvaluacion);
			$("#lTiempoEvaluacionEsperatext").html(tiempoEvaluacion);
		}
	});
// listar tipo de Notificacion de acuerdo al codigo de ventanilla tabla ventanilla notificacion_id
	$.ajax({ 
		type: 'POST', 
		url: 'ActivaNotificacionVentanilla.app',
		data: {idVentanilla: idVentanilla}, 	    		
		success: function (response) {
			var data = response.data;
			$("#txtNotifica_sino").val(data);
		}
	});

	// listar ventanillas


	
	$.ajax({ 
		type: 'POST', 
		url: 'getventanillabyid.app',
		data: {idVentanilla: idVentanilla},
		success: function (response) {
			var data = response.data;				     			
			var nombreVentanilla=data.nombre;				        					
			$('#txtNombreVentanilla').html(nombreVentanilla);
    					
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaApellidoSino.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;

			$('#txtApellido_sino').val(data);	
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaAsistencia.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			var asistencia = document.getElementById('divAsistencia');
			if(data == 1){
				asistencia.style.display = '';
			}
			
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaCharla.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			var charla = document.getElementById('divCharla');
			if(data == 1){
				charla.style.display = '';
			}
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listarticketbyidusuario.app',
		data: {idUsuario: idUsuario},			
		success: function (response) {			
			var data = response.data;				     			
			var html;									
			var hi;
			var hf; 
			var TextooApellido_sino=$('#txtApellido_sino').val();			
			Construyehtml(data,'S',idEvalua, TextooApellido_sino, idControlAsistencia, iAnula);

		}
	});
	
	$(".btn-group .btn").click(function(){
		var inputValue = $(this).find("input").val();
		if(inputValue != 'all'){
			var target = $('table tr[data-status="' + inputValue + '"]');
			$("table tbody tr").not(target).hide();
			target.fadeIn();
		} else {
			$("table tbody tr").fadeIn();
		}
	});
	// Changing the class of status label to support Bootstrap 4
    var bs = $.fn.tooltip.Constructor.VERSION;
    var str = bs.split(".");
    if(str[0] == 4){
        $(".label").each(function(){
        	var classStr = $(this).attr("class");
            var newClassStr = classStr.replace(/label/g, "badge");
            $(this).removeAttr("class").addClass(newClassStr);
        });
    }
    
    $.ajax({ 
		type: 'POST', 
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
	

			$.each(data, function (index, item) {
                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboArea");
            });	
		}
	});
	var tipoParametro= $("#txtTipoDerivacion").val();	
	derivalistadogrupo(idSucursal, tipoParametro, idUsuario);	
	derivalistadoventanilla(idSucursal, tipoParametro, idUsuario);
	
});

window.onbeforeunload = function() {
	  var xhr = new XMLHttpRequest();
	  xhr.open("GET", "logout.app", true);
	  xhr.send();
	};
// vbr 20241223
//End vbr 20241223
setInterval(verTicketEspera,10000);
function verTicketEspera(){										       
	var idRol='${usuario.iRolEquipo}';
	console.log(idRol);
	$.ajax({ 
		type: 'POST', 
		url: 'getcantidadticketesperaTodo.app',
		data: {idRol: idRol},
		success: function (response) {
					var data = response.data;
					cant = data;
					var dataInicial=$("#cantEspera").html();
					var notificaSiNo=$("#txtNotifica_sino").val();
					console.log("data inicio:"+dataInicial);
					if(cant!=0){
						$('#btnTurnos').addClass("parpadea");
					}
					else{
						$('#btnTurnos').removeClass("parpadea");
					}
					console.log("data carga:"+cant);
					if (notificaSiNo==1){
						if (cant>dataInicial){
							notificacion_windows();
						}
					}	
					$("#cantEspera").html(cant);
					
			}
		});
 	}


$("#btnActualizarVentanilla").click(function() {    	
	
	var idSucursal='${usuario.iSucursal}';
	var idUsuario='${usuario.iUsuarioId}';
	var idArea = $("#cboArea").val();
	var idVentanilla = $("#cboVentanilla").val();
	
	$.ajax({ 
		type: 'POST', 
		url: 'getventanillabyid.app',
		data: {idVentanilla: idVentanilla},
		success: function (response) {
			var data = response.data;				     			
			var nombreVentanilla=data.nombre;				        					
			$('#txtNombreVentanilla').html(nombreVentanilla);
    					
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'actualizarventanilla.app',
		data: {idUsuario: idUsuario, idSucursal: idSucursal, idArea: idArea, idVentanilla: idVentanilla},
		success: function (response) {
// 			window.location.reload(true);
// 			window.history.forward(1);
		}
	});
});

</script>
    	
 <div class="modal fade" id="modalCambiarClave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center modal-header-primary">
        <h4 class="modal-title w-100 font-weight-bold">Cambiar Clave</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">          
          <input type="password" id="txtNuevaClave" class="form-control validate" placeholder="Ingrese Nueva Clave">
          
        </div>
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-primary" onclick="fnCambiarClave()">Cambiar</button>
      </div>
    </div>
  </div>
</div>   	
 
 
</body>
</html>