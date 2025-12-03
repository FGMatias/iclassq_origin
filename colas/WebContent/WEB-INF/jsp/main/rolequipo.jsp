<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::IClassQ::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="librerias/admin/plugins/fontawesome-free/css/all.min.css">    
  <link rel="stylesheet" href="librerias/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/jqvmap/jqvmap.min.css">  
  <link rel="stylesheet" href="librerias/admin/dist/css/adminlte.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/daterangepicker/daterangepicker.css">  
  <link rel="stylesheet" href="librerias/admin/plugins/summernote/summernote-bs4.css">  
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="librerias/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  
  <link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
  <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <style>
  	.modal-backdrop{
	   background-color: rgba(0,0,0,0.2);
	}
  </style>
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
      <span class="brand-text font-weight-light">SUCURSAL: <span id="nombreSucursal"></span></span>
    </a>    
    <div class="sidebar">      
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
          <a href="#" class="d-block"><span id="nombreUsuario"></span></a>
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
              <li class="breadcrumb-item"><a style="color:#007bff; cursor:pointer"id="volverSucursal">Sucursal</a></li>
              <li class="breadcrumb-item active">Rol</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">        
         <div class="row">
        	<div class="col-6">
          		<div class="card">
            		<div class="card-header">
              			<button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Rol"><i class="fas fa-plus"></i></button>
            		</div>            
            		<div class="card-body">
            			<table id="tblListadoRolEquipo" class="table table-bordered table-hover">
                			<thead>
                				<tr>
                  					<th>Rol</th>
                  					<th>Tipo Equipo</th>
                  					<th>Acciones</th>
                				</tr>
                			</thead>
                			<tbody>                                
                			</tbody>
              			</table>
            		</div>            
          		</div>
        	</div>
        	<div class="col-md-6">
	            <div id="GruposXRol" class="card" style="display:none">
	              <div class="card-header">
	                <h3 class="card-title">Grupos de: <span class="nombreRol"></span></h3>                
	              </div>
	              <!-- /.card-header -->
	              <div id="grvGrupo" class="card-body" style="display:none">
	                <table class="table table-bordered" id="tblListadoGruposXRol">
	                  <thead>
	                    <tr>
	                      <th>Nombre</th>
	                      <th>Proporcion</th>
	                      <th style="width: 150px">Acciones</th>
	                    </tr>
	                  </thead>
	                  <tbody>                   
	                  </tbody>
	                </table>
	              </div>      
	              <div id="grvSubGrupo" class="card-body" style="display:none">
	                <table class="table table-bordered" id="tblListadoSubGruposXRol">
	                  <thead>
	                    <tr>
	                      <th>Grupo</th>
	                      <th>SubGrupo</th>
	                      <th>Proporcion</th>
	                      <th style="width: 150px">Acciones</th>
	                    </tr>
	                  </thead>
	                  <tbody>                   
	                  </tbody>
	                </table>
	              </div>              
	            </div>
	            <div id="UsuariosXRol" class="card" style="display:none">
	              <div class="card-header">
	                <h3 class="card-title">Usuarios de: <span class="nombreRol"></span></h3>                
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	                <table class="table table-bordered" id="tblListadoUsuariosXRol">
	                  <thead>
	                    <tr>
	                      <th>Login</th>
	                      <th>Direccion IP</th>
	                      <th style="width: 180px">Acciones</th>
	                    </tr>
	                  </thead>
	                  <tbody>                   
	                  </tbody>
	                </table>
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

<!-- nuevo rol -->
	<div class="modal" id="nuevoRolEquipo">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Rol</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtId" style="text-transform:uppercase;" placeholder="Nombre Rol"/>
											<div class="col-xs-12 col-sm-4">
												<label>Rol</label>
												<input class="form-control" type="text" id="txtRol" style="text-transform:uppercase;" placeholder="Nombre Rol" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Tipo Equipo</label>
												<select class="form-control" id="txtTipoEquipo" required>
													<option value="">--Seleccione--</option>
													<option value="M">M</option>
													<option value="K">K</option>
													<option value="VS">VS</option>
													<option value="VA">VA</option>
													<option value="C">C</option>
												</select>
											</div>
											<div id="divTipoAlgoritmo" class="col-xs-12 col-sm-4" style="display: none;">
												<label>Tipo de Algoritmo</label>
												<select class="form-control" id="cboAlgoritmo">
													<option value="0">--Seleccione--</option>																																				
												</select>
											</div>
										</div>
									</div>
								</div>
<!-- 								07-09-2019 -->
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
<!-- 						    			--	 -->
								<button type="submit" id="btnGrabarRolEquipo" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- editar rol -->
	<div class="modal" id="editarRolEquipo">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Rol</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdRol" style="text-transform:uppercase;" placeholder="Nombre Rol"/>
											<div class="col-xs-12 col-sm-4">
												<label>Rol</label>
												<input class="form-control" type="text" id="txtRolEdit" style="text-transform:uppercase;" placeholder="Nombre Rol" required/>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Tipo Equipo</label>
												<select class="form-control" id="txtTipoEquipoEdit" required>
													<option value="">--Seleccione--</option>
													<option value="M">M</option>
													<option value="K">K</option>
													<option value="VS">VS</option>
													<option value="VA">VA</option>
													<option value="C">C</option>
												</select>
											</div>
											<div id="algoritmo" class="col-xs-12 col-sm-4">
												<label>Tipo de Algoritmo</label>
												<select class="form-control" id="cboAlgoritmoEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>

								<button type="submit" id="btnEditarRolEquipo" class="btn btn-primary" title="Grabar"><i class="fa fa-edit"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- 	modal nuevo usuario Monitor -->
	<div class="modal" id="modalNuevoUsuarioMonitor">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Usuario Monitor</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<input class="form-control" type="hidden" id="txtIdRolSeleccionado" />
									<div class="col-12 form-group">							
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-3">
												<label>Solicita IP</label>
												<select class="form-control" id="cboSolicitaIpMonitor" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																									
												</select>
											</div>										
											<div class="col-xs-12 col-sm-3">
												<label>Direccion IP</label>
												  <div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpMonitor" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask required>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpMonitor" placeholder="127.0.0.1"/> -->
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Usuarios</label>
												<select class="form-control" id="cboUsuariosMonitor" required>
													<option value="">--Seleccione--</option>
												</select>
											</div>		
											<div class="col-xs-12 col-sm-3">
												<label>Tipo Monitor</label>
												<select class="form-control" id="cboTipoMonitor" required>
													<option value="">--Seleccione--</option>
													<option value="1">6 columnas</option>
													<option value="2">4 columnas</option>
													<option value="3">Texto</option>
													<option value="4">Listado 4C</option>																									
													<option value="5">Monitor de (6 *2) </option>
													<option value="20">Visualizacion</option>	
													<option value="21">Sin timbre(6 * 4)</option>	
													<option value="22">Secundario</option>	
													<option value="23">Solo Ticket</option>	
												</select>
											</div>										
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-3">
												<label>Carga por Area</label>
												<select class="form-control" id="sinoAreaMonitor">
													<option value="">--Seleccione--</option>
													<option value="0">No</option>
													<option value="1">Si</option>																									
												</select>
											</div>		
											<div class="col-xs-12 col-sm-3">
												<label>Usuario Principal</label>
												<select class="form-control" id="cboUsuarioPrincipal">
													<option value="">--Seleccione--</option>																								
												</select>
											</div>									
											<div class="col-xs-12 col-sm-3">
												<label id="labelAreaMonitor" style="display:none">Area</label>
												<select class="form-control" id="cboAreaMonitor" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
										</div>							
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
								<button type="submit" id="btnGrabarUsuarioMonitor" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
	
	<!-- 	modal nuevo usuario kiosko -->
	<div class="modal" id="modalNuevoUsuarioKiosko">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Usuario Kiosko</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<input class="form-control" type="hidden" id="txtIdRolSeleccionado" />
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Usuarios</label>
												<select class="form-control" id="cboUsuariosKiosko" required>
													<option value="">--Seleccione--</option>
												</select>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Solicita IP</label>
												<select class="form-control" id="cboSolicitaIpKiosko" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																									
												</select>
											</div>										
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												<div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpKiosko" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask required>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpKiosko" placeholder="127.0.0.1"/> -->
											</div>									
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Valida Tipo Doc</label>
												<select class="form-control" id="cboValidaTipoDoc" required>
													<option value="">--Seleccione--</option>
													<option value="1">NO</option>
													<option value="2">BD LOCAL</option>
													<option value="3">BD PROPIA</option>
													<option value="4">RENIEC</option>																																						
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Pide Documento</label>
												<select class="form-control" id="cboPideDocumento" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Imprime Ticket</label>
												<select class="form-control" id="cboImprimeTicket" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>		
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Confirma Impresion</label>
												<select class="form-control" id="cboConfirmaImpresion" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>		
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
								<button type="submit" id="btnGrabarUsuarioKiosko" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- 	nuevo usuario ventanilla -->
	<div class="modal" id="modalNuevoUsuarioVentanilla">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Nuevo Usuario Ventanilla</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Usuarios</label>
												<select class="form-control" id="cboUsuarios" required>
													<option value="">--Seleccione--</option>
												</select>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Area</label>
												<select class="form-control" id="cboAreaXSucursal" required>
													<option value="">--Seleccione--</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Ventanilla</label>
												<select class="form-control" id="cboVentanillaXSucursal" required>
													<option value="">--Seleccione--</option>
												</select>
											</div>
																																									
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												<div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpVentanilla" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask required>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpVentanilla" placeholder="127.0.0.1"/> -->
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Registra Atencion</label>
												<select class="form-control" id="cboAsistencia" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Evalua</label>
												<select class="form-control" id="cboEvalua" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>
													<option value="3">OPTATIVO</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Anula</label>
												<select class="form-control" id="cboAnula" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>
												</select>
											</div>			
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">		
											<div id="puertoEvalua" class="col-xs-12 col-sm-4" style="display:none">
												<label id="puerto" style="display:none">Puerto de Evaluacion</label>
												<label id="ip" style="display:none">IP de Evaluacion</label>
												<input class="form-control" type="text" id="txtPuerto" style="text-transform:uppercase;" required/>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
							  			<div id="msgValidate" class="alert alert-danger fade">
							    			<button type="button" class="close" data-dismiss="alert">&times;</button>
							    			<strong>Incorrecto! </strong>Ingrese todos los campos obligatorios.
						    			</div>
						    		</div>
						    	</div>
								<button type="submit" id="btnGrabarUsuarioVentanilla" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>

