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
              <p>Sucursales<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="sucursalsupervisor.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>      
		  <li class="nav-item has-treeview" id="divUsuarios">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Usuarios<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="usuariopermiso.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Permisos</p>
                </a>
              </li>                            
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="estadogestionusuariosup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Estado Usuarios</p>
                </a>
              </li>                            
            </ul>
          </li>
		  <li class="nav-item has-treeview" id="tiempoObjetivoGrupo" style="display: none;">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Tiempo Objetivo<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="tiempoobjetivogrupo.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
                </a>
              </li>                            
            </ul>
          </li>
		  <li class="nav-item has-treeview" id="tiempoObjetivoCaja" style="display: none;">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Tiempo Objetivo<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="tiempoobjetivocaja.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listar</p>
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
                <a href="reportexareasup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Detalle por<br>Area</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reportexgruposup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte por Grupo</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reportexusuariosup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte por Usuario</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reporteventassup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte de Ventas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reporteasistenciassup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte de Asistencias</p>
                </a>
              </li>
              <li class="nav-item" >
                <a href="reportegestionticketssup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gestión de Tickets<br>en tiempo real</p>
                </a>
              </li>
              <li id="reporteAtencion" class="nav-item" style="display: none;">
                <a href="reporteatencionsup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte de Atenciones</p>
                </a>
              </li>
              <li id="reporteKallpa" class="nav-item" style="display: none;">
                <a href="reportekallpasup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Kallpa</p>
                </a>
              </li>
              <li id="reporteBroker" class="nav-item" style="display: none;">
                <a href="reportebrokersup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Broker</p>
                </a>
              </li>
              <li id="reporteCaja" class="nav-item" style="display: none;">
                <a href="reportecajasup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Caja</p>
                </a>
              </li>
              <li id="reporteSiniestro" class="nav-item" style="display: none;">
                <a href="reportesiniestrosup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte Siniestro</p>
                </a>
              </li>
              <li id="reporteCanalDirecto" class="nav-item" style="display: none;">
                <a href="reportecanaldirectosup.app" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reporte de Canal <br>Directo</p>
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
$(document).ready(function() {
	var zona = parseInt('${usuario.zona}', 10);
	var idRol = parseInt('${usuario.idRolSelectedLogin}',10);	

	const $atencion = $('#reporteAtencion');
	const $kallpa = $('#reporteKallpa');
	const $broker = $('#reporteBroker');
	const $caja = $('#reporteCaja');
	const $siniestro = $('#reporteSiniestro');
	const $canalDirecto = $('#reporteCanalDirecto');
	const $tiempoObjetivoGrupo = $('#tiempoObjetivoGrupo');
	const $tiempoObjetivoCaja = $('#tiempoObjetivoCaja');
	
	switch(idRol) {
		case 18: // SUPERVISOR PLATAFORMA
			$tiempoObjetivoGrupo.show();
			$atencion.show();
			break;
		case 19: // SUPERVISOR CAJA
			$tiempoObjetivoCaja.show();
			$caja.show();
			break;
		case 20: // SUPERVISOR BROKER
			$tiempoObjetivoGrupo.show();
			$broker.show();
			break;
		case 21: // SUPERVISOR KALLPA
			$kallpa.show();
			break;
		case 22: // SUPERVISOR SINIESTRO
			$siniestro.show();
			break;
		case 23: // SUPERVISOR CANAL DIRECTO
			$canalDirecto.show();
			break;
		default:
		      break;
	}
});
</script>
</body>
</html>