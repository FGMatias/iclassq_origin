<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sucursales</title>
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
              <li class="breadcrumb-item active">Ventanillas</li>
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
            			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Ventanilla"><i class="fas fa-plus"></i></button>
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoVentanilla" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Nombre</th>
                  					<th>Frase de Llamado</th>
                  					<th>Ubicacion</th>
                  					<th>Area</th>      
                  					<th>Tipo Evaluacion</th>    
                  					<th>Puerto</th>    
                  					<th>Notificacion Sino?</th>   
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

<!-- nuevo Ventanilla  -->
<div class="modal" id="nuevoVentanilla">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nueva Ventanilla</h4>
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
												<input class="form-control" type="text" id="txtNombreVentanilla" style="text-transform:uppercase;" placeholder="Nombre Ventanilla" required/>
											</div>

											<div class="col-xs-12 col-sm-8">
												<label>Frase de llamado</label>
												<input class="form-control" type="text" id="txtDescripcionVentanilla" style="text-transform:uppercase;" placeholder="descripcion"/>
											</div>																					
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">								
											<div class="col-xs-12 col-sm-3">
												<label>Area</label>
												<select class="form-control" id="cboAreaVentanilla" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-9">
												<label>Ubicacion</label>
												<input class="form-control" type="text" id="txtUbicacionVentanilla" style="text-transform:uppercase;" placeholder="ubicacion"/>

											</div>																					
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Evalua</label>
												<select class="form-control" id="cboEvalua" required>
													<option value="">--Seleccione--</option>
													<option value="0">NO</option>
													<option value="1">Por teclado</option>
													<option value="2">Por Web</option>
												</select>
											</div>
											<div id="puertoEvalua" class="col-xs-12 col-sm-4" style="display:none">
												<label id="puerto" style="display:none">Puerto de Evaluacion</label>
												<label id="ip" style="display:none">IP de Evaluacion</label>
												<input class="form-control" type="text" id="txtPuerto" style="text-transform:uppercase;" required/>
											</div>
										</div>
									</div>
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Notifica</label>
												<select class="form-control" id="cboNotifica" required>
													<option value="">--Seleccione--</option>
													<option value="0">NO</option>
													<option value="1">SI</option>
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
								<button type="submit" id="btnGrabarVentanilla" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
								<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>

	    </div>
	  </div>
	</div>

<!-- editar Ventanilla  -->
<div class="modal" id="editarVentanilla">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Ventanilla</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdVentanilla"/>
											<div class="col-xs-12 col-sm-4">
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreVentanillaEdit" style="text-transform:uppercase;" placeholder="Nombre Ventanilla" required/>
											</div>
											<div class="col-xs-12 col-sm-8">
												<label>Frase de LLamado</label>
												<input class="form-control" type="text" id="txtDescripcionVentanillaEdit" style="text-transform:uppercase;" placeholder="descripcion"/>
											</div>																					
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">								
											<div class="col-xs-12 col-sm-3">
												<label>Area</label>
												<select class="form-control" id="cboAreaVentanillaEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-9">
												<label>Ubicacion</label>
												<input class="form-control" type="text" id="txtUbicacionVentanillaEdit" style="text-transform:uppercase;" placeholder="ubicacion"/>
											</div>																					
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Evalua</label>
												<select class="form-control" id="cboEvaluaEdit" required>
													<option value="">--Seleccione--</option>
													<option value="0">NO</option>
													<option value="1">Por teclado</option>
													<option value="2">Por Web</option>
												</select>
											</div>
											<div id="puertoEvaluaEdit" class="col-xs-12 col-sm-4" style="display:none">
												<label id="puertoEdit" style="display:none">Puerto de Evaluacion</label>
												<label id="ipEdit" style="display:none">IP de Evaluacion</label>
												<input class="form-control" type="text" id="txtPuertoEdit" style="text-transform:uppercase;" required/>
											</div>
										</div>
									</div>
								</div>	
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Notifica</label>
												<select class="form-control" id="cboNotificaEdit" required>
													<option value="">--Seleccione--</option>
													<option value="0">NO</option>
													<option value="1">SI</option>
												</select>
											</div>
										</div>
									</div>
								</div>
																
								<button type="submit" id="btnEditarVentanilla" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
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
	$("#txtNombreVentanilla").val("");			
	$("#txtUbicacionVentanilla").val("");
	$("#cboAreaVentanilla").val("");
	$("#txtDescripcionVentanilla").val("");
	$("#cboEvalua").val("");
	$("#txtPuerto").val("");		
	$("#cboNotifica").val("");
	
	$("#nuevoVentanilla").modal("show");
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
		url: 'getventanillasxidsucursal.app',
		data: {idSucursal: idSucursal}, 			
		success: function (response) {
			var data = response.data;	
			$('#tblListadoVentanilla tbody').empty();					
			for(var i=0; i<data.length; i++){									
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].descripcion+'</span></td>' +
				'<td><span>'+data[i].ubicacion+'</span></td>' +
				'<td><span>'+data[i].nombreArea+'</span></td>' +				
				'<td><span>'+data[i].tipoEvaluacion+'</span></td>' +
				'<td><span>'+data[i].puerto+'</span></td>' +
				'<td><span>'+data[i].notificacionId+'</span></td>' +
				'<td><button type="button" class="btn btn-success" onclick="fnEditarVentanilla('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnEliminarVentanilla('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoVentanilla tbody').append(html);
    		}
