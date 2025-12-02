<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>ICLASSQ MATIAS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">
  <script src="librerias/libBase/include.js"></script>
  <script src="librerias/libBase/include.essalud.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
  
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
  
  
</head>
<body>  

<div id="divCabecera" class="navbar navbar-default navbar-fixed-top"
		role="navigation">
		<!--Barra superior-->
		<div class="navbar-header">
			<button id="btnNavbar" type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#divNavPrinicipal">
				<span class="sr-only">Toggle</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand navLogo" href="#">
			</a>
		</div>		
		<!--Barra azul-->
		<div id="divNavAzul"
			class="navbar-collapse collapse hidden-xs backAzul1 text-small">
			<p class="navbar-text navbar-left colBlanco">
				<span class="spanFecha negrita">SISTEMA DE CONTROL DE COLAS ESSALUD</span>
			</p>
			<ul id="ulMenu02" class="nav navbar-nav navbar-right">
				<!--Usuario-->
				<li id="liOpcionUsuario2" class=""><a id="aOpcionUsuario2"
					href="https://e-menu.sunat.gob.pe/cl-ti-itmenu/MenuInternet.htm?pestana=*&amp;agrupacion=*#"
					class="colBlanco negrita"> <span>Bienvenido, </span> <span>${usuario.vUsuarioNombres} ${usuario.vUsuarioApPaterno} ${usuario.vUsuarioApMaterno}
							</span> <span class="caret"></span> <!--TODO: Truncar-->
				</a>
					</li>
				<!--Domicilio-->
				<li class="liEstadoDomicilio">
					<p class="navbar-text navbar-left colBlanco negrita pEstadoDomicilio">
							<span>Perfil:</span> <span class="spanEstadoDomicilio" title="">${usuario.rolName}</span>
					</p>
				</li>
				<!--Salir-->
				<li>&nbsp;&nbsp;
					<button id="btnSalir"
						class="btn navbar-btn colBlanco backCeleste1 sinRadio aOpcionSalir"
						type="button">&nbsp;Salir&nbsp;</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</li>
			</ul>
			<!--/nav navbar-nav navbar-right -->
		</div>		
	</div>
	<!--/.navbar -->

	<!-- Nuevo Usuario -->
		<div class="modal fade" id="nuevoUsuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="lblNuevoUsuarioModalLabel">Nuevo Usuario</h4>
		      </div>
		      <div class="modal-body">
		      	<fieldset class="scheduler-border">						
						<form>
							<div class="row">
								<div class="col-xs-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-3">
											<label>Sede</label>
											<select class="form-control" id="cboSede">
												<option>--Seleccione--</option>
												<option value="01">Ica</option>
												<option value="02">Huancavelica</option>																								
											</select>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Paterno</label>
											<input class="form-control" type="text" id="txtAPaterno" style="text-transform:uppercase;" placeholder="Apellidos Paterno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Apellido Materno</label>
											<input class="form-control" type="text" id="txtAMaterno" style="text-transform:uppercase;" placeholder="Apellidos Materno"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Nombres</label>
											<input class="form-control" type="text" id="txtNombres" style="text-transform:uppercase;" placeholder="Nombres"/>
										</div>										
									</div>									
								</div>																
							</div>
							<div class="row">
								<div class="col-xs-12 form-group">									
									<div class="row">
										<div class="col-xs-12 col-sm-3">
											<label>Rol</label>
											<select class="form-control" id="cboRol">
												<option value="0">--Seleccione--</option>
												<option value="1">ADMINISTRADOR GENERAL</option>
												<option value="2">ADMINISTRADOR SEDE</option>
												<option value="3">CONSULTA</option>												
												<option value="4">VENTANILLA</option>
												<option value="5">MONITOR</option>
												<option value="6">KIOSKO</option>												
											</select>
										</div>										
										<div class="col-xs-12 col-sm-3">
											<label>Direccion IP</label>
											<input class="form-control" type="text" id="txtIp" placeholder="127.0.0.1"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Login</label>
											<input class="form-control" type="text" id="txtLogin" style="text-transform:uppercase;" placeholder="Login de usuario"/>
										</div>
										<div class="col-xs-12 col-sm-3">
											<label>Correo</label>
											<input class="form-control" type="text" id="txtEmail" style="text-transform:uppercase;" placeholder="email@gmail.com"/>
										</div>										
									</div>
								</div>
							</div>
