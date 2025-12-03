<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ICLASSQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
<link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
<link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
<link rel="stylesheet" type="text/css" href="librerias/bootstrap-3.3.7/dist/css/bootstrap-multiselect.css">
<link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
<link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
<link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
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
	
	.error-highlight {
        border: 2px solid #d32f2f !important;
        background-color: #ffebee !important;
        animation: shake 0.5s;
    }
    
    @keyframes shake {
        0%, 20%, 40%, 60%, 80% { transform: translateX(-2px); }
        10%, 30%, 50%, 70%, 90% { transform: translateX(2px); }
    }
    
    .is-invalid {
        border-color: #d32f2f !important;
    }
    
    .is-valid {
        border-color: #2e7d32 !important;
    }
    
    .invalid-feedback {
        color: #d32f2f;
        font-size: 0.875em;
        margin-top: 0.25rem;
    }
  </style>
  
<script src="librerias/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap.min.css"> 
<link href="librerias/css/estilosmenu.css" rel="stylesheet">
<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>
<script type="text/javascript" src="librerias/bootstrap-3.3.7/js/multi-select.js"></script>

<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
  
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
		font-size: 20px;
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
            	<input class="form-control" type="hidden" id="txtApellido_sino" />
				<input class="form-control" type="hidden" id="txtNotifica_sino" />
				<input class="form-control" type="hidden" id="puerto" />
				<select class="form-control" id="listaDeDispositivos" required style="display:none"></select>
				<input class="form-control" type="hidden" id="txtTieneAudio"/>
		   		<input class="form-control" type="hidden" id="txtDirAudio"/>
		   		
                <div class="col-sm-3 d-flex flex-column">
                	<h2 class="p-2">
                		<span>SUCURSAL: <span id="nombreSucursal"></span></span>
          			</h2>
                	<h2 class="p-2">
                		<span id="txtNombreVentanilla"></span>: 
               			<b>${usuario.vUsuarioNombres} ${usuario.vUsuarioApPaterno} ${usuario.vUsuarioApMaterno}</b>
          			</h2>
               	</div>
                <div class="col-sm-3 d-flex flex-column">
               		<h2 class="p-2">
               			<span>TICKETS ATENDIDOS: <span id="cantTickets">0</span></span>  
               		</h2>
                </div>
                <div class="col-sm-4">
               		<button type="button" class="btn btn-primary btn-lg" id="btnLlamarSiguiente"><span class="glyphicon glyphicon-forward"></span>&nbsp;Siguiente</button>
                	<button type="button" id="btnTurnos" class="btn btn-success">N° Turnos en Espera: <b><span id="cantEspera" style="font-size:15px"></span></b></button> 
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-danger btn-lg pull-right" onclick="fnCerrarSession()"><span class="glyphicon glyphicon-off"></span>&nbsp;Salir</button>
                	<button type="button" class="btn btn-primary btn-lg pull-right" onclick="fnCambiarClaveForm(${usuario.iUsuarioId})"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Cambiar Clave</button>
					<button type="button" class="btn btn-info btn-lg pull-right" onclick="handleAbsence(${usuario.iUsuarioId})" id="btnAusencia">
						<span class="glyphicon glyphicon-ok"></span>&nbsp;
						<span id="labelBtnAusencia">Registrar Ausencia</span>
					</button> 	
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover" id="tbl_ventanilla_usuario">
            <thead>
                <tr>                    
                    <th>TICKET</th>
                    <th>TIPO</th>
                    <th>N° DOCUMENTO</th>                    
                    <th>PRIORIDAD</th>   
                    <th>FECHA</th>   
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
	  <div class="modal-dialog modal-lg">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <h4 class="modal-title">Derivar Ticket</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
			<fieldset class="scheduler-border">
				<form>
					<div class="row">
						<input class="form-control" type="hidden" id="txtIdTicketDeriva" />
						<input class="form-control" type="hidden" id="txtNumeroDocumento" />
						<input class="form-control" type="hidden" id="txtNombreGrupo" />
				   		<input class="form-control" type="hidden" id="txtTipoDerivacion"/>				
						<div class="col-12 form-group">
							<div class="row center-block">
								<div class="col-xs-12 col-sm-4" style="display:none" id="divDerivaMenu">
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
<!-- 								<div class="col-xs-12 col-sm-4" style="display:none" id="divDerivaGrupoVentanilla"> -->
<!-- 									<label>Grupo</label> -->
<!-- 									<select class="form-control" id="cboGrupoVentanillaDerivar" disabled> -->
<!-- 										<option value="0">--Seleccione--</option> -->
<!-- 									</select> -->
<!-- 								</div>		 -->
							</div>
						</div>
					</div>
				</form>
			</fieldset>
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

