<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Tickets</title>
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
        <jsp:include page="menu/menuReportes.jsp"/>
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
              <li class="breadcrumb-item"><a href="mostrarestadoticketconsultor.app">Inicio</a></li>
              <li class="breadcrumb-item active">Consulta</li>
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
            			<h3 class="card-title">Gestionar Ticket  del Dia</h3>
            		</div>
            		<div class="card-body">            
              			<div class="row">
                            <div class="col-sm-6">
                                <!-- select -->
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btnBuscarXArea">Buscar</button>&nbsp;
                                    <button type="button" class="btn btn-danger">Cancelar</button>&nbsp;
                                    <button type="button" class="btn btn-success" id="btnExportArea">Exportar</button>&nbsp;
									<button type="button" class="btn btn-warning" id="btnImprimirReporte1">Imprimir</button>
                                    <br>
                                
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">  
                                <div class="form-group">
                                    <label>Area:</label>
                                    <select class="form-control" id="cboArea">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Ventanilla:</label>
                                    <select class="form-control" id="cboVentanilla">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
							<div class="col-sm-4">  
                                <div class="form-group">
                                    <label>Grupo:</label>
                                    <select class="form-control" id="cboGrupo">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">  
                                <div class="form-group">
                                    <label>Operador:</label>
                                    <select class="form-control" id="cboOperador">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <select class="form-control" id="cboEstado">
                                        <option value="60">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
							<div class="col-sm-4">  
                                <div class="form-group">
                                    <label>Apellido o Ticket:</label>
                                    <input type="text" class="form-control" id="cboApellido"><br>
                                    <input class="form-control" type="hidden" id="txtApellido_sino" style="text-transform:uppercase;" placeholder="id txtApellido_sino"/>
                                    <input class="form-control" type="hidden" id=txtconsultapresentacion_tipo style="text-transform:uppercase;" placeholder="id txtconsultapresentacion_tipo"/>

                                </div>
                            </div>
                        </div>
          			</div>
          			</div>
          			
            		<div class="card-body">
            			<table id="tblListadoTicket" class="table table-bordered table-hover">
                			<thead>
		                <tr>
		                  <th>Area</th>
		                  <th>Operador</th>
		                  <th>Ventanilla</th>
		                  <th>DNI</th>
		                  <th>Ticket</th>
		                  <th>Grupo</th>
		                  <th>SubGrupo</th>
		                  <th>Hora Ticket</th>
		                  <th>H. Inicio Atencion</th>
		                  <th>H. Fin Atencion</th>
		                  <th>Tiempo Espera</th>
		                  <th>Tiempo de Atencion</th> 
		                  <th>Estado</th> 
       					  <th>Anular</th>
       					  <th>CambiarEstado</th>
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
  
  <div class="modal" id="modalAnularTicket">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Anular</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdTicket" style="text-transform:uppercase;" placeholder="id ticket"/>
											
											<div class="col-xs-12 col-sm-3">
												<label>Tipo Anulacion</label>
												<select class="form-control" id="txtTipoAnulacion" required>
													<option value="">--Seleccione--</option>
													
													<option value="10">Ticket Duplicado</option>
													<option value="12">Demasiado tiempo de espera</option>
													<option value="13">Personal desatento</option>
													<option value="16">Ticket Errado</option>
													<option value="17">Ticket Atendido</option>

												</select>
											</div>
											<div class="col-xs-12 col-sm-9">
												<label>Descripcion</label>
												<textarea class="form-control rounded-0" id="txtDescripcionAnulacion" rows="3"></textarea>
											</div>
											
										</div>
									</div>
								</div>
<!-- 								07-09-2019 -->
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
<!-- 						    			--	 -->
								<button type="button" id="btnGrabarAnulacion" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
  
  <div class="modal" id="modalCambiarEstadoTicket">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Cambiar Estado del Ticket</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdTicket" style="text-transform:uppercase;" placeholder="id ticket"/>
											<div class="col-xs-12 col-sm-12">
												<label>Acepta proceder a Reiniciar el Ticket ? confirme</label>
											</div>
										</div>
									</div>
								</div>
<!-- 								07-09-2019 -->
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
<!-- 						    			--	 -->
								<button type="button" id="btnGrabarCambioEstado" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
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


