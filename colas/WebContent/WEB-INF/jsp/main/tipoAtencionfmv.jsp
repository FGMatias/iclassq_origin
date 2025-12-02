<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::IClassQ::</title>
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
          <div class="col-sm-6">
            
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Sucursal</a></li>
              <li class="breadcrumb-item active">Tipos de Atención</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">        
         <div class="row">
        	<div class="col-6">
          		<div class="card">
            		<!--<div class="card-header">
              			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Desplegable"><i class="fas fa-plus"></i></button>
            		</div>-->            
            		<div class="card-body">
            			<table id="tblListadoTipoAtencion" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Desplegable</th>
                  					<th>Acciones</th>
                				</tr>
                			</thead>
                			<tbody>                                
                			</tbody>
              			</table>
            		</div>            
          		</div>
        	</div>
        	<div class="col-md-6">
	            <div id="OpcionesXLista" class="card" style="display:none">
	              <div class="card-header">
	                <h3 class="card-title">Opciones de: <span class="nombreDesplegable"></span></h3>                
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	                <table class="table table-bordered" id="tblListadoOpciones">
	                  <thead>
	                    <tr>
	                      <th>Nombre</th>
	                      <th style="width: 150px">Acciones</th>
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

<!-- nuevo desplegable -->
	<div class="modal" id="nuevoDesplegable">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Desplegable</h4>
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
												<label>Descripcion</label>
												<input class="form-control" type="text" id="txtDesplegable" style="text-transform:uppercase;" placeholder="Desplegable" required/>
											</div>
										</div>
									</div>
								</div>

								<button type="submit" id="btnGrabarDesplegable" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- editar desplegable -->
	<div class="modal" id="editarDeplegable">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Desplegable</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdDesplegable" style="text-transform:uppercase;" placeholder="Nombre Rol"/>
											<div class="col-xs-12 col-sm-4">
												<label>Descripcion</label>
												<input class="form-control" type="text" id="txtDesplegableEdit" style="text-transform:uppercase;" placeholder="Nombre Rol" required/>
											</div>
										</div>
									</div>
								</div>

								<button type="submit" id="btnEditarDesplegable" class="btn btn-primary" title="Grabar"><i class="fa fa-edit"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- agregar opciones -->
	<div class="modal" id="addOpcion">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Agregar Opcion</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdDesplegable" style="text-transform:uppercase;" placeholder="Desplegable"/>
											<div class="col-xs-12 col-sm-8">
												<label>Descripcion</label>
												<input class="form-control" type="text" id="txtOpcion" style="text-transform:uppercase;" placeholder="Descripcion" required/>
											</div>
										</div>
										<div class="row">	
											<div class="col-xs-12 col-sm-8">
												<label>Descripcion Larga</label>
												<input class="form-control" type="text" id="txtOpcionLarga" style="text-transform:uppercase;" placeholder="Descripcion Larga" required/>
											</div>
										</div>
									</div>																
								</div>	
								<button type="submit" id="btnAgregarOpcion" class="btn btn-primary" title="Agregar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- editar grupo -->
	<div class="modal" id="editarOpcion">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Opcion</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdOpcion" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
											<input class="form-control" type="hidden" id="txtIdPadre" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
											<div class="col-xs-12 col-sm-8">
												<label>Descripcion</label>
												<input class="form-control" type="text" id="txtOpcionEdit" style="text-transform:uppercase;" placeholder="Descripcion" required/>
											</div>
										</div>
										<div class="row">	
											<div class="col-xs-12 col-sm-8">
												<label>Descripcion Larga</label>
												<input class="form-control" type="text" id="txtOpcionLargaEdit" style="text-transform:uppercase;" placeholder="Descripcion" required/>
											</div>
										</div>
									</div>																
								</div>	
								<button type="submit" id="btnEditarOpcion" class="btn btn-primary" title="Agregar"><i class="fas fa-save"></i></button>
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
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

<script src="librerias/admin/plugins/inputmask/jquery.inputmask.bundle.js"></script>

<script>

$(function () {
    $('[data-mask]').inputmask()
})
  