<!-- 							ventanas ocultas							 -->
							<div class="row" id="rowVistaGrupos" style="display: none">
								<div class="col-xs-12 form-group">									
									<div class="row">
										<div class="col-xs-12 col-sm-3">
											<label>Seleccione Grupo</label>
											<select class="form-control" id="cboGrupoxKiosko">																								
											</select>
										</div>																				
									</div>
								</div>
							</div>
							
							<div class="row" id="rowVistaGruposMultiple" style="display: none">
								<div class="col-xs-12 form-group">									
									<div class="row">
										<div class="col-xs-12 col-sm-3">
											<label>Seleccione Grupo(s)</label>
											<select class="form-control selectpicker w-100" id="cboGruposMultiple" multiple>																								
											</select>
										</div>																				
									</div>
								</div>
							</div>
							
						</form>
				</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		        <button type="button" class="btn btn-primary" id="btnGrabarUsuario">Guardar</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 		fin de usuarios -->
		
<!-- 		LISTADO DE SUB GRUPOS X GRUPO -->
		<div class="modal fade" id="verSubGruposXGrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="lblGruposXKiosko">Listado de Sub Grupos</h4>
		      </div>
		      <div class="modal-body">
		      	<fieldset class="scheduler-border">						
						<form>
							<div class="row">
								<div class="col-xs-12 form-group">
									<table id="tblListadoSubGrupoXGrupo" class="table table-striped table-bordered" style="width:100%">
								        <thead>
								            <tr>
								                <th>Sub Grupo</th>
								                <th>Prefijo</th>
								                <th>Prioridad</th>								                						                
								                <th>Acciones</th>
								            </tr>
								        </thead>
								        	<tr>
								                <td>PREFERENCIAL</td>
								                <td>PR</td>
								                <td>1</td>								                						                
								                <td><button type="button" class="btn btn-danger">Eliminar</button></td>
								            </tr>
								        <tbody>
											            
								        </tbody>									        
								    </table>								
								</div>																
							</div>
														
						</form>
				</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		        <button type="button" class="btn btn-primary" id="btnAddSubGrupoAGrupo">Grabar</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 		fin de añadir sub grupos grupos -->		
		
		
		<!-- ver grupos asiganos a kisko-->
		<div class="modal fade" id="editarGrupoAKiosko" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="lblGruposXKiosko">Asignar Grupo</h4>
		      </div>
		      <div class="modal-body">
		      	<fieldset class="scheduler-border">						
						<form>
							<div class="row">
								<div class="col-xs-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<label>Grupos Sede Ica</label>
											<select class="form-control" id="cboEditarGrupoAKiosko">
												<option>--Seleccione--</option>																																				
											</select>
										</div>																				
									</div>									
								</div>																
							</div>
														
						</form>
				</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		        <button type="button" class="btn btn-primary" id="btnEditarGrupoAKiosko">Grabar</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 		fin de añadir grupos -->
		
