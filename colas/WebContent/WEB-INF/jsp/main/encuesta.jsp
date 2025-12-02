<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Encuesta</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">   -->
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/jqvmap/jqvmap.min.css">   -->
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">   -->
<!--   <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">   -->
<!--   <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">   -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  
  <link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
  <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <style>
  	.modal-backdrop{
	   background-color: rgba(0,0,0,0.2);
	}
  </style>
</head>
<body>
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <jsp:include page="menu/menuTop.jsp"/>
  </nav>  
  <aside class="main-sidebar sidebar-dark-primary elevation-4">    
    <a href="index3.html" class="brand-link">
      <span class="brand-text font-weight-light">SUCURSAL: <span id="nombreSucursal"></span></span>
    </a>    
    <div class="sidebar">      
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
        	<a href="#" class="d-block"><span id="nombreUsuario"></span></a>
        </div>
      </div>      
      <nav class="mt-2">
        <jsp:include page="menu/menu.jsp" />
      </nav>      
    </div>    
  </aside>  
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Sucursal</a></li>
              <li class="breadcrumb-item active">Encuestas</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">        
        <div class="row">
        	<div class="col-12">
          		<div class="card">
            		<div class="card-header">
            			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Encuesta"><i class="fas fa-plus mr-2"></i>Agregar Encuesta</button>
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoEncuesta" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Encuesta</th>                  					
                  					<th>Fecha Creación</th>                  					
                  					<th>Desde</th>                  					
                  					<th>Hasta</th>                  					
                  					<th>Estado</th>                  					
                  					<th>Acciones</th>
                				</tr>
                			</thead>
                			<tbody>                                
                			</tbody>
              			</table>
            		</div>            
          		</div>
        	</div>          
       	</div>        
      </div>
    </section>    
  </div>  
  <footer class="main-footer">
    <strong>Copyright &copy; 2019 <a href="http://www.ginnet.com.pe">Ginnet</a>.</strong>
    todos los derechos reservados
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.0
    </div>
  </footer>
  <aside class="control-sidebar control-sidebar-dark">    
  </aside>  
</div>

	<!-- nueva encuesta  -->
	<div class="modal" id="newSurvey">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
			  <!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nueva Encuesta</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Título</label>
											<input class="form-control" type="text" id="txtDescripcion" style="text-transform:uppercase;" placeholder="Encuesta"/>
										</div>																																							
									</div>																		
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">								
									<div class="row">																			
										<div class="col-xs-12 col-sm-6">
											<label>Desde</label>
											<input class="form-control" type="date" id="fechaInicio"/>
										</div>																				
										<div class="col-xs-12 col-sm-6">
											<label>Hasta</label>
											<input class="form-control" type="date" id="fechaFin"/>
										</div>																				
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
						  			<div id="msgValidate" class="alert alert-danger fade">
						    			<button type="button" class="close" data-dismiss="alert">&times;</button>
						    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
					    			</div>
					    		</div>
					   		</div>
							<button type="submit" id="btnSaveSurvey" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar encuesta  -->
	<div class="modal" id="editSurvey">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Pregunta</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<input class="form-control" type="hidden" id="txtIdEncuesta" />
										<div class="col-xs-12 col-sm-12">
											<label>Título</label>
											<input class="form-control" type="text" id="txtDescripcionEdit" style="text-transform:uppercase;" placeholder="Encuesta"/>
										</div>																																							
									</div>																		
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">								
									<div class="row">																			
										<div class="col-xs-12 col-sm-6">
											<label>Desde</label>
											<input class="form-control" type="date" id="fechaInicioEdit"/>
										</div>																				
										<div class="col-xs-12 col-sm-6">
											<label>Hasta</label>
											<input class="form-control" type="date" id="fechaFinEdit"/>
										</div>																				
									</div>									
								</div>																
							</div>
							<button type="submit" id="btnEditSurvey" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>						
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	
	<!-- preguntas por encuesta -->
	<div class="modal" id="questions">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Preguntas</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>			
				<!-- Modal body -->
				<div class="modal-body">					
					<fieldset class="scheduler-border">	
						<div class="card">
							<div class="card-header">
								<button id="btnOpenModalQuestions" type="button" class="btn btn-primary">
		                            <i class="fas fa-plus mr-2"></i>Agregar Pregunta
		                        </button>
							</div>
							<div class="card-body">
								<table id="tblQuestions" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Pregunta</th>
											<th>Estado</th>
											<th>Acciones</th>
										</tr>
									</thead>
								<tbody>
								</tbody>
								</table>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	
	<!-- nueva pregunta  -->
	<div class="modal" id="newQuestion">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
			  <!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nueva Pregunta</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<input class="form-control" type="hidden" id="IdEncuesta" />
										<div class="col-xs-12 col-sm-12">
											<label>Pregunta</label>
											<textarea class="form-control rounded-0" id="txtPregunta" rows="3"></textarea>
										</div>																				
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
						  			<div id="msgValidate" class="alert alert-danger fade">
						    			<button type="button" class="close" data-dismiss="alert">&times;</button>
						    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
					    			</div>
					    		</div>
					   		</div>
							<button type="submit" id="btnSaveQuestion" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar pregunta  -->
	<div class="modal" id="editQuestion">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
			<!-- Modal Header -->
			<div class="modal-header modal-header-primary">
				<h4 class="modal-title">Editar Pregunta</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>		
			<!-- Modal body -->
			<div class="modal-body">
				<fieldset class="scheduler-border">						
					<form class="needs-validation" novalidate>
						<div class="row">
							<div class="col-12 form-group">
								<div class="row">
									<input class="form-control" type="hidden" id="IdEncuesta" />
									<input class="form-control" type="hidden" id="IdPregunta" />
									<div class="col-xs-12 col-sm-12">
										<label>Pregunta</label>
										<textarea class="form-control rounded-0" id="txtPreguntaEdit" rows="3"></textarea>
									</div>																				
								</div>									
							</div>																				
						</div>
						<button type="submit" id="btnEditQuestion" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
						<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>						
					</form>
				</fieldset>
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
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	$("#newSurvey").modal("show"); 
	$("#txtDescripcion").val("");
	$("#fechaInicio").val("");
	$("#fechaFin").val("");
	$("#msgValidate").removeClass("show");
});

