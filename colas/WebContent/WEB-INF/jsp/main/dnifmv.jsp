<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DNI</title>
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
              <li class="breadcrumb-item active">Personas</li>
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
            		    <button id="btnOpenModal"type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Persona"><i class="fas fa-plus"></i></button>
<!--               			<h3 class="card-title">Listado de DNI</h3> -->
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoPersonas" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>DNI</th>
                  					<th>Nombres</th>
                  					<th>Apellido Paterno</th>
                  					<th>Apellido Materno</th>
                  					<th>Tipo de Registro</th>
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


<!-- nueva persona  -->
<div class="modal" id="nuevaPersona">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nueva Persona</h4>
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
												<label>Nombres</label>
												<input class="form-control" type="text" id="txtNombres" style="text-transform:uppercase;" placeholder="Nombres" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Paterno</label>
												<input class="form-control" type="text" id="txtApePaterno" style="text-transform:uppercase;" placeholder="Apellidos Paterno" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Materno</label>
												<input class="form-control" type="text" id="txtApeMaterno" style="text-transform:uppercase;" placeholder="Apellidos Materno" required/>
											</div>
										</div>								
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">	
											<div class="col-xs-12 col-sm-4">
												<label>DNI</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtDNI" placeholder="DNI"/>
											</div>								
											<div class="col-xs-12 col-sm-4" id="divTipoRegistro">
												<label>Tipo de Registro:</label>
												<select class="form-control" id="cboTipoRegistro" required>
													<option value="0">--Seleccione--</option>
													<option value="1">Por carga de data</option>
													<option value="2">Por registro web</option>
													<option value="3">Por registro en aplicacion</option>
												</select>
											</div>	
										</div>
									</div>
								</div>
								<button type="submit" id="btnNuevaPersona" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	    </div>
	  </div>
	</div>

<!-- editar persona  -->
<div class="modal" id="editarPersona">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Persona</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form>							
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdPersona" />
											<div class="col-xs-12 col-sm-4">
												<label>Nombres</label>
												<input class="form-control" type="text" id="txtNombresEdit" style="text-transform:uppercase;" placeholder="Nombres" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Paterno</label>
												<input class="form-control" type="text" id="txtApePaternoEdit" style="text-transform:uppercase;" placeholder="Apellidos Paterno" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Apellido Materno</label>
												<input class="form-control" type="text" id="txtApeMaternoEdit" style="text-transform:uppercase;" placeholder="Apellidos Materno" required/>
											</div>
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">								
											<div class="col-xs-12 col-sm-4">
												<label>DNI</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtDNIEdit" placeholder="DNI"/>
											</div>	
										</div>
									</div>
								</div>								
								<button type="button" id="btnEditarPersona" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>							
							</form>
					</fieldset>
		      </div>
	
	      <!-- Modal footer -->
<!-- 	      <div class="modal-footer"> -->
	      	
<!-- 	      </div> -->
	
	    </div>
	  </div>
	</div>

<script src="librerias/admin/plugins/summernote/summernote-bs4.min.js"></script>
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

	var idSucursal = '${usuario.iSucursal}';
	var nombre = '${usuario.vUsuarioNombres}';
	var apellido = '${usuario.vUsuarioApPaterno}';
	console.log("nombre: "+nombre); 
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
		url: 'findallpersonas.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			var desEstado='';			
			for(var i=0; i<data.length; i++){
				if(data[i].estado==0){
					if(data[i].tipoRegistro == 1){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por carga de data</span></td>' +
						'<td><span>INACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}
 					if(data[i].tipoRegistro == 2){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por registro web</span></td>' +
						'<td><span>INACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}
 					if(data[i].tipoRegistro == 3){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por registro de aplicacion</span></td>' +
						'<td><span>INACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}   					
				$('#tblListadoPersonas tbody').append(html);
				}
				
				if(data[i].estado==1){
					if(data[i].tipoRegistro == 1){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por carga de data</span></td>' +
						'<td><span>ACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}
 					if(data[i].tipoRegistro == 2){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por registro web</span></td>' +
						'<td><span>ACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}
 					if(data[i].tipoRegistro == 3){
 						html = '<tr>' +
						'<td><span>'+data[i].dni+'</span></td>' +
						'<td><span>'+data[i].nombres+'</span></td>' +
						'<td><span>'+data[i].apePaterno+'</span></td>' +									
						'<td><span>'+data[i].apeMaterno+'</span></td>' +
						'<td><span>Por registro de aplicacion</span></td>' +
						'<td><span>ACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        
 					}     					
				$('#tblListadoPersonas tbody').append(html);
				}				
    		}	
			$('#tblListadoPersonas').DataTable();
		}
	});
});