<!-- 	modal editar usuario Monitor -->
	<div class="modal" id="editarUsuarioMonitor">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Usuario Monitor</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<input class="form-control" type="hidden" id="txtIdRolEdit" />	
								<input class="form-control" type="hidden" id="txtIdUsuarioMonitor" />
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Solicita IP</label>
												<select class="form-control" id="cboSolicitaIpMonitorEdit">
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																									
												</select>
											</div>										
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												  <div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpMonitorEdit" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpMonitor" placeholder="127.0.0.1"/> -->
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Tipo Monitor</label>
												<select class="form-control" id="cboTipoMonitorEdit">
													<option value="">--Seleccione--</option>
													<option value="1">6 columnas</option>
													<option value="2">4 columnas</option>
													<option value="3">Texto</option>
													<option value="4">Listado 4C</option>
													<option value="5">Monitor de (6 *2) </option>	
													<option value="20">Visualizacion </option>	
													<option value="21">Sin timbre(6 * 4) </option>	
													<option value="22">Secundario</option>											
													<option value="23">Solo Ticket</option>											
												</select>
											</div>												
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Usuario Principal</label>
												<select class="form-control" id="cboUsuarioPrincipalEdit">
													<option value="0">--Seleccione--</option>																								
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Carga Por Area</label>
												<select class="form-control" id="sinoAreaMonitorEdit">
													<option value="">--Seleccione--</option>
													<option value="0">No</option>
													<option value="1">Si</option>																									
												</select>
											</div>									
											<div class="col-xs-12 col-sm-4">
												<label id="labelAreaMonitorEdit" style="display:none">Area</label>
												<select class="form-control" id="cboAreaMonitorEdit" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
										</div>
									</div>
								</div>
							</form>
					</fieldset>
		      </div>
		  
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" id="btnEditarUsuarioMonitor" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	
	<!-- 	modal editar usuario kiosko -->
	<div class="modal" id="editarUsuarioKiosko">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Usuario Kiosko</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<input class="form-control" type="hidden" id="txtIdRolEdit" />	
									<input class="form-control" type="hidden" id="txtIdUsuarioKiosko" />
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Solicita IP</label>
												<select class="form-control" id="cboSolicitaIpKioskoEdit">
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																									
												</select>
											</div>										
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												<div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpKioskoEdit" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpKiosko" placeholder="127.0.0.1"/> -->
											</div>	
											<div class="col-xs-12 col-sm-4">
												<label>Valida Tipo Doc</label>
												<select class="form-control" id="cboValidaTipoDocEdit">
													<option value="">--Seleccione--</option>
													<option value="1">NO</option>
													<option value="2">BD LOCAL</option>
													<option value="3">BD PROPIA</option>
													<option value="4">RENIEC</option>																																						
												</select>
											</div>								
										</div>									
									</div>																
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Pide Documento</label>
												<select class="form-control" id="cboPideDocumentoEdit">
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Imprime Ticket</label>
												<select class="form-control" id="cboImprimeTicketEdit">
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>	
											<div class="col-xs-12 col-sm-4">
												<label>Confirma Impresion</label>
												<select class="form-control" id="cboConfirmaImpresionEdit">
													<option value="0">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>																																						
												</select>
											</div>		
										</div>
									</div>
								</div>
							</form>
					</fieldset>
		      </div>
		  
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" id="btnEditarUsuarioKiosko" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- 	editar usuario ventanilla -->
	<div class="modal" id="editarUsuarioVentanilla">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Usuario Ventanilla</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<input class="form-control" type="hidden" id="txtIdRolEdit" />	
									<input class="form-control" type="hidden" id="txtIdUsuarioVentanilla" />															
								</div>								
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">		
											<div class="col-xs-12 col-sm-4">
												<label>Area</label>
												<select class="form-control" id="cboAreaXSucursalEdit">
													<option value="">--Seleccione--</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Ventanilla</label>
												<select class="form-control" id="cboVentanillaXSucursalEdit">
													<option value="">--Seleccione--</option>
												</select>
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Registra Asistencia</label>
												<select class="form-control" id="cboAsistenciaEdit" required>
													<option value="">--Seleccione--</option>
													<option value="1">Si</option>
													<option value="2">NO</option>	
												</select>
											</div>																																							
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Direccion IP</label>
												<div class="input-group">
											        <div class="input-group-prepend">
											          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
											        </div>
											        <input id="txtIpVentanillaEdit" type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
											      </div>
<!-- 												<input class="form-control" type="text" id="txtIpVentanilla" placeholder="127.0.0.1"/> -->
											</div>		
											<div class="col-xs-12 col-sm-4">
												<label>Evalua</label>
												<select class="form-control" id="cboEvaluaEdit" required>
													<option value="">--Seleccione--</option>
													<option value="2">NO</option>
													<option value="1">Si</option>
													<option value="3">Optativo</option>
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Anula</label>
												<select class="form-control" id="cboAnulaEdit" required>
													<option value="">--Seleccione--</option>
													<option value="1">SI</option>
													<option value="2">NO</option>
												</select>
											</div>									
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div id="puertoEvaluaEdit" class="col-xs-12 col-sm-4">
												<label id="puertoEdit">Puerto o IP de Evaluacion</label>
												<input class="form-control" type="text" id="txtPuertoEdit" style="text-transform:uppercase;" required/>
											</div>				
											<div class="col-xs-12 col-sm-4">
												<label>Registra Atención</label>
												<select class="form-control" id="cboAtencionEdit" required>
													<option value="">--Seleccione--</option>
													<option value="1">Si</option>
													<option value="2">NO</option>
												</select>
											</div>								
										</div>
									</div>
								</div>
							</form>
					</fieldset>
		      </div>
		  
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" id="btnEditarUsuarioVentanilla" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
	      </div>
	
	    </div>
	  </div>
	</div>

