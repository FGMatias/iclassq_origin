<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
<link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
<style>
	.modal-backdrop{
		position: static;
	}
</style>
</head>
<body>
	<ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
<!--       <li class="nav-item d-none d-sm-inline-block"> -->
<!--         <a href="index3.html" class="nav-link">Home</a> -->
<!--       </li> -->
<!--       <li class="nav-item d-none d-sm-inline-block"> -->
<!--         <a href="#" class="nav-link">Contact</a> -->
<!--       </li> -->
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
<!--       	<a href="logout.app"> -->
<!--           <i class="fas fa-edit"></i> -->
<!--         </a> -->
<!--         &nbsp;&nbsp; -->
<!--         <a id="cambiarClave"> -->
          
<!--         </a> -->
<!--         &nbsp;&nbsp; -->
        <button type="button" class="btn btn-primary" onclick="fnCambiarClaveForm(${usuario.iUsuarioId})"><i class="fas fa-edit"></i></button>
        <button type="button" class="btn btn-primary" onclick="fnCerrarSession()"><i class="fa fa-power-off"></i></button>
      </li>
    </ul>
    

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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

<script>	
    function fnCambiarClaveForm(idUsuario){
		$('#modalCambiarClave').modal('show');

	}

	function fnCerrarSession(){
		window.location.href = 'logout.app';
	}

// 	window.onbeforeunload = function() {
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", "logout.app", true);
// 		xhr.send();
// 	};
	
	function fnCambiarClave(){
		var pass = $('#txtNuevaClave').val();
		var idUsuario = '${usuario.iUsuarioId}';
		
		$.ajax({ 
			type: 'POST', 
			url: 'cambiarclaveusuario.app',
			data: {idUsuario: idUsuario, pass: pass},		
			success: function (response) {				
				var mensaje = response.message;	 			
     			if(response.success==true){
//      				$.alert({
//                         title: 'Exito',
//                         content: mensaje,
//                     });
     				$("#modalCambiarClave").val("");
     				$('#modalCambiarClave').modal('hide');
     				window.location.href = 'logout.app';     				
             	}	
			}
		});		
	}
</script>


</body>
</html>