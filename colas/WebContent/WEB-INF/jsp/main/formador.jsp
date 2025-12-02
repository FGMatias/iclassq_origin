<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formadores</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">    
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/jqvmap/jqvmap.min.css">  
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">  
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
		      <span class="brand-text font-weight-light">ICLASSQ</span>
		    </a>    
			<div class="sidebar">      
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">        
					<div class="info">
						<a href="#" class="d-block"><span id="nombreUsuario"></span></a>
					</div>
				</div>      
				<nav class="mt-2">
					<jsp:include page="menu/menuAdministrador.jsp" />
				</nav>      
			</div>    
		</aside>  
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6"> </div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Formador</a></li>
								<li class="breadcrumb-item active">Usuarios</li>
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
									<button id="btnNewTrainer" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Formador">
										<i class="fas fa-plus"></i>
									</button>
								</div>            
								<div class="card-body">
									<table id="tblListTrainers" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Apellidos y Nombres</th>
												<th>Usuario</th>
												<th>Rol</th>
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
			<strong>Copyright &copy; 2019 <a href="http://www.ginnet.com.pe">Ginnet</a>.</strong>todos los derechos reservados
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.0
			</div>
		</footer>
		<aside class="control-sidebar control-sidebar-dark">    
		</aside>  
	</div>

	<!-- nuevo formador  -->
	<div class="modal" id="newTrainer">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nuevo Formador</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">											
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Paterno</label>
											<input class="form-control" type="text" id="txtApePaterno" style="text-transform:uppercase;" placeholder="Apellido Paterno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Materno</label>
											<input class="form-control" type="text" id="txtApeMaterno" style="text-transform:uppercase;" placeholder="Apellido Materno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Nombres</label>
											<input class="form-control" type="text" id="txtNombres" style="text-transform:uppercase;" placeholder="Nombres del usuario"/>
										</div>	
										<div class="col-xs-12 col-sm-3">
											<label>DNI</label>
											<input class="form-control" type="text" id="txtDNI" style="text-transform:uppercase;" placeholder="DNI de usuario" required/>
										</div>																				
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<div class="col-xs-12 col-sm-4">
											<label>Correo</label>
											<input class="form-control" type="email" id="txtCorreo" style="text-transform:uppercase;" placeholder="email@gmail.com" required/>
										</div>		
										<div class="col-xs-12 col-sm-4">
											<label>Usuario</label>
											<input class="form-control" type="text" id="txtUsuario" style="text-transform:uppercase;" placeholder="Login de usuario" required/>
										</div>					
									</div>
								</div>
							</div>
							<button type="submit" id="btnSaveTrainer" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar formador  -->
	<div class="modal" id="editTrainer">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Formador</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form>	
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">			
										<input class="form-control" type="hidden" id="idUsuario" />								
										<input class="form-control" type="hidden" id="idUsuarioRol" />								
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Paterno</label>
											<input class="form-control" type="text" id="txtApePaternoEdit" style="text-transform:uppercase;" placeholder="Apellido Paterno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Materno</label>
											<input class="form-control" type="text" id="txtApeMaternoEdit" style="text-transform:uppercase;" placeholder="Apellido Materno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Nombres</label>
											<input class="form-control" type="text" id="txtNombresEdit" style="text-transform:uppercase;" placeholder="Nombres del usuario"/>
										</div>	
										<div class="col-xs-12 col-sm-3">
											<label>DNI</label>
											<input class="form-control" type="text" id="txtDNIEdit" style="text-transform:uppercase;" placeholder="DNI de usuario" required/>
										</div>																				
									</div>
								</div>
							</div>						
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<div class="col-xs-12 col-sm-4">
											<label>Correo</label>
											<input class="form-control" type="email" id="txtCorreoEdit" style="text-transform:uppercase;" placeholder="email@gmail.com" required/>
										</div>		
										<div class="col-xs-12 col-sm-4">
											<label>Usuario</label>
											<input class="form-control" type="text" id="txtUsuarioEdit" style="text-transform:uppercase;" placeholder="Login de usuario" required/>
										</div>					
									</div>								
								</div>																
							</div>							
							<button type="button" id="btnEditTrainer" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
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
<script src="librerias/admin/plugins/inputmask/jquery.inputmask.bundle.js"></script>

<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>

$(function () {
    $('[data-mask]').inputmask()
})

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnNewTrainer").click(function() {
	$("#txtApePaterno").val("");
	$("#txtApeMaterno").val("");
	$("#txtNombres").val("");
	$("#txtDNI").val("");
	$("#txtCorreo").val("");
	$("#txtUsuario").val("");
	$("#newTrainer").modal("show");
	$("#msgValidate").removeClass("show");
});

$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var nombre = '${usuario.vUsuarioNombres}';
	$('#nombreUsuario').html(nombre);

	loadAllTrainers();
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

function loadAllTrainers() {
	$.ajax({ 
		type: 'POST', 
		url: 'getAllTrainers.app',
		success: function (response) {
			var data = response.data;		
			console.log(data);
			$('#tblListTrainers tbody').empty();	
			for(var i = 0; i < data.length; i++){	
				var html = data[i].iUsuarioEstado == 1
					? userEnable(data[i])
					: userDisable(data[i]);
				
				$('#tblListTrainers tbody').append(html);				
    		}	
			$('#tblListTrainers').DataTable();
		}
	});
}

