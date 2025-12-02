<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ICLASSQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
<link rel="stylesheet" href="librerias/css/font-awesome.min.css">
<link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
<link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
<style>
  	.modal-backdrop{
	   background-color: rgba(0,0,0,0.2);
	}
	
	.parpadea {
	  
	  animation-name: parpadeo;
	  animation-duration: 2s;
	  animation-timing-function: linear;
	  animation-iteration-count: infinite;
	
	  -webkit-animation-name:parpadeo;
	  -webkit-animation-duration: 2s;
	  -webkit-animation-timing-function: linear;
	  -webkit-animation-iteration-count: infinite;
	}
	
	@-moz-keyframes parpadeo{  
	  0% { opacity: 1.0; }
	  50% { opacity: 0.7; }
	  100% { opacity: 1.0; }
	}
	
	@-webkit-keyframes parpadeo {  
	  0% { opacity: 1.0; }
	  50% { opacity: 0.7; }
	   100% { opacity: 1.0; }
	}
	
	@keyframes parpadeo {  
	  0% { opacity: 1.0; }
	   50% { opacity: 0.7; }
	  100% { opacity: 1.0; }
	} 
	
  </style>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="librerias/css/estilosmenu.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>

  
  
  <style type="text/css">
    body {
        color: #566787;
        background: #f5f5f5;
		font-family: 'Roboto', sans-serif;
	}
	.table-wrapper {        
        background: #fff;
        padding: 0px 30px 5px;
        margin: 10px auto;
        box-shadow: 0 0 1px 0 rgba(0,0,0,.25);
    }
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		min-width: 50px;
		border-radius: 2px;
		border: none;
		padding: 6px 12px;
		font-size: 95%;
		outline: none !important;
		height: 30px;
	}
    .table-title {
		border-bottom: 1px solid #e9e9e9;
		padding-bottom: 15px;
		margin-bottom: 5px;
		background: rgb(0, 50, 74);
		margin: -20px -31px 10px;
		padding: 15px 30px;
		color: #fff;
    }
    .table-title h2 {
		margin: 2px 0 0;
		font-size: 24px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 40px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table td a {
/*         color: #2196f3; */
    }
	table.table td .btn.manage {
		padding: 2px 10px;
		background: #37BC9B;
		color: #fff;
		border-radius: 2px;
	}
	table.table td .btn.manage:hover {
		background: #2e9c81;		
	}
	
	#number {
  font-size:50px;
  color:#434343;
}
</style>
  
</head>
<body>
	<div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6"><h2><span id="txtNombreVentanilla"></span>: <b>${usuario.vUsuarioNombres} ${usuario.vUsuarioApPaterno} ${usuario.vUsuarioApMaterno}</b></h2></div>
                <div class="col-sm-6">
                	<button type="button" class="btn btn-primary btn-lg" id="btnLlamarSiguiente"><span class="glyphicon glyphicon-forward"></span>&nbsp;Siguiente</button>
                	<button type="button" id="btnTurnos" class="btn btn-success">N° Turnos en Espera: <b><span id="cantEspera" style="font-size:15px"></span></b></button>
                	<button type="button" class="btn btn-danger btn-lg pull-right" onclick="fnCerrarSession()"><span class="glyphicon glyphicon-off"></span>&nbsp;salir</button>
                	<button type="button" class="btn btn-primary btn-lg pull-right" onclick="fnCambiarClaveForm(${usuario.iUsuarioId})"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Cambiar Clave</button>
                	
                    <div class="btn-group" data-toggle="buttons">
<!--                         <a id="btnCambiarClave" onclick="fnCambiarClave()" class="btn btn-success" title="Cambiar Clave"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Cambiar Clave</a> -->
<!--                         <a href="#" id="btnCerrarSession" class="btn btn-danger" title="Salir del Sistema"><span class="glyphicon glyphicon-off"></span>&nbsp;Salir</a>                        							 -->
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover" id="tbl_ventanilla_usuario">
            <thead>
                <tr>                    
                    <th>TICKET</th>
                    <th>DNI</th>                    
                    <th>PRIORIDAD</th>   
                    <th>HORA LLEGADA</th>
                    <th>HORA ATENCION</th>                   
                    <th>HORA FIN ATENCION</th>
                    <th>ESTADO</th>
                    <th style="width: 400px;">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
    
