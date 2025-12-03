<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grupos</title>
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
              <li class="breadcrumb-item active">Grupos</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <button id="btnOpenModal" type="button" class="btn btn-primary" data-toggle="modal" title="Nuevo Grupo" ><i class="fas fa-plus"></i></button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered" id="tblListadoGrupos">
                  <thead>                  
                    <tr>                      
                      <th style="width: 100px">Nombre</th>
                      <th style="width: 100px">Algoritmo</th>
                      <th style="width: 170px">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>                    
                  </tbody>
                </table>
              </div>              
            </div>            
          </div>
          <!-- /.col -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">SubGrupos de: <span id="nombreGrupo"></span></h3>                
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered" id="tblListadoSubGrupos">
                  <thead>                  
                    <tr>                      
                      <th style="width: 100px">Nombre</th>
                      <th style="width: 70px">Prefijo</th>
                      <th style="width: 100px">Prioridad</th>
                      <th style="width: 150px">Acciones</th>
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

<!-- nuevo grupo -->

	<div class="modal" id="nuevoGrupo">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header modal-header-primary">
	        <h4 class="modal-title">Nuevo Grupo</h4>
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
											<label>Nombre</label>
											<input class="form-control" type="text" id="txtNombreGrupo" style="text-transform:uppercase;" placeholder="Nombre Grupo" required/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Prefijo</label>
											<input class="form-control" type="text" id="txtPrefijoGrupo" maxlength="3" style="text-transform:uppercase;" placeholder="Prefijo" required/>
										</div>										
										<div class="col-xs-12 col-sm-3">
											<label>Tipo de Algoritmo</label>
											<select class="form-control" id="cboAlgoritmo" required>
												<option value="">--Seleccione--</option>																																				
											</select>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Area</label>
											<select class="form-control" id="cboArea" required>
												<option value="">--Seleccione--</option>																																				
											</select>
										</div>
									</div>							
								</div>														
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-6">
											<label>Descripcion Corta</label>
											<input class="form-control" type="text" id="txtDescripcionCorta" style="text-transform:uppercase;" placeholder="Descripcion Corta"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Entrada (Algoritmo 3)</label>
											<input class="form-control" type="text"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtKioskoA3Entrada" style="text-transform:uppercase;" placeholder="Entrada"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Minimo (Algoritmo 3)</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtKioskoA3Minimo" style="text-transform:uppercase;" placeholder="Minimo"/>
										</div>																				
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Descripcion</label>
											<textarea class="form-control rounded-0" id="txtDescripcionLarga" rows="3"></textarea>
										</div>
									</div>
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-4">
											<label>Hora Inicio (Kiosko)</label>
											<input class="form-control" type="time" id="txtHoraInicio" required>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label>Hora Fin (Kiosko)</label>
											<input class="form-control" type="time" id="txtHoraFin" required>
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
					    	<button type="submit" id="btnGrabarGrupoXSucursal" class="btn btn-primary" title="Grabar"><i class="fas fa-save"></i></button>
        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>							
						</form>
				</fieldset>
	      </div>

    </div>
  </div>
</div>

<!-- nuevo subgrupo -->

	<div class="modal" id="nuevoSubGrupo">
	  	<div class="modal-dialog modal-lg">
	    	<div class="modal-content">	

			      <div class="modal-header modal-header-primary">
			        <h4 class="modal-title">Nuevo SubGrupo</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>	

			      <div class="modal-body">
			      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<input class="form-control" type="hidden" id="txtIdGrupo" />												
											<div class="col-xs-12 col-sm-4">
												<label>Nombre</label>
												<input class="form-control" type="text" id="txtNombreSubGrupo" style="text-transform:uppercase;" placeholder="Nombre SubGrupo" required/>
											</div>
											<div class="col-xs-12 col-sm-2">
												<label>Prefijo</label>
												<input class="form-control" type="text" id="txtPrefijoSubGrupo" maxlength="1" style="text-transform:uppercase;" placeholder="Prefijo" required/>
											</div>										
											<div class="col-xs-12 col-sm-3">
												<label>Tipo de Prioridad</label>
												<select class="form-control" id="cboPrioridad" required>
													<option value="">--Seleccione--</option>																																				
												</select>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Secuencia</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtSecuencia"  placeholder="Secuencia" required/>
											</div>										
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-4">
												<label>Descripcion Corta</label>
												<input class="form-control" type="text" id="txtDescripcionCortaSubGrupo" style="text-transform:uppercase;" placeholder="Descripcion Corta"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Prioridad Algoritmo 2</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo2" placeholder="10"/>
											</div>
											<div class="col-xs-12 col-sm-3">
												<label>Prioridad Algoritmo 3</label>
												<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo3" placeholder="20"/>
											</div>
											<div class="col-xs-12 col-sm-2">
												<label>Agrupador</label>
												<select class="form-control" id="cboAgrupador" required>
													<option value="">Seleccione</option>																																				
												</select>
											</div>
										</div>									
									</div>																
								</div>
								<div class="row">
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												<label>Descripcion</label>
<!-- 												<textarea class="form-control rounded-0" id="txtDescripcionLargaSubGrupo" rows="3"></textarea> -->
													<textarea id="txtDescripcionLargaSubGrupo" class="textarea" placeholder="Place some text here"
	                          						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; 
	                          						border: 1px solid #dddddd; padding: 10px;"></textarea>
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

								<button type="submit" id="btnGrabarSubGrupo" class="btn btn-primary"title="Grabar"><i class="fas fa-save"></i></button>
			        			<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>							
							</form>
						</fieldset>			
			      </div>
    		</div>
  		</div>
	</div>