<!-- 	modal editar usuario Encuestador -->
	<div class="modal" id="editarUsuarioEncuestador">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar Usuario Encuestador</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<input class="form-control" type="hidden" id="txtIdRolEdit" />	
								<input class="form-control" type="hidden" id="txtIdUsuarioEncuestador" />
								<div class="row">
									<div class="col-12 form-group">										
										<div class="row">		
											<div class="col-xs-12 col-sm-6">
												<label>Usuario Ventanilla</label>
												<select class="form-control" id="cboVentanillaEdit">
													<option value="0">--Seleccione--</option>																								
												</select>
											</div>								
										</div>
									</div>
								</div>
							</form>
					</fieldset>
		      </div>
		  
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" id="btnEditarUsuarioEncuestador" class="btn btn-primary" data-dismiss="modal" title="Editar"><i class="fa fa-edit"></i></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
	      </div>
	
	    </div>
	  </div>
	</div>


<!-- agregar grupo -->
	<div class="modal" id="addGrupoXEquipo">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Agregar Grupo</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row" id="tipoGrupo">
											<input class="form-control" type="hidden" id="txtIdRol" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
											<div class="col-xs-12 col-sm-4">
												<label>Grupo</label>
												<select class="form-control" id="cboGrupoXRol" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Proporcion (Algoritmo 4)</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtProporcion" placeholder="1" required/>
											</div>
										</div>
										
									</div>																
								</div>								
								<button type="submit" id="btnAgregarGrupo" class="btn btn-primary" title="Agregar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>
	
<!-- agregar subgrupo -->
	<div class="modal" id="addSubGrupo">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Agregar SubGrupo</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row" id="tipoSubgrupo">
											<input class="form-control" type="hidden" id="txtIdRolSG" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
											<div class="col-xs-12 col-sm-4">
												<label>Grupo</label>
												<select class="form-control" id="cboGrupoXRolLast" required>
													<option value="0">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>SubGrupo</label>
												<select class="form-control" id="cboSubGrupo" required>
													<option value="0">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-4">
												<label>Proporcion (Algoritmo 4)</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtProporcionSG" placeholder="1" required/>
											</div>
										</div>
										
									</div>																
								</div>	
								<button type="submit" id="btnAgregarSubGrupo" class="btn btn-primary" title="Agregar"><i class="fas fa-save"></i></button>
	        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>

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
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

<script src="librerias/admin/plugins/inputmask/jquery.inputmask.bundle.js"></script>

<script>

$(function () {
    $('[data-mask]').inputmask()
})
  
$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	var divTipoAlgoritmo = document.getElementById('divTipoAlgoritmo');
	var divPermiteAtencion = document.getElementById('divPermiteAtencion');
	$("#txtTipoEquipo").change(function(){
		var tipoEquipo = $("#txtTipoEquipo").val();
		if (tipoEquipo == 'V' || tipoEquipo == 'VS' | tipoEquipo == 'VA'){
			divTipoAlgoritmo.style.display = ''; 
			divPermiteAtencion.style.display = ''; 
		}else{
			divTipoAlgoritmo.style.display = 'none'; 
			divPermiteAtencion.style.display = 'none'; 
		}
	});
	$("#txtRol").val("");
	$("#txtTipoEquipo").val("");
	$("#nuevoRolEquipo").modal("show");
	$("#msgValidate").removeClass("show");
});

(function() {
    'use strict';
    window.addEventListener('load', function() {
      var forms = document.getElementsByClassName('needs-validation');
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            $("#msgValidate").addClass("show"); 
          }
          form.classList.add('was-validated');
        }, false);
      });
	}, false);
})();

$(document).ready(function() {

	$("form").submit(function() {
		return false;
    });
    
	var idSucursal = '${usuario.iSucursal}';
	var nombre = '${usuario.vUsuarioNombres}'; 
	$('#nombreUsuario').html(nombre);

	$.ajax({
		type: 'POST',
		url: 'getsucursalbyid.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			$('#nombreSucursal').html(data.nombre);
			
			if (data.encuesta == 1) {
	            if ($("#txtTipoEquipo option[value='E']").length === 0) {
	                $("#txtTipoEquipo").append('<option value="E">E</option>');
	            }
	        }
		}
	});
	
	$.ajax({
		type: 'POST',
		url: 'listarrolequipo.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;
			console.log("data ready");
			console.log(data);
			$('#tblListadoRolEquipo tbody').empty();						
			for(var i=0; i<data.length; i++){				
				if(data[i].tipoEquipo == 'VS'){
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].tipoEquipo+'</span></td>' +
					'<td><button type="button" class="btn btn-info" title="Asignar SubGrupo" onclick="fnAddSubGrupo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver SubGrupos" onclick="fnMostrarSubGrupos('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
				  '</tr>';
				$('#tblListadoRolEquipo tbody').append(html);
				}
				else{
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].tipoEquipo+'</span></td>' +
					'<td><button type="button" class="btn btn-info" title="Asignar Grupo" onclick="fnAddGrupoXEquipo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver Grupos" onclick="fnMostrarGruposXRol('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
				  '</tr>';
				$('#tblListadoRolEquipo tbody').append(html);
				}
    		}	
// 			$('#tblListadoRolEquipo').DataTable();
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxsede.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")  
                        .attr("value", item.id)
                        .text(item.nombre)
                        .appendTo("#cboGrupoXRol");
                $("<option/>")  
                .attr("value", item.id)
                .text(item.nombre)
                .appendTo("#cboGrupoXRolLast");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarUsuariosPrincipal.app',	 
		data: {idSucursal: idSucursal},	
		success: function (response) {
			var data = response.data;
			console.log("usuarios principales");
			console.log(data);
			$.each(data, function (index, item) {
                $("<option/>")  
                    .attr("value", item.iUsuarioId)
                    .text(item.vUsuarioUsername)
                    .appendTo("#cboUsuarioPrincipal");
                $("<option/>")  
	                .attr("value", item.iUsuarioId)
	                .text(item.vUsuarioUsername)
	                .appendTo("#cboUsuarioPrincipalEdit");
            });	
		}
	});


// 	listar area
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
                        .appendTo("#cboAreaXSucursal");
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
                        .appendTo("#cboAreaMonitor");
                $("<option/>")
                .attr("value", item.id)
                .text(item.descripcion)
                .appendTo("#cboAreaMonitorEdit");
			});	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'getventanillasxidsucursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre+"-"+item.nombreArea)
                        .appendTo("#cboVentanillaXSucursal");
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
                        .appendTo("#cboAreaXSucursalEdit");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'getventanillasxidsucursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre+"-"+item.nombreArea)
                        .appendTo("#cboVentanillaXSucursalEdit");
                $("<option/>")
	                .attr("value", item.id)
	                .text(item.nombre+"-"+item.nombreArea)
	                .appendTo("#cboVentanillaEdit");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarNombresUsuarios.app',
		data: {idSucursal: idSucursal},		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
	            $("<option/>")
                    .attr("value", item.iUsuarioId)
                       .text(item.vUsuarioNombres+" "+item.vUsuarioApPaterno+" "+item.vUsuarioApMaterno)
                    .appendTo("#cboUsuariosKiosko");
	            $("<option/>")
	                .attr("value", item.iUsuarioId)
	                   .text(item.vUsuarioNombres+" "+item.vUsuarioApPaterno+" "+item.vUsuarioApMaterno)
	                .appendTo("#cboUsuariosMonitor");
	            $("<option/>")
	                .attr("value", item.iUsuarioId)
	                   .text(item.vUsuarioNombres+" "+item.vUsuarioApPaterno+" "+item.vUsuarioApMaterno)
	                .appendTo("#cboUsuarios");
	        });	
		}
	}); 
	
	$.ajax({ 
		type: 'POST', 
		url: 'listaalgoritmos.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboAlgoritmo");
                $("<option/>")
		                .attr("value", item.id)
		                .text(item.descripcion)
		                .appendTo("#cboAlgoritmoEdit");
            });	
		}
	});

});


