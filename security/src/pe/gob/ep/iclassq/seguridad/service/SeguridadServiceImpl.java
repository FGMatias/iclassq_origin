package pe.gob.ep.iclassq.seguridad.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.management.ManagementFactory;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;
import javax.management.Query;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.gob.ep.iclassq.ticket.service.TicketService;



























import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Asistencia;
import pe.gob.ep.iclassq.negocio.bean.AsistenciaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Empresa;
import pe.gob.ep.iclassq.negocio.bean.EmpresaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Secuencia;
import pe.gob.ep.iclassq.negocio.bean.SecuenciaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Session;
import pe.gob.ep.iclassq.negocio.bean.SessionCriteria;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.SucursalCriteria;
import pe.gob.ep.iclassq.negocio.dao.AsistenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.EmpresaDAO;
import pe.gob.ep.iclassq.negocio.dao.SessionDAO;
import pe.gob.ep.iclassq.negocio.dao.SucursalDAO;
import pe.gob.ep.iclassq.seguridad.bean.Opcion;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.RolOpcion;
import pe.gob.ep.iclassq.seguridad.bean.RolOpcionCriteria;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioCriteria;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRolCriteria;
import pe.gob.ep.iclassq.seguridad.dao.RolOpcionDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioRolDAO;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Licfivaad;
import pe.gob.ep.iclassq.util.Util;

@Service
public class SeguridadServiceImpl implements SeguridadService {
	
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private RolService rolService;
	@Autowired
	private OpcionService opcionService;
	@Autowired
	private UsuarioRolDAO usuarioRolDAO;
	@Autowired
	private RolOpcionDAO rolOpcionDAO;
	@Autowired
	private SucursalDAO sucursalDAO;
	@Autowired	
	private TicketService ticketService;
	@Autowired	
	private EmpresaDAO empresaDAO;
	@Autowired	
	private UsuarioDAO usuarioDAO;
	@Autowired	
	private SessionDAO sessionDAO;
	@Autowired
	private AsistenciaDAO asistenciaDAO;