<!-- editar grupo -->

	<div class="modal" id="editarGrupo">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header modal-header-primary">
	        <h4 class="modal-title">Editar Grupo</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      		<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="">
											<input class="form-control" type="hidden" id="txtIdGrupo" style="text-transform:uppercase;" placeholder="Nombre Sucursal"/>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label>Nombre</label>
											<input class="form-control" type="text" id="txtNombreGrupoEdit" style="text-transform:uppercase;" placeholder="Nombre Grupo" required/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Prefijo</label>
											<input class="form-control" type="text" id="txtPrefijoGrupoEdit" style="text-transform:uppercase;" placeholder="Prefijo" required />
										</div>										
										<div class="col-xs-12 col-sm-3">
											<label>Tipo de Algoritmo</label>
											<select class="form-control" id="cboAlgoritmoEdit" required>
												<option value="0">--Seleccione--</option>
											</select>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Area</label>
											<select class="form-control" id="cboAreaEdit" required>
												<option value="0">--Seleccione--</option>
											</select>
										</div>										
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-6">
											<label>Descripcion Corta</label>
											<input class="form-control" type="text" id="txtDescripcionCortaEdit" style="text-transform:uppercase;" placeholder="Descripcion Corta"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Entrada (Algoritmo 3)</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtKioskoA3EntradaEdit" style="text-transform:uppercase;" placeholder="Entrada"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Minimo (Algoritmo 3)</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtKioskoA3MinimoEdit" style="text-transform:uppercase;" placeholder="Minimo"/>
										</div>																				
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Descripcion</label>
											<textarea class="form-control rounded-0" id="txtDescripcionLargaEdit" rows="3"></textarea>
											
										</div>																														
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-4">
											<label>Hora Inicio (Kiosko)</label>
											<input class="form-control" type="time" id="txtHoraInicioEdit" required>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label>Hora Fin (Kiosko)</label>
											<input class="form-control" type="time" id="txtHoraFinEdit" required>
										</div>
									</div>
								</div>																
							</div>
							<button type="submit" id="btnEditarGrupoXSucursal" class="btn btn-primary" title="Editar Grupo"><i class="fa fa-edit"></i></button>
        					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>							
						</form>
				</fieldset>
	      </div>
	      
    </div>
  </div>
</div>


<!-- editar subgrupo -->

