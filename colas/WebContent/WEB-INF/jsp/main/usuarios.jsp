<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usuarios</title>
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
						<div class="col-sm-6"> </div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Sucursal</a></li>
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
									<button id="btnNewUser" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Usuario">
										<i class="fas fa-plus"></i>
									</button>
								</div>            
								<div class="card-body">
									<table id="tblListUsers" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Apellidos y Nombres</th>
												<th>Login</th>
												<th>Rol</th>
												<th>IP Asignada</th>
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

	<!-- nuevo usuario  -->
	<div class="modal" id="newUser">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nuevo Usuario</h4>
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
											<input class="form-control" type="text" id="txtUsuarioAPaterno" style="text-transform:uppercase;" placeholder="Apellido Paterno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Materno</label>
											<input class="form-control" type="text" id="txtUsuarioAMaterno" style="text-transform:uppercase;" placeholder="Apellido Materno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Nombres</label>
											<input class="form-control" type="text" id="txtUsuarioNombres" style="text-transform:uppercase;" placeholder="Nombres del usuario"/>
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
											<input class="form-control" type="email" id="txtUsuarioEmail" style="text-transform:uppercase;" placeholder="email@gmail.com" required/>
										</div>		
										<div class="col-xs-12 col-sm-4">
											<label>Login</label>
											<input class="form-control" type="text" id="txtUsuarioLogin" style="text-transform:uppercase;" placeholder="Login de usuario" required/>
										</div>					
										<div class="col-xs-12 col-sm-4">
											<label>Direccion IP</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"><i class="fas fa-laptop"></i></span>
												</div>
												<input id="txtUsuarioIp" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<div class="col-xs-12 col-sm-4">
											<label id="labelRolUsuario">Rol</label>
											<select class="form-control" id="cboRolUsuario" required>
												<option value="">--Seleccione--</option>																																				
											</select>
										</div>							
										<div class="col-xs-12 col-sm-4">
											<label>Tipo Administracion</label>
											<select class="form-control" id="cboTipoAdm" required>
												<option value="">--Seleccione--</option>
												<option value="0">Sucursal</option>
												<option value="1">Area</option>
											</select>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label id="labelAreaUsuario" style="display:none">Area</label>
												<select class="form-control" id="cboAreaUsuario" required style="display:none">
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>										
									</div>
								</div>
							</div>
							<button type="submit" id="btnSaveUser" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar usuario  -->
	<div class="modal" id="editUser">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Usuario</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form>	
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">											
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Paterno</label>
											<input class="form-control" type="text" id="txtUsuarioAPaternoEdit" style="text-transform:uppercase;" placeholder="Apellido Paterno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Materno</label>
											<input class="form-control" type="text" id="txtUsuarioAMaternoEdit" style="text-transform:uppercase;" placeholder="Apellido Materno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Nombres</label>
											<input class="form-control" type="text" id="txtUsuarioNombresEdit" style="text-transform:uppercase;" placeholder="Nombres del usuario"/>
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
										<input class="form-control" type="hidden" id="txtIdUsuario" />
										<div class="col-xs-12 col-sm-4">
											<label>Correo</label>
											<input class="form-control" type="email" id="txtUsuarioEmailEdit" style="text-transform:uppercase;" placeholder="email@gmail.com" required/>
										</div>		
										<div class="col-xs-12 col-sm-4">
											<label>Login</label>
											<input class="form-control" type="text" id="txtLoginEdit" style="text-transform:uppercase;" placeholder="Login de usuario"/>
										</div>										
										<div class="col-xs-12 col-sm-4">
											<label>Direccion IP</label>
											<input class="form-control" type="text" id="txtIpEdit" placeholder="127.0.0.1"/>
										</div>
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<div class="col-xs-12 col-sm-4">
											<label id="labelRolUsuario">Rol</label>
											<select class="form-control" id="cboRolUsuarioEdit" required>
												<option value="">--Seleccione--</option>																																				
											</select>
										</div>							
										<div class="col-xs-12 col-sm-4">
											<label>Tipo Administracion</label>
											<select class="form-control" id="cboTipoAdmEdit" required>
												<option value="">--Seleccione--</option>
												<option value="0">Sucursal</option>
												<option value="1">Area</option>
											</select>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label id="labelAreaUsuarioEdit" style="display:none">Area</label>
											<select class="form-control" id="cboAreaUsuarioEdit" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>
									</div>
								</div>
							</div>								
							<button type="button" id="btnEditUser" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
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

