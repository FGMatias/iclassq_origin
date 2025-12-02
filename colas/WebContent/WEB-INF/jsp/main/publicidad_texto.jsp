<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Publicidad</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css"> 
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">  
  <link rel="stylesheet" type="text/css" href="librerias/css/bootstrap.min.css" />
  <link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
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
								<li class="breadcrumb-item active">Publicidad</li>
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
									<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Publicidad"><i class="fas fa-plus"></i></button>
								</div>            
								<div class="card-body">
									<table id="tblListPublicity" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Texto</th>
												<th>Secuencia</th>
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


	<!-- nueva publicidad -->
	<div class="modal" id="newPublicity">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Nueva Publicidad</h4>
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
											<label>Texto Publicitario</label>
											<input class="form-control" id="txtPublicidad" type="text" style="text-transform:uppercase;" placeholder="Texto" required/>
										</div>										
										<div class="col-xs-12 col-sm-4">
											<label>Sec. Texto</label>
											<input class="form-control"  id="txtSecuencia" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="1" required/>
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
							<button type="submit" id="btnSavePublicity" class="btn btn-primary"title="Grabar"><i class="fas fa-save"></i></button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>   	
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- editar publicidad -->
	<div class="modal" id="editPublicity">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">		
				<!-- Modal Header -->
				<div class="modal-header modal-header-primary">
					<h4 class="modal-title">Editar Publicidad</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>		
				<!-- Modal body -->
				<div class="modal-body">
					<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<input class="form-control" type="hidden" id="txtIdPublicidadTexto" />
								<input class="form-control" type="hidden" id="cboTipoPublicidadEdit" />
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-8">
											<label>Texto Publicitario</label>
											<input class="form-control" id="txtPublicidadEdit" type="text" style="text-transform:uppercase;" placeholder="Texto" required/>
										</div>										
										<div class="col-xs-12 col-sm-4">
											<label>Sec. Texto</label>
											<input class="form-control"  id="txtSecuenciaEdit" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required/>
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
							<button type="submit" id="btnEditPublicity" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
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

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	$("#newPublicity").modal("show");
	$("#msgValidate").removeClass("show");
    $("#txtPublicidad").val("");
	$("#txtSecuencia").val("");	
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
	var nombre = '${usuario.vUsuarioNombres}'; 
	$('#nombreUsuario').html(nombre);

	getSucursalById(idSucursal);
	loadAllPublicity(idSucursal);
	
});

function getSucursalById(idSucursal) {
	$.ajax({
		type: 'POST',
		url: 'getsucursalbyid.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#nombreSucursal').html(data.nombre);
		}
	});
}

function loadAllPublicity(idSucursal) {
	$.ajax({
		type: 'POST',
		url: 'getAllPublicityText.app',
		data: { idSucursal: idSucursal },
		success: function (response) {
			var data = response.data;
			console.log(data);
			$('#tblListPublicity tbody').empty();
			for(var i=0; i<data.length; i++){
				var html = buildData(data[i]);  					
				$('#tblListPublicity tbody').append(html);
    		}	
			$('#tblListPublicity').DataTable();	
		}
	});
}

function buildData(publicity) {
	return '<tr>' +
		'<td><span>' + publicity.pubTexto + '</span></td>' +
		'<td><span>' + publicity.secuenciaTexto + '</span></td>' +								
		'<td>' +
			'<button type="button" class="btn btn-success" onclick="fnEditPublicity(' + publicity.id + ')" title="Editar">' +
				'<i class="fa fa-edit"></i>' +
			'</button>&nbsp;' +
			'<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnDeletePublicity(' + publicity.id + ')">' +
				'<i class="fa fa-trash" aria-hidden="true"></i>' +
			'</button>' +
		'</td>' +
	'</tr>';	   
}

$("#btnSavePublicity").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var texto = $("#txtPublicidad").val();
	var secuencia = $("#txtSecuencia").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'savePublicityText.app',
 		data: {
			idSucursal: idSucursal, 
			texto: texto,
			secuencia: secuencia
		}, 
 		success: function (response) {
 			if (response.success){
 				console.log("publicity saved: ", response.data);
				$("#newPublicity").modal("hide");
				$.alert({
                    title: 'Éxito!',
                    content: response.message,
                });
				loadAllPublicity(idSucursal)
 			} else {
 				$('#newPublicity').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}	
	});			
					  
});

function fnEditPublicity(idPublicidad){
	$('#editPublicity').modal('show');
	
	$.ajax({ 
		type: 'POST', 
		url: 'getPublicityById.app',
		data: { idPublicidad: idPublicidad },		
		success: function (response) {
			var data = response.data;
			$("#txtIdPublicidadTexto").val(data.id);
			$("#txtPublicidadEdit").val(data.pubTexto);
			$("#txtSecuenciaEdit").val(data.secuenciaTexto);
		}
	});
}

$("#btnEditPublicity").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idPublicidad = $("#txtIdPublicidadTexto").val();
	var textoEdit = $("#txtPublicidadEdit").val();
	var secuenciaEdit = $("#txtSecuenciaEdit").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'editPublicityText.app',
 		data: {
 			idSucursal: idSucursal, 
 			idPublicidad: idPublicidad, 
 			textoEdit: textoEdit,
 			secuenciaEdit: secuenciaEdit
 		},
 		success: function (response) {
 			if (response.success){
 				console.log("publicity edited: ", response.data);
				$("#editPublicity").modal("hide");
				$.alert({
                    title: 'Éxito!',
                    content: response.message,
                });
				loadAllPublicity(idSucursal)
 			} else {
 				$('#editPublicity').modal('hide');
 				$.alert({
                    title: 'Error',
                    content: response.message,
                });
 			}
 		}	
	});				  
});


function fnDeletePublicity(idPublicidad){
	var idSucursal = '${usuario.iSucursal}';

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
					$.ajax({ 
						type: 'POST', 
						url: 'deletePublicity.app',
						data: { idPublicidad: idPublicidad },		
						success: function (response) {
							if (response.success){
								console.log("publicity deleted: ", response.data);
								$.alert({
				                    title: 'Éxito!',
				                    content: response.message,
				                });
								loadAllPublicity(idSucursal)
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