<div class="modal" id="editarSubGrupo">
  	<div class="modal-dialog modal-lg">
    	<div class="modal-content">	
   				<!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">Editar SubGrupo</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>	
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<input class="form-control" type="hidden" id="txtIdGrupoEdit" />
										<input class="form-control" type="hidden" id="txtIdSubGrupo" />												
										<div class="col-xs-12 col-sm-4">
											<label>Nombre</label>
											<input class="form-control" type="text" id="txtNombreSubGrupoEdit" style="text-transform:uppercase;" placeholder="Nombre SubGrupo" required/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Prefijo</label>
											<input class="form-control" type="text" id="txtPrefijoSubGrupoEdit" style="text-transform:uppercase;" placeholder="Prefijo" required/>
										</div>										
										<div class="col-xs-12 col-sm-3">
											<label>Tipo de Prioridad</label>
											<select class="form-control" id="cboPrioridadEdit" required>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Secuencia</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtSecuenciaEdit"  placeholder="Secuencia" required/>
										</div>
									</div>							
								</div>														
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-4">
											<label>Descripcion Corta</label>
											<input class="form-control" type="text" id="txtDescripcionCortaSubGrupoEdit" style="text-transform:uppercase;" placeholder="Descripcion Corta"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Prioridad Algoritmo 2</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo2Edit" placeholder="10"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Prioridad Algoritmo 3</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo3Edit" placeholder="20"/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Agrupador</label>
											<select class="form-control" id="cboAgrupadorEdit" required>
												<option value="0">Seleccione</option>																																				
											</select>
										</div>
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Descripcion</label>
<!-- 											<textarea class="form-control rounded-0" id="txtDescripcionLargaSubGrupoEdit" rows="3"></textarea> -->
											<textarea id="txtDescripcionLargaSubGrupoEdit" class="textarea"
	                          						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; 
	                          						border: 1px solid #dddddd; padding: 10px;"></textarea>
										</div>
									</div>
								</div>														
							</div>
							<button type="submit" id="btnEditarSubGrupoXGrupo" class="btn btn-primary" title="Editar"><i class="fa fa-edit"></i></button>
		        			<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i></button>
						</form>
					</fieldset>
		      </div>
   		</div>
 		</div>
</div>

<!-- detalles subgrupo -->

<div class="modal" id="detallesSubGrupo">
  	<div class="modal-dialog modal-lg">
    	<div class="modal-content">	
   				<!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">Detalles</h4>
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
											<label>Nombre</label>
											<input class="form-control" type="text" id="txtNombreSubGrupoVer" style="text-transform:uppercase;" placeholder="Nombre SubGrupo" readonly/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Prefijo</label>
											<input class="form-control" type="text" id="txtPrefijoSubGrupoVer" style="text-transform:uppercase;" placeholder="Prefijo" readonly/>
										</div>										
										<div class="col-xs-12 col-sm-3">
											<label>Tipo de Prioridad</label>
											<select class="form-control" id="cboPrioridadVer" readonly>
												<option value="0">--Seleccione--</option>																																				
											</select>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Secuencia</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtSecuenciaVer"  placeholder="Secuencia" readonly/>
										</div>
									</div>							
								</div>														
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-4">
											<label>Descripcion Corta</label>
											<input class="form-control" type="text" id="txtDescripcionCortaSubGrupoVer" style="text-transform:uppercase;" placeholder="Descripcion Corta" readonly/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Prioridad Algoritmo 2</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo2Ver" placeholder="10" readonly/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Prioridad Algoritmo 3</label>
											<input class="form-control" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtPrioridadAlgoritmo3Ver" placeholder="20" readonly/>
										</div>
										<div class="col-xs-12 col-sm-2">
											<label>Agrupador</label>
											<select class="form-control" id="cboAgrupadorVer" readonly>
												<option value="0">Seleccione</option>
											</select>
										</div>																				
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Descripcion</label>
<!-- 											<textarea class="form-control rounded-0" id="txtDescripcionLargaSubGrupoEdit" rows="3"></textarea> -->
											<textarea id="txtDescripcionLargaSubGrupoVer" class="textarea"
	                          						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; 
	                          						border: 1px solid #dddddd; padding: 10px;" readonly></textarea>
										</div>
									</div>
								</div>														
							</div>
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
<script src="librerias/admin/plugins/summernote/summernote-bs4.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

  <script src="librerias/general/general.js"></script> 
  
<script>

$("#volverSucursal").click(function() {
	var idUsuario = '${usuario.iUsuarioId}';
	console.log("idusuaruio: "+idUsuario);
	window.location.href = 'mostrarsucursalxusuario.app?idUsuario='+idUsuario;

});