(function() {
    'use strict';
    window.addEventListener('load', function() {
      var forms = document.getElementsByClassName('needs-validation');
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            $("#msgValidate").addClass("show"); 
          }
          form.classList.add('was-validated');
        }, false);
      });
	}, false);
})();


$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var idSucursal = '${usuario.iSucursal}';
	console.log(idSucursal)
	var nombre = '${usuario.vUsuarioNombres}'; 
	$('#nombreUsuario').html(nombre);

	$.ajax({
		type: 'POST',
		url: 'getsucursalbyid.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#nombreSucursal').html(data.nombre);
		}
	});
	
	loadAllSurveys(idSucursal);
});

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

function loadAllSurveys(idSucursal) {
	$.ajax({ 
		type: 'POST', 
		url: 'getAllSurveys.app',
		data: { idSucursal: idSucursal }, 			
		success: function (response) {
			var data = response.data;			
			$('#tblListadoEncuesta tbody').empty();					
			for(var i=0; i<data.length; i++){									
				var fechaCreacion = formatearFecha(data[i].fechaCreacion);
				var fechaInicio = formatearFecha(data[i].fechaInicio);
				var fechaFin = formatearFecha(data[i].fechaFin);
				var fecha = formatearFecha(data[i].fecha);
				
				var html = data[i].estado == 1
					? surveyEnable(data[i], fechaCreacion, fechaInicio, fechaFin)
					: surveyDisable(data[i], fechaCreacion, fechaInicio, fechaFin);
					
				$('#tblListadoEncuesta tbody').append(html);
			}
			$('#tblListadoEncuesta').DataTable(); 			 			
		}
	});
}

function surveyEnable(survey, fechaCreacion, fechaInicio, fechaFin) {
	return '<tr>' +
		'<td><span>'+survey.descripcion+'</span></td>' +
		'<td><span>'+fechaCreacion+'</span></td>' +
		'<td><span>'+fechaInicio+'</span></td>' +
		'<td><span>'+fechaFin+'</span></td>' +
		'<td><span>ACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditSurvey('+survey.id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;' +
			'<button type="button" class="btn btn-info" title="Ver Preguntas" onclick="fnLoadAllQuestionsByIdSurvey('+survey.id+')"><i class="fas fa-eye"></i></button>&nbsp;' +
			'<button type="button" class="btn btn-danger" onclick="fnDisableSurvey('+survey.id+')" title="Deshabilitar"><i class="fas fa-ban" aria-hidden="true"></i></button>' +
		'</td>' +
	'</tr>';
}