<jsp:include page="components/modals/modalAusencia.jsp" />
<jsp:include page="components/modals/modalAnulacion.jsp" />
<jsp:include page="components/scripts/toAudioRecord.jsp" />
<jsp:include page="components/scripts/formatString.jsp" />
	
<script type="text/javascript">
	
	var usuarioAusente = false;
 	//parametros (Tipo de funcion, idEvalua)
    //S --siguiente
    //I-- Iniciar
    //F-- Finalizar
     function derivalistadoventanilla(idSucursal, tipoParametro, idUsuario) {
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

    function derivalistadogrupo(idSucursal, tipoParametro, idUsuario) {
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
   		DERIVADO: 70,
   		ANULADO: 90,
   		REACTIVADO: 91,
   		CANCELADO: 92,
   		AUSENTE: 93
   	};
    
    var buttonStateConfig = {
   	    [ESTADOS.LLAMADO_MONITOR]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.MONITOR_PINTA]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.ATENDIENDO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: true,
   	        finalizarAtencion: true,
   	        derivarAtencion: true,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.EVALUANDO]: {
   	    	iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: true,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.FINALIZADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: true,
   	        pendiente: false
   	    },
   	    [ESTADOS.DERIVADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.ANULADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: true,
   	        pendiente: false
   	    },
   	    [ESTADOS.REACTIVADO]: {
   	        iniciarAtencion: true,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: true,
   	        activarAtencion: false,
   	        pendiente: true
   	    },
   	    [ESTADOS.CANCELADO]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        pendiente: false
   	    },
   	    [ESTADOS.AUSENTE]: {
   	        iniciarAtencion: false,
   	        evaluarAtencion: false,
   	        finalizarAtencion: false,
   	        derivarAtencion: false,
   	        anularAtencion: false,
   	        activarAtencion: false,
   	        pendiente: false
   	    }
   	};
    
    function applyButtonsStates(item, config) {
    	$('#btnIniciarAtencion' + item.id).attr("disabled", !config.iniciarAtencion);
    	$('#btnEvaluarAtencion' + item.id).attr("disabled", !config.evaluarAtencion);
    	$('#btnFinalizarAtencion' + item.id).attr("disabled", !config.finalizarAtencion);
    	$('#btnDerivarAtencion' + item.id).attr("disabled", !config.derivarAtencion);
    	$('#btnAnularAtencion' + item.id).attr("disabled", !config.anularAtencion);
    	$('#btnActivarAtencion' + item.id).attr("disabled", !config.activarAtencion);
    	
    	return config.pendiente ? 1 : 0;
    }
    
    function ConstruyeFila(item, iApellido, horaEmision, horaInicio, horaFin, listadoBotones) {
        return '<tr>' +
            '<td><span>' + (iApellido == 1 ? item.descripcion : item.codigo) + '</span></td>' +
            '<td><span>' + item.nombreGrupo + '</span></td>' +
            '<td><span>' + item.numeroIdentificacion + '</span></td>' +
            '<td><span>' + item.nombreSubgrupo + '</span></td>' +
            '<td><span>' + new Date(+item.fechaAtencion).toLocaleDateString('es-PE') + '</span></td>' +
            '<td><span>' + horaEmision + '</span></td>' +
            '<td><span>' + horaInicio + '</span></td>' +
            '<td><span>' + horaFin + '</span></td>' +
            '<td>' + item.descripcionEstado + '</td>' +
            listadoBotones +
		'</tr>';
    }
    
    function Construyehtml(data, tipoPantalla, idEvalua, iApellido, iAtencion, iAnula){
		$('#tbl_ventanilla_usuario tbody').empty(); 
		var nRegistrosPendientes = 0;
		
		if (!data || data.length === 0) {
	        $('#tbl_ventanilla_usuario tbody').append(
	            '<tr><td colspan="8" class="text-center">No hay atenciones activas</td></tr>'
	        );
	        updateNextButton(0);
	        return;
	    }
		
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
		if (usuarioAusente) {
	        $('#btnLlamarSiguiente').prop("disabled", true);
	        return;
	    }
		
		$('#btnLlamarSiguiente').prop("disabled", nRegistrosPendientes > 0);
    }
    
    function showButtons(data, idEvalua, iAtencion, iAnula){
    	// idEvalua == 1 --> Muestra boton de evaluacion
		// iAtencion == 1 --> Muestra boton de tipo de atencion
		// iAnula == 1 --> Muestra boton de anulacion
    	var buttons = '<td>' +
    		makeACall(data) + 
    		initiateAttention(data) + 
    		referAttention(data) +
			endAttention(data) +
			activateAttention(data) +
			( idEvalua == 1 ? isEvaluated(data) : '' ) +
			( iAnula == 1 ? isAnulated(data) : '' ) +
		'</td>';
		
		return buttons;
    }
    
    function makeACall(data) {
    	return '<a href="#" onclick="fnLlamarXAudio('+data.id+')" class="btn btn-primary" title="Llamar">' + 
			'<span class="glyphicon glyphicon-volume-up"></span>&nbsp;LLamar' +
		'</a>&nbsp;';
    }
    
    function initiateAttention(data) {
    	return '<a href="#" id="btnIniciarAtencion'+data.id+'" onclick="fnIniciarAtencion('+data.id+','+data.estado+')" class="btn btn-primary" title="Iniciar" >'+
			'<span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar' +
		'</a>&nbsp;';
    }
    
    function referAttention(data) {
    	return '<a href="#" id="btnDerivarAtencion'+data.id+'" onclick="fnDerivarAtencion(\''+data.id+'\',\''+data.estado+'\',\''+data.idGrupo+'\',\''+data.numeroIdentificacion+'\', \''+data.nombreGrupo+'\')" class="btn btn-warning">' +
			'<span class="glyphicon glyphicon-share"></span>&nbsp;Derivar' +
		'</a>&nbsp;';
    }
    
    function endAttention(data) {
    	return '<a href="#" id="btnFinalizarAtencion'+data.id+'" onclick="fnFinalizarAtencion(\''+data.id+'\',\''+data.estado+'\', \''+data.nombreGrupo+'\')" class="btn btn-info" title="Finalizar">' +
			'<span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar' +
		'</a>&nbsp;';
    }
    
    function activateAttention(data) {
    	return '<a href="#" id="btnActivarAtencion'+data.id+'" onclick="fnActivarAtencion('+data.id+','+data.estado+')" class="btn btn-success">' +
			'<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Re-Activar' +
		'</a>&nbsp;';
    }
    
    function isEvaluated(data) {
    	return '<a href="#" id="btnEvaluarAtencion'+data.id+'" onclick="fnEvaluarAtencion('+data.id+','+data.estado+')" class="btn btn-success">' +
			'<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar' +
		'</a>&nbsp;';
    }
    
    function isAnulated(data) {
    	return '<a href="#" id="btnAnularAtencion'+data.id+'" onclick="fnAnularAtencion('+data.id+','+data.estado+')" class="btn btn-danger">' +
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

    	intval = window.setInterval(function() {
			$("#nroInterval").val(intval);

    		l.innerHTML = n;
			if (n == nMax - 5){
				var j = document.getElementById("esperaEvaluarTxt");
				j.innerHTML="Gracias ya puede salir"
			}
			if (n==nMax) {
				grabar_evaluacion(intval,idTicket, idUsuario, idEvalua);   
			}
			
    	  	n = n + 1;
    	}, 1000);
    }
    
    function grabar_evaluacion(intval, idTicket, idUsuario, idEvalua) {
   		clearInterval(intval);

    	$("#modalEvaluarTicket").modal("hide");

    	$.ajax({ 
     		type: 'POST', 
     		url: 'concluyeevaluacionespera.app',
     		data: {
     			idTicket: idTicket,
     			idUsuario: idUsuario 
   			},
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
		  	
		if (idEvalua==3) {
			grabar_evaluacion(intval,idTicket, idUsuario, idEvalua);    	
		} else {
			clearInterval(intval);
			$("#modalEvaluarTicket").modal("hide");
			$.ajax({ 
				type: 'POST', 
				url: 'listarticketbyidusuario.app',
				data: { idUsuario: idUsuario },
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
    	var iAtencion = '${usuario.iAtencion}';
    	var idRolEquipo = '${usuario.iRolEquipo}';
    	var idSucursal='${usuario.iSucursal}';
    	var idUsuario='${usuario.iUsuarioId}';    	
    	var idVentanilla='${usuario.iVentanilla}';
    	var idEvalua='${usuario.iEvalua}';
    	var iAnula = '${usuario.iAnula}';
		var iEmpresa='${usuario.iEmpresa}';
		$('#btnLlamarSiguiente').prop("disabled", true);
    	$.ajax({ 
     		type: 'POST', 
     		url: 'nextticket.app',
     		data: {
     			idUsuario: idUsuario, 
         		idSucursal: idSucursal, 
         		idRolEquipo: idRolEquipo,         		
         		idVentanilla: idVentanilla
       		},
     		success: function (response) {     			 			
     			var data = response.data;
				var TextooApellido_sino = $('#txtApellido_sino').val();	
				Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAtencion, iAnula);
     		}	
   		});    					  
    });

	$("#btnDerivarTicket").click(function() {    	
		var idRolEquipo = '${usuario.iRolEquipo}';
		var idSucursal = '${usuario.iSucursal}';
		var idUsuario = '${usuario.iUsuarioId}';
		var idGrupo = $("#cboGrupoDerivar").val();
		var tipoParametro = $("#txtTipoDerivacion").val();
		var tipoDeriva = $('#cboTipoDeriva').val();
		var idVentanilla = $("#cboVentanillaDerivar").val();
		var idTicket = $("#txtIdTicketDeriva").val();

		if ((tipoParametro == 1) || (tipoParametro == 2)) {
			if (tipoDeriva == 1) {
				idVentanilla = 0;
			}
		}
		if (tipoParametro == 3) {
			idVentanilla = 0;
		}

		const idEvalua = '${usuario.iEvalua}';
		const iAnula = '${usuario.iAnula}';
		const iEmpresa = '${usuario.iEmpresa}';
		const iAtencion = '${usuario.iAtencion}';
		
		$.ajax({
			type: 'POST',
			url: 'derivarticket.app',
			data: {
				idUsuario: idUsuario,
				idTicket: idTicket,
				idGrupo: idGrupo,
				idVentanilla: idVentanilla,
				idSucursal: idSucursal
			},
			success: function (response) {
				const data = response.data;
				const mensaje = response.message;
				if (response.success === true) {
					$.alert({
						title: 'Éxito',
						content: mensaje,
					});
				}
				const TextooApellido_sino = $('#txtApellido_sino').val();
				Construyehtml(data, 'S', idEvalua, TextooApellido_sino, iAtencion, iAnula);
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
		var idSucursal = '${usuario.iSucursal}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iAtencion = '${usuario.iAtencion}';
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
						data: {idTicket: idTicket, idUsuario:idUsuario, idEstado: idEstado},
						success: function (response) {     
							var data = response.data;
							console.log(data);
	
							var TextooApellido_sino=$('#txtApellido_sino').val();
							Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAtencion, iAnula);
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
		confirmAction({
   			title: '¿Estás seguro de cerrar sesión?',
   			url: 'logout.app',
   			successMessage: 'Sesión Cerrada!',
   			errorMessage: 'Ocurrió un Error al cerrar la sesión!',
   			onSuccess: function() {
				window.location.href = 'login.app'; 
   		    }
   		})
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
     			if (response.success == true){
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

	function fnDerivarAtencion(idTicket, idEstado, idGrupo, numeroDocumento, nombreGrupo){		
		if (idEstado==40 || idEstado==41 || idEstado==60 || idEstado==90 || idEstado==92 || idEstado==93 ){
    		return;
    	}			
		
		$("#modalDerivarTicket").modal("show");
		$("#txtIdTicketDeriva").val(idTicket);
		$("#txtNumeroDocumento").val(numeroDocumento);
		$("#txtNombreGrupo").val(nombreGrupo);
		var idUsuario = '${usuario.iUsuarioId}';
		var idSucursal = '${usuario.iSucursal}';
		var tipoParametro= $("#txtTipoDerivacion").val();
   		$('#cboTipoDeriva').val('0');		
		 // tipoParametro=1 cargar los grupos de la sucursal
		 // tipoparametro=2 cargar los grupos del area
		 // tipo parametro =3 cargar los grupos del Rol

		 if ((tipoParametro==1) || (tipoParametro==2)) {
			$("#divDerivaMenu").show();
			$('#divDerivaGrupo').hide()
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();		
			$('#cboGrupoDerivar').val(idGrupo);
		 }

		 if (tipoParametro==3) {
			$("#divDerivaMenu").hide();		 
			$('#divDerivaGrupo').show()
			$('#divDerivaVentanilla').hide();
			$('#divDerivaGrupoVentanilla').hide();
		 }				 
	} 

	function fnAnularAtencion(idTicket, idEstado){
		if ( idEstado == 50 || 
			 idEstado == 60 || 
			 idEstado == 70 || 
			 idEstado == 90 || 
			 idEstado == 92 || 
			 idEstado == 93 ) return;
    	
		$("#modalGenerarAnulacion").modal("show");		
		getInitDataGenerateCancellation(idTicket);
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

    function fnFinalizarAtencion(idTicket, idEstado, nombreGrupo){
    	var iAtencion = '${usuario.iAtencion}';
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua ='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';
		var iEmpresa ='${usuario.iEmpresa}';	
		var TextooApellido_sino=$('#txtApellido_sino').val();

		if (idEstado==40 || 
			idEstado==41 || 
			idEstado==60 || 
			idEstado==70 || 
			idEstado==90 ||  
			idEstado==92 || 
			idEstado==93){
    		return;
    	}

		confirmAction({
   			title: '¿Estás seguro de finalizar la atención?',
   			url: 'finalizaratencion.app',
   			data: { 
   				idTicket: idTicket, 
   				idUsuario: idUsuario,  
   				idSucursal: idSucursal,
   				idEstado: idEstado
 			},		 
   			successMessage: 'Atención Finalizada!',
   			errorMessage: 'Ocurrió un Error al finalizar la atención!',
   			onSuccess: function(response) {
   				Construyehtml(response.data, 'S', idEvalua, TextooApellido_sino, iAtencion, iAnula);	
   				loadDailyTicketCount();
   			},
   		});
    }
    
    function loadDailyTicketCount() {
    	var idUsuario = '${usuario.iUsuarioId}';
    	
    	$.ajax({
    		type: 'POST',
    		url: 'contarTicketAtendidosDia.app',
    		data: { idUsuario: idUsuario },
    		success: function(res) {
    			$("#cantTickets").text(res.count || 0);
    		}
    	});
    }
    
    $('#cboTipoDeriva').on('change', function() {
		var tipoDeriva = this.value;
		$('#cboGrupoVentanillaDerivar').val(0);	
// 		$('#cboGrupoDerivar').val(0);	
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
// 		$('#cboGrupoDerivar').val(0);	
		
		$("#cboGrupoVentanillaDerivar").children("option:not(:first)").remove();
		$("#cboGrupoVentanillaDerivar").prop('disabled', false);

		console.log("ingresando a la ventanilla:"+idVentanilla);
		$.ajax({ 
    		type: 'POST', 
    		url: 'listarGruposxventanilla.app',
    		data: {idSucursal: idSucursal, idVentanilla: idVentanilla}, 	    		
    		success: function (response) {
    			var data = response.data;
    			$.each(data, function (index, item) {
                    $("<option/>")
                            .attr("value", item.id)
                            .text(item.nombre)
                            .appendTo("#cboGrupoVentanillaDerivar");
            		$('#divDerivaGrupoVentanilla').show();
                });	
    		}
    	});	
	});

    function modalActualizar(){
    	$("#modalActualizarVentanilla").modal('show');	
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

    var idSucursal = 0;
	var nombreArea = "";
$(document).ready(function(){
	init();
	idSucursal='${usuario.iSucursal}';
	var idUsuario='${usuario.iUsuarioId}';	
	var idVentanilla='${usuario.iVentanilla}';
	var idEvalua='${usuario.iEvalua}';
	var iAnula = '${usuario.iAnula}';
	var iAtencion = '${usuario.iAtencion}';
    var idRolEquipo = '${usuario.iRolEquipo}';
	var iEmpresa='${usuario.iEmpresa}';	
	loadUserAbsence(idUsuario);
	loadDailyTicketCount();

	// tipo documento
	$.ajax({ 
		type: 'POST', 
		url: 'listarTipoDocumentoXGeneraTicket.app',   		
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

	// obtener Audio 20241223 
	$.ajax({ 
		type: 'POST', 
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'040'},		 	    		
		success: function (response) {
			var data = response.data;
			$('#txtTieneAudio').val(data);	

			$.ajax({ 
				type: 'POST', 
				url: 'consultaParametroTipoDescrip.app',
				data: {idSucursal: idSucursal, parametro:'041'},		 	    		
				success: function (response) {
					var data = response.data;
					$('#txtDirAudio').val(data);	
				}
			});
			
		}
	});
	//End obtener Audio 20241223 
	
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

	$.ajax({
		type: 'POST',
		url: 'getsucursalbyid.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#nombreSucursal').html(data.nombre);
		}
	});
	
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
	
function listarTicketByIdUsuario(){
	var idUsuario='${usuario.iUsuarioId}';
	var idEvalua='${usuario.iEvalua}';
	var iAnula = '${usuario.iAnula}';
	var iAtencion = '${usuario.iAtencion}';	
	var TextooApellido_sino=$('#txtApellido_sino').val();	
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarticketbyidusuario.app',
		data: {idUsuario: idUsuario},			
		success: function (response) {			
			var data = response.data;	
			var TextooApellido_sino=$('#txtApellido_sino').val();	
			Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAtencion, iAnula);

		}
	});
}

	setInterval(verTicketEspera,1000);
	function verTicketEspera(){				
		var idRol='${usuario.iRolEquipo}';
		var idUsuario='${usuario.iUsuarioId}';
		var idVentanilla='${usuario.iVentanilla}';
		
		$.ajax({ 
			type: 'POST', 
			url: 'getcantidadticketesperaTodo.app',
			data: {
				idRol: idRol,
				idUsuario: idUsuario,
				idVentanilla: idVentanilla
			},
			success: function (response) {
				var data = response.data;
				cant = data;
				var dataInicial=$("#cantEspera").html();
				var notificaSiNo=$("#txtNotifica_sino").val();
				if (cant!=0) {
					$('#btnTurnos').addClass("parpadea");
				} else{
					$('#btnTurnos').removeClass("parpadea");
				}
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