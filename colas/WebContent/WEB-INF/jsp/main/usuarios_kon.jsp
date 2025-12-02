<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usuarios</title>
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
              <li class="breadcrumb-item active">Usuarios</li>
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
            		    <button id="btnNewUser" type="button" class="btn btn-primary" data-toggle="modal" title="Nueva Usuario"><i class="fas fa-plus"></i></button>
<!--               			<h3 class="card-title">Listado de Usuarios</h3> -->
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoUsuarios" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Apellidos y Nombres</th>
                  					<th>Usuario</th>
                  					<th>Rol</th>
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


<!-- nuevo usuario  -->
<div class="modal" id="nuevoUsuario">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Usuario</h4>
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
												<label>Apellido Paterno</label>
												<input class="form-control" type="text" id="txtUsuarioAPaterno" style="text-transform:uppercase;" placeholder="Apellido Paterno"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Apellido Materno</label>
												<input class="form-control" type="text" id="txtUsuarioAMaterno" style="text-transform:uppercase;" placeholder="Apellido Materno"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Nombres</label>
												<input class="form-control" type="text" id="txtUsuarioNombres" style="text-transform:uppercase;" placeholder="Nombres del usuario"/>
											</div>	
											<div class="col-xs-12 col-sm-3">
												<label>DNI</label>
												<input class="form-control" type="text" id="txtDNI" style="text-transform:uppercase;" placeholder="DNI de usuario" required/>
											</div>																				
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">	
											<div class="col-xs-12 col-sm-4">
												<label>Usuario</label>
												<input class="form-control" type="text" id="txtUsuarioLogin" style="text-transform:uppercase;" placeholder="Login de usuario" required/>
											</div>			
											<div class="col-xs-12 col-sm-4">
												<label>Zona</label>
												<select class="form-control" id="cboZona" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>	
											<div class="col-xs-12 col-sm-4">
												<label>Oficina</label>
												<select class="form-control" id="cboOficina" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>			
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">	
											<div class="col-xs-12 col-sm-4">
												<label>Contrato</label>
												<input class="form-control" type="text" id="txtContrato" style="text-transform:uppercase;" placeholder="Contrato" required/>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label id="labelRolUsuario">Rol</label>
												<select class="form-control" id="cboRolUsuario" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>							
											<div class="col-xs-12 col-sm-4">
												<label>Tipo Administracion</label>
												<select class="form-control" id="cboTipoAdm" required>
													<option value="">--Seleccione--</option>
													<option value="0">Sucursal</option>
													<option value="1">Area</option>
												</select>
											</div>									
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">	
											<div class="col-xs-12 col-sm-4">
												<label id="labelAreaUsuario" style="display:none">Area</label>
												<select class="form-control" id="cboAreaUsuario" required style="display:none">
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>										
										</div>
									</div>
								</div>
								<button type="submit" id="btnGrabarUsuario" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	    </div>
	  </div>
	</div>

<!-- editar usuario  -->
<div class="modal" id="editarUsuario">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Usuario</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form>							
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdUsuario" />
											<div class="col-xs-12 col-sm-4">
												<label>Usuario</label>
												<input class="form-control" type="text" id="txtLoginEdit" style="text-transform:uppercase;" placeholder="Login de usuario"/>
											</div>										
											<div class="col-xs-12 col-sm-4">
												<label>Zona</label>
												<select class="form-control" id="cboZonaEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>	
											<div class="col-xs-12 col-sm-4">
												<label>Oficina</label>
												<select class="form-control" id="cboOficinaEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>			
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Contrato</label>
												<input class="form-control" type="text" id="txtContratoEdit" style="text-transform:uppercase;" placeholder="Contrato" required/>
											</div>			
											<div class="col-xs-12 col-sm-4">
												<label id="labelRolUsuario">Rol</label>
												<select class="form-control" id="cboRolUsuarioEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>							
											<div class="col-xs-12 col-sm-4">
												<label>Tipo Administracion</label>
												<select class="form-control" id="cboTipoAdmEdit" required>
													<option value="">--Seleccione--</option>
													<option value="0">Sucursal</option>
													<option value="1">Area</option>
												</select>
											</div>
										</div>
									</div>
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label id="labelAreaUsuarioEdit" style="display:none">Area</label>
												<select class="form-control" id="cboAreaUsuarioEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
										</div>
									</div>
								</div>								
								<button type="button" id="btnEditarUsuario" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
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