$("#btnOpenModal").click(function() {
	$("#txtNombreGrupo").val("");			
	$("#txtPrefijoGrupo").val("");
	$("#cboAlgoritmo").val("");
	$("#cboArea").val("");
	$("#txtDescripcionCorta").val("");
	$("#txtDescripcionLarga").val("");
	$("#txtKioskoA3Entrada").val("");
	$("#txtKioskoA3Minimo").val("");
	$("#txtHoraInicio").val("");
	$("#txtHoraFin").val("");
	$("#nuevoGrupo").modal("show");
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

 function fnMostrarSubGrupos(id){
	console.log('id->>>'+id);

	$.ajax({ 
		type: 'POST', 
		url: 'getgrupobyid.app',
		data: {idGrupo: id},		
		success: function (response) {
			var data = response.data;
			$("#nombreGrupo").html(data.nombre);
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarsubgruposxidgrupo.app',
		data: {idGrupo: id},
		success: function (response) {
			var data = response.data;			
			$('#tblListadoSubGrupos tbody').empty();
			var html;						
			for(var i=0; i<data.length; i++){									
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].prefijo+'</span></td>' +
				'<td><span>'+data[i].idPrioridad+'</span></td>' +				
				'<td><button type="button" class="btn btn-info" onclick="fnDetallesSubGrupo('+data[i].id+')" title="Ver Detalles"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarSubGrupo('+data[i].id+')" title="Editar SubGrupo"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupo('+data[i].id+')" title="Eliminar SubGrupo"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoSubGrupos tbody').append(html);
    		}	
// 			$('#tblListadoSubGrupos').DataTable();
		}
	});	
 }

 	function fnAddSubGrupos(id){
		$("#txtNombreSubGrupo").val("");			
		$("#txtPrefijoSubGrupo").val("");
		$("#cboPrioridad").val("");
		$("#txtSecuencia").val("");		
		$("#txtDescripcionCortaSubGrupo").val("");
		$("#txtDescripcionLargaSubGrupo").val("");
		$("#txtPrioridadAlgoritmo2").val("");
		$("#txtPrioridadAlgoritmo3").val("");
		$("#cboAgrupador").val("");
		$('#txtIdGrupo').val(id);
		$('#nuevoSubGrupo').modal('show');
		$("#msgValidate").removeClass("show");
	}
 
//grabar Grupo 
	$("#btnGrabarGrupoXSucursal").click(function() {
		var idSucursal = '${usuario.iSucursal}';
		var nombreGrupo = $("#txtNombreGrupo").val();			
		var prefijoGrupo = $("#txtPrefijoGrupo").val();
		var idAlgoritmo = $("#cboAlgoritmo").val();
		var idArea = $("#cboArea").val();
		var descripcionCorta = $("#txtDescripcionCorta").val();
		var descripcionLarga = $("#txtDescripcionLarga").val();
		var kioskoAlg3Entrada = $("#txtKioskoA3Entrada").val();
		var kioskoAlg3Minimo = $("#txtKioskoA3Minimo").val();
		var horaInicio = $("#txtHoraInicio").val();
		var horaFin = $("#txtHoraFin").val();
			
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'savegruposxsede.app',
	 		data: {
				idSucursal: idSucursal, 
				nombreGrupo: nombreGrupo, 
		 		prefijoGrupo: prefijoGrupo, 
		 		idAlgoritmo: idAlgoritmo, 
		 		idArea: idArea, 
		 		descripcionCorta:descripcionCorta, 
		 		descripcionLarga: descripcionLarga, 
		 		kioskoAlg3Entrada: kioskoAlg3Entrada,
		 		kioskoAlg3Minimo: kioskoAlg3Minimo, 
		 		horaInicio: horaInicio,
		 		horaFin: horaFin
	 		}, 	    		
	 		success: function (response) {
	 			var data = response.data;
	 			if(response.success==true){
	 				$.alert({
                        title: 'Valido',
                        content: nombreGrupo.toUpperCase() + ' Registrado correctamente.',
                    });
	 				$('#nuevoGrupo').modal('hide');	
		 			var html;
		 			$('#tblListadoGrupos tbody').empty();
		 			for(var i=0; i<data.length; i++){				
						html = '<tr>' +
						'<td><span>'+data[i].nombre+'</span></td>' +
						'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +				
						'<td><button type="button" onclick="fnMostrarSubGrupos('+data[i].id+')" class="btn btn-info" title="Ver SubGrupos"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarGrupo('+data[i].id+')" title="Editar Grupo"><i class="fa fa-edit"></i></button><button type="button" onclick="fnAddSubGrupos('+data[i].id+')" class="btn btn-warning" title="Nuevo SubGrupo"><i class="far fa-address-card"></i></button><button type="button" class="btn btn-danger" title="Eliminar Grupo" onclick="fnEliminarGrupo('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        					
					$('#tblListadoGrupos tbody').append(html);
		    		}	
// 					$('#tblListadoGrupos').DataTable();
	 			}
	 			else{
		 			console.log("error");
	 				$.alert({
                        title: 'Error',
                        content: 'Ya existe un grupo llamado '+nombreGrupo.toUpperCase(),
                    });
	 				$('#nuevoGrupo').modal('hide');
	 			}
	 		}
 		});
	});

	$("#btnGrabarSubGrupo").click(function() {
		var idGrupo =  $('#txtIdGrupo').val();
		console.log('idGrupo->>>'+idGrupo);
		var nombreSubGrupo = $("#txtNombreSubGrupo").val();			
		var prefijoSubGrupo = $("#txtPrefijoSubGrupo").val();
		var idPrioridad = $("#cboPrioridad").val();
		var idSecuencia = $("#txtSecuencia").val();		
		var descCortaSubGrupo = $("#txtDescripcionCortaSubGrupo").val();
		var descLargaSubGrupo = $("#txtDescripcionLargaSubGrupo").val();
		var prioridadAlgoritmo2 = $("#txtPrioridadAlgoritmo2").val();
		var prioridadAlgoritmo3 = $("#txtPrioridadAlgoritmo3").val();
		var idAgrupador = $("#cboAgrupador").val();
					
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'savesubgruposxsede.app',
	 		data: {idGrupo: idGrupo, nombreSubGrupo: nombreSubGrupo, 
	 			prefijoSubGrupo: prefijoSubGrupo, idPrioridad: idPrioridad, 
	 			idSecuencia: idSecuencia, descCortaSubGrupo:descCortaSubGrupo, descLargaSubGrupo: descLargaSubGrupo, 
	 			prioridadAlgoritmo2: prioridadAlgoritmo2, prioridadAlgoritmo3: prioridadAlgoritmo3, idAgrupador: idAgrupador}, 	    		
	 		success: function (response) {
	 			var mensaje = response.message;
	 			var data = response.data;
	 			if(response.success==true){
	 				$.alert({
                        title: 'Valido',
                        content: nombreSubGrupo.toUpperCase() + ' Registrado correctamente.',
                    });
					$('#nuevoSubGrupo').modal('hide');
					var	html='';
					$('#tblListadoSubGrupos tbody').empty();					
					for(var i=0; i<data.length; i++){									
						html = '<tr>' +
						'<td><span>'+data[i].nombre+'</span></td>' +
						'<td><span>'+data[i].prefijo+'</span></td>' +
						'<td><span>'+data[i].idPrioridad+'</span></td>' +				
						'<td><button type="button" class="btn btn-info" onclick="fnDetallesSubGrupo('+data[i].id+')" title="Ver Detalles"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarSubGrupo('+data[i].id+')" title="Editar SubGrupo"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupo('+data[i].id+')" title="Eliminar SubGrupo"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
					  '</tr>';	        					
					$('#tblListadoSubGrupos tbody').append(html);
		    		}	
// 					$('#tblListadoSubGrupos').DataTable();
					$.ajax({ 
						type: 'POST', 
						url: 'getgrupobyid.app',
						data: {idGrupo: idGrupo},		
						success: function (response) {
							var data = response.data;
							$("#nombreGrupo").html(data.nombre);
						}
					});
	 			}
	 			else{
		 			console.log("error");
	 				$.alert({
                        title: 'Error',
                        content: 'Ya existe un subgrupo llamado '+nombreSubGrupo.toUpperCase(),
                    });
	 				$('#nuevoSubGrupo').modal('hide');
	 			}
	 		}	
 		});				  
	});
	


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
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxsede.app',
		data: {idSucursal: idSucursal},
		success: function (response) {
			var data = response.data;	
			var html;
			$('#tblListadoGrupos tbody').empty();					
			for(var i=0; i<data.length; i++){				
				html = '<tr>' +
				'<td><span>'+data[i].nombre+'</span></td>' +
				'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +				
				'<td><button type="button" onclick="fnMostrarSubGrupos('+data[i].id+')" class="btn btn-info" title="Ver SubGrupos"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarGrupo('+data[i].id+')" title="Editar Grupo"><i class="fa fa-edit"></i></button><button type="button" onclick="fnAddSubGrupos('+data[i].id+')" class="btn btn-warning" title="Nuevo SubGrupo"><i class="far fa-address-card"></i></button><button type="button" class="btn btn-danger" title="Eliminar Grupo" onclick="fnEliminarGrupo('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
			  '</tr>';	        					
			$('#tblListadoGrupos tbody').append(html);
    		}	
// 			$('#tblListadoGrupos').DataTable();
		}
	});

	//listar areas

	$.ajax({ 
		type: 'POST', 
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {
                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboArea");
            });	
		}
	});

	//listar algoritmos
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
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaprioridad.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboPrioridad");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listarareaxsurcursal.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboAreaEdit");
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
                        .appendTo("#cboAlgoritmoEdit");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaprioridad.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboPrioridadEdit");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaprioridad.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.descripcion)
                        .appendTo("#cboPrioridadVer");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaragrupadores.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.prefijo)
                        .appendTo("#cboAgrupador");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaragrupadores.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.prefijo)
                        .appendTo("#cboAgrupadorEdit");
            });	
		}
	});

	$.ajax({ 
		type: 'POST', 
		url: 'listaragrupadores.app',		 	    		
		success: function (response) {
			var data = response.data;
			$.each(data, function (index, item) {
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.prefijo)
                        .appendTo("#cboAgrupadorVer");
            });	
		}
	});
});