	@Override
	public List<UsuarioRol> findRolesByUserName(String username, HttpSession session)
			throws Exception {
		// TODO Auto-generated method stub
		int nCantidadEmpresa, nCantidadSucursal, nCantidadKioskos, nCantidadVentanilla;
		Date fecha = new Date();
		String licencia=ticketService.parametroDescripcion("100");
		//cantidad de empresa
		//cantidad de sucursal
		//cantidad de kiosko
		//cantidad de ventanillas
//		nCantidadEmpresa   =this.ValidaCantidaddeUsuarios("empresa");
//		nCantidadSucursal  =this.ValidaCantidaddeUsuarios("sucursal");
//		nCantidadKioskos   =this.ValidaCantidaddeUsuarios("kiosko");		
//		nCantidadVentanilla=this.ValidaCantidaddeUsuarios("ventanilla");		
//		Licfivaad lic = new Licfivaad(licencia,nCantidadEmpresa ,nCantidadSucursal,nCantidadKioskos,nCantidadVentanilla);	
//		System.out.println("nCantidadEmpresas:"+nCantidadEmpresa);
//		System.out.println("nCantidadSucursal:"+nCantidadSucursal);
//		System.out.println("nCantidadKioskos:"+nCantidadKioskos);
//		System.out.println("nCantidadVentanilla:"+nCantidadVentanilla);
//		System.out.println("licencia :"+licencia);
//		if (!lic.LicenciaValida()){ //!lic.LicenciaValida()
//			 String mensa=lic.mensajeLicencia();
//             System.out.println(" MENSAJE DE LA LICENCIA " +mensa);
//			return null;
//		} 
//		else{
			Usuario usuario=usuarioService.findUsuarioByUserName(username);
			
			List<UsuarioRol> rolesPorUsuario=null;
			
			if(usuario==null){
				throw new GenericExcepcion("El usuario ingresado no existe.");
			}
			
			session.setAttribute("usuario", usuario);
			
			UsuarioRolCriteria usuarioRolCriteria=new UsuarioRolCriteria();
			usuarioRolCriteria.createCriteria().andIUsuarioxrolUsuarioIdEqualTo(usuario.getiUsuarioId());
			
			rolesPorUsuario=usuarioRolDAO.selectByExample(usuarioRolCriteria);
			
			if(rolesPorUsuario==null){
					
				rolesPorUsuario=new ArrayList<UsuarioRol>();
				
			}else{
				
				if(rolesPorUsuario.size()>0){
					for (UsuarioRol usuarioRol : rolesPorUsuario) {
						Usuario user = new Usuario();
						user.setiMonitorTipo(usuario.getiMonitorTipo());
						user.setiRolEquipo(usuario.getiRolEquipo());
						user.setiSucursal(usuario.getiSucursal());
						user.setiVentanilla(usuario.getiVentanilla());
						user.setiUsuarioPrincipalId(usuario.getiUsuarioPrincipalId());
						user.setvUsuarioUsername(usuario.getvUsuarioUsername());
						usuarioRol.setUsuario(user);
						usuarioRol.setRol(rolService.findByPk(usuarioRol.getiUsuarioxrolRolId()));
					}
					
					AsistenciaCriteria asistencia = new AsistenciaCriteria();
					asistencia.createCriteria()
								.andIdUsuarioEqualTo(usuario.getiUsuarioId())
								.andFechaEqualTo(fecha)
								.andEstadoEqualTo(1)
								.andHoraSalidaIsNull();
					
					List<Asistencia> abiertas = asistenciaDAO.selectByExample(asistencia);
                    if (abiertas != null && !abiertas.isEmpty()) {
                            throw new GenericExcepcion("El usuario ya tiene una sesión activa.");
                    }
					
					Date fechaActual = new Date();
					Session sesion = new Session();
					sesion.setIdSession(session.getId());
					sesion.setIdUsuario(usuario.getiUsuarioId());
					sesion.setHoraIngreso(fechaActual);
					sesion.setFecha(fechaActual);
					sessionDAO.insertSelective(sesion);	
				}
			}

			return rolesPorUsuario;
		}
//	}
	
	public static void main(String[] args) {
				
		SeguridadService s=new SeguridadServiceImpl();
		
		List<Map<String, Object>> opcionesPorRol=new ArrayList<Map<String,Object>>();
		Map<String, Object> map=null;
		for (int i = 1; i <= 5; i++) {
			map=new HashMap<String, Object>();
			map.put("idRolOpcion", i);
			map.put("nombreRol", "Administrador del Sistema");
			map.put("nombreOpcion", "opcion - "+i);
			map.put("idOpcion", i);
			if(i==1){
				map.put("indPadre",0);
				map.put("childrens",4);
			}else{
				if(i==3){
					map.put("indPadre", 1);
					map.put("childrens",1);
				}else{
				map.put("indPadre", 1);
				map.put("childrens",0);
				}
			}
			
			map.put("action", "");
			map.put("modulo",0);
			opcionesPorRol.add(map);
		}

		map=new HashMap<String, Object>();
		map.put("idRolOpcion", 6);
		map.put("nombreRol", "Administrador del Sistema");
		map.put("nombreOpcion", "opcion - "+6);
		map.put("idOpcion", 6);
			
		map.put("indPadre",3);
		map.put("childrens",0);
		
		
		map.put("action", "");
		map.put("modulo",0);
		opcionesPorRol.add(map);
	
		
		String menu="";
		try {
			menu = s.strMenuRecursivo(opcionesPorRol);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(menu);
	}
	
	
	@Override
	public String obtenerOpcionesPorRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		
		Date fecha = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fechafin = sdf.parse("2019-09-01");
		if(fecha.after(fechafin)){
			return null;
		}
		else{
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("IDROL", idRol);
			List<Map<String, Object>> opcionesPorRol=rolOpcionDAO.selectMenu(params);
			return this.strMenuRecursivo(opcionesPorRol);	
		}
	}