$("#btnNewUser").click(function() {
	$("#txtUsuarioAPaterno").val("");
	$("#txtUsuarioAMaterno").val("");
	$("#txtUsuarioNombres").val("");
	$("#txtDNI").val("");
	$("#txtUsuarioEmail").val("");
	$("#txtUsuarioLogin").val("");
	$("#txtUsuarioIp").val("");
	$("#cboRolUsuario").val("");
	$("#cboTipoAdm").val("");
	$("#cboAreaUsuario").val("");
	$("#newUser").modal("show");
	$("#msgValidate").removeClass("show");
});

$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var idSucursal = '${usuario.iSucursal}';
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

	listAreaBySucursal(idSucursal);
	listUserRol(idSucursal);
	loadAllUsers(idSucursal);
});

function listAreaBySucursal(idSucursal) {
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
                        .appendTo("#cboAreaUsuario");
                $("<option/>")
	                .attr("value", item.id)
	                .text(item.descripcion)
	                .appendTo("#cboAreaUsuarioEdit");
			});	
		}
	});
}

function listUserRol(idSucursal) {
	$.ajax({ 
		type: 'POST', 
		url: 'listarrolusuario.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
					.attr("value", item.id)
					.text(item.nombre)
					.appendTo("#cboRolUsuario");
                $("<option/>")
	                .attr("value", item.id)
	                .text(item.nombre)
	                .appendTo("#cboRolUsuarioEdit");
			});	
		}
	});
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

function loadAllUsers(idSucursal) {
	$.ajax({ 
		type: 'POST', 
		url: 'getAllUsers.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;		
			console.log(data);
			$('#tblListUsers tbody').empty();	
			for(var i = 0; i < data.length; i++){	
				var html = data[i].iUsuarioEstado == 1
					? userEnable(data[i])
					: userDisable(data[i]);
				
				$('#tblListUsers tbody').append(html);				
    		}	
			$('#tblListUsers').DataTable();
		}
	});
}

function userEnable(user) {
	return '<tr>' +
		'<td><span>' + user.vUsuarioApPaterno + ' ' + user.vUsuarioApMaterno + ' ' + user.vUsuarioNombres + '</span></td>' +
		'<td><span>' + user.vUsuarioUsername + '</span></td>' +
		'<td><span>' + user.roles[0].rol.vRolNombre + '</span></td>' +									
		'<td><span>' + user.cUsuarioIp + '</span></td>' +
		'<td><span>ACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditUser(' + user.iUsuarioId + ')" title="Editar">' +
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
		'<td><span>' + user.cUsuarioIp + '</span></td>' +
		'<td><span>INACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditUser(' + user.iUsuarioId + ')" title="Editar">' +
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
	var idSucursal = '${usuario.iSucursal}';
	
	confirmAction({
		title: '¿Estás seguro de habilitar el usuario?',
		url: 'enableUser.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Usuario Habilitado!',
		errorMessage: 'Ocurrió un Error al habilitar el usuario!',
		onSuccess: function(response) {
			loadAllUsers(idSucursal);		
		},
	})
}

function fnDisableUser(idUsuario) {
	var idSucursal = '${usuario.iSucursal}';
	
	confirmAction({
		title: '¿Estás seguro de deshabilitar el usuario?',
		url: 'disableUser.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Usuario Deshabilitado!',
		errorMessage: 'Ocurrió un Error al deshabilitar el usuario!',
		onSuccess: function(response) {
			loadAllUsers(idSucursal);		
		},
	})
}

$("#btnSaveUser").click(function() {
	var idSucursal = '${usuario.iSucursal}';	 
	var aPaterno =  $("#txtUsuarioAPaterno").val();
	var aMaterno = $("#txtUsuarioAMaterno").val();
	var nombres = $("#txtUsuarioNombres").val();
	var dni = $("#txtDNI").val();
	var ip = $("#txtUsuarioIp").val();
	var login = $("#txtUsuarioLogin").val();
	var email = $("#txtUsuarioEmail").val();
	var idEmpresa = '${usuario.iEmpresa}';	
	var tipoAdm=$("#cboTipoAdm").val();
	var idArea=  $("#cboAreaUsuario").val();
	var rol = $("#cboRolUsuario").val();
	if (tipoAdm==0) idArea=0;
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveUser.app',
 		data: { 
 			idSucursal: idSucursal, 
 			aPaterno: aPaterno, 
 			aMaterno: aMaterno,
	 		nombres: nombres, 
	 		dni: dni, 
	 		ip: ip, 
	 		login: login, 
	 		email: email, 
	 		idEmpresa: idEmpresa, 
	 		idArea: idArea, 
	 		rol: rol
	 	},
 		success: function (response) {
 			var data = response.data; 
 			if ( response.success ){
 				$('#newUser').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllUsers(idSucursal);
 			} else {
 				$('#newUser').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}
	});	
});