//     	$('#tblListadoVentanilla').DataTable(); 			 			
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {
                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboAreaVentanilla");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboAreaVentanillaEdit");
            });	
		}
	});		
	
});


$("#btnGrabarVentanilla").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var nombreVentanilla = $("#txtNombreVentanilla").val();			
	var ubicacionVentanilla = $("#txtUbicacionVentanilla").val();
	var idArea = $("#cboAreaVentanilla").val();
	var descripcionVentanilla = $("#txtDescripcionVentanilla").val();
	var iEvalua = $("#cboEvalua").val();
	var puerto = $("#txtPuerto").val();	
	var notifica = $("#cboNotifica").val();	
	if (iEvalua=='0') puerto="";
	
					
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveventanilla.app',
 		data: {idSucursal: idSucursal, nombreVentanilla: nombreVentanilla, ubicacionVentanilla: ubicacionVentanilla, 
 			idArea: idArea, descripcionVentanilla: descripcionVentanilla, iEvalua: iEvalua, puerto: puerto, notifica:notifica}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombreVentanilla.toUpperCase()+' Registrado correctamente.',
                });
 				$('#nuevoVentanilla').modal('hide');
				var	html='';
				$('#tblListadoVentanilla tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].descripcion+'</span></td>' +
					'<td><span>'+data[i].ubicacion+'</span></td>' +
					'<td><span>'+data[i].nombreArea+'</span></td>' +
					'<td><span>'+data[i].tipoEvaluacion+'</span></td>' +
					'<td><span>'+data[i].puerto+'</span></td>' +
					'<td><span>'+data[i].notificacionId+'</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarVentanilla('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnEliminarVentanilla('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoVentanilla tbody').append(html);
	    		}	
				$('#tblListadoVentanilla').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una ventanilla llamada '+nombreVentanilla.toUpperCase(),
                });
 				$('#nuevoVentanilla').modal('hide');
 			}
 		}	
	});				  
});

function fnEditarVentanilla(id){
	console.log('id->>>'+id);
	$('#editarVentanilla').modal('show');
	console.log('id->>'+id);
	var idVentanilla =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getventanillabyid.app',
		data: {idVentanilla: idVentanilla},		
		success: function (response) {
			var data = response.data;
			$("#txtIdVentanilla").val(data.id);
			$("#txtNombreVentanillaEdit").val(data.nombre);			
			$("#txtUbicacionVentanillaEdit").val(data.ubicacion);
			$("#cboAreaVentanillaEdit").val(data.idArea);
			$("#txtDescripcionVentanillaEdit").val(data.descripcion);
			$("#cboEvaluaEdit").val(data.tipoEvaluacion);
			$("#txtPuertoEdit").val(data.puerto);	
			$("#cboNotificaEdit").val(data.notifica);			
			if ($("#cboEvaluaEdit").val()==0){
				$("#puertoEvaluaEdit").css("display", "none");
		        $("#txtPuertoEdit").removeAttr("required");
			}
			if ($("#cboEvaluaEdit").val()==1){
				$("#puertoEvaluaEdit").removeAttr("style");
				$("#puertoEdit").removeAttr("style");
		        $("#ipEdit").css("display", "none");
		        $("#txtPuertoEdit").attr("required");
			}
			if ($("#cboEvaluaEdit").val()==2){
				$("#puertoEvaluaEdit").removeAttr("style");
				$("#ipEdit").removeAttr("style");
		        $("#puertoEdit").css("display", "none");
		        $("#txtPuertoEdit").attr("required");
			}

			
			
		}
	});
	
}
$('#cboEvalua').on('change',function(){
	if ($("#cboEvalua").val()==0){
		$("#puertoEvalua").css("display", "none");
        $("#txtPuerto").removeAttr("required");
	}
	if ($("#cboEvalua").val()==1){
		$("#puertoEvalua").removeAttr("style");
		$("#puerto").removeAttr("style");
        $("#ip").css("display", "none");
        $("#txtPuerto").attr("required");
	}
	if ($("#cboEvalua").val()==2){
		$("#puertoEvalua").removeAttr("style");
		$("#ip").removeAttr("style");
        $("#puerto").css("display", "none");
        $("#txtPuerto").attr("required");
	}
})