$("#btnGrabarRolEquipo").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var rol = $("#txtRol").val();
	var tipoEquipo = $("#txtTipoEquipo").val();
	var algoritmo = $("#cboAlgoritmo").val();
		
	$.ajax({ 
 		type: 'POST', 
 		url: 'saverolequipo.app',
 		data: {
 			idSucursal: idSucursal, 
 			rol: rol, 
 			tipoEquipo: tipoEquipo, 
 			algoritmo: algoritmo
		},
 		success: function (response) {
 			var data = response.data; 	
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: rol.toUpperCase() + ' Registrado correctamente.',
                });
 				$('#nuevoRolEquipo').modal('hide');	
	 			var html='';
	 			$('#tblListadoRolEquipo tbody').empty();
	 				for(var i=0; i<data.length; i++){
	 					if(data[i].tipoEquipo == 'VS'){
	 						html = '<tr>' +
	 						'<td><span>'+data[i].nombre+'</span></td>' +
	 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
	 						'<td><button type="button" class="btn btn-info" title="Asignar SubGrupo" onclick="fnAddSubGrupo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver SubGrupos" onclick="fnMostrarSubGrupos('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
	 					  '</tr>';
	 					$('#tblListadoRolEquipo tbody').append(html);
	 					}
	 					else{
	 						html = '<tr>' +
	 						'<td><span>'+data[i].nombre+'</span></td>' +
	 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
	 						'<td><button type="button" class="btn btn-info" title="Asignar Grupo" onclick="fnAddGrupoXEquipo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver Grupos" onclick="fnMostrarGruposXRol('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
	 					  '</tr>';
	 					$('#tblListadoRolEquipo tbody').append(html);
	 					}
		    		}	
	 			
// 				$('#tblListadoRolEquipo').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un rol llamado '+rol.toUpperCase(),
                });
 				$('#nuevoRolEquipo').modal('hide');
 			}
 		}
	});	
});

$("#btnAgregarGrupo").click(function() {
	var idRol =  $('#txtIdRol').val();
	console.log('idRol->>>'+idRol);
	var idGrupoRol = $("#cboGrupoXRol").val();			
	var proporcion =  $("#txtProporcion").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'agregargrupoxrol.app',
 		data: {idRol: idRol, idGrupoRol: idGrupoRol, proporcion: proporcion}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: data[data.length-1].nombreGrupo.toUpperCase() + ' Agregado correctamente.',
                });
 				$('#addGrupoXEquipo').modal('hide');	
				var html='';
				$('#tblListadoGruposXRol tbody').empty();
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].nombreGrupo+'</span></td>' +
					'<td><span>'+data[i].proporcion+'</span></td>' +		
					'<td><button type="button" class="btn btn-danger" onclick="fnEliminarGrupoXRol(\''+data[i].idRolEquipo+'\','+data[i].idGrupo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoGruposXRol tbody').append(html);
				console.log(html);
	    		}
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un grupo agregado con este nombre.',
                });
 				$('#addGrupoXEquipo').modal('hide');
 			}
 		}
	});		  
});

function fnAddUsuarioXRol(idRol, id){
	if(idRol=='M'){
		$('#txtIdRolSeleccionado').val(id);
		$("#cboSolicitaIpMonitor").val("");
		$("#txtIpMonitor").val("");
// 		$("#txtLoginMonitor").val("");
		$("#cboTipoMonitor").val("");
		$("#cboUsuarioPrincipal").val("");
		$("#cboUsuariosMonitor").val("");
		fnhabilitaCamposUsuarioMonitor("Nuevo"); 
		$('#modalNuevoUsuarioMonitor').modal('show');		
	}
	else if(idRol=='K'){
		$('#txtIdRolSeleccionado').val(id);
// 		$("#txtLoginKiosko").val("");	
		$("#cboSolicitaIpKiosko").val("");
		$("#txtIpKiosko").val("");	
		$("#cboValidaTipoDoc").val("");
		$("#cboPideDocumento").val("");
		$("#cboImprimeTicket").val("");
		$("#cboUsuariosKiosko").val("");
		$('#modalNuevoUsuarioKiosko').modal('show');
	}
	else if(idRol=='V'){
		$('#txtIdRolSeleccionado').val(id);
		$("#cboUsuarios").val("");
		$("#txtAPaternoVentanilla").val("");
		$("#txtAMaternoVentanilla").val("");
		$("#txtNombresVentanilla").val("");
		$("#txtLoginVentanilla").val("");
		$("#cboAreaXSucursal").val("");
		$("#cboVentanillaXSucursal").val("");
		$("#txtIpVentanilla").val("");
		$("#cboEvalua").val("");
		$("#txtPuerto").val("");
		$('#modalNuevoUsuarioVentanilla').modal('show');
	}
	else if(idRol=='VS'){
		$('#txtIdRolSeleccionado').val(id);
		$("#cboUsuarios").val("");
		$("#txtAPaternoVentanilla").val("");
		$("#txtAMaternoVentanilla").val("");
		$("#txtNombresVentanilla").val("");
		$("#txtLoginVentanilla").val("");
		$("#cboAreaXSucursal").val("");
		$("#cboVentanillaXSucursal").val("");
		$("#txtIpVentanilla").val("");
		$("#cboEvalua").val("");
		$("#txtPuerto").val("");
		$('#modalNuevoUsuarioVentanilla').modal('show');
	}
	else{
		console.log('otro tipo de rol no definido');
	}	
}

//grabar usuario MONITOR
$("#btnGrabarUsuarioMonitor").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var iSolicitaIp = $("#cboSolicitaIpMonitor").val();
	var vIp= $("#txtIpMonitor").val();
	var iTipoMonitor = $("#cboTipoMonitor").val();
	var idEmpresa = '${usuario.iEmpresa}';
	var iSinoAreaMonitor=$("#sinoAreaMonitor").val();
	var iAreaMonitor=$("#cboAreaMonitor").val();
	if (iSinoAreaMonitor=='0') iAreaMonitor="0";	
	var idRolEquipo = $('#txtIdRolSeleccionado').val();
	var usuarioPrincipal = $("#cboUsuarioPrincipal").val();
	var idUsuario = $("#cboUsuariosMonitor").val();
	$.ajax({ 
		type: 'POST', 
		url: 'grabarusuariomonitor.app',
		data: {idSucursal:idSucursal, iSolicitaIp: iSolicitaIp, vIp:vIp, iTipoMonitor:iTipoMonitor, idRolEquipo: idRolEquipo,
			idEmpresa: idEmpresa, iAreaMonitor: iAreaMonitor, usuarioPrincipal: usuarioPrincipal, idUsuario: idUsuario}, 	    		
		success: function (response) {
			var data = response.data;
			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Registrado correctamente.',
                });
 				$("#UsuariosXRol").css("display","");
 				$("#GruposXRol").css("display","none");
 				$('#modalNuevoUsuarioMonitor').modal('hide');
 				var html='';	
				$('#tblListadoUsuariosXRol tbody').empty();			
				for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioMonitor('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioMonitor(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';				
				  $('#tblListadoUsuariosXRol tbody').append(html);
	    		}
			}
		}	
	});
	
});

//grabar usuario Kiosko
$("#btnGrabarUsuarioKiosko").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var iSolicitaIp = $("#cboSolicitaIpKiosko").val();
	var vIp= $("#txtIpKiosko").val();	
	var iTipoValidaDoc = $("#cboValidaTipoDoc").val();
	var iPideDocumento = $("#cboPideDocumento").val();
	var iImprimeTicket = $("#cboImprimeTicket").val();	
	var idRolEquipo = $('#txtIdRolSeleccionado').val();
	var idEmpresa = '${usuario.iEmpresa}';
	var iConfirmaImpresion = $("#cboConfirmaImpresion").val();	
	var idUsuario = $("#cboUsuariosKiosko").val();
	console.log(iConfirmaImpresion)
	$.ajax({ 
		type: 'POST', 
		url: 'grabarusuariokiosko.app',
		data: {idSucursal:idSucursal, iSolicitaIp: iSolicitaIp, vIp:vIp, iTipoValidaDoc: iTipoValidaDoc, iPideDocumento: iPideDocumento,   
			iImprimeTicket: iImprimeTicket, idRolEquipo: idRolEquipo, idEmpresa:idEmpresa, iConfirmaImpresion: iConfirmaImpresion, idUsuario: idUsuario},   		 
		success: function (response) {
			var data = response.data;
			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Registrado correctamente.',
                });
 				$("#UsuariosXRol").css("display","");
 				$("#GruposXRol").css("display","none");
 				$('#modalNuevoUsuarioKiosko').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();			
				for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioKiosko('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioKiosko(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';				
				  $('#tblListadoUsuariosXRol tbody').append(html);
	    		}
			}
		}	
	});
	
});

