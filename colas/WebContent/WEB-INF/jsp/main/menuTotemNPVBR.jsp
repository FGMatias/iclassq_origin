<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>ICLASSQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="librerias/libBase/include.js"></script>
  <script src="librerias/libBase/include.essalud.js"></script>  
  <script src="librerias/js/bootstrap.min.js"></script>
  <script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
   <style>
  
  	.centered {
	  position: absolute;
	  left: 50%;
	  margin-left: -100px;
	}
  </style> 
  
</head>
<body> 
<img id="img_background">
<div class="container">
        <div class="row">
            <div id="espacio" class="col-md-6">
          	</div>
            <div class="col-md-2 offset-md-4">
            	<span style="font-size:30px;margin-top:0px"><a href="logout.app"><i class="fa fa-power-off"></i></a></span>
            </div>
        </div>
        <br><br>
        <div class="row">
        	<div class="dni-descripcion col-sm-12">
        		<span id="txtPersona"></span>
        	</div>
        </div><br>
        <div id="pnlAgrupadores">
	        <div class="row">'
				<div class="boton col-sm-6 offset-sm-3">
					<a onclick="fnGenerarTicketCusco(43,1)" style="font-size:35px" class="justificarMenu myButton1">Normal</a>
				</div>'
     		</div>
     		<div class="row">'
				<div class="boton col-sm-6 offset-sm-3">
					<a onclick="fnGenerarTicketCusco(43,2)" style="font-size:35px" class="justificarMenu myButton1">Preferencial</a>
				</div>
     		</div>     		
        </div>
        
        <br><br>        
        <br>
		<div class="row">
			<div class="teclado-boton col-xs-12 col-md-3">
				<a href="teclado.app" class="justificarMenu myButton2">Atrás</a>
            </div>
        </div>
         <form class="needs-validation" novalidate>
			<div class="row">
				<div class="col-12 form-group">
					<div class="row">
						<input class="form-control" type="hidden" id="idGrupo" />
					</div>
				</div>
			</div>
		</form>       
    </div>
     <div class="modal" id="nuevoTicket">
          <div class="modal-dialog">
              <div class="modal-content">
              <div class="modal-body">
                  <div id="ticket">
                      <div class="">
                          <img src="librerias/imagenes/logo.png" height="70px"><br><br>
                      
                          <b><span id="nombreSucursal"></span></b><br>
                          <span>BIENVENIDOS</span><br>