function surveyDisable(survey, fechaCreacion, fechaInicio, fechaFin) {
	return '<tr>' +
		'<td><span>'+survey.descripcion+'</span></td>' +
		'<td><span>'+fechaCreacion+'</span></td>' +
		'<td><span>'+fechaInicio+'</span></td>' +
		'<td><span>'+fechaFin+'</span></td>' +
		'<td><span>INACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-info" title="Ver Preguntas" onclick="fnLoadAllQuestionsByIdSurvey('+survey.id+')"><i class="fas fa-eye"></i></button>&nbsp;' +
			'<button type="button" class="btn btn-warning" onclick="fnEnableSurvey('+survey.id+')" title="Habilitar"><i class="fas fa-check-circle" aria-hidden="true"></i></button>' +
		'</td>' +
	'</tr>';
}

function formatearFecha(timestamp) {
    if (!timestamp) return '';

    var fecha = new Date(parseInt(timestamp));

    var dia = fecha.getDate().toString().padStart(2, '0');
    var mes = (fecha.getMonth() + 1).toString().padStart(2, '0');
    var anio = fecha.getFullYear();

    return anio + '-' + mes + '-' + dia;
}

function fnEnableSurvey(idEncuesta) {
	var idSucursal = '${usuario.iSucursal}';
	
	confirmAction({
		title: '¿Estás seguro de habilitar la encuesta?',
		url: 'enableSurvey.app',
		data: { idEncuesta: idEncuesta }, 	 
		successMessage: 'Encuesta Habilitada!',
		errorMessage: 'Ocurrió un Error al habilitar la encuesta!',
		onSuccess: function(response) {
			loadAllSurveys(idSucursal);		
		},
	})
}

function fnDisableSurvey(idEncuesta) {
	var idSucursal = '${usuario.iSucursal}';
	
	confirmAction({
		title: '¿Estás seguro de deshabilitar la encuesta?',
		url: 'disableSurvey.app',
		data: { idEncuesta: idEncuesta }, 	 
		successMessage: 'Encuesta Deshabilitada!',
		errorMessage: 'Ocurrió un Error al deshabilitar la encuesta!',
		onSuccess: function(response) {
			loadAllSurveys(idSucursal);		
		},
	})  
}

$("#btnSaveSurvey").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var descripcion = $("#txtDescripcion").val();
	var fechaInicio = $("#fechaInicio").val();
	var fechafin = $("#fechaFin").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'saveSurvey.app',
 		data: {
 			idSucursal: idSucursal, 
 			descripcion: descripcion, 
 			fechaInicio: fechaInicio, 
 			fechafin: fechafin
 		}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$('#newSurvey').modal('hide');
 				$.alert(mensaje);
 				loadAllSurveys(idSucursal);		
 			}
 		}	
	});
});

function fnEditSurvey(idEncuesta){
	$('#editSurvey').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getSurveyById.app',
		data: {idEncuesta: idEncuesta},		
		success: function (response) {
			var data = response.data;
			$("#txtIdEncuesta").val(data.id);
			$("#txtDescripcionEdit").val(data.descripcion);	
			$("#fechaInicioEdit").val(formatearFecha(data.fechaInicio));	
			$("#fechaFinEdit").val(formatearFecha(data.fechaFin));	
		}
	});	
}

$("#btnEditSurvey").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idEncuesta = $("#txtIdEncuesta").val();
	var descripcionEdit = $("#txtDescripcionEdit").val();		
	var fechaInicioEdit = $("#fechaInicioEdit").val();		
	var fechaFinEdit = $("#fechaFinEdit").val();	
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editSurvey.app',
 		data: {
 			idSucursal: idSucursal, 
 			idEncuesta: idEncuesta, 
 			descripcionEdit: descripcionEdit, 
 			fechaInicioEdit: fechaInicioEdit, 
 			fechaFinEdit: fechaFinEdit
 		}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$('#editSurvey').modal('hide');
 				$.alert(mensaje);
 				loadAllSurveys(idSucursal);		
	    	}
 		}
	});				  
});

