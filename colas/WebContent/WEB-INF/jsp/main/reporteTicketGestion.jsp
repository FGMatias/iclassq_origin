<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestión de Tickets en Tiempo Real</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">  
  <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
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
  <link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap-multiselect.css"/>
  <style>
	.btn-group.multiselect .btn.multiselect {
	  background-color: #fff !important;
	  color: #212529 !important;
	  border: 1px solid #ced4da !important;
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
        <jsp:include page="menu/menu.jsp"/>
      </nav>      
    </div>    
  </aside>  
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer" id="volverConsulta">Inicio</a></li>
              <li class="breadcrumb-item active">Gestión de Tickets en Tiempo Real</li>
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
            			<h3 class="card-title">Gestión de Tickets en Tiempo Real</h3>
            		</div>
           		</div>
           		<div class="card">
            		<div class="card-body">
            			<div class="table-responsive">
	            			<table id="tblListTicketManagement" class="table table-bordered table-striped">
				                <thead>
					                <tr>
					                    <th>Zona</th>
					                    <th>Oficina</th>
							            <th>Ejecutivo</th>
							            <th>Ventanilla</th>
							            <th>Número Documento</th>
							            <th>Cliente</th>
							            <th>Grupo</th>
							            <th>SubGrupo</th>
							            <th>Hora de Emisión</th>
							            <th>Hora de Inicio de Atención</th>
							            <th>Hora de Fin de Atención</th>
							            <th>Tiempo de Atención</th>
							            <th>Tiempo de Espera</th>
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
      </div>
    </section>
  </div>
  
  <div class="modal" id="modalGenerarAnulacion">
	<div class="modal-dialog">
		<div class="modal-content">		
			<!-- Modal Header -->
			<div class="modal-header modal-header-primary">
				<h4 class="modal-title">Registrar Anulación</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>		
			<!-- Modal body -->
			<div class="modal-body">
				<fieldset class="scheduler-border">						
					<form class="needs-validation" novalidate>
						<div class="row">
							<input type="hidden" id="idTicket"/>
							<div class="col-12 form-group">
								<div class="row center-block">	
									<div class="col-xs-12 col-sm-12">
										<label>MOTIVO ANULACIÓN</label>
										<select class="form-control" id="cboMotivoAnulacion" required>
											<option value="0">--Seleccione--</option>
											<option value="92">CANCELADO</option>
											<option value="93">AUSENTE</option>
										</select>
									</div>	
								</div>	
							</div>				
						</div>
						<div class="modal-footer">
							<button type="button" id="btnGenerarAnulacion" class="btn btn-primary">Anular</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
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
<script src="librerias/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script type="text/javascript" src="librerias/bootstrap-3.3.7/js/multi-select.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<script src="librerias/Highcharts/code/highcharts.js"></script>
<script src="librerias/Highcharts/code/modules/exporting.js"></script>
<script src="librerias/Highcharts/code/modules/export-data.js"></script>
<script src="librerias/js/jquery.table2excel.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>
<script>
var ticketTable, pollingId;
var grupos = [];

function clearFormAnulacion() {
	$("#cboMotivoAnulacion").val("0");
}

$("#btnGenerarAnulacion").click(function() {    	
	var idTicket = $('#idTicket').val();	
	var idUsuario = '${usuario.iUsuarioId}';
	var idSucursal = '${usuario.iSucursal}';
	var tipoAnulacion =11;
	var descripcion = 'Se retiro sin Motivo';
	var motivo = $('#cboMotivoAnulacion').val();	
	
	if (motivo === '0') {
		$.alert('Seleccione un motivo de anulación.');
		return;
	}
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'anularatencion.app',
 		data: {
 			idTicket: idTicket, 
			idUsuario: idUsuario,  
			idSucursal: idSucursal,
			tipoAnulacion: tipoAnulacion, 
			descripcion: descripcion,
			motivo: motivo
     	},
 		success: function (response) { 
 			$('#modalGenerarAnulacion').modal('hide');
 			$.alert({
				title: 'Éxito!',
				content: "Ticket anulado correctamente"
			});
 		}	
	});    					  
});