// 07-09-2019

$(function () {
    // Summernote
    $('.textarea').summernote();
})

function fnEditarGrupo(id){
	$('#editarGrupo').modal('show');
	console.log('idGrupo->>'+id);
	var idGrupo =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getgrupobyid.app',
		data: {idGrupo: idGrupo},		
		success: function (response) {
			var data = response.data;
			var fini = new Date();
			var ffin = new Date();
			fini.setTime(data.horaInicio); 
			ffin.setTime(data.horaFin); 
			$("#txtIdGrupo").val(data.id);	 				
 			$("#txtNombreGrupoEdit").val(data.nombre);		
 			$("#txtPrefijoGrupoEdit").val(data.prefijo);			
 			$("#cboAlgoritmoEdit").val(data.idAlgoritmo);
 			$("#cboAreaEdit").val(data.idArea);
 			$("#txtDescripcionCortaEdit").val(data.descripcionCorta);
 			$("#txtDescripcionLargaEdit").val(data.descripcionLarga);
 			$("#txtKioskoA3EntradaEdit").val(data.kioskoAlg3Entrada);
 			$("#txtKioskoA3MinimoEdit").val(data.kioskoAlg3Minimo);
 			$("#txtHoraInicioEdit").val(time_format(fini));
 			$("#txtHoraFinEdit").val(time_format(ffin));
		}
	});
}