$("#btnNewUser").click(function() {
	$("#txtUsuarioAPaterno").val("");
	$("#txtUsuarioAMaterno").val("");
	$("#txtUsuarioNombres").val("");
	$("#txtDNI").val("");
	$("#txtUsuarioEmail").val("");
	$("#txtUsuarioLogin").val("");
	$("#txtUsuarioIp").val("");
	$("#cboRolUsuario").val("");
	$("#cboTipoAdm").val("");
	$("#cboAreaUsuario").val("");
	$("#cboZona").val("");
	$("#cboOficina").val("");
	$("#txtContrato").val("");
	$("#nuevoUsuario").modal("show");
	$("#msgValidate").removeClass("show");
	
	$("#cboZona").change(function(){
		var idZona = $("#cboZona option:selected").val();
					
		if ( idZona != 0 ) {
			$("#cboOficina").children("option:not(:first)").remove();
			fnGetOficina(idZona, idSucursal);

		} else {
			$("#cboOficina").children("option:not(:first)").remove();
		}
					
	});
});

function fnGetOficina(idZona, idSucursal, callback) {
    $.ajax({
        type: 'POST',
        url: 'listarOpciones.app',
        data: { idPadre: idZona, idSucursal: idSucursal },
        success: function (response) {
            var data = response.data;
            $("#cboOficina").empty().append('<option value="0">Seleccione</option>'); 
            $.each(data, function (index, item) {
                $("<option/>")
                    .attr("value", item.id)
                    .text(item.descripcion)
                    .appendTo("#cboOficina");
                $("<option/>")
                    .attr("value", item.id)
                    .text(item.descripcion)
                    .appendTo("#cboOficinaEdit");
            });
            if (callback) callback(); 
        }
    });
}

var idSucursal = 0;

$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });

	idSucursal = '${usuario.iSucursal}';
	var nombre = '${usuario.vUsuarioNombres}';
	console.log("nombre: "+nombre); 
	$('#nombreUsuario').html(nombre);
	
	// matias zonas
	$.ajax({ 
		type: 'POST', 
		url: 'listarOpciones.app',   		
		data: {idPadre: '5', idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
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
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboAreaUsuario");
                $("<option/>")
                .attr("value", item.id)
                .text(item.descripcion)
                .appendTo("#cboAreaUsuarioEdit");
			});	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarrolusuario.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre)
                        .appendTo("#cboRolUsuario");
                $("<option/>")
                .attr("value", item.id)
                .text(item.nombre)
                .appendTo("#cboRolUsuarioEdit");
			});	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'findallusuarios.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			console.log(data);
			var desEstado='';			
			for(var i=0; i<data.length; i++){
				if(data[i].iUsuarioEstado==0){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
					'<td><span>INACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuarios tbody').append(html);
				}
				if(data[i].iUsuarioEstado==1){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
					'<td><span>ACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuarios tbody').append(html);
				}				
    		}	
			$('#tblListadoUsuarios').DataTable();
		}
	});
});



