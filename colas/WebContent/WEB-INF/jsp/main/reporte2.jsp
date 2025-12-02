<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte por Algoritmo</title>
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
              <li class="breadcrumb-item active">Reporte por Algoritmo</li>
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
            			<h3 class="card-title">Reporte por Algoritmo</h3>
            		</div>
            		<div class="card-body">
              			<div class="row">
                            <div class="col-sm-6">
                                <!-- select -->
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btnBuscarXAlgoritmo">Buscar</button>&nbsp;
                                    <button type="button" class="btn btn-danger">Cancelar</button>&nbsp;
                                    <button type="button" class="btn btn-success" id="btnExportAlgoritmo">Exportar</button>&nbsp;
                                    <button type="button" class="btn btn-warning" id="btnImprimirReporte2">Imprimir</button>
                                    <input class="form-control" type="hidden" id="txtApellido_sino" style="text-transform:uppercase;" placeholder="id txtApellido_sino"/>
                                    <input class="form-control" type="hidden" id=txtconsultapresentacion_tipo style="text-transform:uppercase;" placeholder="id txtconsultapresentacion_tipo"/>
                                    <br>
                                
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">  
                                <div class="form-group">
                                    <label>Area:</label>
                                    <select class="form-control" id="cboArea">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Tipo Algoritmo:</label>
                                    <select class="form-control" id="cboAlgoritmo">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">  
                                <div class="form-group">
                                    <label>Fecha Inicio</label>
                                    <input class="form-control" type="date" id="fechaInicio"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Fecha Fin</label>
                                    <input class="form-control" type="date" id="fechaFin"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
<!--                         	<div class="col-sm-6"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label>Grupo:</label> -->
<!--                                     <select class="form-control" id="cboGrupo"> -->
<!--                                         <option value="0">--TODOS--</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-sm-3">   -->
<!--                                 <div class="form-group"> -->
<!--                                     <div class="form-check"><br> -->
<!--                                         <div class="custom-control custom-checkbox"> -->
<!--                                             <input id="verSubGrupo" class="custom-control-input" type="checkbox"  value="option1"> -->
<!--                                             <label for="customCheckbox1" class="custom-control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Muestra SubGrupo</label> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
            		</div>
            		</div>
            		<div class="card">
            		<div class="card-body">
            		<table id="tblListadoTicketXAlgoritmo" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Area</th>
		                  <th>Grupo</th>
		                  <th>Algoritmo</th>
		                  <th>F.Atencion</th>
		                  <th>Atendidos</th>
		                  <th>Derivados</th>
		                  <th>No Atendidos</th>
		                  <th>Anulados</th>
		                  <th>Tiempo Prom<br>Espera (Min)</th>
		                  <th>Tiempo Prom<br>Atencion(Min)</th>
		                </tr>
		                </thead>
		                <tbody>		
		                </tbody>
		             </table>
					 <div id="graficaListadoXAlgoritmo" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>

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

<script src="librerias/Highcharts/code/highcharts.js"></script>
<script src="librerias/Highcharts/code/modules/exporting.js"></script>
<script src="librerias/Highcharts/code/modules/export-data.js"></script>
<script src="librerias/js/jquery.table2excel.js"></script>

<script>
function Construyecabecera(presentacion){
	var	html='';
	$('#tblListadoTicketXAlgoritmo thead').empty();	
	html = ' <tr> '; 
	html =html + '<th>Area</th>';
	html =html + '<th>Grupo</th>';
	html =html + '<th>Algoritmo</th>';
	html =html + '<th>F.Atencion</th>';
	html =html + '<th>Atendidos</th>';
	html =html + '<th>Derivados</th>';
	html =html + '<th>No Atendidos</th>';
	html =html + '<th>Anulados</th>';
	html =html + '<th>Tiempo Prom<br>Espera (Min)</th>';
	html =html + '<th>Tiempo Prom<br>Atencion(Min)</th>';
	html=html+'</tr>';
	$('#tblListadoTicketXAlgoritmo thead').append(html);
}
function Construyehtml(data, iApellido, presentacion){
	var	html='';
	console.log('presentacion'+presentacion);
	$('#tblListadoTicketXAlgoritmo tbody').empty();					
	for(var i=0; i<data.length; i++){				
			html = '<tr>';

			html = html + '<td><span>'+data[i].area+'</span></td>';
			html = html + '<td><span>'+data[i].nombreGrupo+'</span></td>';
			html = html + '<td><span>'+data[i].nombreAlgoritmo+'</span></td>';
			html = html + '<td><span>'+data[i].fechaAtencion+'</span></td>';
			html = html + '<td><span>'+data[i].atendidosCantidad+'</span></td>';									
			html = html + '<td><span>'+data[i].derivadosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].noatendidosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].anuladosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].tpromedioEspera+'</span></td>';
			html = html + '<td><span>'+data[i].tpromedioAtencion+'</span></td>';
			html=html+'</tr>';
		$('#tblListadoTicketXAlgoritmo tbody').append(html);
		}
		$('#tblListadoTicketXAlgoritmo').DataTable();
}

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;
});

$("#volverConsulta").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	window.location.href = 'mostrarestadoticketconsultor.app';
});

$("#btnBuscarXAlgoritmo").click(function() {
	var idSucursal = '${usuario.iSucursal}';	
	var idArea = $("#cboArea").val();
	var idAlgoritmo = $("#cboAlgoritmo").val();
	var fechaInicio = $("#fechaInicio").val();

	var fechaFin = $("#fechaFin").val();
	var tipoGrafico = $("#cboGrafico").val();
	var TextooApellido_sino=$('#txtApellido_sino').val();
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();
	console.log("presentacion_forma="+presentacion_forma);
	Construyecabecera(presentacion_forma);	 
	
	$.ajax({
		type: 'POST', 
		url: 'listaratencionesxalgoritmo.app',	  
    	data: {idSucursal : idSucursal, idArea : idArea, idAlgoritmo: idAlgoritmo, fechaInicio: fechaInicio, fechaFin: fechaFin},           
		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
			Construyehtml(data, TextooApellido_sino, presentacion_forma);	 			
			}
	});
});

$("#btnExportAlgoritmo").click(function() {
	$('#tblListadoTicketXAlgoritmo').table2excel({
		name: "Reporte2",
		filename: "ReportePorAlgoritmo"
	});
});

$("#btnImprimirReporte2").click(function() {
//		$("#pnlTicket").printElement();
	console.log("imprimiendo...");
	var printContents = document.getElementById('tblListadoTicketXAlgoritmo');
    w = window.open();
    w.document.write(printContents.outerHTML);
    w.document.close(); // necessary for IE >= 10
    w.focus(); // necessary for IE >= 10
	w.print();
	w.close();				
// 	$('#reporteXArea').prop('hidden', true);
});


$(document).ready(function() {	
	//listado de usuarios
	var idSucursal = '${usuario.iSucursal}';
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
	
	//listar areas

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
                        .appendTo("#cboArea");
            });	
		}
	});

// 	listar grupos
	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxsede.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			$.each(data, function (index, item) {
                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre)
                        .appendTo("#cboGrupo");
            });	
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
                        .appendTo("#cboAlgoritmo");
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
});
</script>
</body>
</html>