<!-- 		Nuevo grupo -->
		<div class="modal fade" id="nuevoGrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Nuevo Grupo</h4>
		      </div>
		      <div class="modal-body">
		      	<fieldset class="scheduler-border">						
						<form>
							<div class="row">
								<div class="col-xs-12 form-group">
									<div class="row">
										<div class="col-xs-12 col-sm-4">
											<label>Grupo</label>
											<input class="form-control" type="text" id="txtNombreGrupo" style="text-transform:uppercase;" placeholder="Nombre Grupo"/>
										</div>
										<div class="col-xs-12 col-sm-4">
											<label>Prefijo</label>
											<input class="form-control" type="text" id="txtPrefijoGrupo" style="text-transform:uppercase;" placeholder="Prefijo"/>
										</div>										
										<div class="col-xs-12 col-sm-4">
											<label>Tipo de Asignacion</label>
											<select class="form-control" id="cboTipoAsignacion">
												<option value="0">--Seleccione--</option>
												<option value="1">Secuencial</option>
												<option value="2">Prioridades</option>
												<option value="3">Ratios</option>												
												<option value="4">Proporciones</option>																								
											</select>
										</div>										
									</div>									
								</div>																
							</div>							
						</form>
				</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		        <button type="button" id="btnGrabarGrupo" class="btn btn-primary">Guardar</button>
		      </div>
		    </div>
		  </div>
		</div>

	<div id="divContainerAplicacion" class="container divContainerIframe backPlomo1">
		<div class="row">			
			<div id="iDivApplication"
				class="embed-responsive embed-responsive-4by3">
				<br>
				<div class="container col-md-10 col-md-offset-1">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Datos del Proyecto</h3>
						</div>
						<div class="panel-body">
							<div class="row col-md-offset-0">
								<div class="form-group col-md-6">
									<label for="nroRUC" class="col-md-4 control-label">Seleccionar Zona:</label>
									<div class="col-md-8">
										<select class="form-control" id="cboProductos" name="cboProductos">
									      <option>--TODOS--</option>									      
									    </select>
									</div>
								</div>
								<div class="form-group col-md-6">
									<label for="nombre" class="col-md-4 control-label">RESPONSABLE:</label>
									<div class="col-md-8">
										<select class="form-control" id="cboResponsable">
									      <option>-- Seleccione --</option>
									      <option>Peve Saldaña Diana</option>
									      <option>Manrique Arias Jhony</option>
									      <option>Almeida Solari Daysi</option>
									      <option>Rodas Huaman Addy</option>
									      <option>Palomino Villegas Jose</option>
									    </select>
									</div>
								</div>
							</div>							
						</div>
					</div>
					<div class="panel panel-primary">						
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-2">
							      	<div class="btn-group-vertical  btn-group-lg">
									    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Usuarios</button>
									    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp;Parametros</button>
									    <button type="button" class="btn btn-primary" id="btnKioskos"><span class="glyphicon glyphicon-hd-video" aria-hidden="true"></span>&nbsp;Kioskos</button>
									    <button type="button" class="btn btn-primary" id="btnMonitores"><span class="glyphicon glyphicon-sound-dolby" aria-hidden="true"></span>&nbsp;Monitores</button>
									    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>&nbsp;Reportes</button>
									    <button type="button" class="btn btn-primary" id="btnGrupos"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>&nbsp;Grupos</button>        
							  		</div>
							    </div>
							    <div class="col-sm-10">
							      	<div class="panel panel-primary" id="pnlUsuarios">
							      		<div class="panel-heading">
											<h3 class="panel-title">Usuarios</h3>
										</div>						
										<div class="panel-body">
											<div class="row">
												<div class="col-sm-12">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoUsuario"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Nuevo</button>
												</div><hr/>
												
												<table id="tblListadoUsuarios" class="table table-striped table-bordered" style="width:100%">
											        <thead>
											            <tr>
											                <th>Apellidos y Nombres</th>
											                <th>Login</th>
											                <th>Rol</th>						                
											                <th>Estado</th>						                
											                <th>Acciones</th>
											            </tr>
											        </thead>
											        <tbody>
											            
											        </tbody>
											        <tfoot>
											            <tr>
											                <th>Apellidos y Nombres</th>
											                <th>Login</th>
											                <th>Rol</th>						                
											                <th>Estado</th>						                
											                <th>Acciones</th>
											            </tr>
											        </tfoot>
											    </table>											    										    															
											</div>							
										</div>
									</div>
<!-- 									listado de kioskos									 -->
									<div class="panel panel-primary" id="pnlKioskos" style="display:none">
							      		<div class="panel-heading">
											<h3 class="panel-title">Kioskos</h3>
										</div>						
										<div class="panel-body">
											<div class="row">																								
												<table id="tblListadoKioskos" class="table table-striped table-bordered" style="width:100%">
											        <thead>
											            <tr>											                	
											                <th>Login</th>
											                <th>Direccion IP</th>
											                <th>Ingresar con IP</th>
											                <th>Grupo</th>											                					                
											                <th>Acciones</th>
											            </tr>
											        </thead>
											        <tbody>
											            
											        </tbody>
											        <tfoot>
											            <tr>
											                <th>Login</th>
											                <th>Direccion IP</th>
											                <th>Ingresar con IP</th>
											                <th>Grupo</th>											                					                
											                <th>Acciones</th>
											            </tr>
											        </tfoot>
											    </table>											    										    															
											</div>							
										</div>
									</div>