	private String obtenerChildrens(List<Map<String, Object>> opcionesPorRol,Integer padre){
		
		String childrens="",cadena="";
		Boolean isPadre=false;
		Integer indPadre=null;
		Integer countChildren=null;
		Integer idPadre=null;
		for (Map<String, Object> rolOpcion : opcionesPorRol) {
			indPadre=Integer.parseInt(rolOpcion.get("indPadre").toString());
			idPadre=Integer.parseInt(rolOpcion.get("idOpcion").toString());
			if(indPadre==padre){
				countChildren=Integer.parseInt(rolOpcion.get("childrens").toString());
				isPadre=(countChildren>0?true:false);
				
				if(isPadre){
					
					cadena=obtenerChildrens(opcionesPorRol,idPadre);
					if(!cadena.equals("")){
					childrens=childrens.concat("<li class=\"dropdown-submenu\">");
					childrens=childrens.concat("<a  href=\"#\">"+rolOpcion.get("nombreOpcion").toString()+"</a>");
					childrens=childrens.concat("<ul class=\"dropdown-menu\">");
					childrens=childrens.concat(cadena);
					childrens=childrens.concat("</ul>");
					childrens=childrens.concat("</li>");
					}else{
						childrens=childrens.concat("<li><a href=\"#\" onclick=\"SirepManager.goToComponent(\\'"+rolOpcion.get("action").toString()+"\\',\\'"+rolOpcion.get("nombreOpcion").toString()+"\\');\">"+rolOpcion.get("nombreOpcion").toString()+"</a></li>");
					}
				}else{
				childrens=childrens.concat("<li><a href=\"#\" onclick=\"SirepManager.goToComponent(\\'"+rolOpcion.get("action").toString()+"\\',\\'"+rolOpcion.get("nombreOpcion").toString()+"\\');\">"+rolOpcion.get("nombreOpcion").toString()+"</a></li>");
				}
			}
		}
		
		return childrens;
	}
	
	@Override
	public String strMenuRecursivo(List<Map<String, Object>> opcionesPorRol)
			throws Exception {
		String strMenu="";
		String cadena="";
		Integer idPadre=null;
		List<Map<String, Object>> roots=new ArrayList<Map<String,Object>>();
		if(opcionesPorRol!=null && opcionesPorRol.size()>0){
			for (Map<String, Object> a : opcionesPorRol) {
				if(a.get("indPadre")!=null){
					if(a.get("indPadre").toString().equals("0")){
						roots.add(a);
					}
					
				}
			}
		}

		for (Map<String, Object> root : roots) {
			idPadre = Integer.parseInt(root.get("idOpcion").toString());
			strMenu = strMenu
					.concat("<li class=\"dropdown\">")
					.concat("<a role=\"button\" data-toggle=\"dropdown\"  href=\"#\">"
							+ root.get("nombreOpcion").toString()
							+ "<span class=\"caret\"></span></a>")
					.concat("<ul class=\"dropdown-menu multi-level\" role=\"menu\" aria-labelledby=\"dropdownMenu\">");

			cadena = obtenerChildrens(opcionesPorRol, idPadre);
			strMenu = strMenu.concat(cadena);
			strMenu = strMenu.concat("</ul>");
			strMenu = strMenu.concat("</li>");

		}
		
		return strMenu;
	}

	
	/**
	 @author Arturo Sanchez
	 Opciones por Rol Tree 
	  **/
	@Override
	public String obtenerTreeOpcionesPorRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("IDROL", idRol);
		List<Map<String, Object>> opcionesPorRol=rolOpcionDAO.selectTreeRolOpcion(params);
		return this.strTreeRecursivo(opcionesPorRol);
	}

	@Override
	public String strTreeRecursivo(List<Map<String, Object>> opcionesPorRol)
			throws Exception {
		// TODO Auto-generated method stub
		String strMenu="";
		String cadena="";
		Integer idPadre=null;
		List<Map<String, Object>> roots=new ArrayList<Map<String,Object>>();
		if(opcionesPorRol!=null && opcionesPorRol.size()>0){
			for (Map<String, Object> a : opcionesPorRol) {
				if(a.get("indPadre")!=null){
					if(a.get("indPadre").toString().equals("0")){
						roots.add(a);
					}
					
				}
			}
		}

		for (Map<String, Object> root : roots) {
			idPadre = Integer.parseInt(root.get("idOpcion").toString());
			strMenu = strMenu
					.concat("{\n")
					.concat("\"text\": \""+root.get("nombreOpcion").toString()+"\",\n")
					.concat("\"cls\": \"folder\",\n")
					.concat("\"expanded\": true,\n")
					.concat("\"idOpcion\": "+root.get("idOpcion").toString()+",\n")
					.concat("\"checked\": "+(root.get("idRolOpcion")==null?false:true)+",\n")
					.concat("\"children\": [\n");

			cadena = obtenerChildrensTree(opcionesPorRol, idPadre);
			strMenu = strMenu.concat(cadena);
			strMenu = strMenu.concat("\n]\n},");
		}
		strMenu=strMenu.substring(0, strMenu.length()-1);
		return "["+strMenu+"]";
	
	}
	