//grabar usuario ventanilla
$("#btnGrabarUsuarioVentanilla").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idUsuario = $("#cboUsuarios").val();
	var iVentanilla = $("#cboVentanillaXSucursal").val();
	var vIp= $("#txtIpVentanilla").val();
	var iArea = $("#cboAreaXSucursal").val();
	var iControlAsistencia = $("#cboAsistencia").val();
	var iEvalua = $("#cboEvalua").val();
	var iAnula = $("#cboAnula").val();
	var puerto = $("#txtPuerto").val();
	var idRolEquipo = $('#txtIdRolSeleccionado').val();
	var idEmpresa = '${usuario.iEmpresa}';
	
	$.ajax({ 
		type: 'POST', 
		url: 'grabarusuarioventanilla.app',
		data: {idSucursal:idSucursal, idUsuario: idUsuario, iVentanilla:iVentanilla, vIp:vIp, 
			iArea: iArea, iControlAsistencia: iControlAsistencia, iEvalua: iEvalua, puerto: puerto,
			idRolEquipo: idRolEquipo, idEmpresa:idEmpresa, iAnula: iAnula}, 	 //aPaterno: aPaterno, aMaterno: aMaterno, vNombre:vNombre, vDNI: vDNI, vLogin:vLogin,
		success: function (response) {
			var data = response.data;
			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: ' Registrado correctamente.',
                });
 				$("#UsuariosXRol").css("display","");
 				$("#GruposXRol").css("display","none");
 				$('#modalNuevoUsuarioVentanilla').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();			
				for(var i=0; i<data.length; i++){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioVentanilla('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioVentanilla(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';				
				  $('#tblListadoUsuariosXRol tbody').append(html);
	    		}
			}
			else{
				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un usuario llamado '+vLogin.toUpperCase(),
                });
 				$('#modalNuevoUsuarioVentanilla').modal('hide');
			}	
		}	
	});
	
});

function fnAddGrupoXEquipo(id){	
	$("#cboGrupoXRol").val("");		
	$("#txtProporcion").val("");
	$('#addGrupoXEquipo').modal('show');	
	console.log('id->>'+id);
	$('#txtIdRol').val(id);	
}

function fnAddSubGrupo(id) {			
	$("#cboGrupoXRolLast").val(0);		
	$("#cboSubGrupo").val(0);	
	$("#txtProporcionSG").val("");
	$('#addSubGrupo').modal('show');	
	$("#cboSubGrupo").children("option:not(:first)").remove();

	console.log('id->>' + id);
	$('#txtIdRolSG').val(id);	

	$("#cboGrupoXRolLast").off("change").change(function () {
		var idGrupo = $("#cboGrupoXRolLast option:selected").val();
		
		if (idGrupo != 0) {
			$("#cboSubGrupo").children("option:not(:first)").remove();
			fnGetSubGrupoXGrupo(idGrupo); 
		} else {
			$("#cboSubGrupo").children("option:not(:first)").remove();
		}
	});
}

function fnGetSubGrupoXGrupo(idGrupo){
	$.ajax({ 
		type: 'POST', 
		url: 'listarsubgruposxsede.app',
		data: {idGrupo: idGrupo},		 	    		
		success: function (response) {
			var data = response.data;
			console.log(data);
			$.each(data, function (index, item) {	
	            $("<option/>")  
	                    .attr("value", item.id)
	                    .text(item.nombre)
	                    .appendTo("#cboSubGrupo");
	        });	
		}
	});
}

$('#cboTipo').on('change',function(){

	if ($("#cboTipo").val()==1){
        $("#tipoGrupo").removeAttr("style");
        $("#tipoSubgrupo").css("display", "none");
        $("#cboGrupoXRol").removeAttr("required");
        $("#txtProporcion").removeAttr("required");       
	}
	if ($("#cboTipo").val()==2){
		$("#tipoSubgrupo").removeAttr("style");
		$("#tipoGrupo").css("display", "none");
		$("#cboSubGrupo").removeAttr("required");
		$("#txtProporcion").removeAttr("required");
	}
})

