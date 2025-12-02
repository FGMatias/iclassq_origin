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

	<img  id="img_background">
	<div class="container">
        <div class="row">
        	<div id="espacio" class="col-md-6">
            </div>
            <div class="col-md-2 offset-md-4">
            <br>
            	<button type="button" class="btn btn-primary" onclick="fnCambiarClaveForm(${usuario.iUsuarioId})"><i class="fas fa-edit"></i></button>
        		<button type="button" class="btn btn-primary" onclick="fnCerrarSession()"><i class="fa fa-power-off"></i></button>
<!--             	<span style="font-size:30px;margin-top:800px"><a href="logout.app"><i class="fa fa-power-off"></i></a></span> -->
            </div>
        </div>
        <br><br><br><br>
		<div class="row">
            <div class="dni-descripcion col-sm-12">
                <span style="text-align: center">BIENVENIDOS A <span id="nombreSucursal"></span></span>
            </div>
        </div><br><br><br>
		<div class="row">
			<div class="dni-boton col-md-6">
				<a href="lector.app" class="justificarMenu myButton1">Atención con DNI</a>
            </div><br>
            <div class="dni-boton col-md-6" >
                <a id="teclado" href="teclado.app" class="justificarMenu myButton1">Atención sin documento de identidad (fisico)</a>
            </div>
        </div><br><br><br>
		<div class="row">
			<div class="dni-aviso col-sm-12">
				<span>"Recuerde que todo tramite se realiza mostrando el documento de identidad vigente"</span>
            </div>
		</div><br>
    </div>
    
    <div class="modal" id="modalCambiarClave" >
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header text-center modal-header-primary">
		        <h4 class="modal-title w-100 font-weight-bold">Cambiar Clave</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body mx-3">
		        <div class="md-form mb-5">          
		          <input type="password" id="txtNuevaClave" class="form-control validate" placeholder="Ingrese Nueva Clave">
		          
		        </div>
		      </div>
		      <div class="modal-footer d-flex justify-content-center">
		        <button class="btn btn-primary" onclick="fnCambiarClave()">Cambiar</button>
		      </div>
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


function fnCambiarClaveForm(idUsuario){
	console.log('aaaaasss->>>');		
	$('#modalCambiarClave').modal('show');

}

function fnCerrarSession(){
	window.location.href = 'logout.app';
}

function fnCambiarClave(){
	console.log('aaaaasss->>>');
	var pass = $('#txtNuevaClave').val();
	var idUsuario = '${usuario.iUsuarioId}';
	
	$.ajax({ 
		type: 'POST', 
		url: 'cambiarclaveusuario.app',
		data: {idUsuario: idUsuario, pass: pass},		
		success: function (response) {				
			var mensaje = response.message;	 			
 			if(response.success==true){
//  				$.alert({
//                     title: 'Exito',
//                     content: mensaje,
//                 });
 				$("#modalCambiarClave").val("");
 				$('#modalCambiarClave').modal('hide');
 				window.location.href = 'logout.app';     				
         	}	
		}
	});		
}

</script>

</html>