private String obtenerChildrensTree(List<Map<String, Object>> opcionesPorRol,Integer padre){
		
		String childrens="",cadena="";
		Boolean isPadre=false;
		Integer indPadre=null;
		Integer countChildren=null;
		Integer idPadre=null;
		for (Map<String, Object> rolOpcion : opcionesPorRol) {
			indPadre=Integer.parseInt(rolOpcion.get("indPadre").toString());
			idPadre=Integer.parseInt(rolOpcion.get("idOpcion").toString());
			if(indPadre==padre){
				countChildren=Integer.parseInt(rolOpcion.get("childrens").toString());
				isPadre=(countChildren>0?true:false);
				
				if(isPadre){
					
					cadena=obtenerChildrensTree(opcionesPorRol,idPadre);
					if(!cadena.equals("")){
					childrens=childrens.concat("{\n");
					childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
					childrens=childrens.concat("\"cls\": \"folder\",\n");
					childrens=childrens.concat("\"expanded\": true,\n");
					childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+",\n");
					childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+"\n");
					childrens=childrens.concat(",\"children\": [\n");
					childrens=childrens.concat(cadena);
					childrens=childrens.concat("]");
					childrens=childrens.concat("},");
					}else{
						childrens=childrens.concat("{\n");
						childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
						childrens=childrens.concat("\"leaf\": true,\n");
						childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+",\n");
						childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"\n},\n");
					}
				}else{
					childrens=childrens.concat("{\n");
					childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
					childrens=childrens.concat("\"leaf\": true,\n");
					childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+",\n");
					childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"\n},\n");
				}
			}
		}
		
		if(!childrens.equals("")){
			childrens=childrens.substring(0, childrens.length()-2);
		}
		
		return childrens;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false, rollbackFor = Exception.class)
	public Map<String, Object> insertOpcionPorRol(Rol rol) throws Exception {
		// TODO Auto-generated method stub
		List<RolOpcion> opcionesPorRol = rol.getOpcionesPorRol();
		Integer idRol = rol.getiRolId();

		RolOpcionCriteria rxocri = new RolOpcionCriteria();
		rxocri.createCriteria().andIRolxopcionRolIdEqualTo(idRol);
		rolOpcionDAO.deleteByExample(rxocri);

		if (opcionesPorRol != null) {
			for (RolOpcion rolOpcion : opcionesPorRol) {
				rolOpcion.setiRolxopcionRolId(idRol);
				rolOpcionDAO.insertSelective(rolOpcion);
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("opcionesPorRol", opcionesPorRol);
		return result;
	}

	@Override
	public Integer getEmpresaByIdSucursal(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub	
		SucursalCriteria sc = new SucursalCriteria();
		sc.createCriteria().andIdEqualTo(idSucursal);
		List<Sucursal> list = new ArrayList<>();
		list = sucursalDAO.selectByExample(sc);
		int idEmpresa = list.get(0).getIdEmpresa();
		return idEmpresa;
	}
	

	public String getIpAddressAndPort() 
		throws MalformedObjectNameException, NullPointerException,
            UnknownHostException {

        MBeanServer beanServer = ManagementFactory.getPlatformMBeanServer();

        Set<ObjectName> objectNames = beanServer.queryNames(new ObjectName("*:type=Connector,*"),
                Query.match(Query.attr("protocol"), Query.value("HTTP/1.1")));

        String host = InetAddress.getLocalHost().getHostAddress();
        String port = objectNames.iterator().next().getKeyProperty("port");

        String ip = host+":"+port;
        return ip;
    }
	
	public String getPublicIpAddressAndPort() throws Exception {
		String publicIp = this.getPublicIp();
		String port = this.getServerPort();
		return publicIp + ":" + port;
	}

	private String getPublicIp() throws IOException {
		String[] services = {
				"https://api.ipify.org",
	            "https://checkip.amazonaws.com",
	            "https://ipinfo.io/ip"	
		};
		
		int intentosFallidos = 0;
		
		for (String service : services) {
			try {
				URL url = new URL(service);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setConnectTimeout(3000);
				con.setReadTimeout(3000);
				
				try (BufferedReader reader = new BufferedReader(
					new InputStreamReader(con.getInputStream()))) {
					return reader.readLine().trim();
				}
			} catch (IOException e) {
				intentosFallidos++;
	            System.err.println("[Intento " + intentosFallidos + "] Error en " + service + ": " + e.getMessage());
			}
		}
		throw new IOException("No se pudo obtener la IP pública");
	}
	
	private String getServerPort() throws Exception {
        MBeanServer beanServer = ManagementFactory.getPlatformMBeanServer();
        Set<ObjectName> objectNames = beanServer.queryNames(
            new ObjectName("*:type=Connector,*"),
            Query.match(Query.attr("protocol"), Query.value("HTTP/1.1"))
        );
        return objectNames.iterator().next().getKeyProperty("port");
    }
	
	public int ValidaCantidaddeUsuarios(String pTipoUsuario) 
		{	int cantidad=0;
			
			switch(pTipoUsuario)
			{	case "empresa":
					EmpresaCriteria ec = new EmpresaCriteria();
					ec.createCriteria().andEstadoEqualTo(1);
					List<Empresa> liste = empresaDAO.selectByExample(ec);
					
					for(int i=0; i<liste.size(); i++){
						cantidad=cantidad+1;
					}
					break;
				case "sucursal":
					SucursalCriteria sc = new SucursalCriteria();
					sc.createCriteria().andEstadoEqualTo(1);
					List<Sucursal> lists = sucursalDAO.selectByExample(sc);
					
					for(int i=0; i<lists.size(); i++){
						cantidad=cantidad+1;
					}
					break;
				case "kiosko":
					UsuarioCriteria usk = new UsuarioCriteria();
					usk.createCriteria().andIRolEquipoIsNotNull().andIRolEquipoGreaterThan(0).andIUsuarioEstadoEqualTo(1).andVUsuarioNombresEqualTo("KIOSKO");
					List<Usuario> listuk = usuarioDAO.selectByExample(usk);
					
					for(int i=0; i<listuk.size(); i++){
						cantidad=cantidad+1;
					}
					break;
				case "ventanilla":
					UsuarioCriteria usv = new UsuarioCriteria();
					usv.createCriteria().andIRolEquipoIsNotNull().andIRolEquipoGreaterThan(0).andIUsuarioEstadoEqualTo(1).andIVentanillaGreaterThan(0);
					List<Usuario> listuv = usuarioDAO.selectByExample(usv);
					
					for(int i=0; i<listuv.size(); i++){
						cantidad=cantidad+1;
					}
					break;			
			}	
			return cantidad;
		}
	
	@Override
	public Usuario getIpAcceso(String pip) throws Exception
		{		UsuarioCriteria usip = new UsuarioCriteria();
				usip.createCriteria().andIRolEquipoIsNotNull().andIRolEquipoGreaterThan(0).andIUsuarioEstadoEqualTo(1).andCUsuarioIpEqualTo(pip);
				List<Usuario> listuip = usuarioDAO.selectByExample(usip);
				System.out.println("Ingreso a getIpAcceso ");
			
		return listuip.get(0);
	}

}