$("#modalGenerarAnulacion").on("hidden.bs.modal", function() {
	clearFormAnulacion();
});

function cancelTicket(data, type, row) {
	if ([0, 40, 41].includes(row.idEstado)) {
		return '<td>' +
				'<button type="button" class="btn btn-danger" onclick="fnCancelTicket(' + row.idTicket + ')" title="Anular Ticket">' +
					'<i class="fa fa-ban" aria-hidden="true"></i>' +
				'</button>' +
			'</td>';
	}
	return '<td></td>';
} 

function fnCancelTicket(idTicket) {
	$("#modalGenerarAnulacion").modal('show');
	clearFormAnulacion();
	$("#idTicket").val(idTicket);
}

function refreshTicketsTable() {
	var zona = '${usuario.zona}';
	var idSucursal = '${usuario.iSucursal}'; 
	
	$.ajax({
		type: 'POST',
		url: 'getAllTicketsManagement.app',
		traditional: true,
		data: { 
			sucursales: idSucursal,
			zona: zona, 
			grupos: grupos
		},
		success: function (response) {
			var data = response.data;
			console.log(data);
			ticketTable.clear();
			ticketTable.rows.add(data);
			ticketTable.draw(false);
		},
		error: function() {
			$.alert('Error al cargar la lista de tickets');
		}
	});
}

function ticketRow(ticket) {
	return '<tr>' +
		'<td><span>' + ticket.zona + '</span></td>' +		
		'<td><span>' + ticket.sucursal + '</span></td>' +
		'<td><span>' + ticket.ejecutivo + '</span></td>' +
		'<td><span>' + ticket.ventanilla + '</span></td>' +
		'<td><span>' + ticket.numeroDocumento + '</span></td>' +
		'<td><span>' + ticket.cliente + '</span></td>' +
		'<td><span>' + ticket.grupo + '</span></td>' +
		'<td><span>' + ticket.subgrupo+ '</span></td>' +
		'<td><span>' + ticket.horaEmision+ '</span></td>' +
		'<td><span>' + ticket.horaInicioAtencion + '</span></td>' +
		'<td><span>' + ticket.horaFinAtencion + '</span></td>' +
		'<td><span>' + ticket.tiempoAtencion + '</span></td>' +
		'<td><span>' + ticket.tiempoEspera + '</span></td>' +
		'<td><span>' + ticket.estado + '</span></td>' +
		cancelTicket(ticket) +
	'</tr>';
}
  
$(document).ready(function() {
	var idSucursal = '${usuario.iSucursal}';
	var nombre = '${usuario.vUsuarioNombres}';
	var idRol = parseInt('${usuario.idRolSelectedLogin}',10);	
	var zona = '${usuario.zona}';
	$('#nombreUsuario').html(nombre);
	
	ticketTable = $('#tblListTicketManagement').DataTable({
		paging: true,
		ordering: true,
		searching:true,
		pageLength: 10,
		columns: [
			{ data: 'zona' },
			{ data: 'sucursal' },
			{ data: 'ejecutivo' },
			{ data: 'ventanilla' },
			{ data: 'numeroDocumento' },
			{ data: 'cliente' },
			{ data: 'grupo' },
			{ data: 'subgrupo' },
			{ data: 'horaEmision' },
			{ data: 'horaInicioAtencion' },
			{ data: 'horaFinAtencion' },
			{ data: 'tiempoAtencion' },
			{ data: 'tiempoEspera' },
			{ data: 'estado' },
			{ data: 'acciones', render: cancelTicket }
		]
	});

	refreshTicketsTable();
	startPolling();
});

function startPolling() {
	if (pollingId) return; 
	pollingId = setInterval(refreshTicketsTable, 1000);
}
</script>
</body>
</html>