<!--     Deraivar Ticket -->
	
	<div id="modalDerivarTicket" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header modal-header-primary">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Derivar Ticket</h4>
	      </div>
	      <div class="modal-body">
	        	<div class="row">
					<div class="col-12 form-group">
						<div class="row">
							<div class="">
								<input class="form-control" type="hidden" id="txtIdTicketDeriva" />
							</div>
							<div class="col-xs-12 col-sm-4">
								<label>Derivar a:</label>
								<select class="form-control" id="cboTipoDeriva" required>
									<option value="0">--Seleccione--</option>
									<option value="1">Grupo</option>
									<option value="2">Ventanilla</option>
								</select>
							</div>
							<div class="col-xs-12 col-sm-4" style="display:none" id="cboDeriva1">
								<label>Grupo</label>
								<select class="form-control" id="cboGrupoDerivar" required>
									<option value="0">--Seleccione--</option>
								</select>
							</div>
							<div class="col-xs-12 col-sm-4" style="display:none" id="cboDeriva2">
								<label>Sub grupo</label>
								<select class="form-control" id="cboSubGrupoDerivar" disabled>
									<option value="0">--Seleccione--</option>
								</select>
							</div>
							<div class="col-xs-12 col-sm-4" style="display:none" id="cboDeriva3">
								<label>Ventanilla</label>
								<select class="form-control" id="cboVentanillaDerivar" required>
									<option value="0">--Seleccione--</option>
								</select>
							</div>																								
						</div>									
					</div>																
				</div>
	      </div>
	      <div class="modal-footer">
	        	<button type="button" id="btnDerivarTicket" class="btn btn-primary" data-dismiss="modal">Derivar</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	
	  </div>
</div>
     
<!--     evaluar ticket -->