$("#btnEditarGrupoXSucursal").click(function() {
	var idSucursal = '${usuario.iSucursal}';
	var idGrupo = $("#txtIdGrupo").val();
	var nombreEdit =  $("#txtNombreGrupoEdit").val();		
	var prefijoEdit = $("#txtPrefijoGrupoEdit").val();			
	var algEdit = $("#cboAlgoritmoEdit").val();
	var areaEdit = $("#cboAreaEdit").val();
	var descripCortaEdit = $("#txtDescripcionCortaEdit").val();
	var kioskoEntradaEdit = $("#txtKioskoA3EntradaEdit").val();
	var kioskoMinimoEdit = $("#txtKioskoA3MinimoEdit").val();
	var descripLargaEdit = $("#txtDescripcionLargaEdit").val();
	var horaInicioEdit = $("#txtHoraInicioEdit").val();
	var horaFinEdit = $("#txtHoraFinEdit").val();
	
	$.ajax({ 
 		type: 'POST', 
 		url: 'editgrupos.app',
 		data: {
			idGrupo: idGrupo, 
			idSucursal: idSucursal, 
			nombreEdit: nombreEdit, 
 	 		prefijoEdit: prefijoEdit, 
 	 		algEdit: algEdit, 
 	 		areaEdit: areaEdit, 
 	 		descripCortaEdit: descripCortaEdit, 
 	 		kioskoEntradaEdit: kioskoEntradaEdit, 
 	 		kioskoMinimoEdit: kioskoMinimoEdit,	
 	 		descripLargaEdit: descripLargaEdit,
 	 		horaInicioEdit: horaInicioEdit, 
 	 		horaFinEdit: horaFinEdit
 		},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombreEdit.toUpperCase() + ' Editado correctamente.',
                });
 				$('#editarGrupo').modal('hide');	
				var	html='';
				$('#tblListadoGrupos tbody').empty();					
				for(var i=0; i<data.length; i++){				
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +
					'<td><button type="button" onclick="fnMostrarSubGrupos('+data[i].id+')" class="btn btn-info" title="Ver SubGrupos"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarGrupo('+data[i].id+')" title="Editar Grupo"><i class="fa fa-edit"></i></button><button type="button" onclick="fnAddSubGrupos('+data[i].id+')" class="btn btn-warning" title="Nuevo SubGrupo"><i class="far fa-address-card"></i></button><button type="button" class="btn btn-danger" title="Eliminar Grupo" onclick="fnEliminarGrupo('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoGrupos tbody').append(html);
	    		}	
// 				$('#tblListadoGrupos').DataTable();
 			}
 			else{
 				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un grupo llamado '+nombreEdit.toUpperCase(),
                });
 				$('#editarGrupo').modal('hide');
 	 		}
 		}	
	});
});