$(document).ready(function() {
	var nombre = '${usuario.vUsuarioNombres}';
	var idArea = '${usuario.iArea}';
	console.log("nombre: "+nombre); 
	$('#nombreUsuario').html(nombre);
	var idSucursal = '${usuario.iSucursal}';
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
		url: 'listarareaxsurcursalxPerfil.app',
		data: {idSucursal: idSucursal, idArea: idArea},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
	                    .attr("value", item.id)
	                    .text(item.descripcion)
	                    .appendTo("#cboArea");
	        });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'consultaApellidoSino.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			console.log("ConsultaApellido");

			var data = response.data;
			console.log(data);
			$('#txtApellido_sino').val(data);	
		}
	});
	$.ajax({ 
		type: 'POST', 
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'120'},		 	    		
		success: function (response) {
			var data = response.data;
			console.log('consultaParametroTipo:');
			console.log(data);
			$('#txtconsultapresentacion_tipo').val(data);	
		}
	});

	
	$.ajax({ 
		type: 'POST', 
		url: 'getventanillasxidsucursal.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
	                    .attr("value", item.id)
                        .text(item.nombre+"-"+item.nombreArea)
	                    .appendTo("#cboVentanilla");
	        });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxsede.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
	                    .attr("value", item.id)
	                    .text(item.nombre)
	                    .appendTo("#cboGrupo");
	        });	
		}
	});
	
	setInterval(mostrarTicket,1000);
	
	function mostrarTicket(){
		var nombre = '${usuario.vUsuarioNombres}';
		console.log("nombre: "+nombre); 
		$('#nombreUsuario').html(nombre);
	
		var idSucursal = '${usuario.iSucursal}';
		var idUsuario = '${usuario.iUsuarioId}'; 
		var idArea = $("#cboArea").val();
		var idVentanilla = $("#cboVentanilla").val();
		var idGrupo = $("#cboGrupo").val();
		var idOperador = $("#cboOperador").val();
		var idEstado = $("#cboEstado").val();	
		var cApellido ='%'+ $("#cboApellido").val()+'%';
		var TextooApellido_sino=$('#txtApellido_sino').val();	
		var presentacion_forma=$('#txtconsultapresentacion_tipo').val();	
		Construyecabecera(presentacion_forma);
		console.log("sino "+TextooApellido_sino+"xx");
		console.log("cApellido:"+cApellido);
		if (cApellido=="%%"){
			cApellido='0';
		}
		console.log("cApellido 2:"+cApellido);
		console.log("idusuario: "+idUsuario);

		$.ajax({
			type: 'POST',
			url: 'GestionTicket_1.app',
			data: {idUsuario: idUsuario, idSucursal: idSucursal, idArea: idArea,idVentanilla: idVentanilla, idGrupo: idGrupo,idOperador: idOperador, idEstado: idEstado,cApellido: cApellido },
			success: function (response) {
				var data = response.data;

				Construyehtml(data, TextooApellido_sino, presentacion_forma);
			}
		});
	}
});

