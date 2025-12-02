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
  
  
</head>
<body style="background-image: url('librerias/imagenes/fondo.png');"> 

<div class="container">
        <div class="row">
            <div id="espacio" class="col-md-6">
            </div>
            <div class="col-md-2 offset-md-4">
            	<span style="font-size:30px;margin-top:0px"><a href="logout.app"><i class="fa fa-power-off"></i></a></span>
            </div>
        </div>
        <br><br>
        
        <div id="pnlAgrupadores">
	        <div class="row">'
				<div class="dni-descripcion col-sm-12">
        			<span id="txtPersona"></span>
        		</div>
     		</div>
	        <div class="row">'
				<div class="boton col-sm-6 offset-sm-3">
					<a onclick="fnGenerarTicketBalanceado()" style="font-size:35px" class="justificarMenu myButton1">Consultorio Externo</a>
				</div>'
     		</div>
     		<div class="row">'
				<div class="boton col-sm-6 offset-sm-3">
					<a onclick="fnImprimirTicket()" style="font-size:35px" class="justificarMenu myButton1">Reimpresion de Citas</a>
				</div>
     		</div>
     		<div class="row">
				<div class="boton col-sm-6 offset-sm-3">
					<a onclick="fnCasosEspeciales()" style="font-size:35px" class="justificarMenu myButton1">Casos Especiales</a>
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
    </div>
    <div class="modal" id="nuevoReimprecioncita">
          <div class="modal-dialog">
              <div class="modal-content">
              <div class="modal-body">
                  <div id="ticket">
                      <div class="">
                          <img src="librerias/imagenes/logo.png" height="70px"><br><br>
                      
                          <b><span id="nombreSucursal"></span></b><br>
                          <span>Reempresion de Citas</span><br>
<!--                         <div id="" class=""> -->
<!--                             <p>ID: <span id="numDoc"></span></p> -->
<!--                         </div> -->
                          <span>Fecha :</span><br>
                          <b><span style="font-size:70px" id="ffecha"></span></b><br>
                          <span>Hora :</span><br>
                          <b><span id="fhora"></span></b><br>
                          <span>Especialidad :</span><br>
                          <b><span id="fespecialidad"></span></b><br>
                          <span>Consultorio :</span><br>
                          <b><span id="fconsultorio"></span><br>
                          <span>Medico :</span><br>
                          <b><span id="fmedido"></span><br>
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

		function fnGenerarTicketBalanceado(){
			var dni = '${dni}';		
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			window.location.href = 'mostraropcionesnp.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona;
		}


		function fnCasosEspeciales(){//'N. P'							
			var dni = '${dni}';
			var persona = '${persona}';
			var pideDoc = '${usuario.iPideDocumento}';
			var iValidaDoc =  '${usuario.iValidaDocumento}';
			var tipoDoc =0;
			if(pideDoc ==1 && iValidaDoc == 3){
				tipoDoc = '${tipoDoc}';
				window.location.href = 'menugrupos.app?dni='+dni+'&tipoDoc='+tipoDoc;
			}
			else{
				tipoDoc = 1;
				window.location.href = 'kiosco.app?dni='+dni+'&tipoDoc='+tipoDoc+'&prefijo='+prefijo;
			}			
			
		}
		
		function fnImprimirTicket(){
			var dni = '${dni}';		
			var tipoDoc = '${tipoDoc}';
			var persona = '${persona}';
			var CodEntidad='0000000';
			var fecha='2019-12-30';
			var centro='020';
			var iValidaDoc =  '${usuario.iValidaDocumento}';
			if((iValidaDoc==3) && (tipoDoc== 1)){
	    		$.ajax({ 
		    		type: 'POST', 
		    		url: 'reimiprimitticketessaludcusco.app',
		    		data: {dni: dni, fecha:fecha, centro:centro},	    		    		
		    		success: function (response) {
		    			var data = JSON.parse(response.data);
		    			var cservicio=data.servicio;
		    			var cfecha=data.fecha;
						var cmedico=data.medico;
		    			var chora=data.haten;
		    			var cconsultorio=data.consultorio;
		    			var corden=data.orden;
		    			var ctipo=data.tipo;
		    			var cpaciente=data.paciente;
		    			$("#nuevoReimprecioncita").modal("show");
		    			var date = new Date(data.fechaAtencion);
		    			$("#ffecha").html(cfecha);
		    			$("#fespecialidad").html(cservicio);						
		    			$("#fmedico").html(cmedico);	
		    			$("#fconsultorio").html(cconsultorio);			

		    		}
		    	});
	        }
	    	else{
	        	console.log('aaaaa->>');
	    		window.location.href = 'menugrupos.app?dni='+dni+'&tipoDoc='+tipoDoc;
	        }
			
			

			
		}

		$(document).ready(function() {
			var idSucursal = '${usuario.iSucursal}';						
			var persona = '${persona}';
			$("#txtPersona").html(persona);			
			var idSucursal = '${usuario.iSucursal}';						
			$('.myButton4').attr('href','dni.app');	
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
			
			
		);

    </script>

</body>
</html>