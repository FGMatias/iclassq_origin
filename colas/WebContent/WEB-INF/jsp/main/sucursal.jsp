<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sucursal</title>
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
        <jsp:include page="menu/menuGeneral.jsp" />
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
              <li class="breadcrumb-item"><a href="mostrarempresas.app">Inicio</a></li>
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
            		<div class="card-header">
            			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Sucursal"><i class="fas fa-plus"></i>&nbsp; Nueva Sucursal</button>
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoSucursal" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Nombre</th>
                  					<th>RUC</th>
                  					<th>Direccion</th>
                  					<th>Telefono</th>
                  					<th>Tipo Algoritmo</th>
                  					<th>Nombre Completo</th>
                  					<th>Admin Usuario</th>
                  					<th>Encuesta</th>
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

<!-- nuevo sucursal -->
	<div class="modal" id="nuevoSucursal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nueva Sucursal</h4>
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
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreSucursal" style="text-transform:uppercase;" placeholder="Nombre Sucursal" required/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>URL</label>
												<input class="form-control" type="text" id="txtUrl" style="text-transform:uppercase;" placeholder="URL" required/>
											</div>										
											<div class="col-xs-12 col-sm-3">
												<label>RUC</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtRucSucursal" placeholder="RUC"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Tipo de Algoritmo</label>
												<select class="form-control" id="cboTipoAlgoritmo" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
																					
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-6 col-sm-6">
												<label>Direccion</label>
												<textarea class="form-control rounded-0" id="txtDireccion" rows="3"></textarea>
											</div>
											<div class="col-xs-3 col-sm-3">
												<label>Telefono</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTelefono" placeholder="Telefono"/>
											</div>																														
											<div class="col-xs-12 col-sm-3">
												<label>Encuesta</label>
												<select class="form-control" id="cboEncuesta" required>
													<option value="0">--Seleccione--</option>																																				
													<option value="1"> SI </option>																																				
													<option value="2"> NO </option>																																				
												</select>
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
						    	<button type="submit" id="btnGrabarSucursal" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>

<!-- editar sucursal -->
	<div class="modal" id="editarSucursal">
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
											<div class="">
												<input class="form-control" type="hidden" id="txtIdSucursal" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreSucursalEdit" style="text-transform:uppercase;" placeholder="Nombre Sucursal" required/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>URL</label>
												<input class="form-control" type="text" id="txtUrlEdit" style="text-transform:uppercase;" placeholder="URL" required/>
											</div>										
											<div class="col-xs-12 col-sm-3">
												<label>RUC</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtRucSucursalEdit" placeholder="RUC"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Tipo de Algoritmo</label>
												<select class="form-control" id="cboTipoAlgoritmoEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
																					
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-6 col-sm-6">
												<label>Direccion</label>
												<textarea class="form-control rounded-0" id="txtDireccionEdit" rows="3"></textarea>
											</div>
											<div class="col-xs-3 col-sm-3">
												<label>Telefono</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTelefonoEdit" placeholder="Telefono"/>
											</div>																														
											<div class="col-xs-12 col-sm-3">
												<label>Encuesta</label>
												<select class="form-control" id="cboEncuestaEdit" required>
													<option value="0">--Seleccione--</option>																																				
													<option value="1"> SI </option>																																				
													<option value="2"> NO </option>																																				
												</select>
											</div>
										</div>
									</div>
								</div>
								<button type="submit" id="btnEditarSucursal" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>					
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>

<!-- nuevo admin  -->
<div class="modal" id="nuevoAdminSucursal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Admin</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdSucursalAdmin"/>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Paterno</label>
												<input class="form-control" type="text" id="txtAdminAPaterno" style="text-transform:uppercase;" placeholder="Apellidos Paterno" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Materno</label>
												<input class="form-control" type="text" id="txtAdminAMaterno" style="text-transform:uppercase;" placeholder="Apellidos Materno" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Nombres</label>
												<input class="form-control" type="text" id="txtAdminNombres" style="text-transform:uppercase;" placeholder="Nombres" required/>
											</div>
										</div>								
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">								
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												<div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtAdminIp" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtAdminIp" placeholder="127.0.0.1" required/> -->
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Login</label>
												<input class="form-control" type="text" id="txtAdminLogin" style="text-transform:uppercase;" placeholder="Login de usuario" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Correo</label>
												<input class="form-control" type="email" id="txtAdminEmail" style="text-transform:uppercase;" placeholder="email@gmail.com" required/>
											</div>
										</div>
									</div>
								</div>
								<button type="submit" id="btnGrabarAdminSucursal" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
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