function fnMostrarGruposXRol(id){
	console.log('id->>>'+id);
	$("#GruposXRol").css("display","");
	$("#UsuariosXRol").css("display","none");
	$("#grvGrupo").css("display","");
	$("#grvSubGrupo").css("display","none"); 

	$.ajax({ 
		type: 'POST', 
		url: 'getrolbyid.app',
		data: {idRol: id},		
		success: function (response) {
			var data = response.data;
			$(".nombreRol").html(data.nombre);
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxrol.app',
		data: {idRol: id},
		success: function (response) {
			var data = response.data;			
			$('#tblListadoGruposXRol tbody').empty();
			var html='';
			for(var i=0; i<data.length; i++){									
				html = '<tr>' +
				'<td><span>'+data[i].nombreGrupo+'</span></td>' +
				'<td><span>'+data[i].proporcion+'</span></td>' +				
				'<td><button type="button" class="btn btn-danger" onclick="fnEliminarGrupoXRol(\''+data[i].idRolEquipo+'\','+data[i].idGrupo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoGruposXRol tbody').append(html);
    		}	
// 			$('#tblListadoGruposXRol').DataTable();
		}
	});	
 }

function fnVerUsuariosXRol(tipoEquipo, id){
	console.log('tipoEquipo->>>>'+tipoEquipo);
	console.log('id->>>'+id); 
	$("#UsuariosXRol").css("display","");
	$("#GruposXRol").css("display","none");

	$.ajax({ 
		type: 'POST', 
		url: 'getrolbyid.app',
		data: {idRol: id},		
		success: function (response) {
			var data = response.data;
			$(".nombreRol").html(data.nombre);
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarusuariosxrol.app',
		data: {idRol: id},
		success: function (response) {
			var data = response.data;
			console.log("roles")
			console.log(data);
			$('#tblListadoUsuariosXRol tbody').empty();
			var html;						
			for(var i=0; i<data.length; i++){
				if(tipoEquipo=='M'){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioMonitor('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioMonitor(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
				}
				if(tipoEquipo=='K'){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioKiosko('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioKiosko(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
				}
				if(tipoEquipo=='V' || tipoEquipo == 'VS' || tipoEquipo == 'VA'){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioVentanilla('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioVentanilla(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
				}
				if(tipoEquipo=='C'){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
// 					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioConsulta('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioVentanilla(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
				}
				if(tipoEquipo=='E'){
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioEncuestador(\''+data[i].iUsuarioId+'\','+data[i].iSucursal+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioEncuestador(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
				}
    		}	
// 			$('#tblListadoUsuariosXRol').DataTable();
		}
	});	
 }


function fnEditarUsuarioMonitor(id){
	$('#editarUsuarioMonitor').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: {idUsuario: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdRolEdit").val(data.iRolEquipo);
			$("#txtIdUsuarioMonitor").val(data.iUsuarioId);			
			$("#cboSolicitaIpMonitorEdit").val(data.cUsuarioSolicitaIp);		
 			$("#txtIpMonitorEdit").val(data.cUsuarioIp);			
 			$("#txtLoginMonitorEdit").val(data.vUsuarioUsername);
 			$("#cboTipoMonitorEdit").val(data.iMonitorTipo);
 			$("#cboAreaMonitorEdit").val(data.iArea);
 			$("#cboUsuarioPrincipalEdit").val(data.iUsuarioPrincipalId == null ? "0" : data.iUsuarioPrincipalId);
 			var iSino=data.iArea;
 			console.log("isino: "+iSino);
 			if (iSino=="" || iSino==0) {
 				$("#sinoAreaMonitorEdit").val("0");
 			} else  $("#sinoAreaMonitorEdit").val("1");
 			fnhabilitaCamposUsuarioMonitor("Edit")
 			
		}
	});
}

function fnhabilitaCamposUsuarioMonitor(pTipoEdicion){
	
	if (pTipoEdicion=="Edit") {
		if ($("#cboTipoMonitorEdit").val()==20) {
			$("#sinoAreaMonitorEdit").val("0");
			$("#sinoAreaMonitorEdit").hide();
			$('#cboAreaMonitorEdit').hide();
			$("#cboAreaMonitorEdi").removeAttr("required");
	        $("#labelAreaMonitorEdit").css("display", "none");		
		} else {
			if ($("#sinoAreaMonitorEdit").val()==0){
				$('#cboAreaMonitorEdit').hide();
				$("#cboAreaMonitorEdit").removeAttr("required");
		        $("#labelAreaMonitorEdit").css("display", "none");		
	
			}
			if ($("#sinoAreaMonitorEdit").val()==1){
				$('#cboAreaMonitorEdit').show();
				$("#cboAreaMonitorEdit").attr("required");
				$("#labelAreaMonitorEdit").removeAttr("style");
			}
		}
	}
	if (pTipoEdicion=="Nuevo")  {
		if ($("#cboTipoMonitor").val()==20) {
				$("#sinoAreaMonitor").val("0");
				$("#sinoAreaMonitor").hide();
				$('#cboAreaMonitor').hide();
				$("#cboAreaMonitor").removeAttr("required");
		        $("#labelAreaMonitor").css("display", "none");		
		} else {
			$("#sinoAreaMonitor").show();
			if ($("#sinoAreaMonitor").val()==0){
				$('#cboAreaMonitor').hide();
				$("#cboAreaMonitor").removeAttr("required");
		        $("#labelAreaMonitor").css("display", "none");		
	
			}
			if ($("#sinoAreaMonitor").val()==1){
				$('#cboAreaMonitor').show();
				$("#cboAreaMonitor").attr("required");
				$("#labelAreaMonitor").removeAttr("style");
			}
		}
	}
}



$('#sinoAreaMonitorEdit').on('change',function(){
	fnhabilitaCamposUsuarioMonitor("Edit");
})



$('#sinoAreaMonitor').on('change',function(){
	fnhabilitaCamposUsuarioMonitor("Nuevo");	
})
$('#cboTipoMonitor').on('change',function(){
	console.log("cambio");
	fnhabilitaCamposUsuarioMonitor("Nuevo");	
})
$('#cboTipoMonitorEdit').on('change',function(){
	fnhabilitaCamposUsuarioMonitor("Edit");	
})
$("#btnEditarUsuarioMonitor").click(function() {
	var idUsuario = $("#txtIdUsuarioMonitor").val();
	var idRol = $("#txtIdRolEdit").val();
	var idSucursal = '${usuario.iSucursal}';
	var iSolicitaIpEdit = $("#cboSolicitaIpMonitorEdit").val();
	var vIpEdit= $("#txtIpMonitorEdit").val();
	var iTipoMonitorEdit = $("#cboTipoMonitorEdit").val();
	var iSinoAreaMonitorEdit=$("#sinoAreaMonitorEdit").val();
	var iAreaMonitorEdit=$("#cboAreaMonitorEdit").val();
	var usuarioPrincipalEdit = $("#cboUsuarioPrincipalEdit").val();
	if (iSinoAreaMonitorEdit=='0') iAreaMonitorEdit="0";
		
	$.ajax({ 
 		type: 'POST', 
 		url: 'editusuariomonitor.app',
 		data: {idUsuario: idUsuario, idRol: idRol, idSucursal: idSucursal, iSolicitaIpEdit: iSolicitaIpEdit, vIpEdit: vIpEdit,
 			iTipoMonitorEdit: iTipoMonitorEdit, iAreaMonitorEdit: iAreaMonitorEdit, usuarioPrincipalEdit: usuarioPrincipalEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Editado correctamente.',
                });
				$('#editarUsuarioMonitor').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioMonitor('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioMonitor(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuariosXRol tbody').append(html);
	    		}
 			}
 		}	
	});				  
});

function fnEditarUsuarioKiosko(id){
	$('#editarUsuarioKiosko').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: {idUsuario: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdRolEdit").val(data.iRolEquipo);
			$("#txtIdUsuarioKiosko").val(data.iUsuarioId);			
			$("#txtLoginKioskoEdit").val(data.vUsuarioUsername);		
 			$("#cboSolicitaIpKioskoEdit").val(data.cUsuarioSolicitaIp);			
 			$("#txtIpKioskoEdit").val(data.cUsuarioIp);
 			$("#cboValidaTipoDocEdit").val(data.iValidaDocumento);
 			$("#cboPideDocumentoEdit").val(data.iPideDocumento);
 			$("#cboImprimeTicketEdit").val(data.iImprimeTicket);
 			$("#cboConfirmaImpresionEdit").val(data.iConfirmaImpresion == null ? "0" : data.iConfirmaImpresion);
		}
	});
}

$("#btnEditarUsuarioKiosko").click(function() {
	var idUsuario = $("#txtIdUsuarioKiosko").val();
	var idSucursal = '${usuario.iSucursal}';
	var iSolicitaIpEdit = $("#cboSolicitaIpKioskoEdit").val();
	var vIpEdit= $("#txtIpKioskoEdit").val();
	var iTipoValidaDocEdit = $("#cboValidaTipoDocEdit").val();
	var iPideDocumentoEdit = $("#cboPideDocumentoEdit").val();
	var iImprimeTicketEdit = $("#cboImprimeTicketEdit").val();	
	var idRol = $('#txtIdRolEdit').val();
	var iConfirmaImpresionEdit = $("#cboConfirmaImpresionEdit").val();
					
	$.ajax({ 
 		type: 'POST', 
 		url: 'editusuariokiosko.app',
 		data: {idUsuario: idUsuario, idSucursal: idSucursal, iSolicitaIpEdit: iSolicitaIpEdit,
 			vIpEdit: vIpEdit, iTipoValidaDocEdit: iTipoValidaDocEdit, iPideDocumentoEdit: iPideDocumentoEdit,
 			iImprimeTicketEdit: iImprimeTicketEdit, idRol: idRol, iConfirmaImpresionEdit: iConfirmaImpresionEdit}, 
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Editado correctamente.',
                });
				$('#editarUsuarioKiosko').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioKiosko('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioKiosko(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuariosXRol tbody').append(html);
	    		}
 			}
 		}	
	});				  
});

function fnEditarUsuarioVentanilla(id){
	$('#editarUsuarioVentanilla').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: {idUsuario: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdRolEdit").val(data.iRolEquipo);
			$("#txtIdUsuarioVentanilla").val(data.iUsuarioId);
			$("#txtAPaternoVentanillaEdit").val(data.vUsuarioApPaterno);
			$("#txtAMaternoVentanillaEdit").val(data.vUsuarioApMaterno);
			$("#txtNombresVentanillaEdit").val(data.vUsuarioNombres);
			$("#txtDNIVentanillaEdit").val(data.dni);
			$("#txtLoginVentanillaEdit").val(data.vUsuarioUsername);
			$("#cboVentanillaXSucursalEdit").val(data.iVentanilla);
			$("#txtIpVentanillaEdit").val(data.cUsuarioIp);
			$("#cboAreaXSucursalEdit").val(data.iArea);
			$("#cboAsistenciaEdit").val(data.iControlAsistencia);
			$("#cboEvaluaEdit").val(data.iEvalua);
			$("#cboAnulaEdit").val(data.iAnula);
			$("#txtPuertoEdit").val(data.vPuerto);
			$("#cboAtencionEdit").val(data.iAtencion);
		}
	});
}