function fnhabilitaCamposUsuarios(pTipoEdicion){
	
	if (pTipoEdicion=="Edit") {
		if ($("#cboTipoAdmEdit").val()=="" ){
	        $("#labelAreaUsuarioEdit").css("display", "none");
			$("#cboAreaUsuarioEdit").removeAttr("required");
			$('#cboAreaUsuarioEdit').hide();
		}
		if ($("#cboTipoAdmEdit").val()=="0" ){
	        $("#labelAreaUsuarioEdit").css("display", "none");
			$("#cboAreaUsuarioEdit").removeAttr("required");
			$('#cboAreaUsuarioEdit').hide();
		}
		if ($("#cboTipoAdmEdit").val()=="1"){
			$("#labelAreaUsuarioEdit").removeAttr("style");
			$("#cboAreaUsuarioEdit").attr("required");
			$('#cboAreaUsuarioEdit').show();
		}
		
	}
	if (pTipoEdicion=="Nuevo") 
	{
		if ($("#cboTipoAdm").val()=="" ){
	        $("#labelAreaUsuario").css("display", "none");
			$("#cboAreaUsuario").removeAttr("required");
			$('#cboAreaUsuario').hide();
		}
		if ($("#cboTipoAdm").val()=="0" ){
	        $("#labelAreaUsuario").css("display", "none");
			$("#cboAreaUsuario").removeAttr("required");
			$('#cboAreaUsuario').hide();
		}
		if ($("#cboTipoAdm").val()=="1"){
		    $("#labelAreaUsuario").removeAttr("style");
	        $("#cboAreaUsuario").attr("required");
			$('#cboAreaUsuario').show();
		}
		
	}
}


function fnEditarUsuario(id, idSucursal){
	$('#editarUsuario').modal('show');
	console.log('id->>'+id);
	console.log("sucursal: " + idSucursal)
	var idUsuario =id;	
	
	$("#cboZonaEdit").change(function(){
		var idZona = $("#cboZonaEdit option:selected").val();
					
		if ( idZona != 0 ) {
			$("#cboOficinaEdit").children("option:not(:first)").remove();
			fnGetOficina(idZona, idSucursal);

		} else {
			$("#cboOficinaEdit").children("option:not(:first)").remove();
		}
					
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'getusuariobyid.app',
		data: {idUsuario: idUsuario},		
		success: function (response) {
			var data = response.data;	
			console.log(data)
			$("#txtIdUsuario").val(data.iUsuarioId);
 			$("#txtLoginEdit").val(data.vUsuarioUsername);
 			$("#cboAreaUsuarioEdit").val(data.iArea); 	
 			$("#cboRolUsuarioEdit").val(data.iRolEquipo);
 			$("#cboZonaEdit").val(data.zona);
 			if (data.zona && data.zona !== 0) {
                fnGetOficina(data.zona, idSucursal, function () {
                    if ($("#cboOficinaEdit option").length > 1) {
                        $("#cboOficinaEdit").val(data.oficina);
                    }
                });
            }
 			$("#txtContratoEdit").val(data.contrato);
 			if ( data.iArea==0) {
 				$("#cboTipoAdmEdit").val("0"); 
 			}else {
 				$("#cboTipoAdmEdit").val("1"); 
 			}
 			fnhabilitaCamposUsuarios("Edit");
		}
	});
}

$('#cboTipoAdmEdit').on('change',function(){
		fnhabilitaCamposUsuarios("Edit");
})
$('#cboTipoAdm').on('change',function(){
		fnhabilitaCamposUsuarios("Nuevo");
})
function fnInhabilitarUsuario(id){
	var idSucursal = '${usuario.iSucursal}'; 
	console.log('id->>'+id);
	var idUsuario =id;	
	$.ajax({ 
		type: 'POST', 
		url: 'inhabilitarusuario.app',
		data: {idUsuario: idUsuario, idSucursal: idSucursal},		
		success: function (response) {
			var data = response.data;	
			var	html='';
			$('#tblListadoUsuarios tbody').empty();
			for(var i=0; i<data.length; i++){				
				if(data[i].iUsuarioEstado==0){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
					'<td><span>INACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuarios tbody').append(html);
				}
				if(data[i].iUsuarioEstado==1){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
					'<td><span>ACTIVO</span></td>' +
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuarios tbody').append(html);
				}
    		}	
// 			$('#tblListadoUsuarios').DataTable();
		}
	});
}


