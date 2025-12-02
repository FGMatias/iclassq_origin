<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tiempo Objetivo</title>
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
								<li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Tiempo Objetivo</a></li>
								<li class="breadcrumb-item active">Supervisor</li>
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
									<button id="btnNewTargetTime" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Tiempo Objetivo">
										<i class="fas fa-plus"></i>
									</button>
								</div>            
								<div class="card-body">
									<table id="tblListTargetTime" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Zona</th>
												<th>Sucursal</th>
												<th>Área</th>
												<th>Atención</th>
												<th>Tiempo</th>
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

	<!-- nuevo tiempo objetivo  -->
	<div class="modal" id="newTargetTime">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nuevo Tiempo Objetivo</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">		
										<div class="col-xs-12 col-sm-4">
											<label>Zona</label>
											<select class="form-control" id="cboZona" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>									
										<div class="col-xs-12 col-sm-4">
											<label>Oficina</label>
											<select class="form-control" id="cboSucursal" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>									
										<div class="col-xs-12 col-sm-4">
											<label>Atención</label>
											<input class="form-control" type="text" id="txtAtencion" style="text-transform:uppercase;" placeholder="ATENCIÓN DE CAJA"/>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">		
										<div class="col-xs-12 col-sm-4">
											<label>Tiempo Objetivo (Minutos)</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTiempoObjetivo" placeholder="18"/>
										</div>																			
									</div>
								</div>
							</div>
							<button type="submit" id="btnSaveTargetTime" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar formador  -->
	<div class="modal" id="editTargetTime">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Tiempo Objetivo</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form>	
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">			
										<input class="form-control" type="hidden" id="idSubGrupo" />		
										<div class="col-xs-12 col-sm-4">
											<label>Zona</label>
											<select class="form-control" id="cboZonaEdit" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>	
										<div class="col-xs-12 col-sm-4">
											<label>Oficina</label>
											<select class="form-control" id="cboSucursalEdit" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>							
										<div class="col-xs-12 col-sm-4">
											<label>Atención</label>
											<input class="form-control" type="text" id="txtAtencionEdit" style="text-transform:uppercase;" placeholder="ATENCIÓN DE CAJA"/>
										</div>
									</div>
								</div>
							</div>						
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">			
										<div class="col-xs-12 col-sm-4">
											<label>Tiempo Objetivo (Minutos)</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTiempoObjetivoEdit" placeholder="18"/>
										</div>																			
									</div>
								</div>
							</div>						
							<button type="button" id="btnEditTargetTime" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
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

$("#btnNewTargetTime").click(function() {
	$("#cboZona").val("0");
	$("#cboSucursal").val("0");
	$("#txtAtencion").val("");
	$("#txtTiempoObjetivo").val("");
	$("#newTargetTime").modal("show");
	$("#msgValidate").removeClass("show");
});

$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var nombre = '${usuario.vUsuarioNombres}';
	$('#nombreUsuario').html(nombre);

	loadAllTargetTime();
	listZona();
});

function listZona() {
	$.ajax({ 
		type: 'POST', 
		url: 'listarZonaKon.app',	    		
		success: function (response) {
			var data = response.data;
			console.log(data);
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboZona");
                $("<option/>")
	                .attr("value", item.id)
	                .text(item.descripcion)
	                .appendTo("#cboZonaEdit");
			});	
		}
	});
}

$('#cboZona').off('change').on('change', function () {
    const zonaId = parseInt($(this).val());
    resetSelect("#cboSucursal");
	
	if (zonaId && zonaId !== 0) {
		loadSucursalByZona(zonaId, '#cboSucursal');
	}
});

$('#cboZonaEdit').off('change').on('change', function () {
    const zonaId = parseInt($(this).val());
    resetSelect("#cboSucursalEdit");
	
	if (zonaId && zonaId !== 0) {
		loadSucursalByZona(zonaId, '#cboSucursalEdit');
	}
});