$("#btnOpenModal").click(function() {
	$("#txtNombreSucursal").val("");		
	$("#txtUrl").val("");			
	$("#txtRucSucursal").val("");
	$("#txtTelefono").val("");
	$("#txtDireccion").val("");
	$("#cboTipoAlgoritmo").val("");

	$("#nuevoSucursal").modal("show");
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

	function fnVerGruposSucursal(idSucursal){	
		window.location.href = 'listargrupos.app?idSucursal='+idSucursal;
	}

	function fnVerUsuariosSucursal(idSucursal){		
		window.location.href = 'listarusuarios.app?idSucursal='+idSucursal;
	}


$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	var nombre = '${usuario.vUsuarioNombres}'; 
	$('#nombreUsuario').html(nombre);
	
	var idEmpresa = '${idEmpresa}';
	var idUsuario = '${usuario.iUsuarioId}';
	var adminIdUsuario = '${usuario.iUsuarioId}';
	$.ajax({ 
		type: 'POST', 
		url: 'listarsucursal.app',
		data: {idEmpresa: idEmpresa, idUsuario: idUsuario, 
			adminIdUsuario: adminIdUsuario}, 			
		success: function (response) {
			var data = response.data;
			console.log('data-->'+data);				
			for(var i=0; i<data.length; i++){
				var encuestaText = (data[i].encuesta == 1) ? "SI" : "NO";
				
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].ruc+'</span></td>' +
				'<td><span>'+data[i].direccion+'</span></td>' +									
				'<td><span>'+data[i].telefono+'</span></td>' +
				'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +
				'<td><span>'+data[i].nombreUsuario+'</span></td>' +
				'<td><span>'+data[i].usuario+'</span></td>' +
				'<td><span>'+encuestaText+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarSucursal('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnAddAdmin('+data[i].id+')" title="Asignar Admin"><i class="fa fa-user" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoSucursal tbody').append(html);
    		}	
// 			$('#tblListadoSucursal').DataTable();
		}
	});

	//listar algoritmos
	$.ajax({ 
		type: 'POST', 
		url: 'listaalgoritmos.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboTipoAlgoritmo");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaalgoritmos.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                		.appendTo("#cboTipoAlgoritmoEdit");
            });	
		}
	});
	
});


function fnEditarSucursal(id){
		$('#editarSucursal').modal('show');
		var idSucursal =id;
		
		$.ajax({ 
			type: 'POST', 
			url: 'getsucursalbyid.app',
			data: {idSucursal: idSucursal},		
			success: function (response) {
				var data = response.data;	
				console.log('data->>>>');
				console.log(data);	 			

				$("#txtIdSucursal").val(data.id);	 				
	 			$("#txtNombreSucursalEdit").val(data.nombre);		
	 			$("#txtUrlEdit").val(data.url);			
	 			$("#txtRucSucursalEdit").val(data.ruc);
	 			$("#txtTelefonoEdit").val(data.telefono);
	 			$("#txtDireccionEdit").val(data.direccion);
	 			$("#cboTipoAlgoritmoEdit").val(data.idTipoAlgoritmo);
	 			$("#cboEncuestaEdit").val(data.encuesta);

			}
		});
	}

	$("#btnEditarSucursal").click(function() {

		var idSucursal = $("#txtIdSucursal").val();
		var nombreEdit =  $("#txtNombreSucursalEdit").val();		
		var urlEdit = $("#txtUrlEdit").val();			
		var rucEdit = $("#txtRucSucursalEdit").val();
		var telefEdit = $("#txtTelefonoEdit").val();
		var direccionEdit = $("#txtDireccionEdit").val();
		var tipoAlgoritmoEdit = $("#cboTipoAlgoritmoEdit").val();
		var idEmpresa = '${usuario.iEmpresa}';//global
		var idUsuario = '${usuario.iUsuarioId}';
		var adminIdUsuario = '${usuario.iUsuarioId}';
		var encuestaEdit = $("#cboEncuestaEdit").val();
					
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'editsucursal.app',
	 		data: {
				idSucursal: idSucursal, 
				nombreEdit: nombreEdit, 
				urlEdit: urlEdit, 
	 			rucEdit: rucEdit, 
	 			telefEdit: telefEdit, 
	 			direccionEdit: direccionEdit,
	 			tipoAlgoritmoEdit: tipoAlgoritmoEdit, 
	 			idEmpresa:idEmpresa,
	 			idUsuario: idUsuario, 
	 			adminIdUsuario: adminIdUsuario, 
	 			encuestaEdit: encuestaEdit
 			}, 	    		
	 		success: function (response) {
	 			var mensaje = response.message;	 			
	 			var data = response.data;
				var	html='';
				$('#editarSucursal').modal('hide');
				$('#tblListadoSucursal tbody').empty();					
				for(var i=0; i<data.length; i++){
					var encuestaText = (data[i].encuesta == 1) ? "SI" : "NO";
					
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].ruc+'</span></td>' +
					'<td><span>'+data[i].direccion+'</span></td>' +									
					'<td><span>'+data[i].telefono+'</span></td>' +
					'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +
					'<td><span>'+data[i].nombreUsuario+'</span></td>' +
					'<td><span>'+data[i].usuario+'</span></td>' +
					'<td><span>'+encuestaText+'</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarSucursal('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnAddAdmin('+data[i].id+')" title="Asignar Admin"><i class="fa fa-user" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        	    					
				$('#tblListadoSucursal tbody').append(html);
	    		}	
// 				$('#tblListadoSucursal').DataTable();		
	 		}	
		});	  
	});
	

	$("#btnGrabarSucursal").click(function() {
	var nombre =  $("#txtNombreSucursal").val();		
	var url = $("#txtUrl").val();			
	var ruc = $("#txtRucSucursal").val();
	var telef = $("#txtTelefono").val();
	var direccion = $("#txtDireccion").val();
	var tipoAlgoritmo = $("#cboTipoAlgoritmo").val();
	var idEmpresa = '${idEmpresa}';
	var idUsuario = 0;
	var encuesta = $("#cboEncuesta").val();
	  	  	
	$.ajax({ 
 		type: 'POST', 
 		url: 'savesucursal.app',
 		data: {
 			idEmpresa: idEmpresa, 
			nombre: nombre, 
			ruc: ruc, 
			telef: telef, 
 			direccion: direccion,
			url: url, 
 			tipoAlgoritmo: tipoAlgoritmo, 
 			encuesta: encuesta
		}, 	    		
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                       title: 'Valido',
                       content: nombre.toUpperCase() + ' registrada correctamente.',
                });
 				$('#nuevoSucursal').modal('hide');
				var	html='';
				$('#tblListadoSucursal tbody').empty();					
	 			for(var i=0; i<data.length; i++){				
	 				var encuestaText = (data[i].encuesta == 1) ? "SI" : "NO";
					
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].ruc+'</span></td>' +
					'<td><span>'+data[i].direccion+'</span></td>' +									
					'<td><span>'+data[i].telefono+'</span></td>' +
					'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +
					'<td><span>'+data[i].nombreUsuario+'</span></td>' +
					'<td><span>'+data[i].usuario+'</span></td>' +
					'<td><span>'+encuestaText+'</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarSucursal('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnAddAdmin('+data[i].id+')" title="Asignar Admin"><i class="fa fa-user" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        	
				$('#tblListadoSucursal tbody').append(html);
	    		}	
// 				$('#tblListadoSucursal').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
 	 				title: 'Error',
 	 				content: 'Ya existe una sucursal llamada '+nombre.toUpperCase(),
                });
 				$('#nuevoSucursal').modal('hide');
 			}
 		}
		});
	});