$("#btnEditarUsuarioVentanilla").click(function() {
	var idUsuario = $("#txtIdUsuarioVentanilla").val();
	var idSucursal = '${usuario.iSucursal}';
	var idRol = $('#txtIdRolEdit').val();
	var iVentanillaEdit = $("#cboVentanillaXSucursalEdit").val();
	var vIpEdit= $("#txtIpVentanillaEdit").val();
	var iControlAsistenciaEdit = $("#cboAsistenciaEdit").val()
	var iEvaluaEdit = $("#cboEvaluaEdit").val();
	var iAnulaEdit = $("#cboAnulaEdit").val();
	var puertoEdit = $("#txtPuertoEdit").val();
	var iAreaEdit = $("#cboAreaXSucursalEdit").val();
	var iAtencionEdit = $("#cboAtencionEdit").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editusuarioventanilla.app',
 		data: {idUsuario: idUsuario, idSucursal: idSucursal, idRol: idRol, iVentanillaEdit: iVentanillaEdit, vIpEdit: vIpEdit, iAreaEdit: iAreaEdit, iControlAsistenciaEdit: iControlAsistenciaEdit,
 			iEvaluaEdit: iEvaluaEdit, puertoEdit: puertoEdit, iAnulaEdit: iAnulaEdit, iAtencionEdit: iAtencionEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Editado correctamente.',
                });
				$('#editarUsuarioVentanilla').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioVentanilla('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioVentanilla(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoUsuariosXRol tbody').append(html);
	    		}
 			}
 			else{
 				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un usuario llamado '+vLoginEdit.toUpperCase(),
                });
 				$('#editarUsuarioVentanilla').modal('hide');
 	 		}
 			
 		}
	});
});

function fnEliminarUsuarioMonitor(id, idRol){
	var idRol = idRol;
	var idUsuario =id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminarusuariomonitor.app',
						data: {idRol: idRol, idUsuario: idUsuario},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoUsuariosXRol tbody').empty();			
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
								'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
								'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioMonitor('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioMonitor(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoUsuariosXRol tbody').append(html);
							}
						}
					});
	        	}
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
}

function fnEliminarUsuarioKiosko(id,idRol){
	var idRol = idRol;
	var idUsuario =id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminarusuariokiosko.app',
						data: {idRol: idRol, idUsuario: idUsuario},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoUsuariosXRol tbody').empty();			
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
								'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
								'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioKiosko('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioKiosko(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
							  '</tr>'; 					
							$('#tblListadoUsuariosXRol tbody').append(html);
							}
						}
					});
	        	}
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
}

function fnEliminarUsuarioVentanilla(id, idRol){
	var idRol = idRol;
	var idUsuario =id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminarusuarioventanilla.app',
						data: {idRol: idRol, idUsuario: idUsuario},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoUsuariosXRol tbody').empty();			
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
								'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
								'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioVentanilla('+data[i].iUsuarioId+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioVentanilla(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
							  '</tr>'; 					
							$('#tblListadoUsuariosXRol tbody').append(html);
							}
						}
					});
	        	}
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
}

function fnEditarUsuarioEncuestador(id, idSucursal){
	console.log(idSucursal);
	$('#editarUsuarioEncuestador').modal('show');
	$.ajax({ 
		type: 'POST', 
		url: 'getUserById.app',
		data: {idUsuario: id},		
		success: function (response) {
			var data = response.data;
			$("#txtIdRolEdit").val(data.iRolEquipo);
			$("#txtIdUsuarioEncuestador").val(data.iUsuarioId);	
			if (data.iVentanilla == null || data.iVentanilla == 0) {
 				$("#cboVentanillaEdit").val(0);			
			} else {
 				$("#cboVentanillaEdit").val(data.iVentanilla);				
			}
		}
	});
}

$("#btnEditarUsuarioEncuestador").click(function() {
	var idUsuario = $("#txtIdUsuarioEncuestador").val();
	var idRol = $("#txtIdRolEdit").val();
	var idSucursal = '${usuario.iSucursal}';
	var idVentanilla = $("#cboVentanillaEdit").val();
		
	$.ajax({ 
 		type: 'POST', 
 		url: 'editusuarioencuestador.app',
 		data: {idUsuario: idUsuario, idRol: idRol, idSucursal: idSucursal, idVentanilla: idVentanilla},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: 'Editado correctamente.',
                });
				$('#editarUsuarioEncuestador').modal('hide');
				var	html='';
				$('#tblListadoUsuariosXRol tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
					'<td><span>'+data[i].cUsuarioIp+'</span></td>' +				
					'<td><button type="button" class="btn btn-success" onclick="fnEditarUsuarioEncuestador(\''+data[i].iUsuarioId+'\','+data[i].iSucursal+')" title="Editar"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarUsuarioEncuestador(\''+data[i].iUsuarioId+'\','+data[i].iRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button><button type="button" class="btn btn-warning" onclick="fnResetearClave('+data[i].iUsuarioId+')" title="Resetear"><i class="fas fa-undo"></i></button></td>' +
				  '</tr>';	        					
				  $('#tblListadoUsuariosXRol tbody').append(html);
	    		}
 			}
 		}	
	});				  
});

function fnEliminarGrupoXRol(idRol, idGrupo){
	var idRol = idRol;
	var idGrupo =idGrupo;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminargrupoxrol.app',
						data: {idRol: idRol, idGrupo: idGrupo},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoGruposXRol tbody').empty();
							var html;						
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].nombreGrupo+'</span></td>' +
								'<td><span>'+data[i].proporcion+'</span></td>' +				
								'<td><button type="button" class="btn btn-danger" onclick="fnEliminarGrupoXRol(\''+data[i].idRolEquipo+'\','+data[i].idGrupo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoGruposXRol tbody').append(html);
							}
						}
					});
	        	}
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
}

function fnEditarRolEquipo(id){
	$('#editarRolEquipo').modal('show');
	var algoritmo = document.getElementById('algoritmo');
	var permiteAtencion = document.getElementById('permiteAtencion');
	$.ajax({ 
		type: 'POST', 
		url: 'getrolbyid.app',
		data: {idRol: id},		
		success: function (response) {
			var data = response.data;
			var tipoEquipo = data.tipoEquipo;
			
			if(tipoEquipo == 'M' || tipoEquipo == 'K' || tipoEquipo == 'C'){
				algoritmo.style.display = 'none'; 
				permiteAtencion.style.display = 'none'; 
			}else{
				algoritmo.style.display = ''; 
				permiteAtencion.style.display = ''; 
			}
			
			$("#txtIdRol").val(data.id);
			$("#txtRolEdit").val(data.nombre);
			$("#txtTipoEquipoEdit").val(data.tipoEquipo);
			$("#cboAlgoritmoEdit").val(data.algoritmo);
		}
	});
}

$("#btnEditarRolEquipo").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idRol = $('#txtIdRol').val();
	var rolEdit = $("#txtRolEdit").val();
	var tipoEquipoEdit = $("#txtTipoEquipoEdit").val();
	var algoritmoEdit = $("#cboAlgoritmoEdit").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editrolequipo.app',
 		data: {
			idSucursal: idSucursal, 
			idRol: idRol, 
			rolEdit: rolEdit, 
			tipoEquipoEdit: tipoEquipoEdit, 
			algoritmoEdit: algoritmoEdit,
		},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: rolEdit.toUpperCase() + ' Editado correctamente.',
                });
 				$('#editarRolEquipo').modal('hide');	
	 			var html='';
	 			$('#tblListadoRolEquipo tbody').empty();
	 				for(var i=0; i<data.length; i++){
	 					if(data[i].tipoEquipo == 'VS'){
	 						html = '<tr>' +
	 						'<td><span>'+data[i].nombre+'</span></td>' +
	 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
	 						'<td><button type="button" class="btn btn-info" title="Asignar SubGrupo" onclick="fnAddSubGrupo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver SubGrupos" onclick="fnMostrarSubGrupos('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
	 					  '</tr>';
	 					$('#tblListadoRolEquipo tbody').append(html);
	 					}
	 					else{
	 						html = '<tr>' +
	 						'<td><span>'+data[i].nombre+'</span></td>' +
	 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
	 						'<td><button type="button" class="btn btn-info" title="Asignar Grupo" onclick="fnAddGrupoXEquipo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver Grupos" onclick="fnMostrarGruposXRol('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
	 					  '</tr>';
	 					$('#tblListadoRolEquipo tbody').append(html);
	 					}
		    		}	
// 				$('#tblListadoRolEquipo').DataTable();
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un rol llamado '+rolEdit.toUpperCase(),
                });
 				$('#editarRolEquipo').modal('hide');
 			}
 		}
	});
});

