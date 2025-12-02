<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
		<li class="nav-item has-treeview">
		  <a href="#" class="nav-link active">
		    <i class="nav-icon fas fa-tachometer-alt"></i>
		    <p>Supervisores<i class="right fas fa-angle-left"></i></p>
		  </a>
		  <ul class="nav nav-treeview">
		    <li class="nav-item">
		      <a href="mostrarsupervisor.app?idEmpresa=${usuario.iEmpresa}" class="nav-link active">
		          <i class="far fa-circle nav-icon"></i>
		          <p>Listar</p>
		        </a>
		      </li>                            
		    </ul>
		  </li>
		<li class="nav-item has-treeview">
		  <a href="#" class="nav-link active">
		    <i class="nav-icon fas fa-tachometer-alt"></i>
		    <p>Formadores<i class="right fas fa-angle-left"></i></p>
		  </a>
		  <ul class="nav nav-treeview">
		    <li class="nav-item">
		      <a href="mostrarformador.app?idEmpresa=${usuario.iEmpresa}" class="nav-link active">
		          <i class="far fa-circle nav-icon"></i>
		          <p>Listar</p>
		        </a>
		      </li>                            
		    </ul>
		  </li>
		<li class="nav-item has-treeview">
		  <a href="#" class="nav-link active">
		    <i class="nav-icon fas fa-tachometer-alt"></i>
		    <p>Tipo de Cambio<i class="right fas fa-angle-left"></i></p>
		  </a>
		  <ul class="nav nav-treeview">
		    <li class="nav-item">
		      <a href="mostrartipocambio.app?idEmpresa=${usuario.iEmpresa}" class="nav-link active">
		          <i class="far fa-circle nav-icon"></i>
		          <p>Listar</p>
		        </a>
		      </li>                            
		    </ul>
		  </li>
		<li class="nav-item has-treeview">
		  <a href="#" class="nav-link active">
		    <i class="nav-icon fas fa-tachometer-alt"></i>
		    <p>Objetivo de Ventas<i class="right fas fa-angle-left"></i></p>
		  </a>
		  <ul class="nav nav-treeview">
		    <li class="nav-item">
		      <a href="mostrarobjetivoventas.app" class="nav-link active">
		          <i class="far fa-circle nav-icon"></i>
		          <p>Listar</p>
		        </a>
		      </li>                            
		    </ul>
		  </li>
		</ul>


<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>

</body>
</html>