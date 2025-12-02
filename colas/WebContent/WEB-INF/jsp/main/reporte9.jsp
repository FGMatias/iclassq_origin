<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Comparativo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="librerias/css/bootstrap.min.css" />
  <link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">  
</head>

<body>
<div class="wrapper">
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
            
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Sucursal</a></li>
              <li class="breadcrumb-item active">Reporte Comparativo Gerencial</li>
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
            			<h3 class="card-title">Reporte Comparativo Gerencial</h3>
            		</div>
            		<div class="card-body">
              			<div class="row">
                            <div class="col-sm-6">
                                <!-- select -->
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btnBuscarComparativo">Buscar</button>&nbsp;
                                    <button type="button" class="btn btn-danger">Cancelar</button>&nbsp;
                                    <button type="button" class="btn btn-success" id="btnExportComparativo">Exportar</button>&nbsp;
                                    <button type="button" class="btn btn-warning" id="btnImprimirReporte9">Imprimir</button>
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
                                    <select class="form-control" id="cboArea1">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Area: </label>
                                    <select class="form-control" id="cboArea2">
                                        <option value="0">--TODOS--</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">  
                                <div class="form-group">
                                    <label>Periodo Inicio</label>
                                    <input class="form-control" type="month" id="fechaInicio"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Periodo Fin</label>
                                    <input class="form-control" type="month"  id="fechaFin"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Tipo de Grafico:</label>
                                    <select class="form-control" id="cboGrafico">
                                        <option value="0">--Elija uno--</option>
                                        <option value="1">Listado</option>
                                        <option value="2">Barras</option>
                                    </select>
                                </div>
                            </div>
                        </div>
            		</div>
            		</div>
            		<div class="card">
            		<div class="card-body">
            		<table id="tblListadoTicketComparativo" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Area</th>
		                  <th>Periodo</th>
		                  <th>Atendidos</th>
		                  <th>Derivados</th>
		                  <th>No Atendidos</th>
		                  <th>T. Prom</th>
		                  <th>Eval.<br>E</th>
		                  <th>Eval.<br>B</th>
		                  <th>Eval.<br>R</th>
		                  <th>Eval.<br>M</th>
		                  <th>Eval.<br>N</th>
		                </tr>
		                </thead>
		                <tbody>		
		                </tbody>
		              </table>
                   	  <div id="graficaListadoComparativo" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
<script src="librerias/admin/plugins/chart.js/Chart.min.js"></script>
<!-- <script src="librerias/admin/plugins/sparklines/sparkline.js"></script> -->
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/plugins/summernote/summernote-bs4.min.js"></script>
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<!-- <script src="librerias/admin/dist/js/pages/dashboard.js"></script> -->
<script src="librerias/admin/dist/js/demo.js"></script>
<!-- <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/Highcharts/code/highcharts.js"></script>
<script src="librerias/Highcharts/code/modules/exporting.js"></script>
<script src="librerias/Highcharts/code/modules/export-data.js"></script>

<script>
function Construyecabecera(presentacion){
	var	html='';
	$('#tblListadoTicketComparativo thead').empty();	
	html = ' <tr> '; 
	html =html + '<th>Area</th>';
	html =html + '<th>Periodo</th>';
	html =html + '<th>Atendidos</th>';
	html =html + '<th>Derivados</th>';
	html =html + '<th>No Atendidos</th>';
	html =html + '<th>Anulados</th>';
	html =html + '<th>Tiempo Prom<br>Espera (Min)</th>';
	html =html + '<th>Tiempo Prom<br>Atencion(Min)</th>';
	if (presentacion==3 ||presentacion==5 ||presentacion==7) { 
		html = html + '<th>Eval. E</th>';
		html = html + '<th>Eval. B</th>';
		html = html + '<th>Eval. R</th>';
		html = html + '<th>Eval. M</th>';
		html = html + '<th>Eval. N</th>';
	}
	html=html+'</tr>';
	$('#tblListadoTicketComparativo thead').append(html);
}
function Construyehtml(data, iApellido, presentacion){
	var	html='';
	console.log('presentacion'+presentacion);
	$('#tblListadoTicketComparativo tbody').empty();					
	for(var i=0; i<data.length; i++){				
			html = '<tr>';
			html = html + '<td><span>'+data[i].area+'</span></td>';
			html = html + '<td><span>'+data[i].periodo+'</span></td>';
			html = html + '<td><span>'+data[i].atendidosCantidad+'</span></td>';									
			html = html + '<td><span>'+data[i].derivadosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].noatendidosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].anuladosCantidad+'</span></td>';
			html = html + '<td><span>'+data[i].tpromedioEspera+'</span></td>';
			html = html + '<td><span>'+data[i].tpromedioAtencion+'</span></td>';
			if (presentacion==3 ||presentacion==5 ||presentacion==7) { 
				html = html + '<td><span>'+data[i].evaluacion1+'</span></td>';
				html = html + '<td><span>'+data[i].evaluacion2+'</span></td>';
				html = html + '<td><span>'+data[i].evaluacion3+'</span></td>';
				html = html + '<td><span>'+data[i].evaluacion4+'</span></td>';
				html = html + '<td><span>'+data[i].evaluacion5+'</span></td>';
			}
			html=html+'</tr>';
		$('#tblListadoTicketComparativo tbody').append(html);
		}
		$('#tblListadoTicketComparativo').DataTable();
}

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarestadoticketconsultor.app';

});