<!--                         <div id="" class=""> -->
<!--                             <p>ID: <span id="numDoc"></span></p> -->
<!--                         </div> -->
                          <span>ATENCION</span><br>
                          <b><span style="font-size:70px" id="codigo"></span></b><br>
                          <span id="fecha"></span><br>
                          <span>GRACIAS POR SU VISITA</span>
                      </div>
                      
                      <div class="col-sm-4 offset-sm-4">
                          <a style="color:#fff"  class="myButton4">OK</a>
                      </div>
                  </div>
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
<script>

		
function fnGenerarTicketCusco(idRol, idAgrupador){
			var dni = '${dni}';		
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			$.ajax({
	    		type: 'POST', 
	    		url: 'generarticketatencionbalanceo.app',	
	    		data: {idRol: idRol, idAgrupador: idAgrupador, dni:dni, tipoDoc: tipoDoc,
	        		persona: persona},	
	    		success: function (response) {
	    			var msg = response.success;
	    			var data = response.data;
	    			if(msg==true){
	    				console.log(" VBR 1. paso la generacion del ticket");
	    				console.log(data);
						$("#nuevoTicket").modal("show");
	    				console.log(" VBR 4. paso la generacion del ticket");
	    				$("#numDoc").html(dni);						
						$("#nombreSubGrupo").html(data.nombreSubgrupo);
	    				console.log(" VBR 3. paso la generacion del ticket");
						var parts1 = data.codigo.split("-");
						$("#codigo").html(parts1[0]+parts1[1]);
						var date = new Date(data.fechaAtencion);
						$("#fecha").html(date.toLocaleString());
	    				console.log(" VBR 2. paso la generacion del ticket");						
	// 					window.location.href = 'regresaratencion.app';			    		
// 			    		window.location.href = 'notaria.app';
	        		}
	    		}
	    	});
		}

		$(document).ready(function() {
			var idSucursal = '${usuario.iSucursal}';						
			var pideDoc = '${usuario.iPideDocumento}';
			if (pideDoc==1){
				$('.myButton4').attr('href','dni.app');	
			}
			else{
				$('.myButton4').attr('href','regresaratencion.app');
			}

	    	var imprimeTicket = '${usuario.iImprimeTicket}';
	    	if(imprimeTicket==2){
	    		$('.myButton4').removeAttr('id');
			}
	    	else if (imprimeTicket==1){
	    		console.log("VBR ...imprime else");
	    		$('.myButton4').attr('id','btnImprimirTicket');	
				var valid = false;
	    	    $("#btnImprimirTicket").click(function() {    			
//	    			$("#pnlTicket").printElement();
					$("#btnImprimirTicket").css("display", "none");//oculto el boton
					$("#img_background").css("display", "none");//oculto el boton
					$(".container").css("display", "none");//oculto el boton
		    		
					var printContents = document.getElementById('ticket').innerHTML;
		            w = window.open();
		            w.document.write('<html><body>');
		            w.document.write('<div style="text-align:center">');
		            w.document.write(printContents);
		            w.document.write('</div>');
		            w.document.write('</body></html>');
		           
		            w.document.close(); // necessary for IE >= 10
		            w.focus(); // necessary for IE >= 10
		    		w.print();
		    		w.close();				
		    		$('#ticket').prop('hidden', true);

		    		return true;
		            
		    	});
		    	if(valid == true){
		    		window.location.href = 'dni.app';
			    }
	    	    
	        }
	    	
	    	var idSucursal = '${usuario.iSucursal}';
			var idRol = '${usuario.iRolEquipo}';
			var prefijo = '${prefijo}';
			
	    	$.ajax({ 
	    		type: 'POST', 
	    		url: 'getgrupobyprefijo.app',	
	    		data: {prefijo: prefijo, idSucursal: idSucursal},	
	    		success: function (response) {
	    			var data = response.data;
	    			$('#idGrupo').val(data.id);
	    			var idGrupo = $("#idGrupo").val();
	    			console.log("idGrupo : "+idGrupo); 

	    			$.ajax({ 
	    	    		type: 'POST', 
	    	    		url: 'listarsubgruposxgrupoandsucursal.app',	
	    	    		data: {idSucursal: idSucursal, idGrupo: idGrupo},	
	    	    		success: function (response) {
	    	    			var data = response.data;
	    	    			var html='';    				
	    	    			for(var i=0; i<data.length; i++){				
	    	    				html = '<div class="row">' +
	    		   			 				'<div class="boton col-sm-6">'+
	    		   			 					'<a href="#" onclick="fnGenerarTicket('+data[i].iSubGrupo+', \''+data[i].vPrefijo+'\', \''+data[i].vNombreSubGrupo+'\')" class="justificarMenu myButton1">'+data[i].vNombreSubGrupo+'</a>'+
	    		   			 				'</div>'+
	    		   			 				'<div class="descripcion col-sm-6">'+
	    		   			 					'<span>'+data[i].vDescripcion+'</span>'+
	    	    	                		'</div>'+
	    	   	                		'</div><br><br>';
	    	   	                		$('#panelListadoSubGrupos').append(html);
	    	        		}	
	    	    		}
	    	    	});
	    		}
	    	});

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
	    			$("#nombreSucursal").html(data.nombre);    		
	    		}
	    	});
	    	
		
			
			
		});

    </script>

</body>
</html>