<!-- 									fin de kioskos -->
	
					
<!-- 									listado de grupos -->

									<div class="panel panel-primary" id="pnlGrupos" style="display:none">
							      		<div class="panel-heading">
											<h3 class="panel-title">Grupos</h3>
										</div>						
										<div class="panel-body">
											<div class="row">
												<div class="col-sm-12">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoGrupo"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Nuevo</button>
												</div><hr/>												
												<table id="tblListadoGrupos" class="table table-striped table-bordered" style="width:100%">
											        <thead>
											            <tr>
											                <th>Grupo</th>
											                <th>Prefijo</th>
											                <th>Algoritmo</th>											                						                
											                <th>Acciones</th>
											            </tr>
											        </thead>
											        <tbody>
											            
											        </tbody>
											        <tfoot>
											            <tr>
											                <th>Grupo</th>
											                <th>Prefijo</th>
											                <th>Algoritmo</th>											                						                
											                <th>Acciones</th>
											            </tr>
											        </tfoot>
											    </table>											    										    															
											</div>							
										</div>
									</div>
<!-- 									fin de grupos -->
							    </div>											
							</div>							
						</div>
					</div>
				</div>				
			</div>
		</div>
	</div>
	<script type="text/javascript">

		$('#cboSede').on('change', function() {
// 			var idSede = this.value;
			var idSede = 1;
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'listartablamaestrabygrupo.app',
	    		data: {grupo: idSede}, 	    		
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);
	    			$.each(data, function (index, item) {
	                    console.log(data);
                        $("<option/>")
                                .attr("value", item.valor)
                                .text(item.descripcion)
                                .appendTo("#cboGrupos");
                    });	
	    		}
	    	});	
			
		});

		//listar grupos 
		$('#cboRol').on('change', function() {
			var idRol = this.value;			
			var idSede = 1;			
			if(idRol==6){
				$("#rowVistaGrupos").css("display", "block");
				$("#rowVistaGruposMultiple").css("display", "none");
				$.ajax({ 
		    		type: 'POST', 
		    		url: 'listargruposxsede.app',
		    		data: {idSede: idSede}, 	    		
		    		success: function (response) {
		    			var data = response.data;
						console.log('data->>>');
		    			console.log(data);
		    			$.each(data, function (index, item) {
		                    console.log(data);
	                        $("<option/>")
	                                .attr("value", item.id)
	                                .text(item.nombre)
	                                .appendTo("#cboGrupoxKiosko");
	                    });	
		    		}
		    	});
			}	
			else if((idRol==4) || (idRol==5)){								
				$("#rowVistaGruposMultiple").css("display", "block");
				$("#rowVistaGrupos").css("display", "none");
				$.ajax({ 
		    		type: 'POST', 
		    		url: 'listargruposxsede.app',
		    		data: {idSede: idSede}, 	    		
		    		success: function (response) {
		    			var data = response.data;
						console.log('data->>>');
		    			console.log(data);
		    			$.each(data, function (index, item) {
		                    console.log(data);
	                        $("<option/>")
	                                .attr("value", item.id)
	                                .text(item.nombre)
	                                .appendTo("#cboGruposMultiple");
	                    });	
		    		}
		    	});
			}
			else{
				$("#rowVistaGrupos").css("display", "none");
				$("#rowVistaGruposMultiple").css("display", "none");				
			}		
		});
		
		//mostrar Grupos
		$( "#btnGrupos" ).click(function() {
			//esconder
			$("#pnlUsuarios").css("display", "none");
			$("#pnlKioskos").css("display", "none");
// 			aqui va el contendio de la grilla grupos 
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'listargruposxsede.app',
	    		data: {idSede: 1}, //esto debe ser una variable GLOBAL IDSEDE 	    		
	    		success: function (response) {
	    			var data = response.data;
	    			var html='';
	    			for(var i=0; i<data.length; i++){
	    				html = '<tr>' +
						'<td><span>'+data[i].vNombreGrupo+'</span></td>' +
						'<td><span>'+data[i].vPrefijoGrupo+'</span></td>' +
						'<td><span>'+data[i].vNombreAlgoritmo+'</span></td>' +						
						'<td><span><button type="button" class="btn btn-success" data-toggle="modal" data-target="#verSubGruposXGrupo">Ver Sub Grupos</button></span></td>' +
					  '</tr>';	        					
					$('#tblListadoGrupos tbody').append(html);    			
	    			}	
	    			$('#tblListadoGrupos').DataTable();					
	    				
	    		}
	    	});
			
			
			//mostrar
			$("#pnlGrupos").css("display", "block");		  
		});

		//boton kioskos		
		$("#btnKioskos").click(function() {
			//esconder
			$("#pnlUsuarios").css("display", "none");
			$("#pnlGrupos").css("display", "none");
			//mostrar	
			
			//listado de usuarios
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'findallusuarioskiosko.app',
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);
	    			var html;
	    			var IpSiNo='';
	    			for(var i=0; i<data.length; i++){
		    			if(data[i].vSolicitaIp == '1'){
		    				IpSiNo='NO';
				    	}
		    			else{
		    				IpSiNo='SI';
			    		}
	    				html = '<tr>' +						
						'<td><span>'+data[i].vLogin+'</span></td>' +
						'<td><span>'+data[i].vIp+'</span></td>' +
						'<td><span>'+IpSiNo+'</span></td>' +
						'<td><span>'+data[i].vNombreGrupo+'</span></td>' +						
						'<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editarGrupoAKiosko">Editar Grupo</button></td>' +
					  '</tr>';	        					
					$('#tblListadoKioskos tbody').append(html);
		    		}	
	    			$('#tblListadoKioskos').DataTable();
	    		}
	    	});			
			$("#pnlKioskos").css("display", "block");					  
		});

		//boton Monitores		
		$("#btnMonitores").click(function() {
			//esconder
			$("#pnlUsuarios").css("display", "none");
			$("#pnlGrupos").css("display", "none");
			//mostrar	
			
			//listado de usuarios
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'findallusuarioskiosko.app',
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);
	    			var html;
	    			var IpSiNo='';
	    			for(var i=0; i<data.length; i++){
		    			if(data[i].vSolicitaIp == '1'){
		    				IpSiNo='NO';
				    	}
		    			else{
		    				IpSiNo='SI';
			    		}
	    				html = '<tr>' +						
						'<td><span>'+data[i].vLogin+'</span></td>' +
						'<td><span>'+data[i].vIp+'</span></td>' +
						'<td><span>'+IpSiNo+'</span></td>' +
						'<td><span>'+data[i].vNombreGrupo+'</span></td>' +						
						'<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editarGrupoAKiosko">Editar Grupo</button></td>' +
					  '</tr>';	        					
					$('#tblListadoKioskos tbody').append(html);
		    		}	
	    			$('#tblListadoKioskos').DataTable();
	    		}
	    	});			
			$("#pnlKioskos").css("display", "block");					  
		});

		//actualizar grupo x Kiosko		
		$("#btnEditarGrupoAKiosko").click(function() {
			var codSede = $("#cboSede").val();
			var aPaterno = $("#txtAPaterno").val();			
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'grabarusuario.app',
	    		data: {codSede: codSede, aPaterno: aPaterno, aMaterno: aMaterno, vNombre:vNombre, iRol:iRol,
	    			vIp:vIp, vLogin:vLogin, vEmail:vEmail, iGrupo: iGrupo}, 	    		
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);	
	    			var html;
	    			$('#tblListadoUsuarios tbody').empty();
	    			for(var i=0; i<data.length; i++){
	    				html = '<tr>' +
						'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
						'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
						'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
						'<td><span>'+data[i].vUsuarioApMaterno+'</span></td>' +
						'<td><span>0</span></td>' +
					  '</tr>';	        					
					$('#tblListadoUsuarios tbody').append(html);    			
	    			}
	    		}	
	    	});				  
		});
		
		//grabar usuario		
		$("#btnGrabarUsuario").click(function() {
			var codSede = $("#cboSede").val();
			var aPaterno = $("#txtAPaterno").val();
			var aMaterno = $("#txtAMaterno").val();
			var vNombre = $("#txtNombres").val();
			var iRol = $("#cboRol").val();
			var vIp= $("#txtIp").val();
			var vLogin = $("#txtLogin").val();
			var vEmail = $("#txtEmail").val();
			var iGrupo=0;
			if($("#cboGrupoxKiosko").val()){
				iGrupo = $("#cboGrupoxKiosko").val();
			}
			console.log('iGrupo->>>'+iGrupo);			
			
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'grabarusuario.app',
	    		data: {codSede: codSede, aPaterno: aPaterno, aMaterno: aMaterno, vNombre:vNombre, iRol:iRol,
	    			vIp:vIp, vLogin:vLogin, vEmail:vEmail, iGrupo: iGrupo}, 	    		
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);	
	    			var html;
	    			$('#tblListadoUsuarios tbody').empty();
	    			for(var i=0; i<data.length; i++){
	    				html = '<tr>' +
						'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
						'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
						'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
						'<td><span>'+data[i].vUsuarioApMaterno+'</span></td>' +
						'<td><span>0</span></td>' +
					  '</tr>';	        					
					$('#tblListadoUsuarios tbody').append(html);    			
	    			}
	    		}	
	    	});				  
		});

		
		//grabar Grupo 
		$("#btnGrabarGrupo").click(function() {
			var codSede = 1;//cambiar este valor
			var nombreGrupo = $("#txtNombreGrupo").val();			
			var prefijoGrupo = $("#txtPrefijoGrupo").val();
			var codAsignacion = $("#cboTipoAsignacion").val();				
			console.log('nombreGrupo->>>'+nombreGrupo);
			console.log('prefijoGrupo->>>'+prefijoGrupo);
			console.log('codAsignacion->>>'+codAsignacion);			
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'savegruposxsede.app',
	    		data: {codSede: codSede, nombreGrupo: nombreGrupo, prefijoGrupo: prefijoGrupo, codAsignacion: codAsignacion}, 	    		
	    		success: function (response) {
	    			var data = response.data;						
	    			var html;
	    			$('#tblListadoGrupos tbody').empty();
	    			for(var i=0; i<data.length; i++){
	    				html = '<tr>' +
						'<td><span>'+data[i].vNombreGrupo+'</span></td>' +
						'<td><span>'+data[i].vPrefijoGrupo+'</span></td>' +
						'<td><span>'+data[i].vNombreAlgoritmo+'</span></td>' +						
						'<td><span><button type="button" class="btn btn-success" data-toggle="modal" data-target="#verSubGruposXGrupo">Ver Sub Grupos</button></span></td>' +
					  '</tr>';	        					
					$('#tblListadoGrupos tbody').append(html);    			
	    			}
	    			$('#tblListadoGrupos').DataTable();
	    		}	
	    	});				  
		});
		
		
		function modalZona(e){
			e.stopPropagation();
			$('#modalZona').modal('toggle');
		}
		

		function modalComponente(){
			$('#modalComponente').modal('toggle');
		}
		
		function anterior(){
			$(location).attr('href', '${establecimientos}');
		}
		
		function terminar(){
			$(location).attr('href', '${historialSolicitudes}');
		}
		
		function guardar(){
			$(location).attr('href', '${historialSolicitudes}');
		}
		
		function siguiente(){
			$(location).attr('href', '${bienesFiscalizados}');
		}
		
		$(document).ready(function() {
			$('.selectpicker').selectpicker();
			
			//listado de usuarios
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'findallusuarios.app',
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);
	    			var html;
	    			for(var i=0; i<data.length; i++){
	    				html = '<tr>' +
						'<td><span>'+data[i].vUsuarioApPaterno+' '+data[i].vUsuarioApMaterno+' '+data[i].vUsuarioNombres+'</span></td>' +
						'<td><span>'+data[i].vUsuarioUsername+'</span></td>' +
						'<td><span>'+data[i].roles[0].rol.vRolNombre+'</span></td>' +									
						'<td><span>'+data[i].vUsuarioApMaterno+'</span></td>' +
						'<td><span>0</span></td>' +
					  '</tr>';	        					
					$('#tblListadoUsuarios tbody').append(html);
		    		}	
	    			$('#tblListadoUsuarios').DataTable();
	    		}
	    	});
			
			//listad de grupos x sede			
			$.ajax({ 
	    		type: 'POST', 
	    		url: 'listargruposxsede.app',
	    		data: {idSede: 1}, //esto debe ser una variable GLOBAL IDSEDE 	    		
	    		success: function (response) {
	    			var data = response.data;					
	    			$.each(data, function (index, item) {
	                    console.log(data);
                        $("<option/>")
                                .attr("value", item.id)
                                .text(item.nombre)
                                .appendTo("#cboEditarGrupoAKiosko");
                    });	
	    		}
	    	});


			$.ajax({ 
	    		type: 'POST', 
	    		url: 'listartablamaestrabygrupo.app',
	    		data: {grupo: 1}, 	    		
	    		success: function (response) {
	    			var data = response.data;
					console.log('data->>>');
	    			console.log(data);
	    			$.each(data, function (index, item) {
	                    console.log(data);
                        $("<option/>")
                                .attr("value", item.valor)
                                .text(item.descripcion)
                                .appendTo("#cboProductos");
                    });	
	    		}
	    	});			

		});
	</script>



</body>
</html>
