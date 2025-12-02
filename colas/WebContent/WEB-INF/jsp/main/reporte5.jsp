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
<!--   <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" /> -->
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
      <img src="librerias/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">SEDE:ICA</span>
    </a>    
    <div class="sidebar">      
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="librerias/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Willian Pillaca</a>
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
              <li class="breadcrumb-item"><a href="#">Home</a></li>
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
            			<h3 class="card-title">Reporte 1</h3>
            		</div>
            		<div class="card-body">
              			<div class="row">
                            <div class="col-sm-6">
                                <!-- select -->
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btnBuscarXArea">Buscar</button>&nbsp;
                                    <button type="button" class="btn btn-danger">Cancelar</button>&nbsp;
                                    <button type="button" class="btn btn-success" onclick="fnExportarCajas()" id="btnExportCajas">Exportar</button>
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
                                        <option value="1">AREA 1</option>
                                        <option value="2">AREA 2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Ventanilla</label>
                                    <select class="form-control" id="cboVentanilla">
                                        <option value="0">--TODOS--</option>
                                        <option value="1">AREA 1</option>
                                        <option value="2">AREA 2</option>
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
            		<table id="tblListadoTicketXUsuario" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Area</th>
		                  <th>Ventanilla</th>
		                  <th>Fecha</th>
		                  <th>Atendidos</th>
		                  <th>Derivados</th>
		                  <th>No Atendidos</th>
		                  <th>T. Prom</th>
		                  <th>Eval. E</th>
		                  <th>Eval. B</th>
		                  <th>Eval. R</th>
		                  <th>Eval. M</th>
		                  <th>Eval. N</th>
		                </tr>
		                </thead>
		                <tbody>		
		                </tbody>
		              </table>
<!--             		<div id="graficaListadoXArea" style="min-width: 310px; height: 400px; margin: 0 auto"></div> -->
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
<script src="librerias/js/jquery.table2excel.js"></script>

<script>

$("#btnBuscarXArea").click(function() {
	var idArea = $("#cboArea").val();
	var ventanilla = $("#cboVentanilla").val();
	var fechaInicio = $("#fechaInicio").val();
	var fechaFin = $("#fechaFin").val();
	var tipoGrafico = $("#cboGrafico").val();
	

	if (tipoGrafico == 2){
		console.log("value: "+tipoGrafico);
		$.ajax({
			type: 'POST',
			url: 'listaratencionesxarea.app',
	    	data: {idArea : idArea, ventanilla: ventanilla, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
	 			var mensaje = response.message;	 			
	 			var data = response.data;	 			
				var	html='';					
				for(var i=0; i<data.length; i++){
	    			html ='<tr>' +
					'<td>'+(i+1)+'</td>' +
						'<td>'+data[i].caja+'</td>' +
						'<td>'+data[i].tCantidad+'</td>' +
						'<td>'+data[i].tMaximo+'</td>' +
						'<td>'+data[i].tPromedio+'</td>' +
					'</tr>';
	    			$('#tblReporteXcajas tbody').append(html);
	    			if(i!=0){
	    				cajas =cajas +'","'+data[i].caja;
	    				gTmax =gTmax +","+data[i].tMaximo;
	    				gTprom = gTprom +","+data[i].tPromedio;
	    				gCantidad = gCantidad+","+data[i].tCantidad;
	    			}
	    			else{
	    				cajas ='"'+ data[i].caja;
	    				gTmax =data[i].tMaximo;
	    				gTprom =data[i].tPromedio;
	    				gCantidad = data[i].tCantidad;
	    			}
	    		}	
	    		cajas = cajas+'"';
	    		//wjpm
	    		console.log('test willian->>>>');
	    		console.log(gTprom);
	    		var cajasADM = JSON.parse("[" + cajas + "]");
	    		var tMaxADM = JSON.parse("[" + gTmax + "]");
	    		var tPromADM = JSON.parse("[" + gTprom + "]");
	    		var cantidadADM = JSON.parse("[" + gCantidad + "]");
	    		Highcharts.chart('graficaListadoXArea', {
	    		    chart: {
	    		        type: 'column'
	    		    },
	    		    title: {
	    		        text: 'Grafico Reporte por cajas'
	    		    },	    		    
	    		    xAxis: {
	    		        categories: cajasADM,
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
	    		        name: 'Cantidad',
	    		        data: cantidadADM

	    		    }, {
	    		        name: 'T. Maximo',
	    		        data: tMaxADM

	    		    }, {
	    		        name: 'T.Promedio',
	    		        data: tPromADM
	    		    }]
	    		});
	    		console.log('test willian->>>>');
			}
		});
	}

});

</script>
</body>
</html>