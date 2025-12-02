<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sucursales</title>
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
								<li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Inicio</a></li>
								<li class="breadcrumb-item active">Sucursal</li>
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
								<div class="card-header d-flex align-items-center">
									<span class="mr-auto p-2">SUCURSAL</span>
									<button id="btnReinicioServicio" type="button" class="btn btn-primary p-2" title="Reiniciar Servicio">Reiniciar Servicio</button>
								</div>            
								<div class="card-body">
									<table id="tblListBranch" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Oficina</th>
			                  					<th>RUC</th>
			                  					<th>Dirección</th>
			                  					<th>Telefono</th>
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

	<!-- edit sucursal -->
	<div class="modal" id="editBranch">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Sucursal</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<input class="form-control" type="hidden" id="idSucursal" />	
										<div class="col-xs-12 col-sm-4">
											<label>Nombre</label>
											<input class="form-control" type="text" id="txtNombreSucursalEdit" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label>RUC</label>
											<input class="form-control" type="text" id="txtRucSucursalEdit" placeholder="RUC"/>
										</div>		
										<div class="col-xs-12 col-sm-4">
											<label>Dirección</label>
											<input class="form-control" type="text" id="txtDireccionEdit" style="text-transform:uppercase;" placeholder="Dirección"/>
										</div>																
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">	
										<div class="col-xs-3 col-sm-4">
											<label>Telefono</label>
											<input class="form-control" type="text" id="txtTelefonoEdit" placeholder="Telefono"/>
										</div>	
									</div>
								</div>
							</div>
							<button type="submit" id="btnEditBranch" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
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


$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var idSucursal = '${usuario.iSucursal}';
	var idEmpresa = '${usuario.iEmpresa}';
	var nombre = '${usuario.vUsuarioNombres}';
	$('#nombreUsuario').html(nombre);
	
	listSucursal(idSucursal);
});

function listSucursal(idSucursal){
	$.ajax({ 
		type: 'POST', 
		url: 'getsucursalbyid.app',
		data: { idSucursal: idSucursal },		
		success: function (response) {
			console.log(response.data);
			const rows = Array.isArray(response.data) ? response.data 
                    : (response.data ? [response.data] : []);

			if ($.fn.DataTable.isDataTable('#tblListBranch')) {
			  $('#tblListBranch').DataTable().clear().destroy();
			}
			
			$('#tblListBranch tbody').empty();
			rows.forEach(branch => {
			  $('#tblListBranch tbody').append(buildData(branch));
			});
			
			$('#tblListBranch').DataTable();
			
			if (rows.length) {
		    	setAutoAssignButton(Number(rows[0].autoasignar) === 1);
			}
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

function buildData(branch) {
	return '<tr>' +
		'<td><span>' + branch.nombre + '</span></td>' +
		'<td><span>' + branch.ruc + '</span></td>' +									
		'<td><span>' + branch.direccion + '</span></td>' +
		'<td><span>' + branch.telefono + '</span></td>' +
		'<td><span>ACTIVO</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditBranch(' + branch.id + ')" title="Editar Sucursal">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
// 			'<button type="button" class="btn btn-primary" onclick="fnReiniciarServicio(' + branch.id + ')" title="Reiniciar Servicio">Reiniciar Servicio</button>' +
		'</td>' +
  	'</tr>';	  
}


function fnEditBranch(idSucursal){
	$('#editBranch').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getsucursalbyid.app',
		data: { idSucursal: idSucursal },		
		success: function (response) {
			var data = response.data;	
			console.log(data);
			$("#idSucursal").val(idSucursal);
 			$("#txtNombreSucursalEdit").val(data.nombre);
 			$("#txtRucSucursalEdit").val(data.ruc);
 			$("#txtTelefonoEdit").val(data.telefono);
 			$("#txtDireccionEdit").val(data.direccion);
		}
	});
}

$("#btnEditBranch").click(function() {
	var idSucursal = $("#idSucursal").val();
	var nombreEdit =  $("#txtNombreSucursalEdit").val();		
	var rucEdit = $("#txtRucSucursalEdit").val();
	var telefEdit = $("#txtTelefonoEdit").val();
	var direccionEdit = $("#txtDireccionEdit").val();
	var idEmpresa = '${usuario.iEmpresa}';
	$.ajax({ 
 		type: 'POST', 
 		url: 'editsucursal.app',
 		data: {
 			idSucursal: idSucursal, 
 			nombreEdit: nombreEdit, 
 			rucEdit: rucEdit,
 			telefEdit: telefEdit,
 			direccionEdit: direccionEdit,
 			idEmpresa: idEmpresa
		}, 
		success: function (response) {
 			var data = response.data; 
 			console.log("branch edited")
 			console.log(data);
 			if ( response.success ){
 				$('#editBranch').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				listSucursal(idSucursal); 
 			    loadAutoAssignState(idSucursal);
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

$("#btnReinicioServicio").click(function() {
    var idSucursal = '${usuario.iSucursal}';
    var idUsuario = '${usuario.iUsuarioId}';
    console.log(idSucursal);
    
    $.confirm({
        title: '¿Estás seguro de reiniciar el servicio?',
        content: 'Presiona SI para continuar.',
        buttons: {
            confirm: {
                text: 'SI',
                action: function(){
                    $.ajax({ 
                        type: 'POST', 
                        url: 'reiniciarServicio.app',
                        data: { idSucursal: idSucursal, idUsuario: idUsuario },
                        success: function (response) {
                            var data = response.data;    
                            $.alert('Proceso Reiniciado!');
                        },
                        error: function(){
                            $.alert('Ocurrió un Error al Reiniciar el Servicio!');
                        }
                    });
                }
            },
            cancel: {
                text: 'NO',
                action: function(){
                    $.alert('Cancelado!');
                }
            }
        }
    });             
});

</script>
</body>
</html>