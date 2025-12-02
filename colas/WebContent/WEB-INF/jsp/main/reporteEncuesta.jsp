<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte de Encuesta</title>
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
            
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
<!--               <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer" id="volverSucursal">Sucursal</a></li> -->
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer" id="volverConsulta">Inicio</a></li>
              <li class="breadcrumb-item active">Reporte de Encuesta</li>
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
            			<h3 class="card-title">Reporte de Encuesta</h3>
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
                                    <input class="form-control" type="hidden" id="txtApellido_sino" style="text-transform:uppercase;" placeholder="id txtApellido_sino"/>
                                    <input class="form-control" type="hidden" id=txtconsultapresentacion_tipo style="text-transform:uppercase;" placeholder="id txtconsultapresentacion_tipo"/>
									
                                    <br>
                                
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Usuarios:</label>
                                    <select class="form-control" id="cboUsuarios">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Ventanillas:</label>
                                    <select class="form-control" id="cboVentanilla">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">  
                                <div class="form-group">
                                    <label>Fecha Inicio</label>
                                    <input class="form-control" type="date" id="fechaInicio"/>
                                </div>
                            </div>
                            <div class="col-sm-3">  
                                <div class="form-group">
                                    <label>Fecha Fin</label>
                                    <input class="form-control" type="date" id="fechaFin"/>
                                </div>
                            </div>
                        </div>
            		</div>
           		</div>
           		<div class="card">
            		<div id="reporteEncuesta"  class="card-body">
	            		<div class="table-responsive">
	            			<table id="tblListadoEncuesta" class="table table-bordered table-striped">
			                <thead>
				                <tr>
				                  <th>ID Ticket</th>
				                  <th>Ticket</th>
				                  <th>Usuario</th>
				                  <th>Ventanilla</th>
				                  <th>Encuesta</th>
				                  <th>Pregunta</th>
				                  <th>Respuesta</th>
				                  <th>Hora</th>
				                  <th>Fecha</th>
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
<!-- <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
<script src="librerias/Highcharts/code/highcharts.js"></script>
<script src="librerias/Highcharts/code/modules/exporting.js"></script>
<script src="librerias/Highcharts/code/modules/export-data.js"></script>
<script src="librerias/js/jquery.table2excel.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>
function Construyecabecera(presentacion){
	var	html='';
	$('#tblListadoEncuesta thead').empty();	
		html = ' <tr> '; 
		html = html + '<th>ID Ticket</th>';
		html = html + '<th>Ticket</th>';
		html = html + '<th>Usuario</th>';
		html = html + '<th>Ventanilla</th>';
		html = html + '<th>Encuesta</th>';
		html = html + '<th>Pregunta</th>';
		html = html + '<th>Respuesta</th>';
		html = html + '<th>Hora</th>';
		html = html + '<th>Fecha</th>';
		html=html+'</tr>';
		console.log(html);
		$('#tblListadoEncuesta thead').append(html);
}
function Construyehtml(data){
	var	html='';
	$('#tblListadoEncuesta tbody').empty();					
	for(var i=0; i<data.length; i++){		
		html = '<tr>' +
		'<td><span>'+data[i].idTicket+'</span></td>' +
		'<td><span>'+data[i].codigo+'</span></td>' +
		'<td><span>'+data[i].usuario+'</span></td>' +
		'<td><span>'+data[i].ventanilla+'</span></td>' +
		'<td><span>'+data[i].encuesta+'</span></td>' +
		'<td><span>'+data[i].pregunta+'</span></td>' +
		'<td><span>'+data[i].respuesta+'</span></td>' +
		'<td><span>'+data[i].hora+'</span></td>' +
		'<td><span>'+data[i].fecha+'</span></td>' +
		'</tr>';
		$('#tblListadoEncuesta tbody').append(html);	
	}
	$('#tblListadoEncuesta').DataTable();
}

$('#tblListadoEncuesta').DataTable( {
    "paging":   false,
    "ordering": false,
    "info":     false
} );

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarestadoticketconsultor.app';
});
$("#volverConsulta").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	window.location.href = 'mostrarestadoticketconsultor.app';
});


$("#btnBuscarXArea").click(function() {
	var idUsuario = $("#cboUsuarios").val();
	var idVentanilla = $("#cboVentanilla").val();
	var fechaInicio = $("#fechaInicio").val();
	var fechaFin = $("#fechaFin").val();
	var tipoGrafico = 1;
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();
	console.log("presentacion_forma="+presentacion_forma);
	Construyecabecera(presentacion_forma);	 			
	if (tipoGrafico == 1 ){
		$.ajax({
			type: 'POST', 
			url: 'listarReporteEncuesta.app',
	    	data: {
	    		idUsuario: idUsuario, 
	    		idVentanilla: idVentanilla,
	    		fechaInicio: fechaInicio, 
	    		fechaFin: fechaFin
    		},
			success: function (response) {
	 			var mensaje = response.message;
	 			var data = response.data;
				Construyehtml(data);
			}
		});
	}

});

$("#btnExportArea").click(function() {
	console.log("exportar: ");
	$('#tblListadoEncuesta').table2excel({
		name: "ReporteEncuesta",
		filename: "ReporteEncuesta"
	});
});

$("#btnImprimirReporte1").click(function() {
//		$("#pnlTicket").printElement();
	console.log("imprimiendo...");
	var printContents = document.getElementById('tblListadoEncuesta');
    w = window.open();
    w.document.write(printContents.outerHTML);
    w.document.close();
    w.focus(); 
	w.print();
	w.close();				
// 	$('#reporteXArea').prop('hidden', true);
});

$(document).ready(function() {
	var idSucursal = '${usuario.iSucursal}';
	console.log("este es el id sucursal: " +idSucursal);
	var nombre = '${usuario.vUsuarioNombres}';
	console.log("nombre: "+nombre); 
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
		url: 'listarUsuariosVentanilla.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
	                    .attr("value", item.iUsuarioId)
                        .text(item.vUsuarioNombres+" "+item.vUsuarioApPaterno+" "+item.vUsuarioApMaterno)
	                    .appendTo("#cboUsuarios");
	        });	
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
		url: 'consultaParametroTipo.app',
		data: {idSucursal: idSucursal, parametro:'120'},		 	    		
		success: function (response) {
			var data = response.data;
			console.log('consultaParametroTipo:');
			console.log(data);
			$('#txtconsultapresentacion_tipo').val(data);	
		}
	});
	
	
});
</script>
</body>
</html>