function loadSucursalByZona(zonaId, targetSelector) {
	var idEmpresa = '${usuario.iEmpresa}';
	return $.post('listarSucursalByZona.app', { idZona: zonaId, idEmpresa: idEmpresa })
		.done(function(res) {
			resetSelect(targetSelector);
			(res.data || []).forEach(item => {
				$(targetSelector).append(
					$('<option>').val(item.id).text(item.nombre)
				);
			});
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

function loadAllTargetTime() {
	var area = 'CAJA';
	
	$.ajax({ 
		type: 'POST', 
		url: 'getAllTargetTimeSubGrupo.app',
		data: { area: area },
		success: function (response) {
			var data = response.data;		
			console.log(data);
			$('#tblListTargetTime tbody').empty();	
			for(var i = 0; i < data.length; i++){	
				var html = buildData(data[i]);
				
				$('#tblListTargetTime tbody').append(html);				
    		}	
			$('#tblListTargetTime').DataTable();
		}
	});
}

function buildData(time) {
	return '<tr>' +
		'<td><span>' + time.zonaDesc + '</span></td>' +
		'<td><span>' + time.sucursalDesc + '</span></td>' +
		'<td><span>' + time.area + '</span></td>' +
		'<td><span>' + time.atencion + '</span></td>' +
		'<td><span>' + time.tiempo + '</span></td>' +									
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditTargetTime(' + time.id + ')" title="Editar">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-danger" onclick="fnDeleteTargetTime(' + time.id + ')" title="Eliminar">' +
				'<i class="fas fa-trash"></i>' +
			'</button>' +
		'</td>' +
  	'</tr>';	  
}

function fnDeleteTargetTime(idSubGrupo) {
	confirmAction({
		title: '¿Estás seguro de eliminar el tiempo objetivo?',
		url: 'deleteTargetTimeSubGrupo.app',
		data: { idSubGrupo: idSubGrupo }, 	 
		successMessage: 'Tiempo Objetivo eliminado!',
		errorMessage: 'Ocurrió un Error al eliminar el tiempo objetivo!',
		onSuccess: function(response) {
			loadAllTargetTime();		
		},
	})
}

$("#btnSaveTargetTime").click(function() {	 
	var zona = $("#cboZona").val();
	var idSucursal = $("#cboSucursal").val();
	var atencion = $("#txtAtencion").val();
	var tiempo = $("#txtTiempoObjetivo").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveTargetTimeSubGrupo.app',
 		data: { 
 			area: 'CAJA', 
 			grupo: 'CAJA',
 			zona: zona,
 			atencion: atencion,
 			tiempo: tiempo,
 			idSucursal: idSucursal
	 	},
 		success: function (response) {
 			var data = response.data; 
 			if ( response.success ){
 				$('#newTargetTime').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllTargetTime();
 			} else {
 				$('#newTargetTime').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}
	});	
});

function fnEditTargetTime(idSubGrupo){
	$('#editTargetTime').modal('show');

	$.ajax({ 
		type: 'POST', 
		url: 'getTargetTimeSubGrupoById.app',
		data: { idSubGrupo: idSubGrupo },		
		success: function (response) {
			var data = response.data;	
			console.log(data);
			$("#idSubGrupo").val(data.id);
 			$("#cboZonaEdit").val(data.zona);
 			loadSucursalByZona(data.zona, '#cboSucursalEdit').done(function(){
				$('#cboSucursalEdit').val(data.sucursal);
			});
 			$("#txtAtencionEdit").val(data.atencion);
 			$("#txtTiempoObjetivoEdit").val(data.tiempo);
		}
	});
}

$("#btnEditTargetTime").click(function() {
	var idSubGrupo = $("#idSubGrupo").val();
	var zonaEdit = $("#cboZonaEdit").val();
	var idSucursal = $("#cboSucursalEdit").val();
	var atencionEdit = $("#txtAtencionEdit").val();
	var tiempoEdit = $("#txtTiempoObjetivoEdit").val();
	console.log(idSucursal);
	$.ajax({ 
 		type: 'POST', 
 		url: 'editTargetTimeSubGrupo.app',
 		data: {
 			areaEdit: 'CAJA', 
 			grupoEdit: 'CAJA', 
 			idSubGrupo: idSubGrupo, 
 			zonaEdit: zonaEdit,
 			idSucursal: idSucursal,
 			atencionEdit: atencionEdit, 
 			tiempoEdit: tiempoEdit
		}, 
		success: function (response) {
 			var data = response.data; 
 			if ( response.success ){
 				$('#editTargetTime').modal('hide');	
 				$.alert({
                    title: 'Valido',
                    content: response.message,
                });
 				loadAllTargetTime();
 			} else {
 				$('#editTargetTime').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}
	});				  
});


</script>
</body>
</html>