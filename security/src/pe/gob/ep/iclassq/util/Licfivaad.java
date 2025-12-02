package pe.gob.ep.iclassq.util;

import java.math.BigInteger;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

public class Licfivaad {
    private String nempresa;
    private String nsucursal;
    private String nkiosko;
    private String nventanilla;
    private String macAddress;
    private String tipoLicencia;
    private String fecha_inicio;
    private String fecha_fin;
    private String raid5;
    private int    nEmpresaActual;
    private int    nSucursalActual;
    private int    nKioskoActual;    
    private int    nVentanillaActual;  
    private static String mensajeLicencia;

    Licfivaad() {
    //generar una nueva licencia

    }
    

    public Licfivaad(String pLicenciageneral, int pnEmpresaActual, int pnsucursalActual, int pnKioskoActual, int pnVentanillaActual) {

        String pLicencia;
        pLicencia = desencriptalic(pLicenciageneral);
        if (pLicenciageneral.length()<=45) {
        
        }
        try{
            
            System.out.println("la Licencia es:"+ pLicencia);
            this.nempresa=funcionCalculavalores(pLicencia, "nempresa");
            this.nsucursal=funcionCalculavalores(pLicencia, "nsucursal");
            this.nkiosko=funcionCalculavalores(pLicencia, "nkiosko");
            this.nventanilla=funcionCalculavalores(pLicencia, "nventanilla");
            this.macAddress=funcionCalculavalores(pLicencia, "macAddress");
            this.tipoLicencia=funcionCalculavalores(pLicencia, "tipoLicencia");
            this.fecha_inicio=funcionCalculavalores(pLicencia, "fecha_inicio");      
            this.fecha_fin=funcionCalculavalores(pLicencia, "fecha_fin");
            this.raid5=funcionCalculavalores(pLicencia, "raid5");  
            this.mensajeLicencia="Licencia no Valida";
            this.nEmpresaActual=pnEmpresaActual;
            this.nSucursalActual=pnsucursalActual;
            this.nKioskoActual=pnKioskoActual;
            this.nVentanillaActual=pnVentanillaActual;
        }
        catch (Exception e) {
            this.nempresa="00";
            this.nsucursal="000";
            this.nkiosko="000";
            this.nventanilla="000";
            this.macAddress="00-00-00-00-00-00";
            this.tipoLicencia="00";
            this.fecha_inicio="19900101";      
            this.fecha_fin="19900101";
            this.raid5="00";  
            this.mensajeLicencia="Licencia no Valida";
            }
    
        //calcula fecha inicio y fecha fin apartir de la licencia
       //calcula tipoLiencia apartir de la Licencia
      //nEmpresa nSucursal nkiosko sumanventanilla mac     tipoLiencia    fechaInicio fechaFin Verificacion
       //NN       NNN       NNN       NNN             CCCCCC       NN          AAAAMMDD AAAAMMDD     VVV
       //01       123       456       789             012345       67          89012345 67890123     456
       //                                             1                          2          3    
       //1         2         3         4                 5          6             7       8           9
       // -BB-BBB-CCCC-bb- AAMMDD AAMMDD VVV
       	//           {suma id: empresa, sucursal}
        //TIPO_LICENCIA: CC 00 - UNA EMPRESA, UNA SURCURSAL, 10 VENTANILLAS  DEMO
       	//
       	//TIPO_LICENCIA: CC 01 - UNA EMPRESA, UNA SURCURSAL, 10 VENTANILLAS    3
       	//                  02 - UNA EMPRESA UNA SUCURSAL 20 VENTANILLAS       5
       	//                  03 - UNA EMPRESA UNA SUCURSALE 25 TIPO PERPETUA    15
        //                  04   UNA EMPRESA NSUCURSALES N VENTANILLAS  --CORPORATIVO ESSALUD VALIDA LA CANTIDAD DE LICENCIAS
       	//					05   DOS EMPRESAS DOS SUCURSALES Y 10 VENTANILLAS C/U
       	//					06   DOS EMRPESAS N SUCURSALES  Y N VENTANILLAS
       	//                  
        
        
    }
    public boolean calculamaccAddress(String parmaccAdress){
        boolean respuesta;
        respuesta = false;
        try {
            InetAddress ip = InetAddress.getLocalHost();
            System.out.println("Current IP address : " + ip.getHostAddress());

            Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
            while(networks.hasMoreElements()) {
                NetworkInterface network = networks.nextElement();
                byte[] mac = network.getHardwareAddress();
                if(mac != null) {
                    System.out.print("Current MAC address : ");
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < mac.length; i++) {
                        sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                    }
                    if (sb.toString().equals(parmaccAdress)){
                        respuesta = true;
                        break;
                    }
                    System.out.println(sb.toString());
                }
            }
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e){
            e.printStackTrace();
        }
        return respuesta;
    }
    public Date ParseFecha(String fecha)
    {
        SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd");
        Date fechaDate = null;
        try {
            fechaDate = formato.parse(fecha);
        } 
        catch (ParseException ex) 
        {
            System.out.println(ex);
        }
        return fechaDate;
    }
       //nEmpresa nSucursal nkiosko sumanventanilla mac     tipoLiencia    fechaInicio fechaFin Verificacion
       //NN       NNN       NNN       NNN             CCCCCCCCCCCC       NN          AAAAMMDD AAAAMMDD     VV
       //01       234       567       890             123456789012       34          56789012 34567890     12
       //                               1                      2                          3          4    
       //1         2         3         4                 5          6             7       8           9

    public String funcionCalculavalores( String pLicencia, String ptipo){
        String cResultado;
        cResultado="";
        int valor_numerico=0;
        Date valor_date;
        switch(ptipo)
            {case "nempresa": 
                cResultado=pLicencia.substring(0, 2);
                try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="0";
                }
                break;
            case "nsucursal": 
                cResultado=pLicencia.substring(2, 5);
                 try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="0";
                }
                break;
            case "nkiosko": 
                cResultado=pLicencia.substring(5, 8);
                 try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="0";
                }
                break;
            case "nventanilla": 
                cResultado=pLicencia.substring(8, 11);
                 try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="0";
                }
                break;
           case "macAddress": 
                cResultado=pLicencia.substring(11, 23);
                break;                
           case "tipoLicencia": 
                cResultado=pLicencia.substring(23, 25);
                 try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="00";
                } 
                break; 
           case "fecha_inicio": 
                cResultado=pLicencia.substring(25, 33);
                 try
                {
                    valor_date = this.ParseFecha(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="19900101";
                }
                break;
           case "fecha_fin": 
                cResultado=pLicencia.substring(33, 41);
                 try
                {
                    valor_date = this.ParseFecha(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="19900101";
                }
                break;
           case "raid5": 
                cResultado=pLicencia.substring(41, 43);
                 try
                {
                    valor_numerico = Integer.parseInt(cResultado); 
                }
                catch ( Exception ex) 
                {
                        cResultado="00";
                }
                break;
        }
        return cResultado;
    }
    public boolean LicenciaValida()
    {   boolean respuesta=true;
    	String mensajeRaid5="La licencia no es valida a la proporcionada", mensajefecha=" la fecha no es vigente en la licencia";
        String mensajemacAddress=" no corresponde a la macAddress";
        String mensajeEmpresa=" Muchas Empresas de lo permitido"; 
        String mensajeSucursal="Muchos Sucursales de lo permitido";
        String mensajeKiosko="Demasiado Kioskos de lo permitido";
        String mensajeTipoLicencia="Tipo Licencia no Corresponde";
        String mensajeVentanilla="Numero de Ventanillas no corresponde";
        String smacAddress;
        String vn;

        // revisa macAddress
        System.out.println("valor de la macc");
        System.out.println(this.macAddress);
        
        String cadena=this.macAddress;
        String valor1=cadena.substring(0, 2);
        System.out.println(valor1);
        if (this.raid5 != "00") 
        {    
             String valor2=this.macAddress.substring(2, 4);
           smacAddress=this.macAddress.substring(0, 2)+"-"+this.macAddress.substring(2, 4)+"-"+this.macAddress.substring(4, 6)+"-"+this.macAddress.substring(6, 8)+"-"+this.macAddress.substring(8, 10)+"-"+this.macAddress.substring(10, 12);
            
            if (calculamaccAddress(smacAddress)){
                mensajemacAddress="";
            }else  respuesta=false;
            //revisa la fecha

            Date fecha = new Date();
            mensajefecha=" la fecha no es vigente en la licencia";
            if ( fecha.after(ParseFecha(this.fecha_inicio)) && fecha.before(ParseFecha(this.fecha_fin)) ) {
                    mensajefecha="";
            } else respuesta=false;
            vn=verificacionNumerica(this.nempresa,this.nsucursal,this.nkiosko,this.nventanilla,this.macAddress, this.tipoLicencia, this.fecha_inicio,this.fecha_fin);

            if ( vn.equals(this.raid5)  ) {
                    mensajeRaid5="";
            } else respuesta=false;
            //revisar si la cantidad de kioskos y sucursales son parte de la licencia
            if (this.nEmpresaActual<=Integer.parseInt(this.nempresa )){
                mensajeEmpresa="";
            } else respuesta=false;
          if (this.nSucursalActual  <=Integer.parseInt(this.nsucursal )){
                mensajeSucursal="";
            } else respuesta=false;
          if (this.nKioskoActual<=Integer.parseInt(this.nkiosko )){
                mensajeKiosko=" ";
            } else  respuesta=false;
          if (this.nVentanillaActual<=Integer.parseInt(this.nventanilla )){
                mensajeVentanilla=" ";
            } else  respuesta=false;

          if (this.tipoLicencia.equals("04"))
              // SOLO PARA ESALUD
              mensajeTipoLicencia="";
          else respuesta=false;
        } else {
            respuesta=false;
            mensajeEmpresa="";
            mensajeSucursal="";        
            mensajeKiosko=" ";
            mensajeVentanilla=" ";
            mensajeTipoLicencia="";
            mensajefecha="";
            mensajemacAddress="";
        }

        this.mensajeLicencia=mensajefecha+" "+mensajeRaid5+" "+ mensajemacAddress +" "+mensajeEmpresa+ " "+mensajeSucursal+ " "+mensajeKiosko+ " "+mensajeVentanilla+ " "+mensajeTipoLicencia;

    	return respuesta;
    }
    public String desencriptalic(String paraLicencia){
        int x=0;
        char n;
        String m;
        String n0, cadenaoriginal="";
        for (int i=0; i<paraLicencia.length(); i++){
            m=paraLicencia.substring(i, i+1);
            x=paraLicencia.charAt(i);
            if (x<150)
            {    n=this.desencriptavalor(x, i);
                 cadenaoriginal=cadenaoriginal+n;
            }


        }
        return cadenaoriginal;
    } 
    public String encriptalic(String paraLicencia){
        int x=0;
        char n;
        String n0, cadenanueva="", m;
        for (int i=0; i<paraLicencia.length(); i++){
            m=paraLicencia.substring(i,i+1);
            
            x=paraLicencia.charAt(i);
            n=this.encriptavalor(x, i);
            if (n<200){
                cadenanueva=cadenanueva+n;
            }
        }
//        char cchar;
//        String sbyte="";
//        int charCode;
//        String str;
//        cadenanueva=cadenanueva+cadenacompleta.substring(4)+cadenacompleta.substring(0,4);
//        cadenacompleta="";
//        for (int i=0; i<cadenanueva.length()/8; i++){
//            sbyte=cadenanueva.substring(i*8, i*8+8);
//            charCode= Integer.parseInt(sbyte, 2);
//             str= new Character((char)charCode).toString();
//            cadenacompleta=cadenacompleta+str;
//        }
//        
        return cadenanueva;
   }
    public String generalic(int pnEmpresa, int pnSucursal, int pnKiosko, int pnventanilla, String pnmacAddress, String pntipoLicencia, String pnfecha_inicio, String pnfecha_fin){
        String cadenaLicencia, vn, pcfecha_inicio, pcfecha_fin, cadenaLicenciaEnc, resultado;
        String pnmacAddresssinguion="", cadenaLimpia="";
        String[] parts = pnmacAddress.split("-");

        for(int j=0; j<parts.length; j++){
            pnmacAddresssinguion=pnmacAddresssinguion+parts[j];    
        }
        vn=verificacionNumerica(String.valueOf(pnEmpresa),String.valueOf(pnSucursal),String.valueOf(pnKiosko),String.valueOf(pnventanilla),pnmacAddress, pntipoLicencia, pnfecha_inicio,pnfecha_fin);
         String patron = "%02d%03d%03d%03d";
                        //  1    2  3   4  
                          //NN-NNN-NNN-NNN-NN-MAC-TL-AAAAMMDD-AAAAMMDD-vv
                          //1   2   3   3   4   5  6       7     8     9
                          //E+S+K+ES+MAC+TL+FI+FF+vv
                          //1 2 3  4  5  6  7   8+  9
        String resultadoentero = String.format(patron,pnEmpresa,pnSucursal,pnKiosko,pnventanilla);
        String resuttadocadena = pnmacAddresssinguion+ pntipoLicencia+ pnfecha_inicio+ pnfecha_fin+vn;
                                         //    1          2          3         4                5               6                7                 8       9              
        resultado=resultadoentero+resuttadocadena;
        // limpiar de basura solo cadenas de 0 a la 
        cadenaLimpia=limpiaCadena(resultado);
        cadenaLicenciaEnc=encriptalic(cadenaLimpia);
        System.out.println("la licencia es:"+cadenaLimpia);
        System.out.println("la licencia binaria es:"+cadenaLicenciaEnc);


        return cadenaLicenciaEnc;
    } 
    public String limpiaCadena(String pCadena){
// limpiar de caracteres extranos que se ha generado
        int x=0;
        char n;
        String n0, cadenanueva="", m;
        for (int i=0; i<pCadena.length(); i++){
            m=pCadena.substring(i,i+1);
            x=pCadena.charAt(i);
            if (x<200){
                cadenanueva=cadenanueva+m;
            }

        }
        return cadenanueva;        
    } 
    public int suma_macAddress(String pMac){
        String[] parts = pMac.split("-");
        int suma=0;
        int d = 0;
        int n = 0;
        int h=0;
        System.out.println(" mac:"+ pMac);
        String hexadecimal="";
        for(int j=0; j<parts.length; j++){
            hexadecimal=hexadecimal+parts[j];    
        }
        h= hexadecimal.length() - 1;

        for(int i = 0; i<hexadecimal.length(); i++)
        {
            char ch = hexadecimal.charAt(i);
            boolean flag = false;
            switch(ch)
            {
                case '0': n = 0; break;
                case '1': n = 1; break;
                case '2': n = 2; break;
                case '3': n = 3; break;
                case '4': n = 4; break;
                case '5': n = 5; break;
                case '6': n = 6; break;
                case '7': n = 7; break;
                case '8': n = 8; break;
                case '9': n = 9; break;
                case 'A': n = 10; break;
                case 'B': n = 11; break;
                case 'C': n = 12; break;
                case 'D': n = 13; break;
                case 'E': n = 14; break;
                case 'F': n = 15; break;
                default : flag = true;
            }
            if(flag)
            {
                n=0;
                System.out.println("flag no encontrado"+ch); 
                System.out.println("revisar en posicion"+i);
                
            }
            h--;
            suma=suma+n;
        }
        return suma;
    }
    public int suma_fecha(String pfecha){

        int suma=0;
        for (int j=0; j<pfecha.length();j++){
            suma=suma+Character.getNumericValue(pfecha.charAt(j) );
        }
        return suma;
    }
    public String verificacionNumerica(String pnEmpresa, String pnSucursal, String pnKiosko, String pnventanilla, String pnmacAddress,String pntipoLicencia, String pnfecha_inicio, String pnfecha_fin)
    {
        int vv, valor1, valor2;
        String respuesta="00";
        vv=0;
        try
        {

            vv=Integer.parseInt(pnEmpresa)+Integer.parseInt(pnSucursal)+Integer.parseInt(pnKiosko)+Integer.parseInt(pnventanilla)+Integer.parseInt(pntipoLicencia)+suma_macAddress(pnmacAddress)+suma_fecha(pnfecha_inicio)+suma_fecha(pnfecha_fin);
            valor1=vv%10;
            valor2=vv%7;
            respuesta=String.valueOf(valor1)+String.valueOf(valor2);
        }
        catch (Exception ex){
            vv=0;
        }
        return respuesta;
    }
    public char encriptavalor(int pc, int ppos){
        int resultado;
        
        resultado=pc+1*(ppos-1); 
//        switch ( (char)pc )
//            { case '0':
//                resultado='G'+(ppos)-10;
//                break;
//              case '1':
//                resultado='R'+ppos-9;
//                break;
//              case '2':
//                resultado='L'+ppos-8;
//                break;
//              case '3':
//                resultado='I'+ppos-7;
//                break;
//              case '4':
//                resultado='N'+ppos-6;
//                break;
//              case '5':
//                resultado='V'+ppos-5;
//                break;
//              case '6':
//               resultado='T'+ppos-4;
//                break;
//              case '7':
//               resultado='O'+ppos-3;
//                break;
//                  
//              case '8':
//                resultado='B'+ppos-2;
//                break;
//
//              case '9':
//                resultado='Y'+ppos-1;
//                break;
//              
//              case 'A':
//                resultado='U'+ppos;
//                break;
//              case 'B':
//                resultado='Z'+ppos+1;
//                break;
//              case 'C':
//                resultado='M'+ppos+2;
//                break;
//              case 'D':
//                resultado='X'+ppos+3;
//                break;                  
//              case 'E':
//                resultado='S'+ppos+4;
//                break;                   
//              case 'F':
//                resultado='H'+ppos+5;
//                break;     
//              default:
//                resultado='W';
//                break;     
//               
//        }
        return (char)resultado;
    
}
    public char desencriptavalor(int resultado, int ppos){
        int pc;
        pc=resultado -1*(ppos-1);
        return (char)pc;
    
}
    public String mensajeLicencia()
    {
        return this.mensajeLicencia;
    }
}
