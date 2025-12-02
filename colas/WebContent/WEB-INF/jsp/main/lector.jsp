<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ICLASSQ</title>
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
</head>
<body>

	<img  id="img_background">
	<div class="container">
        <div class="row">
        	<div id="espacio" class="col-md-6">
            </div>
            <div class="col-md-2 offset-md-4">
<!--             	<span style="font-size:30px;margin-top:800px"><a href="logout.app"><i class="fa fa-power-off"></i></a></span> -->
            </div>
        </div>
        <br><br>
		<div class="row">
            <div class="dni-descripcion col-sm-12">
                
            </div>
        </div><br><br><br><br>
		<div class="row">
			<div class="dni-descripcion col-sm-12">
				<span style="font-size:40px">POR FAVOR, INGRESE SU DNI<br>EN LA RANURA</span>
            </div>
		</div>
		<div class="col-12 form-group">
			<input style="opacity: 0;" class="form-control" type="text" id="txtDni" />
		</div>
		<div id="espacio"></div><br><br>
		<div class="row">
			<div class="teclado-boton col-xs-12 col-md-3">
				<a href="dni.app" class="justificarMenu myButton2">Atrás</a>
            </div>
        </div>
    </div>
</body>

<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/plugins/summernote/summernote-bs4.min.js"></script>
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>


<script>


$(document).ready(function() {

	$('#txtDni').focus();

	$("#txtDni").on('change',function(){
	    if($("#txtDni").val().length==8){
	        var dni = $('#txtDni').val();
	    	console.log("dni2: "+dni);
	    	var tipoDoc = 1;
	    	window.location.href = 'menugrupos.app?dni='+dni+'&tipoDoc='+tipoDoc; 
	    }
	});
	    
	$.ajax({
		type: 'POST',
		url: 'listarempresas.app',
		success: function (response) {
		var data = response.data;
		$('#img_background').attr("src",data[0].urlLogo);
		}
	});

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

});


$("#teclado").on('click', function() {
	var rutaImg = '${rutaImg}';
	console.log('ruta img ->>'+rutaImg);
	window.location.href = 'teclado.app';
});

</script>

</html>