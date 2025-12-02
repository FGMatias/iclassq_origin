function time_format(d) {
    hours = format_two_digits(d.getHours());
    minutes = format_two_digits(d.getMinutes());
    return hours + ":" + minutes ;
}

function format_two_digits(n) {
    return n < 10 ? '0' + n : n;
}
function validadCantidadCaracteres(tipoDoc, numero)
   {
	   cantidad=numero.length;
	   if (tipoDoc ==1 && cantidad==8)
		   retorno=true;
		else if (tipoDoc ==2 && cantidad==9)
			retorno=true;
		else 
			retorno=false;			
		
	   return retorno;
   }
function GobSOAPNombre(vdata, PosInicio)
{ 
	i=PosInicio;
	
	nPosFin=vdata.length;

	while(i<nPosFin){
		caracter=vdata.substr(i,1);
		if ( (caracter=='1') ||  (caracter=='2' ) ||  (caracter=='3' ) ||  (caracter=='4' ) ||  (caracter=='5' ) ||  (caracter=='6' ) ||  (caracter=='7' ) ||  (caracter=='8' ) ||  (caracter=='9' ) ||  (caracter=='0' ) ) {
			nPosFin=i;
			break;
		}
		i=i+1;

	}
	cadena=vdata.substr(PosInicio, nPosFin-PosInicio);
	nPosFin=cadena.length;
	i=0;
	// limpiar de espacios en blanco
	cadenaLimpia='';
	caracterAnterior="";
	while(i<nPosFin-1){
		caracter=cadena.substr(i,1);
		//console.log("Pos:"+i+ "caracter:"+caracter+"Anterior:"+caracterAnterior+"x");
		
		if ( (caracter.trim()=="") &&  ((caracterAnterior.trim())==caracter.trim())) {
			console.log("entro a igualdad");
			caracterAnterior=caracter;
		}else {
			if (caracter.trim()=="") {
			cadenaLimpia=cadenaLimpia+",";
			} else {
				cadenaLimpia=cadenaLimpia+caracter;

			}
			caracterAnterior=caracter;
		}
		i=i+1;

	}
	//console.log(" cadenaLimpia"+cadenaLimpia);

	var cadenaArreglo=  cadenaLimpia.split(",");
	resultado=cadenaArreglo[0]+"."+( cadenaArreglo[2].substr(0,1));
	//console.log(" Return "+resultado);
	return resultado
		
}

function GobSOAPFechaNac(vdata, PosInicio)
{ 

	nPosFin=vdata.length;
	i=PosInicio;
	cadenaEval="12 45 7890"
	while(i<nPosFin-1){

		caracter=vdata.substr(i,1);
		cadenaEval=cadenaEval+caracter
		cadenaEval=cadenaEval.substr(1, 10);
		//console.log(" fecha Temporal:"+cadenaEval+"X");
		if ((cadenaEval.substr(2,1)=="/") && (cadenaEval.substr(5,1)=="/")) {
			
			break;
		}
		i=i+1;

	}
	return cadenaEval;
		
}



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
  // funcion para obtener la ip del cliente, probado en mozilla, no chrome
   // vbr 2020/02/13
    function findIP(onNewIP) { //  onNewIp - your listener function for new IPs
        var promise = new Promise(function (resolve, reject) {
            try {
                var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection; //compatibility for firefox and chrome
                var pc = new myPeerConnection({ iceServers: [] }),
                    noop = function () { },
                    localIPs = {},
                    ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
                    key;
                function ipIterate(ip) {
                    if (!localIPs[ip]) onNewIP(ip);
                    localIPs[ip] = true;
                }
                pc.createDataChannel(""); //create a bogus data channel
                pc.createOffer(function (sdp) {
                    sdp.sdp.split('\n').forEach(function (line) {
                        if (line.indexOf('candidate') < 0) return;
                        line.match(ipRegex).forEach(ipIterate);
                    });
                    pc.setLocalDescription(sdp, noop, noop);
                }, noop); // create offer and set local description

                pc.onicecandidate = function (ice) { //listen for candidate events
                    if (ice && ice.candidate && ice.candidate.candidate && ice.candidate.candidate.match(ipRegex)) {
                        ice.candidate.candidate.match(ipRegex).forEach(ipIterate);
                    }
                    resolve("FindIPsDone");
                    return;
                };
            }
            catch (ex) {
                reject(Error(ex));
            }
        });// New Promise(...{ ... });
        return promise;
    };

    //This is the callback that gets run for each IP address found
    function foundNewIP(ip) {
        if (typeof window.ipAddress === 'undefined')
        {
            window.ipAddress = ip;
        }
        else
        {
            window.ipAddress += " - " + ip;
        }
    }

    //This is How to use the Waitable findIP function, and react to the
    //results arriving
    
    function notificacion_windows() {
    	if (Notification) {
    	if (Notification.permission !== "granted") {
    	Notification.requestPermission()
    	}
    	var title = "Iclassq - Sistema de Gestion de Ticket"
    	var extra = {
    	icon: "",
    	body: "Usted tiene Nuevo Ticket por Atender "
    	}
    	var noti = new Notification( title, extra)
    	noti.onclick = {
    	// Al hacer click
    	}
    	noti.onclose = {
    	// Al cerrar
    	}
    	setTimeout( function() { noti.close() }, 10000)
    	}
    	}
    