function fnEliminarRolEquipo(id){
	var idSucursal = '${usuario.iSucursal}';
	var idRol = id;

	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
		            $.ajax({ 
		        		type: 'POST', 
		        		url: 'eliminarrolequipo.app',
		        		data: {idSucursal: idSucursal, idRol: idRol},		
		        		success: function (response) {
		        			var data = response.data;
		        			var html='';	
		        			$('#tblListadoRolEquipo tbody').empty();
		        			for(var i=0; i<data.length; i++){									
		        				if(data[i].tipoEquipo == 'VS'){
			 						html = '<tr>' +
			 						'<td><span>'+data[i].nombre+'</span></td>' +
			 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
			 						'<td><button type="button" class="btn btn-info" title="Asignar SubGrupo" onclick="fnAddSubGrupo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver SubGrupos" onclick="fnMostrarSubGrupos('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
			 					  '</tr>';
			 					$('#tblListadoRolEquipo tbody').append(html);
			 					}
			 					else{
			 						html = '<tr>' +
			 						'<td><span>'+data[i].nombre+'</span></td>' +
			 						'<td><span>'+data[i].tipoEquipo+'</span></td>' +
			 						'<td><button type="button" class="btn btn-info" title="Asignar Grupo" onclick="fnAddGrupoXEquipo('+data[i].id+')"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-success" title="Editar Rol" onclick="fnEditarRolEquipo('+data[i].id+')"><i class="fa fa-edit"></i></button>&nbsp;<button type="button" class="btn btn-danger" title="Eliminar Rol" onclick="fnEliminarRolEquipo('+data[i].id+')"><i class="fa fa-trash"></i></button><br><button type="button" class="btn btn-secondary" title="Ver Grupos" onclick="fnMostrarGruposXRol('+data[i].id+')"><i class="fas fa-eye"></i></button>&nbsp;<button type="button" class="btn btn-warning" title="Nuevo Usuario" onclick="fnAddUsuarioXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-user" aria-hidden="true"></i></button>&nbsp;<button type="button" class="btn btn-dark" title="Ver Usuarios" onclick="fnVerUsuariosXRol(\''+data[i].tipoEquipo+'\','+data[i].id+')"><i class="fa fa-eye" aria-hidden="true"></i></button></td>' +
			 					  '</tr>';
			 					$('#tblListadoRolEquipo tbody').append(html);
			 					}
		        			}
		        		}
		        	});
	            }
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
	
}


function fnResetearClave(id){
	var idUsuario =id;
	$.ajax({ 
		type: 'POST', 
		url: 'resetearclaveuser.app',
		data: {idUsuario: idUsuario},		
		success: function (response) {
			var data = response.data;
			html='';				
			if(response.success==true){
				console.log("reset");
 				$.alert({
                    title: 'Exito',
                    content: response.message,
                });  				
         	}		
		}
	});
}

$('#cboEvalua').on('change',function(){
	if ($("#cboEvalua").val()==1){
		$("#puertoEvalua").css("display", "none");
        $("#txtPuerto").removeAttr("required");
	}
	if ($("#cboEvalua").val()==2){
		$("#puertoEvalua").removeAttr("style");
		$("#puerto").removeAttr("style");
        $("#ip").css("display", "none");
        $("#txtPuerto").attr("required");
	}
	if ($("#cboEvalua").val()==3){
		$("#puertoEvalua").removeAttr("style");
		$("#ip").removeAttr("style");
        $("#puerto").css("display", "none");
        $("#txtPuerto").attr("required");
	}
})

$('#cboEvalucboEvaluaEditaEdit').on('change',function(){
	if ($("#cboEvaluaEdit").val()==1){
		$("#puertoEvaluaEdit").css("display", "none");
        $("#txtPuertoEdit").removeAttr("style");
	}
	if ($("#cboEvaluaEdit").val()==2){
		$("#puertoEvaluaEdit").removeAttr("style");
		$("#puertoEdit").removeAttr("style");
        $("#txtPuertoEdit").attr("required");
	}
	if ($("#cboEvaluaEdit").val()==3){
		$("#puertoEvaluaEdit").removeAttr("style");
		$("#puertoEdit").removeAttr("style");
        $("#txtPuertoEdit").attr("required");
	}
})

$("#btnAgregarSubGrupo").click(function() {
	var idRol =  $('#txtIdRolSG').val();
	console.log('idRol->>>'+idRol);		
	var idSubGrupo = $("#cboSubGrupo").val();		
	var proporcionSG = $("#txtProporcionSG").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'agregarsubgrupoxrol.app',
 		data: {idRol: idRol, idSubGrupo: idSubGrupo, proporcionSG: proporcionSG}, 	    		
 		success: function (response) {
 			var mensaje = response.message;
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: data[data.length-1].nombreSubGrupo.toUpperCase() + ' Agregado correctamente.',
                });
 				$('#addSubGrupo').modal('hide');	
				var html='';
				$('#tblListadoSubGruposXRol tbody').empty();
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].nombreGrupo+'</span></td>' +
					'<td><span>'+data[i].nombreSubGrupo+'</span></td>' +
					'<td><span>'+data[i].proporcion+'</span></td>' +				
					'<td><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupoXRol(\''+data[i].idRolEquipoSubGrupo+'\','+data[i].idSubGrupo+','+data[i].idRolEquipo+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoSubGruposXRol tbody').append(html);
				console.log(html);
	    		}
 			}
 			else{
	 			console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un subgrupo agregado con este nombre.',
                });
 				$('#addSubGrupo').modal('hide');
 			}
 		}
	});				  
});

function fnMostrarSubGrupos(id){
	console.log('id->>>'+id);
	$("#GruposXRol").css("display","");
	$("#UsuariosXRol").css("display","none");
	$("#grvGrupo").css("display","none");
	$("#grvSubGrupo").css("display",""); 
	$.ajax({ 
		type: 'POST', 
		url: 'getrolbyid.app',
		data: {idRol: id},		
		success: function (response) {
			var data = response.data;
			$(".nombreRol").html(data.nombre);
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarsubgruposxrol.app',
		data: {idRol: id},
		success: function (response) {
			var data = response.data;			
			$('#tblListadoSubGruposXRol tbody').empty();
			var html='';
			for(var i=0; i<data.length; i++){			
				html = '<tr>' +
				'<td><span>'+data[i].nombreGrupo+'</span></td>' +
				'<td><span>'+data[i].nombreSubGrupo+'</span></td>' +
				'<td><span>'+data[i].proporcion+'</span></td>' +				
				'<td><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupoXRol('+data[i].idRolEquipoSubGrupo+','+data[i].idSubGrupo+','+id+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoSubGruposXRol tbody').append(html);
    		}	
// 			$('#tblListadoGruposXRol').DataTable();
		}
	});	
 }
 
function fnEliminarSubGrupoXRol(idRolEquipoSubGrupo, idSubGrupo, idRol){
	var idRolEquipoSubGrupo = idRolEquipoSubGrupo;
	var idSubGrupo =idSubGrupo;
	var idRol = idRol;
	console.log(idRolEquipoSubGrupo);
	console.log(idSubGrupo);
	console.log(idRol);
	$.confirm({
	    title: '¿Estás seguro de eliminar?',
	    content: 'Presiona SI para continuar.',
	    buttons: {
	        confirm: {
	        	text: 'SI',
	        	action: function(){
	        		$.alert('Eliminado!');
					$.ajax({ 
						type: 'POST', 
						url: 'eliminarsubgrupoxrol.app',
						data: {idRolEquipoSubGrupo: idRolEquipoSubGrupo, idSubGrupo: idSubGrupo, idRol: idRol},		
						success: function (response) {
							var data = response.data;
							html='';	
							$('#tblListadoSubGruposXRol tbody').empty();
							var html;						
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].nombreGrupo+'</span></td>' +
								'<td><span>'+data[i].nombreSubGrupo+'</span></td>' +
								'<td><span>'+data[i].proporcion+'</span></td>' +				
								'<td><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupoXRol('+data[i].idRolEquipoSubGrupo+','+data[i].idSubGrupo+','+idRol+')" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoSubGruposXRol tbody').append(html);
							}
						}
					});
	        	}
	        },
	        cancel: {
	        	text: 'NO',
	        	action: function(){
	            	$.alert('Cancelado!');
	        	}
	        }
	    }
	});
}

</script>
</body>
</html>