// editar subgrupo

function fnEditarSubGrupo(id){
	$('#editarSubGrupo').modal('show');

	var idSubGrupo =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getsubgrupobyid.app',
		data: {idSubGrupo: idSubGrupo},		
		success: function (response) {
			var data = response.data;	
			$("#txtIdGrupoEdit").val(data.idGrupo);
			$("#txtIdSubGrupo").val(data.id);			
			$("#txtNombreSubGrupoEdit").val(data.nombre);		
 			$("#txtPrefijoSubGrupoEdit").val(data.prefijo);			
 			$("#cboPrioridadEdit").val(data.idPrioridad);
 			$("#txtSecuenciaEdit").val(data.secueciaKiosko);
 			$("#txtDescripcionCortaSubGrupoEdit").val(data.descripcionCorta);
 			$("#txtDescripcionLargaSubGrupoEdit").val(data.descripcion);
 			$("#txtPrioridadAlgoritmo2Edit").val(data.priorTiempoAlg2);
 			$("#txtPrioridadAlgoritmo3Edit").val(data.priorRatioAlg3);
 			$("#cboAgrupadorEdit").val(data.agrupador);
		}
	});
}

$("#btnEditarSubGrupoXGrupo").click(function() {
	var idGrupo =  $("#txtIdGrupoEdit").val();
	console.log("entro subgrupo de grupo: "+idGrupo);
	var idSubGrupo = $("#txtIdSubGrupo").val();
	console.log("idsubgrupo: "+idSubGrupo);
	var nombreSubGrupoEdit =  $("#txtNombreSubGrupoEdit").val();		
	var prefijoSubGrupoEdit = $("#txtPrefijoSubGrupoEdit").val();			
	var idPrioridadEdit = $("#cboPrioridadEdit").val();
	var idSecuenciaEdit = $("#txtSecuenciaEdit").val();
	var descCortaSubGrupoEdit = $("#txtDescripcionCortaSubGrupoEdit").val();
	var descLargaSubGrupoEdit = $("#txtDescripcionLargaSubGrupoEdit").val();
	var prioridadAlgoritmo2Edit = $("#txtPrioridadAlgoritmo2Edit").val();
	var prioridadAlgoritmo3Edit = $("#txtPrioridadAlgoritmo3Edit").val();
	var idAgrupadorEdit = $("#cboAgrupadorEdit").val();
					
	$.ajax({ 
 		type: 'POST', 
 		url: 'editsubgrupos.app',
 		data: {idGrupo: idGrupo, idSubGrupo: idSubGrupo, nombreSubGrupoEdit: nombreSubGrupoEdit, 
 			prefijoSubGrupoEdit: prefijoSubGrupoEdit, idPrioridadEdit: idPrioridadEdit, 
 			idSecuenciaEdit: idSecuenciaEdit, descCortaSubGrupoEdit: descCortaSubGrupoEdit, 
 			descLargaSubGrupoEdit: descLargaSubGrupoEdit, prioridadAlgoritmo2Edit: prioridadAlgoritmo2Edit,
 			prioridadAlgoritmo3Edit: prioridadAlgoritmo3Edit, idAgrupadorEdit: idAgrupadorEdit},
 		success: function (response) {
 			var mensaje = response.message;	 			
 			var data = response.data;
 			if(response.success==true){
 				$.alert({
                    title: 'Valido',
                    content: nombreSubGrupoEdit.toUpperCase() + ' Editado correctamente.',
                });
				$('#editarSubGrupo').modal('hide');
				var	html='';
				$('#tblListadoSubGrupos tbody').empty();					
				for(var i=0; i<data.length; i++){									
					html = '<tr>' +
					'<td><span>'+data[i].nombre+'</span></td>' +
					'<td><span>'+data[i].prefijo+'</span></td>' +
					'<td><span>'+data[i].idPrioridad+'</span></td>' +				
					'<td><button type="button" class="btn btn-info" onclick="fnDetallesSubGrupo('+data[i].id+')" title="Ver Detalles"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarSubGrupo('+data[i].id+')" title="Editar SubGrupo"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupo('+data[i].id+')" title="Eliminar SubGrupo"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
				  '</tr>';	        					
				$('#tblListadoSubGrupos tbody').append(html);
	    		}	
				$('#tblListadoSubGrupos').DataTable();
 			}
 			else{
 				console.log("error");
 				$.alert({
                    title: 'Error',
                    content: 'Ya existe un subgrupo llamado '+nombreSubGrupoEdit.toUpperCase(),
                });
 				$('#editarSubGrupo').modal('hide');
 	 		}
 		}	
	});				  
});