<div class="modal" id="modalEvaluarTicket">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">		
		      <!-- Modal Header -->
		      <div class="modal-header modal-header-primary">
		        <h4 class="modal-title">EVALUACION CON EL DISPOSITIVO</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>		
		      <!-- Modal body -->
		      <div class="modal-body">
		      		<fieldset class="scheduler-border">						
							<form class="needs-validation" novalidate>
							
								<div class="row">
									<div class="col-12 form-group">
											<div id="esperaEvaluar" style="text-align: center"></div>	
											<label>comunicar a su usuario para evaluar la calidad de la atencion</label>
											<label id="LTiempoEvaluacionEspera">0 </label>
											<label>Espere </label>
									</div>
								</div>									
								<div class="row">
									<div class="col-12 form-group">
											<div id="number" style="text-align: center">0</div>						
									</div>
								</div>
								<div class="row">
									<div class="col-12 form-group">
											<div id="esperaEvaluarTxt" style="text-align: center"></div>													
									</div>
								</div>									
	        					<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
							</form>
					</fieldset>
		      </div>
	
	    </div>
	  </div>
	</div>



    <script type="text/javascript">
    
    function count(idTicket, idUsuario, idEvalua){
    	var n = 0;
    	var l = document.getElementById("number");
		var iEmpresa='${usuario.iEmpresa}';
    	
    	nMax=10
    	intval=window.setInterval(function(){
    	  l.innerHTML = n;
    	  if (n==nMax-5){
    		  var j = document.getElementById("esperaEvaluarTxt");
    		  j.innerHTML="Gracias ya puede salir"
    	  }
    	  if (n==nMax){
   		  	window.clearInterval(intval);
   	    	$("#modalEvaluarTicket").modal("hide");
   	    	console.log('revisando');
   	    	$.ajax({ 
   	     		type: 'POST', 
   	     		url: 'concluyeevaluacionespera.app',
   	     		data: {idTicket: idTicket,idUsuario: idUsuario },
			success: function (response) {     			 			
					var data = response.data;
					console.log(data);
					var html;	
					var hi;
					var hf;		
					var listadoBotones;										
					$('#tbl_ventanilla_usuario tbody').empty();
					for(var i=0; i<data.length; i++){
						var he = new Date(data[i].horaEmision);
						var horaInicio;
						var horaFin;
						if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
							horaInicio='';	 	
						}
						else{
							hi = new Date(data[i].horaInicioAtencion);
							horaInicio=hi.toLocaleTimeString();					
						}
						if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
							horaFin='';			
						}
						else{					
							hf = new Date(data[i].horaFinAtencion);
							horaFin=hf.toLocaleTimeString();						
			
						}
						if(data[i].estado==40){
			//					$("#previous").addClass('disabled');
							console.log('holaaa->>');	                	
				        }
						if(idEvalua==1){
							listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
						}
						else{
							listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
						}															
						if (iEmpresa==3) {
							html = '<tr>' +
							'<td><span>'+data[i].descripcion+'</span></td>' 
							}
						else
							{
							html = '<tr>' +
							'<td><span>'+data[i].codigo+'</span></td>' 
							}
						html = html+
						'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +						
						'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
						'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
						'<td><span>'+horaInicio+'</span></td>'+                   
			            '<td>'+horaFin+'</td>'+
			            '<td>'+data[i].descripcionEstado+'</td>'+	                				
			            listadoBotones+
					  '</tr>';	        					
					$('#tbl_ventanilla_usuario tbody').append(html);
					if((data[i].estado == 40) || (data[i].estado==41)){
						$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);						                	
			        }
					if(data[i].estado == 50){					
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
			        }
					if(data[i].estado == 60){					
						$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
						$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);									                	
			        }
					}
					$('#btnLlamarSiguiente').attr("disabled", false);
					}	
				});
   	    	console.log('revisando ajax');
    	  }
   		 
    	  n=n+1;
    	},10000);

    	}
    
    $("#btnCerrarSession").click(function() {
    	window.location.href = 'logout.app';
    });
    
    $("#btnLlamarSiguiente").click(function() {    	
    	
    	var idRolEquipo = '${usuario.iRolEquipo}';
    	var idSucursal='${usuario.iSucursal}';
    	var idUsuario='${usuario.iUsuarioId}';    	
    	var idVentanilla='${usuario.iVentanilla}';
    	var idEvalua='${usuario.iEvalua}';
		var iEmpresa='${usuario.iEmpresa}';
    	
    	$.ajax({ 
     		type: 'POST', 
     		url: 'nextticket.app',
     		data: {idUsuario: idUsuario, 
         		idSucursal: idSucursal, 
         		idRolEquipo: idRolEquipo,         		
         		idVentanilla: idVentanilla},
     		success: function (response) {     			 			
     			var data = response.data;
				console.log(data);
				var html;		
				var hi;
				var hf;			
				var listadoBotones;				
				$('#tbl_ventanilla_usuario tbody').empty();
				for(var i=0; i<data.length; i++){
					var he = new Date(data[i].horaEmision);
					var horaInicio;
					var horaFin;
					if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
						horaInicio='';	 	
					}
					else{
						hi = new Date(data[i].horaInicioAtencion);
						horaInicio=hi.toLocaleTimeString();					
					}
					if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
						horaFin='';			
					}
					else{					
						hf = new Date(data[i].horaFinAtencion);
						horaFin=hf.toLocaleTimeString();						
					}
					if(idEvalua==1){
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
					}
					else{
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
					}	
					if (iEmpresa==3) {
						html = '<tr>' +
						'<td><span>'+data[i].descripcion+'</span></td>' 
						}
					else
						{
						html = '<tr>' +
						'<td><span>'+data[i].codigo+'</span></td>' 
						}
					html = html+
					'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +
					'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
					'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
					'<td><span>'+horaInicio+'</span></td>'+                   
	                '<td><span>'+horaFin+'</span></td>'+
	                '<td>'+data[i].descripcionEstado+'</td>'+				
	                listadoBotones+
				  '</tr>';	        					
					$('#tbl_ventanilla_usuario tbody').append(html);
					if((data[i].estado == 40) || (data[i].estado==41)){
						$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
			        }
					if(data[i].estado == 50){					
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
			        }
					if(data[i].estado == 60){					
						$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
						$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
						$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);
			        }
	    		}
				$('#btnLlamarSiguiente').attr("disabled", true);	    		
     		}	
   		});    					  
    });

	$("#btnDerivarTicket").click(function() {    	
    	
    	var idRolEquipo = '${usuario.iRolEquipo}';
    	var idSucursal='${usuario.iSucursal}';
    	var idUsuario='${usuario.iUsuarioId}';    	
//     	var idVentanilla='${usuario.iVentanilla}';
    	var idTicket = $("#txtIdTicketDeriva").val();
		var idSubGrupo = $("#cboSubGrupoDerivar").val();
		var idVentanilla = $("#cboVentanillaDerivar").val();
		var idEvalua='${usuario.iEvalua}';
		var iEmpresa='${usuario.iEmpresa}';		
		//genera el nuevo ticket
		$.ajax({ 
     		type: 'POST', 
     		url: 'derivarticket.app',
     		data: {idUsuario: idUsuario, idTicket: idTicket, idSubGrupo: idSubGrupo, idVentanilla: idVentanilla},
     		success: function (response) {     			 			
     			var data = response.data;
     			var mensaje = response.message;	 			
     			if(response.success==true){
     				$.alert({
                        title: 'Exito',
                        content: mensaje,
                    });
             	}     			
				var html;	
				var hi;
				var hf;				
				var listadoBotones;									
				$('#tbl_ventanilla_usuario tbody').empty();
				for(var i=0; i<data.length; i++){
					var he = new Date(data[i].horaEmision);
					var horaInicio;
					var horaFin;
					if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
						horaInicio='';	 	
					}
					else{
						hi = new Date(data[i].horaInicioAtencion);
						horaInicio=hi.toLocaleTimeString();					
					}
					if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
						horaFin='';			
					}
					else{					
						hf = new Date(data[i].horaFinAtencion);
						horaFin=hf.toLocaleTimeString();						

					}
					if(data[i].estado==40){
// 						$("#previous").addClass('disabled');
						console.log('holaaa->>');	                	
			        }
					if(idEvalua==1){
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
					}
					else{
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
					}
					if (iEmpresa==3) {
						html = '<tr>' +
						'<td><span>'+data[i].descripcion+'</span></td>' 
						}
					else
						{
						html = '<tr>' +
						'<td><span>'+data[i].codigo+'</span></td>' 
						}
					html = html+
					'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +
					'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
					'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
					'<td><span>'+horaInicio+'</span></td>'+                   
	                '<td>'+horaFin+'</td>'+
	                '<td>'+data[i].descripcionEstado+'</td>'+	                				
	                listadoBotones+
				  '</tr>';	        					
				$('#tbl_ventanilla_usuario tbody').append(html);
				if((data[i].estado == 40) || (data[i].estado==41)){
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);						                	
		        }
				if(data[i].estado == 50){					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
		        }
//cambio VBR 20191120
				if(data[i].estado == 51){					
					$('#btnEvaluarAtencion'+data[i].id).attr("disabled", false);	
		        }
//End cambio VBR 20191120
				if(data[i].estado == 60){					
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
					$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);										                	
		        }
	    		}
				$('#btnLlamarSiguiente').attr("disabled", false);
             	//fin
     		}	
   		});
    });


    function fnEvaluarAtencion(idTicket){
    	$("#modalEvaluarTicket").modal("show");
     	var idUsuario = '${usuario.iUsuarioId}';
    	var idVentanilla='${usuario.iVentanilla}';
		var idEvalua='${usuario.iEvalua}';
		var iEmpresa='${usuario.iEmpresa}';		
		console.log('test->>>'+idTicket);
		$.ajax({ 
     		type: 'POST', 
     		url: 'evaluaratencion.app',
     		data: {idTicket: idTicket, idVentanilla: idVentanilla, idUsuario: idUsuario},
     		success: function (response) {     			 			
     			var data = response.data;
     		}	
   		});
		count(idTicket, idUsuario, idEvalua);
    	console.log('test->>>'+idTicket);
    }
    

    function fnLlamarXAudio(idTicket){
        console.log('aaaaa->>>');
    	var iRolEquipo ='${usuario.iRolEquipo}';
    	
    	$.ajax({ 
     		type: 'POST', 
     		url: 'activarllamadoxaudio.app',
     		data: {idTicket: idTicket},
     		success: function (response) {     			 			
     			var data = response.data;
				if(response.success == true){
					console.log('llamando->>>');
				}
     		}	
   		});
    }

    function fnIniciarAtencion(idTicket){
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		console.log('idusuario->'+idUsuario);
		console.log('idTicket->>>'+idTicket);
		var iEmpresa='${usuario.iEmpresa}';
		
		$.ajax({ 
     		type: 'POST', 
     		url: 'iniciaratencion.app',
     		data: {idTicket: idTicket, idUsuario:idUsuario},
     		success: function (response) {     			 			
     			var data = response.data;
				console.log(data);
				var html;		
				var hi;
				var hf;			
				var listadoBotones;					
				$('#tbl_ventanilla_usuario tbody').empty();
				for(var i=0; i<data.length; i++){
					var he = new Date(data[i].horaEmision);
					var horaInicio;
					var horaFin;
					if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
						horaInicio='';	 	
					}
					else{
						hi = new Date(data[i].horaInicioAtencion);
						horaInicio=hi.toLocaleTimeString();					
					}
					if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
						horaFin='';			
					}
					else{					
						hf = new Date(data[i].horaFinAtencion);
						horaFin=hf.toLocaleTimeString();						
					}
					if(idEvalua==1){
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
					}
					else{
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
					}
									
					if (iEmpresa==3) {
						html = '<tr>' +
						'<td><span>'+data[i].descripcion+'</span></td>' 
						}
					else
						{
						html = '<tr>' +
						'<td><span>'+data[i].codigo+'</span></td>' 
						}
					html = html+
					'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +					
					'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
					'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
					'<td><span>'+horaInicio+'</span></td>'+                   
	                '<td><span>'+horaFin+'</span></td>'+
	                '<td>'+data[i].descripcionEstado+'</td>'+				
	                listadoBotones+
				  '</tr>';	        					
				$('#tbl_ventanilla_usuario tbody').append(html);
				if((data[i].estado == 40) || (data[i].estado==41)){
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
		        }
				if(data[i].estado == 50){					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
		        }
				if(data[i].estado == 60){					
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
					$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);							                	
		        }
	    		}
     		}	
   		});
    }     

