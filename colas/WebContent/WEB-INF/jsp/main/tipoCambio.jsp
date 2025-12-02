<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tipo de Cambio</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css"> 
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">  
  <link rel="stylesheet" type="text/css" href="librerias/css/bootstrap.min.css" />
  <link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
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
					<jsp:include page="menu/menuAdministrador.jsp" />
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
								<li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Administrador</a></li>
								<li class="breadcrumb-item active">Tipo de Cambio</li>
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
									<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Tipo de Cambio"><i class="fas fa-plus"></i></button>
								</div>            
								<div class="card-body">
									<table id="tblListExchangeRate" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Tipo de Cambio</th>
												<th>Fecha</th>
												<th>Mes</th>
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
		<aside class="control-sidebar control-sidebar-dark"></aside>  
	</div>


	<!-- nuevo tipo de cambio -->
	<div class="modal" id="newExchangeRate">
		<div class="modal-dialog modal-md">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nuevo Tipo de Cambio</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row" id="tipoTexto">
										<div class="col-xs-12 col-sm-8">
											<label>Tipo de Cambio</label>
											<input 
												class="form-control" 
												id="txtTipoCambio" 
												type=text
												inputmode="decimal"
												placeholder="0.00" 
												required
											/>
										</div>										
									</div>
								</div>
							</div>
							<!-- 07-09-2019 -->
							<div class="row">
								<div class="col-12 form-group">
									<div id="msgValidate" class="alert alert-danger fade">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
									</div>
								</div>
							</div>
							<button type="submit" id="btnSaveExchangeRate" class="btn btn-primary"title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>   	
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar tipo de cambio -->
	<div class="modal" id="editExchangeRate">
		<div class="modal-dialog modal-md">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Tipo de Cambio</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<input class="form-control" type="hidden" id="idTipoCambio" />
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-8">
											<label>Tipo de Cambio</label>
											<input 
												class="form-control" 
												id="txtTipoCambioEdit" 
												type=text
												inputmode="decimal"
												placeholder="0.00" 
												required
											/>
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
							<button type="submit" id="btnEditExchangeRate" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
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
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>

$("#btnOpenModal").click(function() {
	$("#newExchangeRate").modal("show");
	$("#msgValidate").removeClass("show");
    $("#txtTipoCambio").val("");
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
    
	var idEmpresa = '${usuario.iEmpresa}';
	var nombre = '${usuario.vUsuarioNombres}'; 
	$('#nombreUsuario').html(nombre);
	
	loadAllExchangeRate(idEmpresa);
	
	$('#txtTipoCambio, #txtTipoCambioEdit')
		.on('keypress', function(e) {
			const char = e.which;
			if (char !== 46 && (char < 48 || char > 57)) {
				e.preventDefault();
			}
			if (char === 46 && this.value.includes('.')) {
				e.preventDefault();
			}
		})
		.on('paste', function(e) {
			const paste = (e.originalEvent || e).clipboardData.getData('text/plain');
			if (!/^\d*\.?\d*$/.test(paste)) {
				e.preventDefault();
			}
		});

});

function loadAllExchangeRate(idEmpresa) {
	$.ajax({
		type: 'POST',
		url: 'getAllExchangeRate.app',
		data: { idEmpresa: idEmpresa },
		success: function (response) {
			var data = response.data;
			console.log(data);
			
			$('#tblListExchangeRate tbody').empty();
			for(var i=0; i<data.length; i++){
				var html = buildData(data[i]);  					
				$('#tblListExchangeRate tbody').append(html);
    		}	
			$('#tblListExchangeRate').DataTable();	
		}
	});
}

function nombreMesES(date) {
	var mes = date.toLocaleString('es-PE', { month: 'long' });
	return mes.charAt(0).toUpperCase() + mes.slice(1); 
}

function buildData(exchange) {
	var date = new Date(+exchange.fecha);      
	var mes = nombreMesES(date);
	var mesNum = date.getMonth() + 1; 
	return '<tr>' +
		'<td><span>' + exchange.tipoCambio + '</span></td>' +
		'<td><span>' + date.toLocaleDateString('es-PE') + '</span></td>' +
		'<td data-order="' + mesNum + '"><span>' + mes + '</span></td>' +
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditExchangeRate(' + exchange.id + ')" title="Editar">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnDeleteExchangeRate(' + exchange.id + ')">' +
				'<i class="fa fa-trash" aria-hidden="true"></i>' +
			'</button>' +
		'</td>' +
	'</tr>';	   
}

$("#btnSaveExchangeRate").click(function() {
	var idEmpresa = '${usuario.iEmpresa}';
	var tipoCambio = $("#txtTipoCambio").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveExchangeRate.app',
 		data: {
 			idEmpresa: idEmpresa, 
 			tipoCambio: tipoCambio
		}, 
 		success: function (response) {
 			if (response.success){
 				console.log("exchange saved: ", response.data);
				$("#newExchangeRate").modal("hide");
				$.alert({
                    title: 'Éxito!',
                    content: response.message,
                });
				loadAllExchangeRate(idEmpresa)
 			} else {
 				$('#newExchangeRate').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}	
	});			
					  
});

function fnEditExchangeRate(idTipoCambio){
	$('#editExchangeRate').modal('show');
	
	$.ajax({ 
		type: 'POST', 
		url: 'getExchangeRateById.app',
		data: { idTipoCambio: idTipoCambio },		
		success: function (response) {
			var data = response.data;
			$("#idTipoCambio").val(data.id);
			$("#txtTipoCambioEdit").val(data.tipoCambio);
		}
	});
}

$("#btnEditExchangeRate").click(function() {
	var idTipoCambio = $("#idTipoCambio").val();
	var idEmpresa = '${usuario.iEmpresa}';
	var tipoCambioEdit = $("#txtTipoCambioEdit").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'editExchangeRate.app',
 		data: {
 			idTipoCambio: idTipoCambio, 
 			idEmpresa: idEmpresa, 
 			tipoCambioEdit: tipoCambioEdit
 		},
 		success: function (response) {
 			if (response.success){
 				console.log("exchange edited: ", response.data);
				$("#editExchangeRate").modal("hide");
				$.alert({
                    title: 'Éxito!',
                    content: response.message,
                });
				loadAllExchangeRate(idEmpresa)
 			} else {
 				$('#editExchangeRate').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}	
	});				  
});


function fnDeleteExchangeRate(idTipoCambio){
	var idEmpresa = '${usuario.iEmpresa}';

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
					$.ajax({ 
						type: 'POST', 
						url: 'deleteExchangeRate.app',
						data: { idTipoCambio: idTipoCambio },		
						success: function (response) {
							if (response.success){
								console.log("exchange deleted: ", response.data);
								$.alert({
				                    title: 'Éxito!',
				                    content: response.message,
				                });
								loadAllExchangeRate(idEmpresa)
				 			} else {
				 				$.alert({
				                    title: 'Error',
				                    content: response.message,
				                });
				 			}
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
}

</script>
</body>
</html>