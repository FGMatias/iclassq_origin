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
		  <li class="nav-item has-treeview" id="divUsuarios">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Usuarios<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="listarusuarios.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Areas<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="mostrarareas.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Grupos<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="listargrupos.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Ventanillas<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="listarventanillasxsucursal.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Roles<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="mostrarrolequipo.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Publicidad<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="publicidadtexto.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Texto</p>
                </a>
              </li>                            
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="publicidadvideo.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Video</p>
                </a>
              </li>                            
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Reportes<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="reportexarea.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Detalle por<br>Area</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reportexgrupo.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte por Grupo</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reportexusuario.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte por Usuario</p>
                </a>
              </li>
              <li class="nav-item" >
                <a href="reporteasistencias.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte de Asistencias</p>
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
        
<script>

$("#mostrarVentanillas").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	console.log("idsucur: "+idSucursal);

	window.location.href = "listarventanillasxsucursal.app?idSucursal="+idSucursal;
});

$("#mostrarRoles").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	console.log("idsucur: "+idSucursal);

	window.location.href = "mostrarrolequipo.app?idSucursal="+idSucursal;
});

$(document).ready(function(){
	var iEmpresa='${usuario.iEmpresa}';	
	var idSucursal = '${usuario.iSucursal}';

});

</script>
</body>
</html>