// 	cambiar clave
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
     				$.alert({
                        title: 'Exito',
                        content: mensaje,
                    });
     				$("#modalCambiarClave").val("");
     				$('#modalCambiarClave').modal('hide');
     				window.location.href = 'logout.app';     				
             	}			
			}
		});		
	}
	    
	function fnDerivarAtencion(idTicket){		
		console.log('test->>>>'+idTicket);
		 $("#modalDerivarTicket").modal("show");
		 $("#txtIdTicketDeriva").val(idTicket);
		 				 
	} 
   
    function fnFinalizarAtencion(idTicket){
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iEmpresa='${usuario.iEmpresa}';		
				
		$.ajax({ 
     		type: 'POST', 
     		url: 'finalizaratencion.app',
     		data: {idTicket: idTicket, idUsuario:idUsuario},
     		success: function (response) {     			 			
     			var data = response.data;
				console.log(data);
				var html;	
				var hi;
				var hf;		
				var listadoBotones;										
				$('#tbl_ventanilla_usuario tbody').empty();
				for(var i=0; i<data.length; i++){
					var he = new Date(data[i].horaEmision);
					var horaInicio;
					var horaFin;
					if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
						horaInicio='';	 	
					}
					else{
						hi = new Date(data[i].horaInicioAtencion);
						horaInicio=hi.toLocaleTimeString();					
					}
					if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
						horaFin='';			
					}
					else{					
						hf = new Date(data[i].horaFinAtencion);
						horaFin=hf.toLocaleTimeString();						

					}
					if(data[i].estado==40){
// 						$("#previous").addClass('disabled');
						console.log('holaaa->>');	                	
			        }
					if(idEvalua==1){
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
					}
					else{
						listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
					}															
					if (iEmpresa==3) {
						html = '<tr>' +
						'<td><span>'+data[i].descripcion+'</span></td>' 
						}
					else
						{
						html = '<tr>' +
						'<td><span>'+data[i].codigo+'</span></td>' 
						}
					html = html+
					'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +					
					'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
					'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
					'<td><span>'+horaInicio+'</span></td>'+                   
	                '<td>'+horaFin+'</td>'+
	                '<td>'+data[i].descripcionEstado+'</td>'+	                				
	                listadoBotones+
				  '</tr>';	        					
				$('#tbl_ventanilla_usuario tbody').append(html);
				if((data[i].estado == 40) || (data[i].estado==41)){
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);						                	
		        }
				if(data[i].estado == 50){					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
		        }
				if(data[i].estado == 60){					
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
					$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);									                	
		        }
	    		}
				$('#btnLlamarSiguiente').attr("disabled", false);
     		}	
   		});
    }

    
    $('#cboTipoDeriva').on('change', function() {
//		var idSede = this.value;
		var tipoDeriva = this.value;
		$("#cboSubGrupoDerivar").children("option:not(:first)").remove();
		if(tipoDeriva==1){			
			$("#cboSubGrupoDerivar").prop('disabled', true);
			$('#cboDeriva3').hide()
			$('#cboDeriva1').show();
			$('#cboDeriva2').show();
		}
		else if(tipoDeriva==2){
			$('#cboDeriva1').hide()
			$('#cboDeriva2').hide()
			$('#cboDeriva3').show();	
		}
		else{
			$('#cboDeriva1').hide();
			$('#cboDeriva2').hide();
			$('#cboDeriva3').hide();
			$('#cboTipoDeriva').val(0);
		}		
	});
    
    $('#cboGrupoDerivar').on('change', function() {
//			var idSede = this.value;
		var idGrupo = this.value;
		$("#cboSubGrupoDerivar").children("option:not(:first)").remove();
		$("#cboSubGrupoDerivar").prop('disabled', false);
// 		$("#cboSubGrupoDerivar").empty();		
		$.ajax({ 
    		type: 'POST', 
    		url: 'listarsubgruposxidgrupo.app',
    		data: {idGrupo: idGrupo}, 	    		
    		success: function (response) {
    			var data = response.data;
				console.log('data->>>');
    			console.log(data);
    			$.each(data, function (index, item) {
                    console.log(data);
                    $("<option/>")
                            .attr("value", item.id)
                            .text(item.nombre)
                            .appendTo("#cboSubGrupoDerivar");
                });	
    		}
    	});	
		
	});  
    
