<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte de Broker</title>
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
  <link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap-multiselect.css"/>
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
<!--               <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer" id="volverSucursal">Sucursal</a></li> -->
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer" id="volverConsulta">Inicio</a></li>
              <li class="breadcrumb-item active">Reporte de Broker</li>
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
            			<h3 class="card-title">Reporte de Broker</h3>
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
									<button type="button" class="btn btn-info" id="btnDownloadAudio">Descargar Audios</button>
                                    <input class="form-control" type="hidden" id="txtApellido_sino" style="text-transform:uppercase;" placeholder="id txtApellido_sino"/>
                                    <input class="form-control" type="hidden" id=txtconsultapresentacion_tipo style="text-transform:uppercase;" placeholder="id txtconsultapresentacion_tipo"/>
									
                                    <br>
                                
                                </div>
                            </div>
                        </div>                
                        <div class="row">
                        	<div class="col-sm-3">  
                                 <div class="form-group">
                                    <label>FECHA INICIO ATENCION</label>
									<input class="form-control" type="date" id="fechaInicioAtencion">
                                </div>
                            </div>
                        	<div class="col-sm-3">  
                                 <div class="form-group">
                                    <label>FECHA FIN ATENCION</label>
									<input class="form-control" type="date" id="fechaFinAtencion">
                                </div>
                            </div>
                            <div class="col-sm-3">  
                                 <div class="form-group">
                                    <label>DNI</label>
									<input class="form-control" type="text" id="txtDni" style="text-transform:uppercase;" placeholder="TU RESPUESTA" required/>
                                </div>
                            </div>
                        </div>
            		</div>
           		</div>
           		<div class="card">
            		<div id="reporteBroker"  class="card-body">
	            		<!--cambio VBR 20191120-->
            			<div class="table-responsive">
	            			<table id="tblListadoBroker" class="table table-bordered table-striped">
				                <thead>
					                <tr>
					                    <th>ID Ticket</th>
					                    <th>Sucursal</th>
					                    <th>Estado Ticket</th>
					                    <th>Atención</th>
							            <th>Ticket</th>
							            <th>Hora Inicio Atención</th>
							            <th>Hora Fin Atención</th>
							            <th>Hora Inicio Reactivación</th>
							            <th>Hora Fin Reactivación</th>
							            <th>Tiempo de Atención</th>
							            <th>Tiempo de Espera</th>
							            <th>Fecha Atención</th>
							            <th>Cliente</th>
							            <th>Número Documento</th>
							            <th>Teléfono</th>
							            <th>Correo</th>
							            <th>Ejecutivo</th>
							            <th>Motivo</th>
							            <th>Ventas</th>
							            <th>Modificaciones</th>
							            <th>Fraccionamiento</th>
							            <th>Poliza</th>
							            <th>Certificado</th>
							            <th>Proforma</th>
							            <th>Cupon</th>
							            <th>Cantidad de Cupones</th>
							            <th>Número de Trámite</th>
							            <th>Tipo Trámite</th>
							            <th>Anulación</th>
							            <th>Número Trámite Anulación</th>
							            <th>Fecha</th>
							            <th>Código Cliente</th>
							            <th>Comentario</th>
							            <th>Priorizado</th>
							            <th>Audio</th>
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
<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<!-- <script src="librerias/jquery/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="librerias/bootstrap-3.3.7/dist/css/bootstrap.min.css">  -->
<!-- <script src="librerias/jquery-confirm/demo/libs/bundled.js"></script> -->
<!-- <script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script> -->
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- <script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.min.js"></script> -->
<script type="text/javascript" src="librerias/bootstrap-3.3.7/js/multi-select.js"></script>
<!-- <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<script src="librerias/Highcharts/code/highcharts.js"></script>
<script src="librerias/Highcharts/code/modules/exporting.js"></script>
<script src="librerias/Highcharts/code/modules/export-data.js"></script>
<script src="librerias/js/jquery.table2excel.js"></script>
<jsp:include page="components/players/audioPlayer.jsp" />
<script>
var host = "";
function Construyecabecera(presentacion){
	var	html='';
	$('#tblListadoBroker thead').empty();	
		html += '<th>ID Ticket</th>';
		html += '<th>Sucursal</th>';
		html += '<th>Estado Ticket</th>';
		html += '<th>Atención</th>';
		html += '<th>Ticket</th>';
		html += '<th>Hora Inicio Atención</th>';
		html += '<th>Hora Fin Atención</th>';
		html += '<th>Hora Inicio Reactivación</th>';
		html += '<th>Hora Fin Reactivación</th>';
		html += '<th>Tiempo de Atención</th>';
		html += '<th>Tiempo de Espera</th>';
		html += '<th>Fecha Atención</th>';
		html += '<th>Cliente</th>';
		html += '<th>Número Documento</th>';
		html += '<th>Teléfono</th>';
		html += '<th>Correo</th>';
		html += '<th>Ejecutivo</th>';
		html += '<th>Motivo</th>';
		html += '<th>Ventas</th>';
		html += '<th>Modificaciones</th>';
		html += '<th>Fraccionamiento</th>';
		html += '<th>Poliza</th>';
		html += '<th>Certificado</th>';
		html += '<th>Proforma</th>';
		html += '<th>Cupon</th>';
		html += '<th>Cantidad de Cupones</th>';
		html += '<th>Número de Trámite</th>';
		html += '<th>Tipo Trámite</th>';
		html += '<th>Anulación</th>';
		html += '<th>Número Trámite Anulación</th>';
		html += '<th>Fecha</th>';
		html += '<th>Código Cliente</th>';
		html += '<th>Comentario</th>';
		html += '<th>Priorizado</th>';
		html += '<th class="noExl">Audio</th>';
		$('#tblListadoBroker thead').html('<tr>' + html + '</tr>');
}

