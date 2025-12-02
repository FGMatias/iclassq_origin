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
            			<h3 class="card-title">Reporte Mensual por Usuario</h3>
            		</div>
            		<div class="card-body">
              			<div class="row">
                            <div class="col-sm-6">
                                <!-- select -->
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btnBuscarXMesUsuario">Buscar</button>&nbsp;
                                    <button type="button" class="btn btn-danger">Cancelar</button>&nbsp;
                                    <button type="button" class="btn btn-success" id="btnExportMesUsuario">Exportar</button>&nbsp;
                                    <button type="button" class="btn btn-warning" id="btnImprimirReporte6">Imprimir</button>
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
                                    <label>Usuario</label>
                                    <select class="form-control" id="cboUsuario">
                                        <option value="0">--TODOS--</option>
                                        <option value="1">USUARIO 1</option>
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
            		<table id="tblListadoTicketXMesUsuario" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Area</th>
		                  <th>Usuario</th>
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
                   	  <div id="graficaListadoXMesUsuario" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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

$("#btnBuscarXMesUsuario").click(function() {
	var idArea = $("#cboArea").val();
	var idUsuario = $("#cboUsuario").val();
	var fechaInicio = $("#fechaInicio").val()+'-01';
	var fechaFin = $("#fechaFin").val()+'-31';
	var tipoGrafico = $("#cboGrafico").val();

	console.log("fechaini: "+fechaInicio);	


	if (tipoGrafico == 1 && idUsuario!=0){
		$('#tblListadoTicketXMesUsuario').removeAttr('hidden');
		$('#graficaListadoXMesUsuario').prop('hidden', true);
		console.log("idUsuario: "+idUsuario);
		$.ajax({
			type: 'POST',
			url: 'listaratencionesxmesusuario.app',
	    	data: {idArea : idArea, idUsuario: idUsuario, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
	 			var mensaje = response.message;
	 			var data = response.data;		
				var	html='';
				$('#tblListadoTicketXMesUsuario tbody').empty();
				for(var i=0; i<data.length; i++){
	    			html ='<tr>' +
						'<td><span>'+data[i].area+'</span></td>' +
						'<td><span>'+data[i].usuario+'</span></td>' +
						'<td><span>'+data[i].periodo+'</span></td>' +
						'<td><span>'+data[i].aCantidad+'</span></td>' +									
						'<td><span>'+data[i].dCantidad+'</span></td>' +
						'<td><span>'+data[i].nCantidad+'</span></td>' +
						'<td><span>'+data[i].tPromedio+'</span></td>' +
						'<td><span>'+data[i].evaluacionMin+'</span></td>' +
						'<td><span>'+data[i].evaluacionMen+'</span></td>' +
						'<td><span>'+data[i].evaluacionNor+'</span></td>' +
						'<td><span>'+data[i].evaluacionMay+'</span></td>' +
						'<td><span>'+data[i].evaluacionMax+'</span></td>' +
					'</tr>';
	    			$('#tblListadoTicketXMesUsuario tbody').append(html);
	    		}
			}
		});
	}
	
	if (tipoGrafico == 1 && idUsuario==0){
		$('#tblListadoTicketXMesUsuario').removeAttr('hidden');
		$('#graficaListadoXMesUsuario').prop('hidden', true);
		console.log("idUsuario: "+idUsuario);
		$.ajax({
			type: 'POST',
			url: 'listaratencionestotalxmesusuario.app',
	    	data: {idArea : idArea, idUsuario: idUsuario, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
				var mensaje = response.message;
	 			var data = response.data;
				var	html='';
				$('#tblListadoTicketXMesUsuario tbody').empty();
				for(var i=0; i<data.length; i++){
	    			html ='<tr>' +
						'<td><span>'+data[i].area+'</span></td>' +
						'<td><span>'+data[i].usuario+'</span></td>' +
						'<td><span>'+data[i].periodo+'</span></td>' +
						'<td><span>'+data[i].aCantidad+'</span></td>' +									
						'<td><span>'+data[i].dCantidad+'</span></td>' +
						'<td><span>'+data[i].nCantidad+'</span></td>' +
						'<td><span>'+data[i].tPromedio+'</span></td>' +
						'<td><span>'+data[i].evaluacionMin+'</span></td>' +
						'<td><span>'+data[i].evaluacionMen+'</span></td>' +
						'<td><span>'+data[i].evaluacionNor+'</span></td>' +
						'<td><span>'+data[i].evaluacionMay+'</span></td>' +
						'<td><span>'+data[i].evaluacionMax+'</span></td>' +
					'</tr>';
	    			$('#tblListadoTicketXMesUsuario tbody').append(html);
	    		}
			}
		});
	}

	if (tipoGrafico == 2 && idUsuario!=0){
		$('#graficaListadoXMesUsuario').removeAttr('hidden');
	 	$('#tblListadoTicketXMesUsuario').prop('hidden', true);
		console.log("value: "+tipoGrafico);
		$.ajax({
			type: 'POST',
			url: 'listaratencionesxmesusuario.app',
			data: {idArea : idArea, idUsuario: idUsuario, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
				console.log("INGRESO USUARIO");
	 			var mensaje = response.message;	 			
	 			var data = response.data;	 			
				var	html='';
				var usuario='';
				var area='';
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
	    				usuario = usuario +'","'+data[i].usuario;
	    				area = area +'","'+data[i].area;
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
	    				usuario ='"'+data[i].usuario;
	    				area = '"'+data[i].area;
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
	    		usuario = usuario+'"';
	    		area = area+'"';
	    		//wjpm
	    		console.log('test willian->>>>');
	    		console.log(area);
	    		console.log(usuario);
	    		var usrG = JSON.parse("[" + usuario + "]");
	    		var areaG = JSON.parse("[" + area + "]");
	    		var aCantG = JSON.parse("[" + aCant + "]");
	    		var dCantG = JSON.parse("[" + dCant + "]");
	    		var nCantG = JSON.parse("[" + nCant + "]");
	    		var gTpromG = JSON.parse("[" + gTprom + "]");
	    		var evEG = JSON.parse("[" + evE + "]");
	    		var evBG = JSON.parse("[" + evB + "]");
	    		var evRG = JSON.parse("[" + evR + "]");
	    		var evMG = JSON.parse("[" + evM + "]");
	    		var evNG = JSON.parse("[" + evN + "]");
	    		Highcharts.chart('graficaListadoXMesUsuario', {
	    		    chart: {
	    		        type: 'column'
	    		    },
	    		    title: {
	    		        text: 'Grafico Reporte Mes por Usuario'
	    		    },	    		    
	    		    xAxis: {
	    		        categories: usrG,
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

	    		    }, {
	    		        name: 'Derivados',
	    		        data: dCantG

	    		    }, {
	    		        name: 'No atendidos',
	    		        data: nCantG

	    		    }, {
	    		        name: 'T.Promedio',
	    		        data: gTpromG
	    		    }, {
	    		        name: 'Ev. E',
	    		        data: evEG
	    		    }, {
	    		        name: 'Ev. B',
	    		        data: evBG
	    		    }, {
	    		        name: 'Ev. R',
	    		        data: evRG
	    		    }, {
	    		        name: 'Ev. M',
	    		        data: evMG
	    		    }, {
	    		        name: 'Ev. N',
	    		        data: evNG
	    		    }]
	    		});
			}
		});
	}

	if (tipoGrafico == 2 && idUsuario==0){
		$('#graficaListadoXMesUsuario').removeAttr('hidden');
	 	$('#tblListadoTicketXMesUsuario').prop('hidden', true);
		console.log("value: "+tipoGrafico);
		$.ajax({
			type: 'POST',
			url: 'listaratencionestotalxmesusuario.app',
			data: {idArea : idArea, idUsuario: idUsuario, fechaInicio: fechaInicio, fechaFin: fechaFin},           
			success: function (response) {
				console.log("INGRESO USUARIO");
	 			var mensaje = response.message;
	 			var data = response.data;		
				var	html='';
				var usuario='';
				var area='';
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
	    				usuario = usuario +'","'+data[i].usuario;
	    				area = area +'","'+data[i].area;
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
	    				usuario ='"'+data[i].usuario;
	    				area = '"'+data[i].area;
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
	    		usuario = usuario+'"';
	    		area = area+'"';
	    		console.log('test willian->>>>');
	    		console.log(area);
	    		console.log(usuario);
	    		var usrG = JSON.parse("[" + usuario + "]");
	    		var areaG = JSON.parse("[" + area + "]");
	    		var aCantG = JSON.parse("[" + aCant + "]");
	    		var dCantG = JSON.parse("[" + dCant + "]");
	    		var nCantG = JSON.parse("[" + nCant + "]");
	    		var gTpromG = JSON.parse("[" + gTprom + "]");
	    		var evEG = JSON.parse("[" + evE + "]");
	    		var evBG = JSON.parse("[" + evB + "]");
	    		var evRG = JSON.parse("[" + evR + "]");
	    		var evMG = JSON.parse("[" + evM + "]");
	    		var evNG = JSON.parse("[" + evN + "]");
	    		Highcharts.chart('graficaListadoXMesUsuario', {
	    		    chart: {
	    		        type: 'column'
	    		    },
	    		    title: {
	    		        text: 'Grafico Reporte Mes por Usuario'
	    		    },	    		    
	    		    xAxis: {
	    		        categories: usrG,
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

	    		    }, {
	    		        name: 'Derivados',
	    		        data: dCantG

	    		    }, {
	    		        name: 'No atendidos',
	    		        data: nCantG

	    		    }, {
	    		        name: 'T.Promedio',
	    		        data: gTpromG
	    		    }, {
	    		        name: 'Ev. E',
	    		        data: evEG
	    		    }, {
	    		        name: 'Ev. B',
	    		        data: evBG
	    		    }, {
	    		        name: 'Ev. R',
	    		        data: evRG
	    		    }, {
	    		        name: 'Ev. M',
	    		        data: evMG
	    		    }, {
	    		        name: 'Ev. N',
	    		        data: evNG
	    		    }]
	    		});
			}
		});
	}
});

$("#btnExportMesUsuario").click(function() {
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
	console.log("idSucur: "+idSucursal);
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
	                    .appendTo("#cboArea");
	        });	
		}
	});

});
</script>
</body>
</html>