$('#cboEvaluaEdit').on('change',function(){
	if ($("#cboEvaluaEdit").val()==0){
		$("#puertoEvaluaEdit").css("display", "none");
        $("#txtPuertoEdit").removeAttr("required");
	}
	if ($("#cboEvaluaEdit").val()==1){
		$("#puertoEvaluaEdit").removeAttr("style");
		$("#puertoEdit").removeAttr("style");
        $("#ipEdit").css("display", "none");
        $("#txtPuertoEdit").attr("required");
	}
	if ($("#cboEvaluaEdit").val()==2){
		$("#puertoEvaluaEdit").removeAttr("style");
		$("#ipEdit").removeAttr("style");
        $("#puertoEdit").css("display", "none");
        $("#txtPuertoEdit").attr("required");
	}
})


$("#btnEditarVentanilla").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idVentanilla = $("#txtIdVentanilla").val();
	var nombreVentanillaEdit = $("#txtNombreVentanillaEdit").val();			
	var ubicacionVentanillaEdit = $("#txtUbicacionVentanillaEdit").val();
	var idAreaEdit = $("#cboAreaVentanillaEdit").val();
	var descripcionVentanillaEdit = $("#txtDescripcionVentanillaEdit").val();
	var vIpEdit= $("#txtIpVentanillaEdit").val();
	var iEvaluaEdit = $("#cboEvaluaEdit").val();
	var puertoEdit = $("#txtPuertoEdit").val();	
	var notificaEdit=$("#cboNotificaEdit").val();	
	if (iEvaluaEdit=='0') puertoEdit="";
	$.ajax({ 
 		type: 'POST', 
 		url: 'editventanilla.app',
 		data: {idSucursal: idSucursal, idVentanilla: idVentanilla, nombreVentanillaEdit: nombreVentanillaEdit, ubicacionVentanillaEdit: ubicacionVentanillaEdit, 
 			idAreaEdit: idAreaEdit, descripcionVentanillaEdit: descripcionVentanillaEdit, iEvaluaEdit: iEvaluaEdit, puertoEdit: puertoEdit, notificaEdit: notificaEdit}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombreVentanillaEdit.toUpperCase()+' Editada correctamente.',
                });
 				$('#editarVentanilla').modal('hide');
				var	html='';
				$('#tblListadoVentanilla tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].descripcion+'</span></td>' +
					'<td><span>'+data[i].ubicacion+'</span></td>' +
					'<td><span>'+data[i].nombreArea+'</span></td>' +
					'<td><span>'+data[i].tipoEvaluacion+'</span></td>' +
					'<td><span>'+data[i].puerto+'</span></td>' +	
					'<td><span>'+data[i].notificacionId+'</span></td>' +					
					'<td><button type="button" class="btn btn-success" onclick="fnEditarVentanilla('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnEliminarVentanilla('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoVentanilla tbody').append(html);
	    		}
 			}
 			else{
 				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe una ventanilla llamada '+nombreVentanillaEdit.toUpperCase(),
                });
 				$('#editarVentanilla').modal('hide');
 	 		}
 		}
	});				  
});

function fnEliminarVentanilla(id){
	var idSucursal = '${usuario.iSucursal}';
	var idVentanilla =id;

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
						url: 'eliminarventanilla.app',
						data: {idSucursal: idSucursal, idVentanilla: idVentanilla},		
						success: function (response) {
							var data = response.data;	
							var	html='';			
							$('#tblListadoVentanilla tbody').empty();					
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].nombre+'</span></td>' +
								'<td><span>'+data[i].descripcion+'</span></td>' +
								'<td><span>'+data[i].ubicacion+'</span></td>' +
								'<td><span>'+data[i].nombreArea+'</span></td>' +
								'<td><span>'+data[i].tipoEvaluacion+'</span></td>' +
								'<td><span>'+data[i].puerto+'</span></td>' +
								'<td><span>'+data[i].notifica+'</span></td>' +								
								'<td><button type="button" class="btn btn-success" onclick="fnEditarVentanilla('+data[i].id+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar" onclick="fnEliminarVentanilla('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoVentanilla tbody').append(html);
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