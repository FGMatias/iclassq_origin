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
					<jsp:include page="menu/menuSupervisor.jsp" />
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
									<h3 class="card-title">Permisos de Usuarios</h3>
								</div>
								<div class="card-body">
									<div class="row align-items-end">
										<div class="col-md-8">
											<div class="form-row">
												<input class="form-control" type="hidden" id="area" />	
												<div class="form-group col-md-4 mb-0">
													<label for="cboOficina">Oficina</label>
													<select class="form-control" id="cboOficina" required>
														<option value="">--Seleccione--</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-right">
											<button type="button" class="btn btn-primary btn-lg pr-5 pl-5" id="btnSearch">Buscar</button>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table id="tblListUsers" class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Ejecutivo</th>
													<th>Usuario</th>
													<th>Zona</th>
													<th>Oficina</th>
													<th>Area</th>
													<th>Ventanilla</th>
													<th>Atiende Manualmente</th>
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


$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var nombre = '${usuario.vUsuarioNombres}';
	$('#nombreUsuario').html(nombre);
	
	var zona = '${usuario.zona}';
	
	if (zona != 0) {
		loadSucursalByZona();
	} else {
		loadSucursal();
	}

	var idRol = parseInt('${usuario.idRolSelectedLogin}',10);	

	switch(idRol) {
		case 18: // SUPERVISOR PLATAFORMA
			$("#area").val("ADMINISTRACION");
			break;
		case 19: // SUPERVISOR CAJA
			$("#area").val("CAJA");
			break;
		case 20: // SUPERVISOR BROKER
			$("#area").val("BROKER");
			break;
		case 21: // SUPERVISOR KALLPA
			$("#area").val("KALLPA");
			break;
		case 22: // SUPERVISOR SINIESTRO
			$("#area").val("SINIESTRO");
			break;
		case 23: // SUPERVISOR CANAL DIRECTO
			$("#area").val("CANAL DIRECTO");
			break;
		default:
		      break;
	}
});

function loadSucursalByZona() {
	var idEmpresa = '${usuario.iEmpresa}';
	var zona = '${usuario.zona}';
	return $.post('listarSucursalByZona.app', { idEmpresa: idEmpresa, idZona: zona })
		.done(function(res) {
			resetSelect('#cboOficina');
			console.log(res.data);
			res.data.forEach(item => {
				$('#cboOficina').append(
					$('<option>').val(item.id).text(item.nombre)
				);
			});
		});
}

function loadSucursal() {
    var idEmpresa = '${usuario.iEmpresa}';
    
    return $.post('listarsucursal.app', { idEmpresa: idEmpresa } )
        .done(function(res) {
        	console.log(res.data);
            res.data.forEach(item => {
                $('#cboOficina').append(
                    $('<option>').val(item.id).text(item.nombre)
                );
            });
        })
        .fail(function(error) {
            console.error('Error cargando sucursales:', error);
        });
}

function resetSelect(selector) {
    $(selector).empty().append('<option value="0">--Seleccione--</option>');
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

$("#btnSearch").click(refreshUsersTable);

function refreshUsersTable() {
	var zona = '${usuario.zona}';
	var oficina = $("#cboOficina").val();
	var area = $("#area").val();
	console.log(area);
	
	$.ajax({
		type: 'POST',
		url: 'getAllUsersPermissions.app',
		data: { 
			zona: zona, 
			oficina: oficina,
			area: area
		},
		success: function (response) {
			var data = response.data;
			
			if ($.fn.DataTable.isDataTable('#tblListUsers')) {
				$('#tblListUsers').DataTable().clear().destroy();
			}
			
			$('#tblListUsers tbody').empty();
			
			data.forEach(function(user) {
				var row = user.atiendeManual == "SI"
					? userWithPermissions(user)
					: userWithoutPermissions(user);
				$('#tblListUsers tbody').append(row);
			});
			$('#tblListUsers').DataTable();
		},
		error: function() {
			$.alert('Error al cargar la lista de usuarios');
		}
	});
}


function userWithPermissions(user) {
	console.log(user);
	return '<tr>' +
		'<td><span>' + user.ejecutivo + '</span></td>' +
		'<td><span>' + user.usuario + '</span></td>' +
		'<td><span>' + user.zona + '</span></td>' +									
		'<td><span>' + user.oficina + '</span></td>' +
		'<td><span>' + user.area + '</span></td>' +
		'<td><span>' + user.ventanilla + '</span></td>' +
		'<td><span>SI</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-danger" onclick="fnRevokePermission(' + user.idUsuario + ')" title="Quitar Permiso">' +
				'<i class="fas fa-ban"></i>' +
			'</button>' +
		'</td>' +
  	'</tr>';	  
}

function userWithoutPermissions(user) {
	return '<tr>' +
		'<td><span>' + user.ejecutivo + '</span></td>' +
		'<td><span>' + user.usuario + '</span></td>' +
		'<td><span>' + user.zona + '</span></td>' +									
		'<td><span>' + user.oficina + '</span></td>' +
		'<td><span>' + user.area + '</span></td>' +
		'<td><span>' + user.ventanilla + '</span></td>' +
		'<td><span>NO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnGrantPermission(' + user.idUsuario + ')" title="Dar Permiso">' +
				'<i class="fa fa-edit"></i>' +
			'</button>' +
		'</td>' +
	'</tr>';	
}

function fnGrantPermission(idUsuario) {
	confirmAction({
		title: '¿Estás seguro de conceder permiso al usuario?',
		url: 'grantPermission.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Permiso Concedido!',
		errorMessage: 'Ocurrió un Error al conceder el permiso!',
		onSuccess: function(response) {
			refreshUsersTable();		
		},
	})
}

function fnRevokePermission(idUsuario) {
	confirmAction({
		title: '¿Estás seguro de revocar el permiso al usuario?',
		url: 'revokePermission.app',
		data: { idUsuario: idUsuario }, 	 
		successMessage: 'Permiso Revocado!',
		errorMessage: 'Ocurrió un Error al revocar el permiso!',
		onSuccess: function(response) {
			refreshUsersTable();		
		},
	})
}

</script>
</body>
</html>