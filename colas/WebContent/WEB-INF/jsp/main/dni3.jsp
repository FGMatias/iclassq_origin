<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ICLASSQ</title>
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">    
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
</head>
<body>

	
	<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div style="text-align: center">
				<img src="librerias/poderjudicial/img/logo_poder_judicial.png"/>
			</div>				
		</div>
	</div>       
        <hr/>
		<div class="row">
            <div class="dni-descripcion-pj col-sm-12">
                <span style="text-align: center">BIENVENIDOS A <span id="nombreSucursal"></span></span>
            </div>
        </div><br><br><br>
		<div class="row">
			<div class="dni-boton-pj col-md-6">
				<a href="#" class="justificarMenu-pj myButton1-pj" style="text-decoration:none; color:#D6D6D6">Atención con DNI</a>
            </div><br>
            <div class="dni-boton col-md-6" >
                <a id="teclado" href="tecladopj.app" class="justificarMenu-pj myButton1-pj" style="text-decoration:none; color:#D6D6D6; " >Atención sin documento de identidad (fisico)</a>
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
<script src="librerias/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>


<script>


$(document).ready(function() {

	

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
		url: 'listarempresas.app',
		success: function (response) {
			var data = response.data;
			console.log("data len: "+data.length);
			console.log("data url: "+data[i].urlLogo);
			html ='<img src="'+data[0].urlLogo+'" height="125px">'
	        $('#imagen').append(html);
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