function Construyehtml(data) {
	if ($.fn.DataTable.isDataTable('#tblListadoBroker')) {
		$('#tblListadoBroker').DataTable().clear().destroy();
	}
	
    $('#tblListadoBroker tbody').empty();
    
    var html = '';
    
    for (var i = 0; i < data.length; i++) {
    	var audio;
    	
    	if (data[i].idAtencionBroker == null) {
			audio = '<td><span>No registró atención</span></td>'
		}else if (data[i].audio.trim() === '') {
    		audio = '<td><span>No se pudo grabar audio</span></td>'
    	} else {
    		audio = '<td>' +
	            '<button type="button" id="play-btn-' + i + '" class="btn play-btn btn-primary">Reproducir</button>' +
	        '</td>';
    	}
    	
        html = '<tr>' +
            '<td><span>' + data[i].idTicket+ '</span></td>' +
            '<td><span>' + data[i].sucursal+ '</span></td>' +
            '<td><span>' + data[i].estadoTicket+ '</span></td>' +
            '<td><span>' + data[i].idAtencionBroker+ '</span></td>' +
            '<td><span>' + data[i].ticket + '</span></td>' +
            '<td><span>' + data[i].horaInicioAtencion + '</span></td>' +
            '<td><span>' + data[i].horaFinAtencion + '</span></td>' +
            '<td><span>' + data[i].horaInicioReactivacion + '</span></td>' +
            '<td><span>' + data[i].horaFinReactivacion + '</span></td>' +
            '<td><span>' + data[i].tiempoAtencion + '</span></td>' +
            '<td><span>' + data[i].tiempoEspera + '</span></td>' +
            '<td><span>' + data[i].fechaAtencion + '</span></td>' +
            '<td><span>' + data[i].cliente + '</span></td>' +
            '<td><span>' + data[i].numeroDocumento + '</span></td>' +
            '<td><span>' + data[i].telefono + '</span></td>' +
            '<td><span>' + data[i].correo + '</span></td>' +
            '<td><span>' + data[i].ejecutivo + '</span></td>' +
            '<td><span>' + data[i].motivo + '</span></td>' +
            '<td><span>' + data[i].ventas + '</span></td>' +
            '<td><span>' + data[i].modificaciones + '</span></td>' +
            '<td><span>' + data[i].fraccionamiento + '</span></td>' +
            '<td><span>' + data[i].poliza + '</span></td>' +
            '<td><span>' + data[i].certificado + '</span></td>' +
            '<td><span>' + data[i].proforma + '</span></td>' +
            '<td><span>' + data[i].cupon + '</span></td>' +
            '<td><span>' + data[i].cantidadCupon + '</span></td>' +
            '<td><span>' + data[i].numeroTramite + '</span></td>' +
            '<td><span>' + data[i].tipoTramite + '</span></td>' +
            '<td><span>' + data[i].tipoTramiteAnulacion + '</span></td>' +
            '<td><span>' + data[i].numeroTramiteAnulacion + '</span></td>' +
            '<td><span>' + data[i].fechaAnulacion + '</span></td>' +
            '<td><span>' + data[i].codCliente + '</span></td>' +
            '<td><span>' + data[i].detalle + '</span></td>' +
            '<td><span>' + data[i].priorizado + '</span></td>' +
            audio +
        '</tr>';
        
        $('#tblListadoBroker tbody').append(html);

        var playBtn = document.getElementById('play-btn-' + i);
		if (playBtn) {
			playBtn.addEventListener('click', function() {
				var idx = this.id.replace('play-btn-','');
				var audioSrc = "https://" + host + "/" + data[idx].audio;
				openAudioPlayer(data[idx], audioSrc);
			});
		}
    }
    
    $('#tblListadoBroker').DataTable({
    	pageLength: 10,
		lengthChange: false,
		language: {
			emptyTable: "No hay datos para esta búsqueda",
			paginate: {
				previous: "&lt;",
				next: "&gt;"
			},
			info: data.length
				? "Mostrando _START_ a _END_ de _TOTAL_ registros"
				: "Mostrando 0 registros",
			infoEmpty: "Mostrando 0 registros"
		}
    });
}