function fnEditarPersona(id){
	$('#editarPersona').modal('show');
	console.log('idPersona->>'+id);
	var idPersona =id;	
	$.ajax({ 
		type: 'POST', 
		url: 'getpersonabyid.app',
		data: {idPersona: idPersona},		
		success: function (response) {
			var data = response.data;
			$("#txtIdPersona").val(data.id);
			$("#txtApePaternoEdit").val(data.apePaterno);
 			$("#txtApeMaternoEdit").val(data.apeMaterno);
 			$("#txtNombresEdit").val(data.nombres);
 			$("#txtDNIEdit").val(data.dni); 	
		}
	});
}

function fnInhabilitarPersona(id){
	var idSucursal = '${usuario.iSucursal}';
	console.log('id->>'+id);
	var idPersona =id;	
	
	$.confirm({
	    title: '¿Estás seguro de inhabilitar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Inhabilitado!');
	        		$.ajax({ 
	        			type: 'POST', 
	        			url: 'inhabilitarpersona.app',
	        			data: {idSucursal: idSucursal, idPersona: idPersona},		
	        			success: function (response) {
	        				var data = response.data;	
	        				var	html='';
	        				$('#tblListadoPersonas tbody').empty();
	        				for(var i=0; i<data.length; i++){	
	        					if(data[i].estado==0){
	        						if(data[i].tipoRegistro == 1){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por carga de data</span></td>' +
	        							'<td><span>INACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}
	        						if(data[i].tipoRegistro == 2){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por registro web</span></td>' +
	        							'<td><span>INACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}
	        						if(data[i].tipoRegistro == 3){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por registro de aplicacion</span></td>' +
	        							'<td><span>INACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}   					
	        						$('#tblListadoPersonas tbody').append(html);
	        					}
	        					if(data[i].estado==1){
	        						if(data[i].tipoRegistro == 1){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por carga de data</span></td>' +
	        							'<td><span>ACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}
	        						if(data[i].tipoRegistro == 2){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por registro web</span></td>' +
	        							'<td><span>ACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}
	        						if(data[i].tipoRegistro == 3){
	        							html = '<tr>' +
	        							'<td><span>'+data[i].dni+'</span></td>' +
	        							'<td><span>'+data[i].nombres+'</span></td>' +
	        							'<td><span>'+data[i].apePaterno+'</span></td>' +									
	        							'<td><span>'+data[i].apeMaterno+'</span></td>' +
	        							'<td><span>Por registro de aplicacion</span></td>' +
	        							'<td><span>ACTIVO</span></td>' +
	        							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
	        						  '</tr>';	        
	        						}     		    					
	        						$('#tblListadoPersonas tbody').append(html);
	        	    			}	
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


$("#btnEditarPersona").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';	
	var idPersona = $("#txtIdPersona").val();
	console.log("idPersona: "+idPersona);
	var dni =  $("#txtDNIEdit").val();
	var nombres = $("#txtNombresEdit").val();
	var apePaterno = $("#txtApePaternoEdit").val();
	var apeMaterno = $("#txtApeMaternoEdit").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'editPerson.app',
 		data: {idUsuario: idUsuario, idPersona: idPersona, nombres: nombres, dni: dni, apePaterno: apePaterno, apeMaterno: apeMaterno},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data; 			
			var	html='';
			$('#tblListadoPersonas tbody').empty();
			for(var i=0; i<data.length; i++){				
				if(data[i].tipoRegistro == 1){
						html = '<tr>' +
					'<td><span>'+data[i].dni+'</span></td>' +
					'<td><span>'+data[i].nombres+'</span></td>' +
					'<td><span>'+data[i].apePaterno+'</span></td>' +									
					'<td><span>'+data[i].apeMaterno+'</span></td>' +
					'<td><span>Por carga de data</span></td>' +
					'<td><span>ACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        
					}
					if(data[i].tipoRegistro == 2){
						html = '<tr>' +
					'<td><span>'+data[i].dni+'</span></td>' +
					'<td><span>'+data[i].nombres+'</span></td>' +
					'<td><span>'+data[i].apePaterno+'</span></td>' +									
					'<td><span>'+data[i].apeMaterno+'</span></td>' +
					'<td><span>Por registro web</span></td>' +
					'<td><span>ACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        
					}
					if(data[i].tipoRegistro == 3){
						html = '<tr>' +
					'<td><span>'+data[i].dni+'</span></td>' +
					'<td><span>'+data[i].nombres+'</span></td>' +
					'<td><span>'+data[i].apePaterno+'</span></td>' +									
					'<td><span>'+data[i].apeMaterno+'</span></td>' +
					'<td><span>Por registro de aplicacion</span></td>' +
					'<td><span>ACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        
					}    				    					
			$('#tblListadoPersonas tbody').append(html);
    		}	 			
 		}	
	});				  
});

$("#btnOpenModal").click(function() {
	console.log("llego aqui");
	$("#txtNombres").val("");			
	$("#txtApePaterno").val("");
	$("#txtApeMaterno").val("");
	$("#txtDNI").val("");
	
	$("#nuevaPersona").modal("show");
	$("#msgValidate").removeClass("show");
});

$("#btnNuevaPersona").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';	 
	var dni = $("#txtDNI").val();
	var nombres = $("#txtNombres").val();
	var aPaterno =  $("#txtApePaterno").val();
	var aMaterno = $("#txtApeMaterno").val();
	var tipoRegistro = $("#cboTipoRegistro").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'savePerson.app',
 		data: {idUsuario: idUsuario, dni: dni, nombres: nombres, aPaterno: aPaterno, aMaterno: aMaterno, tipoRegistro: tipoRegistro},
 		success: function (response) {
 			var data = response.data; 	
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombres.toUpperCase() + ' ' + aPaterno.toUpperCase() + ' ' + aMaterno.toUpperCase() + ' Registrado correctamente.',
                });
 				$('#nuevaPersona').modal('hide');	
	 			var html='';
	 			$('#tblListadoPersonas tbody').empty();
	 			for(var i=0; i<data.length; i++){
	 				if(data[i].estado==0){
	 					if(data[i].tipoRegistro == 1){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por carga de data</span></td>' +
							'<td><span>INACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}
	 					if(data[i].tipoRegistro == 2){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por registro web</span></td>' +
							'<td><span>INACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}
	 					if(data[i].tipoRegistro == 3){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por registro de aplicacion</span></td>' +
							'<td><span>INACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}
											
					$('#tblListadoPersonas tbody').append(html);
					}
					if(data[i].estado==1){
						if(data[i].tipoRegistro == 1){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por carga de data</span></td>' +
							'<td><span>ACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}
	 					if(data[i].tipoRegistro == 2){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por registro web</span></td>' +
							'<td><span>ACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}
	 					if(data[i].tipoRegistro == 3){
	 						html = '<tr>' +
							'<td><span>'+data[i].dni+'</span></td>' +
							'<td><span>'+data[i].nombres+'</span></td>' +
							'<td><span>'+data[i].apePaterno+'</span></td>' +									
							'<td><span>'+data[i].apeMaterno+'</span></td>' +
							'<td><span>Por registro de aplicacion</span></td>' +
							'<td><span>ACTIVO</span></td>' +
							'<td><button type="button" class="btn btn-success" onclick="fnEditarPersona('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarPersona('+data[i].id+')" title="Inhabilitar Persona"><i class="fa fa-ban" aria-hidden="true"></i></button></td>' +
						  '</tr>';	        
	 					}    					
					$('#tblListadoPersonas tbody').append(html);
					}
	 			}
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una persona con el DNI '+dni,
                });
 				$('#nuevaPersona').modal('hide');
 			}
 		}
	});	
});
</script>
</body>
</html>