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
  <script src="librerias/general/general.js"></script>   
  
  <link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
  <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div style="text-align: center">		
					<img src="librerias/poderjudicial/img/logo_poder_judicial.png" width="100" height="100"/>
				</div>							
			</div>
		</div>
		<hr/>
<!--         06-09-2019 -->
        <div class="row">
            <div class="form-inline col-md-6 offset-md-3">
                <label style="font-size:25x; color: #93938E; font-weight: bold;" for="sel1">Seleccione tipo de Documento:&nbsp;&nbsp;</label>
                <select style="font-size:20px; height: 40px" class="form-control" id="cboTipoDocumento">
                  <option value="1">DNI</option>
                  <option value="2">RUC</option>
                  <option value="3">Pasaporte</option>
                </select>
              </div>
        </div><br>
		<div class="row">
            <div class="col-md-12 form-inline">
                <label class="dni-label-pj col-sm-5 col-form-label" for="name">INGRESE SU DOCUMENTO:</label>
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
                <a id="btnKioskoContinuarPJ" class="justificarMenu-pj btnNextPrevius">Continuar</a>
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
    	var dni = $("#txtDniCliente").val();
    	console.log('dni->>>'+dni);
    	//obtener persona x dni    	
    	var tipoDoc = $("#cboTipoDocumento").val();
    	var iValidaDoc =  '${usuario.iValidaDocumento}';
    	var habilitadoSiNo=false;
    	var hora_entrada=new Date();
    	var hora_salida=new Date();
    	var refrigerio_inicio=new Date();
    	var refrigerio_fin=new Date();
    	var fechaHoy=new Date();
    	var persona;
		var prioridad='N';
    	refrigerio_inicio.setHours(13,0,0,0);
    	refrigerio_fin.setHours(13,30,0,0);
    	hora_entrada.setHours(07,15,0,0);
    	hora_salida.setHours(23,30,0,0);
    	console.log("fecha Hoy:");
    	console.log(fechaHoy);
    	console.log(refrigerio_inicio);
    	console.log("valida documento"+iValidaDoc);
    	persona=dni;
    	if (hora_entrada.getTime() > fechaHoy.getTime() ) {
    		alert(" Disculpe a un no es Horario de Inicio de los Servicios Judicales");
    	
    	}else if (hora_salida.getTime() < fechaHoy.getTime() ) {
    		alert(" Disculpe, fuera de Horario de los Servicios Judiciales");
    	
    	}
    	else if ( fechaHoy.getTime() > refrigerio_inicio.getTime()   &&  fechaHoy.getTime() < refrigerio_fin.getTime()  ) {
    		alert(" Disculpe, turno Cerrado por refrigerio");
    	}
    	else { 
	    	if (iValidaDoc==4){
				console.log("tipo de documento "+tipoDoc+" dni: "+dni);
				
	    		//validar tiempo de espera
	    		$.ajax({ 
		    		type: 'POST', 
		    		async: false,
		    		url: 'habilitarsacadoticketsino.app',
		    		data: {dni: dni, tipoDoc: tipoDoc},	    		    		
		    		success: function (response) {
		    			var data = response.data;
		    			console.log('data->>');
		    			console.log(data);
		    			if(data ==1){
		    				console.log("mas de una hora->>");	    				
		    				habilitadoSiNo=true;
		    			}else{
		    				$.alert({
		                        title: 'Error',
		                        content: 'Usted ya tiene un ticket en espera, espere 5 minutos para generar un nuevo ticket'
		                    });
		    				habilitadoSiNo=false;
		    		    	$('#txtDniCliente').val("");
		    		    	$('#txtDniCliente').focus();
		    				
		    			}	    			
		    			
		    		}
		    	});
	    		
	    		if(habilitadoSiNo==true){

	    			if (tipoDoc==1) {
		    			$.ajax({ 
		    	    		type: 'POST', 
		    	    		url: 'obtenerpersonabydniSOAP.app',
		    	    		data: {dni: dni},	    		    		
		    	    		success: function (response) {
		    	    			var data = response.data;
		    	    			if((data.respuesta=="error") || (data.length <50)){
		    	    				$.alert({
		    	                        title: 'Error',
		    	                        content: 'No se encuentra registros para el DNI '+dni
		    	                    });
		    	    			}
		    	    			else{
		    	    				var data = response.data;
		    	    				var fecha_nacimiento;
		    	    				var edad;
		    	    				edad=18;
		    	    				console.log("data es:");
		    	    				console.log(data);
									persona=GobSOAPNombre(data, 28);
									vfecha_nacimiento=GobSOAPFechaNac(data, 40);
		    	    				console.log("persona "+persona);
		    	    				console.log("fecha Nac"+vfecha_nacimiento);
		    	    				
		    	    				if (typeof vfecha_nacimiento!== 'undefined') {
		    	    					fecha_nacimiento=vfecha_nacimiento;
		        	 	    			console.log(fecha_nacimiento);
		        	 	    			var anonac=fecha_nacimiento.substr(6,4);
		        	 	    			console.log("anonac"+anonac);
		        	 	    			var mesnac=fecha_nacimiento.substr(3,2);
		        	 	    			console.log("mesnac"+mesnac);
		        	 	    			var dianac=fecha_nacimiento.substr(0,2);
		        	 	    			console.log("dianac:"+dianac);
		
		        	 	    			edad=calcularEdad(dianac,mesnac, anonac );
		        	 	    			if (typeof edad=='NaN') {
		        	 	    				Edad=18;
		        	 	    			}
    			
				    				}

		    	    				if(edad<=65){
		    		    				prioridad='N';
		    		    			}
		    		    			else {
		    		    				prioridad='P';
		    		    			}
		    	    				console.log(" prioridad"+prioridad);
		    	    				persona=f_cambiacaraterEspecial(persona);
		    	    				console.log("persona "+persona);
		    	    				window.location.href = 'mostrargrupospj.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona+'&prioridad='+prioridad;
		    	    			}
		    	    		}	
				    	 });
	    			} else { 
	    				console.log(" llego a punto 2");
	    				persona=f_cambiacaraterEspecial(persona);
	    				console.log("persona "+persona);
	    				window.location.href = 'mostrargrupospj.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona+'&prioridad='+prioridad;
	    			}
		    			

	    		}
	    		else{
	    			window.location.href = 'mostrargrupospj.app?dni='+dni+'&tipoDoc='+tipoDoc+'&persona='+persona+'&prioridad='+prioridad;
	    		}
			    	
			}
    	}
    
    });

    
    
    function f_cambiacaraterEspecial(pNombre){
    	var pCadena, vcaracter;
    	pCadena="";
    	for (i=0; i<pNombre.length; i++){
    		switch (pNombre.charAt(i)) {
    		  case 'ñ':
    			  vcaracter='n';
    			  break;
    		  case 'Ñ':
    			  vcaracter='N';
    			  break;
    		  case 'Á':
    			  vcaracter='A';
    			  break;
    		  case 'á':
    			  vcaracter='a';
    			  break;
    		  case 'É':
    			  vcaracter='E';
    			  break;
    		  case 'é':
    			  vcaracter='e';
    			  break;     			  
    		  case 'Í':
    			  vcaracter='I';
    			  break;
    		  case 'í':
    			  vcaracter='i';
    			  break; 
    		  case 'Ó':
    			  vcaracter='O';
    			  break;
    		  case 'ó':
    			  vcaracter='o';
    			  break;
    		  case 'Ú':
    			  vcaracter='U';
    			  break;
    		  case 'ú':
    			  vcaracter='u';
    			  break;
    		  default:
    			 vcaracter=pNombre.charAt(i);
    		  break;
    		  
    		}

    		pCadena=pCadena+vcaracter;	
    	}
    	return pCadena;
    
    }
    
    $(document).ready(function() {
    	$('#txtDniCliente').focus();

   		
   		$.ajax({
   			type: 'POST',
   			url: 'listarempresas.app',
   			success: function (response) {
   				var data = response.data;
   				console.log("data len: "+data.length);
   				for(var i=0; i<data.length; i++){
   					console.log("data url: "+data[i].urlLogo);
   					html ='<img src="'+data[i].urlLogo+'" height="125px">'
   	 	            $('#imagen').append(html);
   				
   	    		}
   			}
   		});

    });
    function calcularEdad(dia, mes, ano)
    	{
    	        var fecha_hoy = new Date();
    	        var ahora_ano = fecha_hoy.getYear();
    	        var ahora_mes = fecha_hoy.getMonth()+1;
    	        var ahora_dia = fecha_hoy.getDate();
    	 
    	        // realizamos el calculo
    	        var edad = (ahora_ano + 1900) - ano;
    	        if ( ahora_mes < mes )
    	        {
    	            edad--;
    	        }
    	        if ((mes == ahora_mes) && (ahora_dia < dia))
    	        {
    	            edad--;
    	        }
    	        if (edad > 1900)
    	        {
    	            edad -= 1900;
    	        }
    	 
    	        // calculamos los meses
    	        var meses=0;
    	        if(ahora_mes>mes)
    	            meses=ahora_mes-mes;
    	        if(ahora_mes<mes)
    	            meses=12-(mes-ahora_mes);
    	        if(ahora_mes==mes && dia>ahora_dia)
    	            meses=11;
    	 
    	        // calculamos los dias
    	        var dias=0;
    	        if(ahora_dia>dia)
    	            dias=ahora_dia-dia;
    	        if(ahora_dia<dia)
    	        {
    	            ultimoDiaMes=new Date(ahora_ano, ahora_mes, 0);
    	            dias=ultimoDiaMes.getDate()-(dia-ahora_dia);
    	        }
    	 
   			return edad;
    	    }
    	
   
    </script>
        
</body>

</html>