function fnEditUser(idUsuario){
	$('#editUser').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: { idUsuario: idUsuario },		
		success: function (response) {
			var data = response.data;	
			console.log(data);
			$("#txtIdUsuario").val(data.iUsuarioId);
 			$("#txtIpEdit").val(data.cUsuarioIp);
 			$("#txtUsuarioNombresEdit").val(data.vUsuarioNombres);
 			$("#txtUsuarioAPaternoEdit").val(data.vUsuarioApPaterno);
 			$("#txtUsuarioAMaternoEdit").val(data.vUsuarioApMaterno);
 			$("#txtUsuarioEmailEdit").val(data.vUsuarioEmail);
 			$("#txtDNIEdit").val(data.dni);
 			$("#txtLoginEdit").val(data.vUsuarioUsername);
 			$("#cboAreaUsuarioEdit").val(data.iArea); 	
 			$("#cboRolUsuarioEdit").val(data.iRolEquipo);
 			$("#cboTipoAdmEdit").val(data.iArea == 0 ? "0" : "1");
 			
 			toggleFields("Edit");
		}
	});
}

function toggleFields(mode) {
	var isEdit = mode == "Edit";
	var prefix = isEdit ? "Edit" : "";
	var selector = "#cboTipoAdm" + prefix;
	var labelSelector = "#labelAreaUsuario" + prefix;
	var selectSelector = "#cboAreaUsuario" + prefix;
	
	var tipoAdminValue = $(selector).val();
	
	if (tipoAdminValue == "" || tipoAdminValue == "0") {
		$(labelSelector).css("display", "none");
		$(selectSelector).removeAttr("required");
		$(selectSelector).hide();
	} else {
		$(labelSelector).removeAttr("style");
		$(selectSelector).attr("required", "required");
		$(selectSelector).show();
	}

}

$('#cboTipoAdmEdit').on('change',function(){
	toggleFields("Edit");
})

$('#cboTipoAdm').on('change',function(){
	toggleFields("New");
})

$("#btnEditUser").click(function() {
	var idSucursal = '${usuario.iSucursal}'; 
	var idUsuario = $("#txtIdUsuario").val();
	var aPaternoEdit =  $("#txtUsuarioAPaternoEdit").val();
	var aMaternoEdit = $("#txtUsuarioAMaternoEdit").val();
	var nombresEdit = $("#txtUsuarioNombresEdit").val();
	var dniEdit = $("#txtDNIEdit").val();
	var emailEdit = $("#txtUsuarioEmailEdit").val();
	var loginEdit =  $("#txtLoginEdit").val();
	var ipEdit = $("#txtIpEdit").val();
	var tipoAdm=$("#cboTipoAdmEdit").val();
	var idArea=  $("#cboAreaUsuarioEdit").val();
	var rolEdit = $("#cboRolUsuarioEdit").val();
	if (tipoAdm==0) idArea=0;

	$.ajax({ 
 		type: 'POST', 
 		url: 'editUser.app',
 		data: {
 			idUsuario: idUsuario, 
 			idSucursal: idSucursal, 
 			aPaternoEdit: aPaternoEdit,
 			aMaternoEdit: aMaternoEdit,
 			nombresEdit: nombresEdit,
 			dniEdit: dniEdit,
 			emailEdit: emailEdit,
 			loginEdit: loginEdit, 
 			ipEdit: ipEdit, 
 			idArea: idArea, 
 			rolEdit: rolEdit
		}, 
		success: function (response) {
 			var data = response.data; 
 			console.log("user edited")
 			console.log(data);
 			if ( response.success ){
 				$('#editUser').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllUsers(idSucursal);
 			} else {
	 			console.log("error");
 				$('#editUser').modal('hide');
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