$("#btnBuscarComparativo").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idArea1 = $("#cboArea1").val();
	var idArea2 = $("#cboArea2").val();
	var fechaInicio = $("#fechaInicio").val()+'-01';
	var fechaFin = $("#fechaFin").val()+'-31';
	var tipoGrafico = $("#cboGrafico").val();
	var TextooApellido_sino=$('#txtApellido_sino').val();
	var presentacion_forma=$('#txtconsultapresentacion_tipo').val();
	console.log("presentacion_forma="+presentacion_forma);
	Construyecabecera(presentacion_forma);	
	
	if (tipoGrafico == 1){
		$('#tblListadoTicketComparativo').removeAttr('hidden');
		$('#graficaListadoComparativo').prop('hidden', true);
		$.ajax({
			type: 'POST',
			url: 'listaratencionescomparativo.app',
	    	data: {idSucursal: idSucursal, idArea1 : idArea1, idArea2: idArea2, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
	 			var mensaje = response.message;
	 			var data = response.data;
				Construyehtml(data, TextooApellido_sino, presentacion_forma);	 			
				}
			});

		}
	
	
	if (tipoGrafico == 2){
		$('#graficaListadoComparativo').removeAttr('hidden');
	 	$('#tblListadoTicketComparativo').prop('hidden', true);
		$.ajax({
			type: 'POST',
			url: 'listaratencionescomparativo.app',
			data: {idArea1 : idArea1, idArea2: idArea2, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
				console.log("INGRESO AREA");
	 			var mensaje = response.message;	 			
	 			var data = response.data;	 			
				var	html='';
				var area='';
				var periodo='';
				var aCant;
				var dCant;
				var nCant;
				var gTprom;
				var evE;
				var evB;
				var evR;
				var evN;
				var evM;
				console.log("grafico");
				for(var i=0; i<data.length; i++){
	    			if(i!=0){
	    				area = area +'","'+data[i].area;
	    				periodo = periodo +'","'+data[i].periodo;
	    				aCant =aCant +","+data[i].aCantidad;
	    				dCant =dCant +","+data[i].dCantidad;
	    				nCant =nCant +","+data[i].nCantidad;
	    				gTprom = gTprom +","+data[i].tPromedio;
	    				evE =evE +","+data[i].evaluacionMin;
	    				evB =evB +","+data[i].evaluacionMen;
	    				evR =evR +","+data[i].evaluacionNor;
	    				evM =evM +","+data[i].evaluacionMay;
	    				evN =evN +","+data[i].evaluacionMax;
	    			}
	    			else{
	    				area = '"'+data[i].area;
	    				periodo = '"'+data[i].periodo;
	    				aCant = data[i].aCantidad;
	    				dCant = data[i].dCantidad;
	    				nCant = data[i].nCantidad;
	    				gTprom = data[i].tPromedio;
	    				evE =data[i].evaluacionMin;
	    				evB =data[i].evaluacionMen;
	    				evR =data[i].evaluacionNor;
	    				evM =data[i].evaluacionMay;
	    				evN =data[i].evaluacionMax;
	    			}
	    		}	
	    		area = area+'"';
	    		periodo = periodo+'"';
	    		console.log(area);
	    		var areaG = JSON.parse("[" + area + "]");
	    		var mesG = JSON.parse("[" + periodo + "]");
	    		var aCantG = JSON.parse("[" + aCant + "]");
	    		var dCantG = JSON.parse("[" + dCant + "]");
	    		var nCantG = JSON.parse("[" + nCant + "]");
	    		var gTpromG = JSON.parse("[" + gTprom + "]");
	    		var evEG = JSON.parse("[" + evE + "]");
	    		var evBG = JSON.parse("[" + evB + "]");
	    		var evRG = JSON.parse("[" + evR + "]");
	    		var evMG = JSON.parse("[" + evM + "]");
	    		var evNG = JSON.parse("[" + evN + "]");
	    		console.log("cant: "+aCantG);

	    		var areaXaCantG = JSON.parse("[" + area + "," + aCant + "]");
	    		console.log("areaxcatn: "+areaXaCantG);
	    		Highcharts.chart('graficaListadoComparativo', {
	    		    chart: {
	    		        type: 'line'
	    		    },
	    		    title: {
	    		        text: 'Grafico Reporte Comparativo'
	    		    },	    		    
	    		    xAxis: {
	    		        categories: mesG,
	    		        crosshair: true
	    		    },
	    		    yAxis: {
	    		        min: 0,
	    		        title: {
	    		            text: 'Valores'
	    		        }
	    		    },
	    		    tooltip: {
	    		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	    		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	    		            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
	    		        footerFormat: '</table>',
	    		        shared: true,
	    		        useHTML: true
	    		    },
	    		    plotOptions: {
	    		        column: {
	    		            pointPadding: 0.2,
	    		            borderWidth: 0
	    		        }
	    		    },
	    		    series: [{
	    		        name: 'Atendidos',
	    		        data: aCantG
	    		    }]
	    		});
			}
		});
	}
});

$("#btnExportComparativo").click(function() {
	console.log("exportar: ");
	$('#tblListadoTicketXMesUsuario').table2excel({
		name: "Reporte6",
		filename: "Reporte Mes Por Usuario"
	});
});

$("#btnImprimirReporte6").click(function() {
	console.log("imprimiendo...");
	var printContents = document.getElementById('tblListadoTicketXMesUsuario');
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
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
                    .attr("value", item.id)
                    .text(item.descripcion)
                    .appendTo("#cboArea1");
	        });	
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
                    .appendTo("#cboArea2");
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