$("#btnBuscarXArea").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var fechaInicioAtencion = $("#fechaInicioAtencion").val();
	var fechaFinAtencion = $("#fechaFinAtencion").val();
	var dni = $("#txtDni").val();
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();
	Construyecabecera(presentacion_forma);	
	
	$.ajax({
		type: 'POST', 
		url: 'buscarXAtencionBroker.app',
		traditional: true,
    	data: {
    		sucursales: idSucursal,
    		fechaInicioAtencion: fechaInicioAtencion, 
    		fechaFinAtencion: fechaFinAtencion, 
    		dni: dni || '0',
		},
		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			console.log(data);
			Construyehtml(data);
		}
	});	
});

$("#btnDownloadAudio").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var fechaInicioAtencion = $("#fechaInicioAtencion").val();
	var fechaFinAtencion = $("#fechaFinAtencion").val();
	var dni = $("#txtDni").val();

	$.ajax({
		type: 'POST', 
		url: 'downloadAudiosBroker.app',
		traditional: true,
    	data: { 
    		sucursales: idSucursal,
    		fechaInicioAtencion: fechaInicioAtencion, 
    		fechaFinAtencion: fechaFinAtencion, 
    		dni: dni || '0',
    	},
    	xhrFields: { responseType: "blob" },
		success: function (blob) {
 			var fileName = "audios_" + new Date().toISOString().slice(0, 19).replace(/[:T]/g,"-") + ".zip";
 			var url = window.URL.createObjectURL(blob);
 			var a = document.createElement("a");
			a.href = url;
			a.download = fileName;
			document.body.appendChild(a);
			a.click();
			a.remove();
			window.URL.revokeObjectURL(url);
		}
	});	
});

$("#btnExportArea").click(function() {
	var table = $('#tblListadoBroker').DataTable();
    var currentLength = table.page.len();

    table.page.len(-1).draw();

    setTimeout(function() {
        $('#tblListadoBroker').table2excel({
        	exclude: ".noExl",
    		name: "ReporteAtencionesBroker",
    		filename: "ReporteAtencionesBroker.xls",
    		preserveColors: false
        });

        table.page.len(currentLength).draw();
    }, 0);
});

$("#btnImprimirReporte1").click(function() {
	console.log("imprimiendo...");
	var printContents = document.getElementById('tblListadoBroker');
    w = window.open();
    w.document.write(printContents.outerHTML);
    w.document.close();
    w.focus(); 
	w.print();
	w.close();				
});

$(document).ready(function() {
	var idSucursal = '${usuario.iSucursal}';
	var nombre = '${usuario.vUsuarioNombres}';
	$('#nombreUsuario').html(nombre);

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
		url: 'getPublicIP.app',
		success: function (response) {
			host = response.data;
		}
	});
	
});


</script>
</body>
</html>