function userEnable(user) {
	return '<tr>' +
		'<td><span>' + user.vUsuarioApPaterno + ' ' + user.vUsuarioApMaterno + ' ' + user.vUsuarioNombres + '</span></td>' +
		'<td><span>' + user.vUsuarioUsername + '</span></td>' +
		'<td><span>' + user.roles[0].rol.vRolNombre + '</span></td>' +									
		'<td><span>ACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditTrainer(' + user.iUsuarioId + ')" title="Editar">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-danger" onclick="fnDisableUser(' + user.iUsuarioId + ')" title="Deshabilitar Usuario">' +
				'<i class="fa fa-ban" aria-hidden="true"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-info" onclick="fnResetPassword(' + user.iUsuarioId + ')" title="Resetear">' +
				'<i class="fas fa-undo"></i>' +
			'</button>' +
		'</td>' +
  	'</tr>';	  
}

function userDisable(user) {
	return '<tr>' +
		'<td><span>' + user.vUsuarioApPaterno + ' ' + user.vUsuarioApMaterno + ' ' + user.vUsuarioNombres + '</span></td>' +
		'<td><span>' + user.vUsuarioUsername + '</span></td>' +
		'<td><span>' + user.roles[0].rol.vRolNombre + '</span></td>' +	
		'<td><span>INACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditTrainer(' + user.iUsuarioId + ')" title="Editar">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-warning" onclick="fnEnableUser(' + user.iUsuarioId + ')" title="Habilitar Usuario">' +
				'<i class="fas fa-check-circle" aria-hidden="true"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-info" onclick="fnResetPassword(' + user.iUsuarioId + ')" title="Resetear">' +
				'<i class="fas fa-undo"></i>' +
			'</button>' +
		'</td>' +
	'</tr>';	
}

function fnEnableUser(idUsuario) {
	confirmAction({
		title: '¿Estás seguro de habilitar el supervisor?',
		url: 'enableUser.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Supervisor Habilitado!',
		errorMessage: 'Ocurrió un Error al habilitar el supervisor!',
		onSuccess: function(response) {
			loadAllTrainers();		
		},
	})
}

function fnDisableUser(idUsuario) {
	confirmAction({
		title: '¿Estás seguro de deshabilitar el supervisor?',
		url: 'disableUser.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Supervisor Deshabilitado!',
		errorMessage: 'Ocurrió un Error al deshabilitar el supervisor!',
		onSuccess: function(response) {
			loadAllTrainers();		
		},
	})
}

$("#btnSaveTrainer").click(function() {	 
	var aPaterno =  $("#txtApePaterno").val();
	var aMaterno = $("#txtApeMaterno").val();
	var nombres = $("#txtNombres").val();
	var dni = $("#txtDNI").val();
	var login = $("#txtUsuario").val();
	var email = $("#txtCorreo").val();
	var idEmpresa = '${usuario.iEmpresa}';	
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveTrainer.app',
 		data: { 
 			aPaterno: aPaterno, 
 			aMaterno: aMaterno,
	 		nombres: nombres, 
	 		dni: dni, 
	 		login: login, 
	 		email: email, 
	 		idEmpresa: idEmpresa
	 	},
 		success: function (response) {
 			var data = response.data; 
 			if ( response.success ){
 				$('#newTrainer').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllTrainers();
 			} else {
 				$('#newTrainer').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}
	});	
});

function fnEditTrainer(idUsuario){
	$('#editTrainer').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: { idUsuario: idUsuario },		
		success: function (response) {
			var data = response.data;	
			$("#idUsuario").val(data.iUsuarioId);
 			$("#txtApePaternoEdit").val(data.vUsuarioApPaterno);
 			$("#txtApeMaternoEdit").val(data.vUsuarioApMaterno);
 			$("#txtNombresEdit").val(data.vUsuarioNombres);
 			$("#txtDNIEdit").val(data.dni);
 			$("#txtCorreoEdit").val(data.vUsuarioEmail);
 			$("#txtUsuarioEdit").val(data.vUsuarioUsername);
		}
	});
}

$("#btnEditTrainer").click(function() {
	var idUsuario = $("#idUsuario").val();
	var aPaternoEdit =  $("#txtApePaternoEdit").val();
	var aMaternoEdit = $("#txtApeMaternoEdit").val();
	var nombresEdit = $("#txtNombresEdit").val();
	var dniEdit = $("#txtDNIEdit").val();
	var loginEdit = $("#txtUsuarioEdit").val();
	var emailEdit = $("#txtCorreoEdit").val();
	var idEmpresa = '${usuario.iEmpresa}';	
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editTrainer.app',
 		data: {
 			idUsuario: idUsuario, 
 			aPaternoEdit: aPaternoEdit, 
 			aMaternoEdit: aMaternoEdit, 
 			nombresEdit: nombresEdit, 
 			dniEdit: dniEdit, 
 			loginEdit: loginEdit,
 			emailEdit: emailEdit
		}, 
		success: function (response) {
 			var data = response.data; 
 			if ( response.success ){
 				$('#editTrainer').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllTrainers();
 			} else {
 				$('#editTrainer').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}
	});				  
});

function fnResetPassword(idUsuario){
	$.ajax({ 
		type: 'POST', 
		url: 'resetearclaveuser.app',
		data: {idUsuario: idUsuario},		
		success: function (response) {
			var data = response.data;			
			if(response.success==true){
 				$.alert({
                    title: 'Exito',
                    content: response.message,
                });  				
         	}		
		}
	});
}


</script>
</body>
</html>