$("#btnEditarUsuario").click(function() {
	var idSucursal = '${usuario.iSucursal}'; 
	var idUsuario = $("#txtIdUsuario").val();
	console.log("idUser: "+idUsuario);
	var loginEdit =  $("#txtLoginEdit").val();
	var ipEdit = "";
	var tipoAdm=$("#cboTipoAdmEdit").val();
	var idArea=  $("#cboAreaUsuarioEdit").val();
	var rolEdit = $("#cboRolUsuarioEdit").val();
	var zonaEdit = $("#cboZonaEdit").val();
	var oficinaEdit = $("#cboOficinaEdit").val();
	var contratoEdit = $("#txtContratoEdit").val();
	if (tipoAdm==0) {
		idArea=0;
	}

	$.ajax({ 
 		type: 'POST', 
 		url: 'editusuario.app',
 		data: {idUsuario: idUsuario, idSucursal: idSucursal, loginEdit: loginEdit, ipEdit: ipEdit, idArea: idArea, rolEdit: rolEdit,
 			zonaEdit: zonaEdit, oficinaEdit: oficinaEdit, contratoEdit: contratoEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data; 			
 			console.log(data);
 			if(response.success==true)
			{
 				$.alert({
                    title: 'Valido',
                    content: 'Editado correctamente.',
                });
 				var	html='';
 				$('#tblListadoUsuarios tbody').empty();
 				for(var i=0; i<data.length; i++){				
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
 					'<td><span>'+data[i].iUsuarioEstado+'</span></td>' +
 					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
 				  '</tr>';	        					
 				$('#tblListadoUsuarios tbody').append(html);
 	    		}	
			}		
 		}	
	});				  
});

function fnResetearClave(id){
	var idUsuario =id;
	$.ajax({ 
		type: 'POST', 
		url: 'resetearclaveuser.app',
		data: {idUsuario: idUsuario},		
		success: function (response) {
			var data = response.data;
			html='';				
			if(response.success==true){
				console.log("reset");
 				$.alert({
                    title: 'Exito',
                    content: response.message,
                });  				
         	}		
		}
	});
}

$("#btnGrabarUsuario").click(function() {
	var idSucursal = '${usuario.iSucursal}';	 
	var aPaterno =  $("#txtUsuarioAPaterno").val();
	var aMaterno = $("#txtUsuarioAMaterno").val();
	var nombres = $("#txtUsuarioNombres").val();
	var dni = $("#txtDNI").val();
	var ip = "";
	var login = $("#txtUsuarioLogin").val();
	var email = "";
	var idEmpresa = '${usuario.iEmpresa}';	
	var tipoAdm=$("#cboTipoAdm").val();
	var idArea=  $("#cboAreaUsuario").val();
	var rol = $("#cboRolUsuario").val();
	var zona = $("#cboZona").val();
	var oficina = $("#cboOficina").val();
	var contrato = $("#txtContrato").val();
	if (tipoAdm==0) {
		idArea=0;
	}
	$.ajax({ 
 		type: 'POST', 
 		url: 'saveusuarioreporte.app',
 		data: {idSucursal: idSucursal, aPaterno: aPaterno, aMaterno: aMaterno,
	 		nombres: nombres, dni: dni, ip: ip, login: login, email: email, idEmpresa:idEmpresa, idArea: idArea, rol: rol,
	 		zona: zona, oficina: oficina, contrato: contrato},
 		success: function (response) {
 			var data = response.data; 	
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: login.toUpperCase() + ' Registrado correctamente.',
                });
 				$('#nuevoUsuario').modal('hide');	
	 			var html='';
	 			$('#tblListadoUsuarios tbody').empty();
	 			for(var i=0; i<data.length; i++){
	 				if(data[i].iUsuarioEstado==0){
						html = '<tr>' +
						'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
						'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
						'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
						'<td><span>INACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
					  '</tr>';	        					
					$('#tblListadoUsuarios tbody').append(html);
					}
					if(data[i].iUsuarioEstado==1){
						html = '<tr>' +
						'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
						'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
						'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
						'<td><span>ACTIVO</span></td>' +
						'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuario('+data[i].iUsuarioId+','+idSucursal+')" title="Editar"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" onclick="fnInhabilitarUsuario('+data[i].iUsuarioId+')" title="Inhabilitar Usuario"><i class="fa fa-ban" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
					  '</tr>';	        					
					$('#tblListadoUsuarios tbody').append(html);
					}
	 			}
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un usuario llamado '+login.toUpperCase(),
                });
 				$('#nuevoUsuario').modal('hide');
 			}
 		}
	});	
});
</script>
</body>
</html>