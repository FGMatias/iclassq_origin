<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ICLASSQ</title>
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="librerias/css/estilosmenu.css" rel="stylesheet">
  
  <link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
  <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
</head>
<body>
	
	<div class="container">
		<div class="row">
		
			<div class="col-sm-12 col-md-3">
				<div style="text-align: center">
					<img  id="img_background" />
				</div>				
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-9 offset-md-3"">
				<div style="text-align: center">
					<div class="dni-label-pj">CORTE SUPERIOR DE JUSTICIA DE LA LIBERTAD</div>
					<div class="dni-label-pj">EVALUACION DE LA CALIDAD DE ATENCION</div>

				</div>				
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-12 form-group">
				<div class="row">
					<div class="col-xs-12 col-sm-1">
                          <label class="dni-label-pj col-sm-12 col-md-2"  for="name"> DOCUMENTO:</label>
                 	</div>
           		 </div>
			</div>           		 
            <div class="col-xs-12 col-sm-5">
                <select style="font-size:20px; height: 40px" class="form-control" id="cboTipoDocumento">
                  <option value="1">DNI</option>
                  <option value="2">RUC</option>
                  <option value="3">Pasaporte</option>
                </select>
            </div>     
            <div class="col-xs-12 col-sm-5">
                <input type="texto" autocomplete="off" id="txtDniCliente" style="background: #B00701; color: #D6D6D6;font-weight: bold; font-size:40px" class="col-sm-5 form-control" >
            </div>
        </div><br><br>
        
        <div class="btn-group-vertical col-md-4 offset-md-4">
            <div class="btn-group">
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(1)">1</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(2)">2</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(3)">3</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(4)">4</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(5)">5</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(6)">6</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(7)">7</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(8)">8</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(9)">9</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btnIngresoDNI" onclick="document.getElementById('txtDniCliente').value=document.getElementById('txtDniCliente').value.slice(0, -1);">Borrar</button>
                <button type="button" class="btnIngresoDNI" onclick="mostrarValor(0)">0</button>
            </div>        
        </div><br><br>
        <br>
		<div class="row">
			<div class="teclado-boton col-xs-12 col-md-3">
				<a href="" class="justificarMenu-pj btnNextPrevius">Atrás</a>
            </div>
            <div class="teclado-boton col-xs-12 col-md-3 offset-md-6" >
                <a id="btnKioskoContinuarPJ" class="justificarMenu-pj btnNextPrevius">Evaluar</a>
            </div>
        </div>
        
    </div>
 <div id="modalEvaluarAtencion" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="border: 10px solid #144766;">
	      <div class="modal-header modal-header-evaluador-success">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Evaluar Atencion</h4>
	      </div>
	      <div class="modal-body">	
	      	<div class="modal-body mx-3">
		        <div class="md-form mb-5">
		        	<h3 style="font-weight: bold; color: #144766">Usted es el ticket N° <span id="numeroTicket"></span></h3>
		        	<h4> </h4>
		          	<h5 style="font-weight: bold; color: #144766">	Su respuesta será tratada de forma confidencial y serán utilizadas únicamente para mejorar el servicio que le proporcionamos.
					</h5>
					<h3 style="font-weight: bold; color: #144766">En relaci&oacute;n al Servicio que tan bueno considera la Atenci&oacute;n brindada?</h3>		          
					<label>Ud. tiene </label>
					<label id="lTiempoEvaluacionEsperatext">0 </label>
   					<input class="form-control" type="hidden" id="lTiempoEvaluacionEspera" style="text-transform:uppercase;" placeholder="id lTiempoEvaluacionEsperatext"/>
					<input class="form-control" type="hidden" id="nroInterval" style="text-transform:uppercase;" placeholder="id nroInterval"/>
					<label>Segundos para evaluar </label>
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

		        </div>
      		</div>   
	      	   	
        	<div class="row">
        		<div class="ec-stars-wrapper" >
         			<input class="form-control" type="hidden" id="txtIdTicket" />       	
					<a href="#" onclick="fnEvaluarAtencion(1)" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(2)" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(3)"  data-value="3" title="Votar con 3 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(4)" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
					<a href="#" onclick="fnEvaluarAtencion(5)" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
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
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>
    
    
<script>

    function mostrarValor(num){
		var cantDigitos = 0;
        if ($('#cboTipoDocumento').val()==1){
            cantDigitos=8;
            if ($('#txtDniCliente').val().length<cantDigitos){
            	$('#txtDniCliente').val($('#txtDniCliente').val()+num);	
            }
		}
        if ($('#cboTipoDocumento').val()==2){
            cantDigitos=11;
            if ($('#txtDniCliente').val().length<cantDigitos){
            	$('#txtDniCliente').val($('#txtDniCliente').val()+num);	
            }
            
		}
        if ($('#cboTipoDocumento').val()==3){
            cantDigitos=10;
            if ($('#txtDniCliente').val().length<cantDigitos){
            	$('#txtDniCliente').val($('#txtDniCliente').val()+num);	
            }
            
		}
    }

    $('#cboTipoDocumento').on('change',function(){
    	$('#txtDniCliente').val("");
    	$('#txtDniCliente').focus();
		console.log(this.value);
	})
        

    $("#btnKioskoContinuarPJ").click(function() {

    		var pip=$("#ipcliente").text();
    		console.log("ip del Cliente: "+pip);
    		// obtiene el tiempo de evaluacion
    		
    		$.ajax({ 
    			type: 'POST', 
    			url: 'obtenerultimoticket.app',
    			data: {pip: pip},
    			success: function (response) {
    				var data = response.data;
    				console.log(response.success);
    				console.log(data);
    				if (response.success){
    					console.log(data.codigo);
    					$("#numeroTicket").html(data.codigo);
    					$("#txtIdTicket").val(data.id);
    					var txtIdTicket=data.id;		    			
    					if (parseInt(txtIdTicket)>0) {
    						console.log(parseInt(txtIdTicket));		    				
    						$("#modalEvaluarAtencion").modal("show");
    						count(txtIdTicket);
    						} 
    				}
    				else{
    					alert(" No tiene Ticket para Evaluar");
    					$("#numeroTicket").html("");
    					$("#txtIdTicket").val('');
    				}
    				
    			}
    		});
	
     });

	function fnEvaluarAtencion(valor){
		console.log('valor->>>'+valor);
		var dni = $('#input_field_2').val();
		console.log('idTicket->>>'+idTicket);
		$.ajax({ 
			type: 'POST', 
			url: 'saveevaluacionatencionpj.app',
			data: {dni: dni, nota: valor},
			success: function (response) {
				var data = response.success;
				if(response.success == true){
					$('#txtIdTicket').val();
					$('#input_field_2').val("");
					$('#input_field_2').focus();
					$('#modalEvaluarAtencion').modal('hide');
				}				     	
							
			}
		});
		
	}



    
     
    $(document).ready(function() {
    	$('#txtDniCliente').focus();

   		
   		$.ajax({
   			type: 'POST',
   			url: 'listarempresas.app',
   			success: function (response) {
   				var data = response.data;

   				for(var i=0; i<data.length; i++){
   					console.log("data url: "+data[i].urlLogo);
   		   			$('#img_background').attr("src",data[i].urlLogo);
   	    		}
   			}
   		});

    });
 

    	
   
    </script>
        
</body>

</html>