function fnAddAdmin(id){
	$("#txtAdminAPaterno").val("");
	$("#txtAdminAMaterno").val("");
	$("#txtAdminNombres").val("");
	$("#txtAdminIp").val("");
	$("#txtAdminLogin").val("");
	$("#txtAdminEmail").val("");
	$('#nuevoAdminSucursal').modal('show');
	$('#txtIdSucursalAdmin').val(id);	
}


$("#btnGrabarAdminSucursal").click(function() {

	var idSucursal = $('#txtIdSucursalAdmin').val();	 
	var aPaterno =  $("#txtAdminAPaterno").val();
	var aMaterno = $("#txtAdminAMaterno").val();
	var nombres = $("#txtAdminNombres").val();
	var ip = $("#txtAdminIp").val();
	var login = $("#txtAdminLogin").val();
	var email = $("#txtAdminEmail").val();
	var idEmpresa = '${idEmpresa}';
  	  	
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'grabarusuariosucursal.app',
	 		data: {idSucursal: idSucursal, aPaterno: aPaterno, aMaterno: aMaterno, nombres: nombres, ip: ip, login: login,
	 			email: email, idEmpresa: idEmpresa}, 	    		
	 		success: function (response) {
	 			var mensaje = response.message;	 			
	 			var data = response.data;
	 			var valid = response.success;
	 			if(response.success==true){
	 				$.alert({
                        title: 'Valido',
                        content: login.toUpperCase() + ' registrado correctamente.',
                    });
	 				$('#nuevoAdminSucursal').modal('hide');
					var	html='';
					$('#tblListadoSucursal tbody').empty();					
		 			for(var i=0; i<data.length; i++){				
						html = '<tr>' +
						'<td><span>'+data[i].nombre+'</span></td>' +
						'<td><span>'+data[i].ruc+'</span></td>' +
						'<td><span>'+data[i].direccion+'</span></td>' +									
						'<td><span>'+data[i].telefono+'</span></td>' +
						'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +
						'<td><span>'+data[i].nombreUsuario+'</span></td>' +
						'<td><span>'+data[i].usuario+'</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarSucursal('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnAddAdmin('+data[i].id+')" title="Asignar Admin"><i class="fa fa-user" aria-hidden="true"></i></button></td>' +
					  '</tr>';
					$('#tblListadoSucursal tbody').append(html);
		    		}	
// 					$('#tblListadoSucursal').DataTable();
				}
	 			else{
		 			console.log("error");
	 				$.alert({
                        title: 'Error',
                        content: 'Ya existe un usuario llamado '+login.toUpperCase(),
                    });
	 				$('#nuevoAdminSucursal').modal('hide');
	 			}
	 		}	
			});
	});
</script>
</body>
</html>