$(document).ready(function(){
	
	var idSucursal='${usuario.iSucursal}';
	var idUsuario='${usuario.iUsuarioId}';	
	var idVentanilla='${usuario.iVentanilla}';
	var idEvalua='${usuario.iEvalua}';
    var idRolEquipo = '${usuario.iRolEquipo}';
	console.log('idUsuario->>>'+idUsuario);
	console.log('idRolEquipo->>>'+idRolEquipo);
	



	//obtener el nombre de ventanilla por idUsuario

	//listar los ghrupos
	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxsede.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {		                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre)
                        .appendTo("#cboGrupoDerivar");
            });	
		}
	});
	
	// vbr 20191124 OBTENER el tiempo de espera para la evaluacion parametro 005
	$.ajax({ 
		type: 'POST', 
		url: 'ConsultaTiempoEvaluacion.app',
		data: {idSucursal: idSucursal}, 	    		
		success: function (response) {
			var data = response.data;
			tiempoEvaluacion=data[0].valor;
			texto= " Espere "+tiempoEvaluacion+" Segundos"
			console.log('Tiempo de Evaluaciondata ->>>');
			console.log(data);
			$("#lTiempoEvaluacionEspera").html(tiempoEvaluacion);
		}
	});
// listar ventanillas


	$.ajax({ 
		type: 'POST', 
		url: 'getventanillasxidsucursalRolEquipo.app',
		data: {idSucursal: idSucursal, idRolEquipo: idRolEquipo}, 	    		
		success: function (response) {
			var data = response.data;
			console.log('data->>>');
			console.log(data);
			$.each(data, function (index, item) {
                
                $("<option/>")
                        .attr("value", item.id)
                        .text(item.nombre)
                        .appendTo("#cboVentanillaDerivar");
            });	
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'getventanillabyid.app',
		data: {idVentanilla: idVentanilla},
		success: function (response) {
			var data = response.data;				     			
			var nombreVentanilla=data.nombre;				        					
			$('#txtNombreVentanilla').html(nombreVentanilla);
    					
		}
	});
	
	$.ajax({ 
		type: 'POST', 
		url: 'listarticketbyidusuario.app',
		data: {idUsuario: idUsuario},
		success: function (response) {
			var data = response.data;				     			
			var html;									
			var hi;
			var hf;    		    			    		    		
			for(var i=0; i<data.length; i++){
				console.log(data[i].horaFinAtencion);
				var he = new Date(data[i].horaEmision);
				var horaInicio;
				var horaFin;
				var listadoBotones;
				if((data[i].horaInicioAtencion ===null) || (data[i].horaInicioAtencion ==null) || (data[i].horaInicioAtencion =="null")){
					horaInicio='';	 	
				}
				else{
					hi = new Date(data[i].horaInicioAtencion);
					horaInicio=hi.toLocaleTimeString();					
				}
				if((data[i].horaFinAtencion ===null) || (data[i].horaFinAtencion ==null) || (data[i].horaFinAtencion =="null")){					
					horaFin='';			
				}
				else{					
					hf = new Date(data[i].horaFinAtencion);
					horaFin=hf.toLocaleTimeString();
				}	
				if(idEvalua==1){
					listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp;<a href="#" id="btnEvaluarAtencion'+data[i].id+'" onclick="fnEvaluarAtencion('+data[i].id+')" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;Evaluar</a></td>';	
				}
				else{
					listadoBotones='<td><a href="#" onclick="fnLlamarXAudio('+data[i].id+')" class="btn btn-primary" title="Llamar"><span class="glyphicon glyphicon-volume-up"></span>LLamar</a>&nbsp;<a href="#" id="btnIniciarAtencion'+data[i].id+'" onclick="fnIniciarAtencion('+data[i].id+')" class="btn btn-primary" title="Iniciar" disabled><span class="glyphicon glyphicon-play-circle"></span>&nbsp;Iniciar</a>&nbsp;<a href="#" onclick="fnDerivarAtencion('+data[i].id+')" class="btn btn-warning"><span class="glyphicon glyphicon-share"></span>&nbsp;Derivar</a>&nbsp<a href="#" id="btnFinalizarAtencion'+data[i].id+'" onclick="fnFinalizarAtencion('+data[i].id+')" class="btn btn-info" title="Finalizar"><span class="glyphicon glyphicon-ok"></span>&nbsp;Finalizar</a></td>';
				}							
				if (iEmpresa==3) {
					html = '<tr>' +
					'<td><span>'+data[i].descripcion+'</span></td>' 
					}
				else
					{
					html = '<tr>' +
					'<td><span>'+data[i].codigo+'</span></td>' 
					}
				html = html+
				'<td><span>'+data[i].numeroIdentificacion+'</span></td>' +				
				'<td><span>'+data[i].nombreSubgrupo+'</span></td>' +
				'<td><span>'+he.toLocaleTimeString()+'</span></td>' +									
				'<td><span>'+horaInicio+'</span></td>'+                   
                '<td><span>'+horaFin+'</span></td>'+
                '<td>'+data[i].descripcionEstado+'</td>'+                		
                listadoBotones+
			  '</tr>';	      
				  					
				$('#tbl_ventanilla_usuario tbody').append(html);
				if((data[i].estado == 40) || (data[i].estado==41)){
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", false);
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
		        }
				if(data[i].estado == 50){					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", false);	
		        }
				if(data[i].estado == 60){					
					$('#btnIniciarAtencion'+data[i].id).attr("disabled", true);					
					$('#btnFinalizarAtencion'+data[i].id).attr("disabled", true);
					$('#btnEvaluarAtencion'+data[i].id).attr("disabled", true);										                	
		        }
    		}			
		}
	});
	
	$(".btn-group .btn").click(function(){
		var inputValue = $(this).find("input").val();
		if(inputValue != 'all'){
			var target = $('table tr[data-status="' + inputValue + '"]');
			$("table tbody tr").not(target).hide();
			target.fadeIn();
		} else {
			$("table tbody tr").fadeIn();
		}
	});
	// Changing the class of status label to support Bootstrap 4
    var bs = $.fn.tooltip.Constructor.VERSION;
    var str = bs.split(".");
    if(str[0] == 4){
        $(".label").each(function(){
        	var classStr = $(this).attr("class");
            var newClassStr = classStr.replace(/label/g, "badge");
            $(this).removeAttr("class").addClass(newClassStr);
        });
    }
});


setInterval(verTicketEspera,1000);
function verTicketEspera(){										       
	var idRol='${usuario.iRolEquipo}';

	$.ajax({ 
		type: 'POST', 
		url: 'listargruposxrol.app',
		data: {idRol: idRol},
		success: function (response) {
			var data = response.data;			
			var html='';
			var cant = 0;
			for(var i=0; i<data.length; i++){
				var idGrupo = data[i].idGrupo;
				$.ajax({ 
					type: 'POST', 
					url: 'getcantidadticketespera.app',
					data: {idGrupo: idGrupo},
					success: function (response) {
						var data = response.data;
						cant = cant + data;						
						if(cant!=0){
							$('#btnTurnos').addClass("parpadea");
						}
						else{
							$('#btnTurnos').removeClass("parpadea");
						}
						$("#cantEspera").html(cant);
						
					}
				});
    		}
		}
	});	    	
}

</script>
    	
 <div class="modal fade" id="modalCambiarClave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
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
</html>