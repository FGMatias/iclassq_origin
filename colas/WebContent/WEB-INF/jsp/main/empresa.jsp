<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Empresas</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/jqvmap/jqvmap.min.css">  
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">  
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
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
<%--         <jsp:include page="menu/menuGeneral.jsp" /> --%>
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
              <li class="breadcrumb-item"><a href="mostrarempresas.app">Inicio</a></li>
              <li class="breadcrumb-item active">Empresa</li>
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
                			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoEmpresa"><i class="fas fa-plus"></i></button>  -->
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoEmpresas" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Nombre</th>
                  					<th>Ruc</th>
                  					<th>Direccion</th>
                  					<th>Telefono</th>
                  					<th>Acciones</th>
                				</tr>
                			</thead>
                			<tbody>                                
                			</tbody>
                			<tfoot>
               					<tr>
	                  				<th>Nombre</th>
                  					<th>Ruc</th>
                  					<th>Direccion</th>
                  					<th>Telefono</th>
                  					<th>Acciones</th>
                				</tr>
                			</tfoot>
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

<!-- nuevo empresa -->
	<div class="modal" id="nuevoEmpresa">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nueva Empresa</h4>
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
												<input class="form-control" type="text" id="txtNombreEmpresa" style="text-transform:uppercase;" placeholder="Nombre Empresa" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Ruta Logo</label>
												<input class="form-control" type="text" id="txtUrlLogo" style="text-transform:uppercase;" placeholder="URL" required/>
											</div>										
											<div class="col-xs-12 col-sm-2">
												<label>RUC</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtRucEmpresa" placeholder="RUC"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Telefono</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTelefono" placeholder="Telefono"/>
											</div>										
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												<label>Direccion</label>
												<textarea class="form-control rounded-0" id="txtDireccion" rows="3"></textarea>
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
						    	<button type="submit" id="btnGrabarEmpresa" class="btn btn-primary"title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
		 	
	    </div>
	  </div>
	</div>

<!-- 07-09-2019 -->
<!-- editar empresa -->
	<div class="modal" id="editarEmpresa">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Empresa</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdEmpresa" />
											<div class="col-xs-12 col-sm-3">
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreEmpresaEdit" style="text-transform:uppercase;" placeholder="Nombre Empresa"/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Ruta Logo</label>
												<input class="form-control" type="text" id="txtUrlLogoEdit" style="text-transform:uppercase;" placeholder="Prefijo"/>
											</div>										
											<div class="col-xs-12 col-sm-2">
												<label>RUC</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtRucEmpresaEdit" placeholder="RUC"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Telefono</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtTelefonoEdit" placeholder="Telefono"/>
											</div>										
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												<label>Direccion</label>
												<textarea class="form-control rounded-0" id="txtDireccionEdit" rows="3"></textarea>
											</div>																														
										</div>									
									</div>																
								</div>
								<button type="submit" id="btnEditarEmpresa" class="btn btn-primary"><i class="fa fa-edit"></i></button>
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
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>


<script>

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
	var nombre = '${usuario.vUsuarioNombres}';
	var idEmpresa = '${usuario.iEmpresa}';
	console.log("nombre: "+nombre); 
	console.log("empresa: "+idEmpresa); 
	$('#nombreUsuario').html(nombre);
	
	$.ajax({
		type: 'POST',
		url: 'getempresabyid.app',
		data: {idEmpresa: idEmpresa}, 	
		success: function (response) {
			var data = response.data;
			console.log(data)
			html = '<tr>' +
				'<td><span>'+data.nombre+'</span></td>' +
				'<td><span>'+data.ruc+'</span></td>' +
				'<td><span>'+data.direccion+'</span></td>' +									
				'<td><span>'+data.telefono+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarEmpresa('+data.id+')"><i class="fa fa-edit"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoEmpresas tbody').append(html);
			$('#tblListadoEmpresas').DataTable();
		}
	});
});

// 07-09-2019
$("#btnGrabarEmpresa").click(function() {
	var nombre =  $("#txtNombreEmpresa").val();		
	var urlLogo = $("#txtUrlLogo").val();			
	var ruc = $("#txtRucEmpresa").val();
	var telef = $("#txtTelefono").val();
	var direccion = $("#txtDireccion").val();

 	$.ajax({ 
 		type: 'POST', 
 		url: 'saveempresa.app',
 		data: {nombre: nombre, urlLogo: urlLogo, 
 			ruc: ruc, telef: telef, direccion: direccion}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
			var	html='';
			$('#tblListadoEmpresas tbody').empty();					
 			for(var i=0; i<data.length; i++){				
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].ruc+'</span></td>' +
				'<td><span>'+data[i].direccion+'</span></td>' +									
				'<td><span>'+data[i].telefono+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarEmpresa('+data[i].id+')"><i class="fa fa-edit"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoEmpresas tbody').append(html);
    		}	
			$('#tblListadoEmpresas').DataTable();
 			
 		}	
	});					  
});


function fnEditarEmpresa(id){
	$('#editarEmpresa').modal('show');
	console.log('id->>'+id);
	var idEmpresa =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getempresabyid.app',
		data: {idEmpresa: idEmpresa},		
		success: function (response) {
			var data = response.data;	
			console.log('data->>>>');
			console.log(data);

			$("#txtIdEmpresa").val(data.id);
			$("#txtNombreEmpresaEdit").val(data.nombre);		
			$("#txtUrlLogoEdit").val(data.urlLogo);
			$("#txtRucEmpresaEdit").val(data.ruc);
			$("#txtTelefonoEdit").val(data.telefono);
			$("#txtDireccionEdit").val(data.direccion);
	
		}
	});
}

$("#btnEditarEmpresa").click(function() {
	console.log("entro");
	var idEmpresa = $("#txtIdEmpresa").val();
	console.log("idemrpesa: "+idEmpresa);
	var nombreEdit =  $("#txtNombreEmpresaEdit").val();		
	var urlLogoEdit = $("#txtUrlLogoEdit").val();			
	var rucEdit = $("#txtRucEmpresaEdit").val();
	var telefEdit = $("#txtTelefonoEdit").val();
	var direccionEdit = $("#txtDireccionEdit").val();

	$.ajax({ 
 		type: 'POST', 
 		url: 'editempresa.app',
 		data: {idEmpresa: idEmpresa, nombreEdit: nombreEdit, urlLogoEdit: urlLogoEdit, 
	 		rucEdit: rucEdit, telefEdit: telefEdit, 
 			direccionEdit: direccionEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			
 			console.log("data editada empresa: -->"+data);
			var	html='';
			$('#tblListadoEmpresas tbody').empty();					
			for(var i=0; i<data.length; i++){				
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].ruc+'</span></td>' +
				'<td><span>'+data[i].direccion+'</span></td>' +									
				'<td><span>'+data[i].telefono+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarEmpresa('+data[i].id+')"><i class="fa fa-edit"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoEmpresas tbody').append(html);
    		}	
			$('#tblListadoEmpresas').DataTable();
 			$("#txtNombreEmpresaEdit").val("");		
 			$("#txtUrlLogoEdit").val("");			
 			$("#txtRucEmpresaEdit").val("");
 			$("#txtTelefonoEdit").val("");
 			$("#txtDireccionEdit").val("");	 			
 		}	
	});
});


function fnVerSucursal(id){
	console.log('eliminar id->>'+id);
	var idEmpresa =id;
	window.location.href = "mostrarsucursal.app?idEmpresa="+idEmpresa; 

}

</script>
</body>
</html>