function fnEliminarSubGrupo(id){
	var idGrupo = $("#txtIdGrupo").val();
	var idSubGrupo =id;

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
						url: 'eliminarsubgrupo.app',
						data: {idGrupo: idGrupo, idSubGrupo: idSubGrupo},		
						success: function (response) {
							var data = response.data;
							$('#tblListadoSubGrupos tbody').empty();
							var html;			
							for(var i=0; i<data.length; i++){									
								html = '<tr>' +
								'<td><span>'+data[i].nombre+'</span></td>' +
								'<td><span>'+data[i].prefijo+'</span></td>' +
								'<td><span>'+data[i].idPrioridad+'</span></td>' +				
								'<td><button type="button" class="btn btn-info" onclick="fnDetallesSubGrupo('+data[i].id+')" title="Ver Detalles"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarSubGrupo('+data[i].id+')" title="Editar SubGrupo"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-danger" onclick="fnEliminarSubGrupo('+data[i].id+')" title="Eliminar SubGrupo"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoSubGrupos tbody').append(html);
				    		}	
				// 			$('#tblListadoSubGrupos').DataTable();
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


function fnDetallesSubGrupo(id){
	$('#detallesSubGrupo').modal('show');
	var idSubGrupo =id;
	
	$.ajax({ 
		type: 'POST', 
		url: 'getsubgrupobyid.app',
		data: {idSubGrupo: idSubGrupo},		
		success: function (response) {
			var data = response.data;				
			$("#txtNombreSubGrupoVer").val(data.nombre);		
 			$("#txtPrefijoSubGrupoVer").val(data.prefijo);			
 			$("#cboPrioridadVer").val(data.idPrioridad);
 			$("#txtSecuenciaVer").val(data.secueciaKiosko);
 			$("#txtDescripcionCortaSubGrupoVer").val(data.descripcionCorta);
 			$("#txtDescripcionLargaSubGrupoVer").val(data.descripcion);
 			$("#txtPrioridadAlgoritmo2Ver").val(data.priorTiempoAlg2);
 			$("#txtPrioridadAlgoritmo3Ver").val(data.priorRatioAlg3);
 			$("#cboAgrupadorVer").val(data.agrupador);
		}
	});
}


function fnEliminarGrupo(id){
	var idSucursal = '${usuario.iSucursal}';
	var idGrupo =id;

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
						url: 'eliminargrupo.app',
						data: {idGrupo: idGrupo, idSucursal: idSucursal},		
						success: function (response) {
							var data = response.data;	
							$('#tblListadoGrupos tbody').empty();
							var html;			
							for(var i=0; i<data.length; i++){				
								html = '<tr>' +
								'<td><span>'+data[i].nombre+'</span></td>' +
								'<td><span>'+data[i].nombreAlgoritmo+'</span></td>' +				
								'<td><button type="button" onclick="fnMostrarSubGrupos('+data[i].id+')" class="btn btn-info" title="Ver SubGrupos"><i class="fas fa-eye"></i></button><button type="button" class="btn btn-success" onclick="fnEditarGrupo('+data[i].id+')" title="Editar Grupo"><i class="fa fa-edit"></i></button><button type="button" onclick="fnAddSubGrupos('+data[i].id+')" class="btn btn-warning" title="Nuevo SubGrupo"><i class="far fa-address-card"></i></button><button type="button" class="btn btn-danger" title="Eliminar Grupo" onclick="fnEliminarGrupo('+data[i].id+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>' +
							  '</tr>';	        					
							$('#tblListadoGrupos tbody').append(html);
				    		}
				// 			$('#tblListadoSubGrupos').DataTable();
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