function fnLoadAllQuestionsByIdSurvey(idEncuesta) {
	$('#questions').modal('show');
	$("#IdEncuesta").val(idEncuesta);
	$.ajax({ 
		type: 'GET', 
		url: 'getQuestionsByIdSurvey.app',
		data: { idEncuesta: idEncuesta }, 			
		success: function (response) {
			var data = response.data;			
			$('#tblQuestions tbody').empty();					
			for(var i=0; i<data.length; i++){									
				
				var html = data[i].estado == 1
					? questionEnable(data[i])
					: questionDisable(data[i]);
					
				$('#tblQuestions tbody').append(html);
			}
			$('#tblQuestions').DataTable(); 			 			
		}
	});
}

function questionEnable(question) {
	return '<tr>' +
		'<td><span>'+question.descripcion+'</span></td>' +
		'<td><span>ACTIVO</span></td>' +
		'<td>' + 
			'<button type="button" class="btn btn-success" onclick="fnEditQuestion('+question.id+',\''+question.idEncuesta+'\')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;' +
			'<button type="button" class="btn btn-danger" onclick="fnDisableQuestion('+question.id+',\''+question.idEncuesta+'\')" title="Deshabilitar"><i class="fas fa-ban" aria-hidden="true"></i></button>' +
		'</td>' +
	'</tr>';	  
}

function questionDisable(question) {
	return '<tr>' +
		'<td><span>'+question.descripcion+'</span></td>' +
		'<td><span>INACTIVO</span></td>' +
		'<td>' + 
			'<button type="button" class="btn btn-success" onclick="fnEditQuestion('+question.id+',\''+question.idEncuesta+'\')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;' +
			'<button type="button" class="btn btn-warning" onclick="fnEnableQuestion('+question.id+',\''+question.idEncuesta+'\')" title="Habilitar"><i class="fas fa-check-circle" aria-hidden="true"></i></button>' +
		'</td>' +
	'</tr>';
}

function fnEnableQuestion(idPregunta, idEncuesta) {
	confirmAction({
		title: '¿Estás seguro de habilitar la pregunta?',
		url: 'enableQuestion.app',
		data: { idPregunta: idPregunta }, 	 
		successMessage: 'Pregunta Habilitada!',
		errorMessage: 'Ocurrió un Error al habilitar la pregunta!',
		onSuccess: function(response) {
			fnLoadAllQuestionsByIdSurvey(idEncuesta);		
		},
	})
}

function fnDisableQuestion(idPregunta, idEncuesta) {
	confirmAction({
		title: '¿Estás seguro de deshabilitar la pregunta?',
		url: 'disableQuestion.app',
		data: { idPregunta: idPregunta }, 	 
		successMessage: 'Pregunta Deshabilitada!',
		errorMessage: 'Ocurrió un Error al deshabilitar la pregunta!',
		onSuccess: function(response) {
			fnLoadAllQuestionsByIdSurvey(idEncuesta);		
		},
	})
}

$("#btnOpenModalQuestions").click(function() {
	$("#newQuestion").modal("show"); 
	$("#txtPregunta").val("");
	$("#msgValidate").removeClass("show");
});

$("#btnSaveQuestion").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idEncuesta = $("#IdEncuesta").val();
	var pregunta = $("#txtPregunta").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'saveQuestion.app',
 		data: {
 			idSucursal: idSucursal, 
 			idEncuesta: idEncuesta,
 			pregunta: pregunta
 		}, 	    		 		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$('#newQuestion').modal('hide');
 				$.alert(mensaje);
 				fnLoadAllQuestionsByIdSurvey(data.idEncuesta);		
 			}
 		}	
	});
});

function fnEditQuestion(idPregunta){
	$('#editQuestion').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getQuestionById.app',
		data: {idPregunta: idPregunta},		
		success: function (response) {
			var data = response.data;
			$("#IdPregunta").val(data.id);
			$("#txtPreguntaEdit").val(data.descripcion);	
		}
	});	
}

$("#btnEditQuestion").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idEncuesta = $("#IdEncuesta").val();
	var idPregunta = $("#IdPregunta").val();
	var preguntaEdit = $("#txtPreguntaEdit").val();		
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editQuestion.app',
 		data: {
 			idSucursal: idSucursal, 
 			idPregunta: idPregunta, 
 			preguntaEdit: preguntaEdit
 		}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$('#editQuestion').modal('hide');
 				$.alert(mensaje);
 				fnLoadAllQuestionsByIdSurvey(idEncuesta);		
 			}
 		}	
	});				  
});

</script>
</body>
</html>