function Construyecabecera(presentacion){
	var	html='';

	$('#tblListadoTicket thead').empty();

	html = ' <tr> '; 
	html =html + '<th>Area</th>';
	html =html + '<th>Operador</th>';
	html =html + '<th>Ventanilla</th>';
	if (presentacion>=1 && presentacion<=5 ) {
		html =html + '<th>Ticket</th>';
	}
	if (presentacion>=6 && presentacion<=7 ) {
		html = html + '<th>Apellido</th>';
	}
	if (presentacion>=4 && presentacion<=7)  {
		html = html + '<th>DNI</th>';
	}
	html =html + '<th>Grupo</th>';
	if (presentacion!=1)  {
		html = html + '<th>SubGrupo</th>';
	}
	html =html + '<th>Hora Ticket</th>';
	html =html + '<th>H. Inicio Atencion</th>';
	html =html + '<th>H. Fin Atencion</th>';
	html =html + '<th>Tiempo Espera</th>';
	html =html + '<th>Tiempo de Atencion</th>'; 
	html =html + '<th>Estado</th> ';
	html =html + '<th>Anular</th>';
	html =html + '<th>CambiarEstado</th>';
	html=html+'</tr>';
	console.log(html);


	$('#tblListadoTicket thead').append(html);
	
};
function Construyehtml(data,  iApellido, presentacion){
	var html='';
	$('#tblListadoTicket tbody').empty();
	for(var i=0; i<data.length; i++){
		he = new Date(data[i].horaEmision);
		horaEmision=he.toLocaleTimeString();
		html = '<tr>' +
		'<td><span>'+data[i].area+'</span></td>' +
		'<td><span>'+data[i].nombreUsuario+'</span></td>' +
		'<td><span>'+data[i].nombreVentanilla+'</span></td>';					
		if (presentacion>=1 && presentacion<=5 ) {
			html=html+'<td><span>'+data[i].codigo+'</span></td>';
		}
		if (presentacion>=6 && presentacion<=7 ) {
			html=html+'<td><span>'+data[i].descripcion+'</span></td>'
		}
	
		if (presentacion>=4 && presentacion<=7)  {
			html= html + '<td><span>'+data[i].numeroIdentificacion+'</span></td>';
		}
		html=html+'<td><span>'+data[i].nombreGrupo+'</span></td>';
		if (presentacion!=1)  {
			html = html + '<td><span>'+data[i].nombreSubGrupo+'</span></td>';
		}
		 
		html = html + '<td><span>'+data[i].horaTicket+'</span></td>' +
		'<td><span>'+data[i].horaInicioAtencion+'</span></td>' +
		'<td><span>'+data[i].horaFinAtencion+'</span></td>' +
		'<td><span>'+data[i].tiempoEspera+'</span></td>' +
		'<td><span>'+data[i].tiempoAtencion+'</span></td>' +					
		'<td><span>'+data[i].estadoDescripcion+'</span></td>'+
		'<td><button type="button" class="btn btn-danger" onclick="fnAnularTicket('+data[i].id+')" title="Anular Ticket"><i class="fa fa-ban"></i></button></td>' +
		'<td><button type="button" class="btn btn-success" onclick="fnCambiarEstado('+data[i].id+')"  title="Cambiar Estado"><i class="fa fa-ban"></i></button></td>' +	
		'</tr>';	        					
	$('#tblListadoTicket tbody').append(html);
	}	
	$('#tblListadoTicket').DataTable();
	
}

function fnCambiarEstado(id){
	$("#modalCambiarEstadoTicket").modal("show");
	$("#txtIdTicket").val(id)
	var idSucursal = '${usuario.iSucursal}'; 
	console.log('id->>'+id);
	var idTicket =id;
	
}
function fnAnularTicket(id){
	
	$("#modalAnularTicket").modal("show");
	$("#txtIdTicket").val(id)
	var idSucursal = '${usuario.iSucursal}'; 
	console.log('id->>'+id);
	var idTicket =id;
}

$("#btnGrabarAnulacion").click(function() {

	var idUsuario = '${usuario.iUsuarioId}';
	var idTicket = $("#txtIdTicket").val();
	var tipoAnulacion = $("#txtTipoAnulacion").val();
	var descripcion = $("#txtDescripcionAnulacion").val();
	var idSucursal = '${usuario.iSucursal}';
	var TextooApellido_sino=$('#txtApellido_sino').val();
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();	

	$.ajax({ 
		type: 'POST', 
		url: 'anularticket.app',
		data: {idSucursal: idSucursal, idUsuario: idUsuario, idTicket: idTicket, tipoAnulacion: tipoAnulacion, descripcion: descripcion},		
		success: function (response) {
			$('#modalAnularTicket').modal('hide');
			var data = response.data;
			Construyehtml(data, TextooApellido_sino, presentacion_forma);
			}
	});

});

$("#btnGrabarCambioEstado").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	var idTicket = $("#txtIdTicket").val();
	var tipoApertura = $("#txtTipoApertura").val();
	var descripcionApertura = $("#txtDescripcionApertura").val();
	var idSucursal = '${usuario.iSucursal}';
	var TextooApellido_sino=$('#txtApellido_sino').val();	
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();	
	$.ajax({ 
		type: 'POST', 
		url: 'activarticketpasado.app',
		data: {idSucursal: idSucursal, idUsuario: idUsuario, idTicket: idTicket},		
		success: function (response) {
			$('#modalCambiarEstadoTicket').modal('hide');
			var data = response.data;
			Construyehtml(data, TextooApellido_sino, presentacion_forma);
		}
	});

});

</script>
</body>
</html>