$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	$("#txtDesplegable").val("");
	$("#nuevoDesplegable").modal("show");
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
	var apellido = '${usuario.vUsuarioApPaterno}';
	$('#nombreUsuario').html(nombre + ' ' + apellido);

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
		url: 'listarDesplegable.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#tblListadoTipoAtencion tbody').empty();						
			for(var i=0; i<data.length; i++){				
				html = '<tr>' +
				'<td><span>'+data[i].tabla+'</span></td>' +
				'<td><button type="button" class="btn btn-info" title="Asignar Opciones" onclick="fnAddOpciones('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-secondary" title="Ver Opciones" onclick="fnMostrarOpciones('+data[i].id+')"><i class="fas fa-eye"></i></button></td>' +
				'</tr>';
			$('#tblListadoTipoAtencion tbody').append(html);
    		}	
// 			$('#tblListadoTipoAtencion').DataTable();
		}
	});
});


$("#btnGrabarDesplegable").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var desplegable = $("#txtDesplegable").val();
		
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveDesplegable.app',
 		data: {idSucursal: idSucursal, desplegable: desplegable},
 		success: function (response) {
 			var data = response.data; 	
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: desplegable.toUpperCase() + ' Registrado correctamente.',
                });
 				$('#nuevoDesplegable').modal('hide');	
	 			var html='';
	 			$('#tblListadoTipoAtencion tbody').empty();
	 			for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].tabla+'</span></td>' +
					'<td><button type="button" class="btn btn-info" title="Asignar Opciones" onclick="fnAddOpciones('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-secondary" title="Ver Opciones" onclick="fnMostrarOpciones('+data[i].id+')"><i class="fas fa-eye"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoTipoAtencion tbody').append(html);
	    		}	
// 				$('#tblListadoTipoAtencion').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una lista llamada '+descripcion.toUpperCase(),
                });
 				$('#nuevoDesplegable').modal('hide');
 			}
 		}
	});	
});

$("#btnAgregarOpcion").click(function() {
	var idPadre = $('#txtIdDesplegable').val();
	var idSucursal = '${usuario.iSucursal}';
	var opcion =  $('#txtOpcion').val();
	var opcionLarga = $("#txtOpcionLarga").val();			
	$.ajax({ 
 		type: 'POST', 
 		url: 'agregaropcion.app',
 		data: {idPadre: idPadre, idSucursal: idSucursal, opcion: opcion, opcionLarga: opcionLarga}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content:' Agregado correctamente.',
                });
 				$('#addOpcion').modal('hide');	
				var html='';
				$('#tblListadoOpciones tbody').empty();
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].descripcion+'</span></td>' +			
					'<td><button type="button" class="btn btn-success" title="Editar Opcion" onclick="fnEditarOpcion('+data[i].id+')"><i class="fa fa-edit"></i></button></td>' +
					'</tr>';	        					
				$('#tblListadoOpciones tbody').append(html);
	    		}
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una opcion agregado con este nombre.',
                });
 				$('#addOpcion').modal('hide');
 			}
 		}
	});				  
});

function fnAddOpciones(id){
	$('#addOpcion').modal('show');	
	console.log('id->>'+id);
	$('#txtIdDesplegable').val(id);	
}

function fnMostrarOpciones(id){
	console.log('idPadre->>>'+id);
	$("#OpcionesXLista").css("display","");
	var idSucursal = '${usuario.iSucursal}';
	
	$.ajax({ 
		type: 'POST', 
		url: 'getdesplegablebyid.app',
		data: {idDesplegable: id},		
		success: function (response) {
			var data = response.data;
			$(".nombreDesplegable").html(data.tabla);
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listaropcionxdesplegable.app',
		data: {idSucursal: idSucursal, idPadre: id},
		success: function (response) {
			var data = response.data;			
			$('#tblListadoOpciones tbody').empty();
			var html='';
			for(var i=0; i<data.length; i++){									
				html = '<tr>' +
				'<td><span>'+data[i].descripcion+'</span></td>' +			
				'<td><button type="button" class="btn btn-success" onclick="fnEditarOpcion('+data[i].id+','+data[i].idPadre+')" title="Editar Opcion"><i class="fa fa-edit"></i></button></td>' +
				'</tr>';	        					
			$('#tblListadoOpciones tbody').append(html);
    		}	
// 			$('#tblListadoOpciones').DataTable();
		}
	});	
 }
 
function fnEliminarOpcion(id){
	var idOpcion = id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminaropcionxdesplegable.app',
						data: {idOpcion: idOpcion},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoOpciones tbody').empty();
							var html;						
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].descripcion+'</span></td>' +			
								'<td><button type="button" class="btn btn-success" title="Editar Opcion" onclick="fnEditarOpcion('+data[i].id+')"><i class="fa fa-edit"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoOpciones tbody').append(html);
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

