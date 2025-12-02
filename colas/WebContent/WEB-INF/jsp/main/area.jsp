<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Areas</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">   -->
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/jqvmap/jqvmap.min.css">   -->
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
<!--   <link rel="stylesheet" href="librerias/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">   -->
<!--   <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">   -->
<!--   <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">   -->
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
              <li class="breadcrumb-item active">Areas</li>
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
            			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Area"><i class="fas fa-plus"></i></button>
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoArea" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Nombre</th>                  					
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

<!-- nuevo area  -->
<div class="modal" id="nuevoArea">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nueva Area</h4>
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
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreArea" style="text-transform:uppercase;" placeholder="Nombre Area" required/>
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
								<button type="submit" id="btnGrabarArea" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
								<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
		      

	    </div>
	  </div>
	</div>

<!-- editar area  -->
<div class="modal" id="editarArea">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Area</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdArea" />
											<div class="col-xs-12 col-sm-4">
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreAreaEdit" style="text-transform:uppercase;" placeholder="Nombre Area" required/>
											</div>
										</div>									
									</div>																
								</div>
								<button type="submit" id="btnEditarArea" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
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

<script>

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	$("#txtNombreArea").val("");
	$("#nuevoArea").modal("show");
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
	
	$.ajax({ 
		type: 'POST', 
		url: 'listararea.app',
		data: {idSucursal: idSucursal}, 			
		success: function (response) {
			var data = response.data;				
			$('#tblListadoArea tbody').empty();					
			for(var i=0; i<data.length; i++){									
				html = '<tr>' +
				'<td><span>'+data[i].descripcion+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarArea('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoArea tbody').append(html);
    		}	
			$('#tblListadoArea').DataTable(); 			 			
		}
	});
	
});

$("#btnGrabarArea").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var nombreArea = $("#txtNombreArea").val();

	if(nombreArea !=""){
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'savearea.app',
	 		data: {idSucursal: idSucursal, nombreArea: nombreArea}, 	    		
	 		success: function (response) {
	 			var mensaje = response.message;
	 			var data = response.data;
	 			if(response.success==true){
	 				$.alert({
	                    title: 'Valido',
	                    content: nombreArea.toUpperCase()+' Registrada correctamente.',
	                });
	 				$('#nuevoArea').modal('hide');
					var	html='';
					$('#tblListadoArea tbody').empty();			
					for(var i=0; i<data.length; i++){									
						html = '<tr>' +
						'<td><span>'+data[i].descripcion+'</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarArea('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button></td>' +
					  '</tr>';	        					
					$('#tblListadoArea tbody').append(html);
		    		}	
// 					$('#tblListadoArea').DataTable();
	 			}
	 			else{
		 			console.log("error");
	 				$.alert({
	                    title: 'Error',
	                    content: 'Ya existe un area llamada '+nombreArea.toUpperCase(),
	                });
	 				$('#nuevoArea').modal('hide');
	 			}
	 		}	
		});
	}
});

function fnEditarArea(id){
	$('#editarArea').modal('show');
	console.log('id->>'+id);
	var idArea =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getareabyid.app',
		data: {idArea: idArea},		
		success: function (response) {
			var data = response.data;
			$("#txtIdArea").val(data.id);
			$("#txtNombreAreaEdit").val(data.descripcion);	
		}
	});	
}

$("#btnEditarArea").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idArea = $("#txtIdArea").val();
	var nombreAreaEdit = $("#txtNombreAreaEdit").val();		
	$.ajax({ 
 		type: 'POST', 
 		url: 'editarea.app',
 		data: {idSucursal: idSucursal, idArea: idArea, nombreAreaEdit: nombreAreaEdit}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombreAreaEdit.toUpperCase()+' Editada correctamente.',
                });
 				$('#editarArea').modal('hide');
				var	html='';
				$('#tblListadoArea tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].descripcion+'</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarArea('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoArea tbody').append(html);
	    		}
	    	}
 			else{
 				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un area llamada '+nombreAreaEdit.toUpperCase(),
                });
 				$('#editarArea').modal('hide');
 	 		}
 		}
	});				  
});

</script>
</body>
</html>