function fnEditarDespegable(id){
	$('#editarDeplegable').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getdesplegablebyid.app',
		data: {idDesplegable: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdDesplegable").val(data.id);
			$("#txtDesplegableEdit").val(data.tabla);
		}
	});
}

$("#btnEditarDesplegable").click(function() {
	var idDesplegable = $('#txtIdDesplegable').val();
	var idSucursal = '${usuario.iSucursal}';
	var desplegableEdit = $("#txtDesplegableEdit").val();
						
	$.ajax({ 
 		type: 'POST', 
 		url: 'editdesplegable.app',
 		data: {idDesplegable: idDesplegable, idSucursal: idSucursal, desplegableEdit: desplegableEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: desplegableEdit.toUpperCase() + ' Editado correctamente.',
                });
 				$('#editarDeplegable').modal('hide');	
	 			var html='';
	 			$('#tblListadoTipoAtencion tbody').empty();
	 			for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].tabla+'</span></td>' +
					'<td><button type="button" class="btn btn-info" title="Asignar Opciones" onclick="fnAddOpciones('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-secondary" title="Ver Opciones" onclick="fnMostrarOpciones('+data[i].id+')"><i class="fas fa-eye"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoTipoAtencion tbody').append(html);
	    		}	
// 				$('#tblListadoTipoAtencion').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una opcion llamada '+desplegableEdit.toUpperCase(),
                });
 				$('#editarDeplegable').modal('hide');
 			}
 		}
	});
});

function fnEliminarDesplegable(id){
	var idSucursal = '${usuario.iSucursal}';
	var idDesplegable = id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
		            $.ajax({ 
		        		type: 'POST', 
		        		url: 'eliminardesplegable.app',
		        		data: {idSucursal: idSucursal, idDesplegable: idDesplegable},		
		        		success: function (response) {
		        			var data = response.data;
		        			var html='';	
		        			$('#tblListadoTipoAtencion tbody').empty();
		        			for(var i=0; i<data.length; i++){									
		        				html = '<tr>' +
		        				'<td><span>'+data[i].tabla+'</span></td>' +
		    					'<td><button type="button" class="btn btn-info" title="Asignar Opciones" onclick="fnAddOpciones('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-secondary" title="Ver Opciones" onclick="fnMostrarOpciones('+data[i].id+')"><i class="fas fa-eye"></i></button></td>' +
		        			  '</tr>';	        					
		        			$('#tblListadoTipoAtencion tbody').append(html);
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

function fnEditarOpcion(id, idPadre){
	console.log("idOpcion-> "+id);
	console.log("idPadre-> "+idPadre);
	$('#editarOpcion').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getopcionbyid.app',
		data: {idOpcion: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdPadre").val(idPadre);
			$("#txtIdOpcion").val(data.id);
			$("#txtOpcionEdit").val(data.descripcion);
			$("#txtOpcionLargaEdit").val(data.descripcionLarga);
		}
	});
}
	
$("#btnEditarOpcion").click(function() {
	var idPadre = $("#txtIdPadre").val()
	var idOpcion = $('#txtIdOpcion').val();
	var idSucursal = '${usuario.iSucursal}';
	var opcionEdit = $("#txtOpcionEdit").val();
	var opcionLargaEdit = $("#txtOpcionLargaEdit").val();
	console.log("idPadre - > " +idPadre);
	$.ajax({ 
 		type: 'POST', 
 		url: 'editopcion.app',
 		data: {idPadre: idPadre, idOpcion: idOpcion, idSucursal: idSucursal, opcionEdit: opcionEdit, opcionLargaEdit: opcionLargaEdit},
 		success: function (response) {
 			console.log(data);
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: opcionEdit.toUpperCase() + ' Editado correctamente.',
                });
 				$('#editarOpcion').modal('hide');	
	 			var html='';
	 			$('#tblListadoOpciones tbody').empty();
	 			for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].descripcion+'</span></td>' +
					'<td><button type="button" class="btn btn-success" title="Editar Opcion" onclick="fnEditarOpcion('+data[i].id+','+data[i].idPadre+')"><i class="fa fa-edit"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoOpciones tbody').append(html);
	    		}	
 				//$('#tblListadoTipoAtencion').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una opcion llamada '+opcionEdit.toUpperCase(),
                });
 				$('#editarOpcion').modal('hide');
 			}
 		}
	});
});
</script>
</body>
</html>
