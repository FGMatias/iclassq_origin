package pe.gob.ep.iclassq.controller.seguridad;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;












import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;












import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Session;
import pe.gob.ep.iclassq.seguridad.bean.Opcion;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.service.OpcionService;
import pe.gob.ep.iclassq.seguridad.service.RolService;
import pe.gob.ep.iclassq.seguridad.service.SeguridadService;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.service.EssaludService;
import pe.gob.ep.iclassq.ticket.service.TicketService;
import pe.gob.ep.iclassq.util.Util;
import pe.gob.ep.iclassq.negocio.dao.SessionDAO;


@Controller
public class SeguridadController {
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SeguridadService seguridadService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RolService rolService;
	@Autowired
	private OpcionService opcionService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private EssaludService essaludService;
	
	@Autowired	
	private SessionDAO sessionDAO;
	
	
	@RequestMapping(value = "login.app")
	public ModelAndView login() throws Exception {
		ModelAndView modelAndView = new ModelAndView("main/login");
		return modelAndView;
	}		

	@RequestMapping(value = "loginIp.app")
	public ModelAndView loginIp() throws Exception {
		ModelAndView modelAndView = new ModelAndView("main/loginIp");
		return modelAndView;
	}
	
	@RequestMapping(value = "logout.app")
	public ModelAndView logout(HttpSession sesion) throws Exception {
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");
	    if (usuario != null) {
	        essaludService.closeAsistencia(usuario.getiUsuarioId());
	    }
		String session = sesion.getId();
		Date fecha = new Date();
		Session cierre = new Session();
		cierre.setIdSession(session);
		cierre.setHoraSalida(fecha);
		sessionDAO.updateByPrimaryKeySelective(cierre);	
		sesion.removeAttribute("usuario");
		sesion.invalidate();
		ModelAndView modelAndView = new ModelAndView("main/login");
		
		return modelAndView;
	}
	

	@RequestMapping(value = "main.app")
	public ModelAndView home(HttpSession sesion, HttpServletRequest request) throws Exception {
		
		//String fw="main/index2";	
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");
		Integer idUsuario = usuario != null ? usuario.getiUsuarioId() : null;
		Integer iAsistencia = usuario != null ? usuario.getiControlAsistencia() : null;
		int idRol = usuario.getIdRolSelectedLogin().intValue(); 
		int idEmpresa = usuario.getiEmpresa();
		
		System.out.println("idEmpresa->>>>"+idEmpresa);
//		int idEmpresa =0;
//		if(usuario.getiSucursal()!=0){
//			idEmpresa = seguridadService.getEmpresaByIdSucursal(usuario.getiSucursal());	
//		}
		String fw="";

		if(idRol ==3 ){
			
			if(usuario.getiPideDocumento().intValue()==1){
				fw="main/teclado";	//dni
			}
			else if(idEmpresa==1){
				fw="main/menuGrupos";
			}
			else if(idEmpresa==2){
				fw="main/notaria";
			}
			else if(idEmpresa==3){
				fw="main/menuGrupos"; //tecladopj
			} 
			else if(idEmpresa==4){
				fw="main/iafaKiosko";
			} 
			else if(idEmpresa==5){
				fw="main/upKiosko";
			} 			
			else if(idEmpresa==7){
				fw="main/idatKiosko";
			} 	
			else	fw="main/menuGrupos";
				 
		}
		else if(idRol ==1){
			fw="main/empresa";
		}
		else if(idRol ==4){
			int tipoMonitor = usuario.getiMonitorTipo();
			System.out.println("tipoMonitor: "+tipoMonitor);
			if(tipoMonitor<3)  {
				fw="main/monitor1";
			}
			else if(tipoMonitor==5){
				fw="main/monitor5";
			}
			else if(tipoMonitor==4){
				fw="main/monitor2";
			}
			else if(tipoMonitor==20){
				fw="main/monitor2_visualiza";
			}
			else if(tipoMonitor == 21) {
				fw = "main/monitor1_sinllamada";
			}
			else if(tipoMonitor == 22) {
				fw = "main/monitor1_secundario";
			}
			else if(tipoMonitor == 23) {
				fw = "main/monitor_ticket";
			}
			else {
				fw="main/monitor1";
			}
			
		}
		else if(idRol ==6){
			fw="main/sucursalxusuario";
		}		
		else if(idRol ==8 ){
			fw="main/monitor2";
		}
		else if(idRol ==9 ){
			fw="main/monitor3";
		}
		else if(idRol ==5 || idRol == 14){
			fw="main/ventanilla_kon";
			
			if (iAsistencia == 1) {
				essaludService.saveAsistencia(idUsuario);
			}
		}
		else if(idRol ==7 ){
			fw="main/consultor";
		}
		else if(idRol ==2 ){
			fw="main/reportes";
		}
		else if (idRol == 15) {
			fw="main/superadmin";
		}
		else{
			fw="main/index";
		}		
	
		if(usuario==null){
			fw="main/login";
		}else{
			if (usuario.getStrMenu() == null || usuario.getStrMenu().isEmpty()) {
			    usuario.setStrMenu(seguridadService.obtenerOpcionesPorRol(usuario.getIdRolSelectedLogin()));
			    usuario.setRolName(rolService.findByPk(usuario.getIdRolSelectedLogin()).getvRolNombre());
			}
			request.getRequestURI();
			String path=request.getRealPath("librerias/components");
			File components=new File(path);
			String scripts=Util.listFilesForFolder(components);
			sesion.setAttribute("scriptsComponents", scripts);
		 }
		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "obtenerrolesbyusername.app")
	public @ResponseBody Map<String, ? extends Object> obtenerRolesByUsername(HttpSession sesion, String username) throws Exception {
        Map<String, Object> data = new HashMap<String, Object>();
        try{
                data.put("data", seguridadService.findRolesByUserName(username, sesion));
               data.put("success", Boolean.TRUE);
       }catch(GenericExcepcion ge){
               data.put("data", null);
               data.put("success", Boolean.FALSE);
               data.put("message", ge.getMessage());
               log.debug(ge.getMessage());
       }catch (Exception e) {
               // TODO: handle exception
               data.put("data", null);
               data.put("success", Boolean.FALSE);
               data.put("message", "Error inesperado");
               log.debug(e.getMessage());
               e.printStackTrace();
       }
        return data;
}
	
	@RequestMapping(value = "findallrol.app")
	public @ResponseBody Map<String, ? extends Object> findAllRol(Rol rol) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", rolService.findAll(rol));
		}catch(GenericExcepcion ge){
			data.put("data", null);
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}	
	
	@RequestMapping(value = "saverol.app")
	public @ResponseBody Map<String, ? extends Object> saveRol(Rol rol) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			String mode="registr&oacute;";
			if(rol.getiRolId()!=null){
				mode="actualiz&oacute;";
			}
			data.put("data", rolService.save(rol));
			data.put("success", Boolean.TRUE);
			data.put("message", "El rol se "+mode+" de forma satisfactoria.");
		}catch(GenericExcepcion ge){
			data.put("data", null);
			data.put("success", Boolean.FALSE);
			data.put("message", ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "deleterol.app")
	public @ResponseBody Map<String, ? extends Object> deleteRol(Integer idRol) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			rolService.deleteByPk(idRol);
			data.put("success", Boolean.TRUE);
			data.put("message", "El rol se elimin&oacute; de forma satisfactoria.");
		}catch(GenericExcepcion ge){
			data.put("success", Boolean.FALSE);
			log.debug(ge.getMessage());
			data.put("message", ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "findallopciones.app")
	public @ResponseBody Map<String, ? extends Object> findAllOpciones(Opcion opcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", opcionService.findAll(opcion));
		}catch(GenericExcepcion ge){
			data.put("data", new ArrayList<Opcion>());
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Opcion>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "saveopcion.app")
	public @ResponseBody Map<String, ? extends Object> saveOpcion(Opcion opcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			String mode="registr&oacute;";
			if(opcion.getiOpcionId()!=null){
				mode="actualiz&oacute;";
			}
			data.put("data", opcionService.save(opcion));
			data.put("success", Boolean.TRUE);
			data.put("message", "La opcion se "+mode+" de forma satisfactoria.");
		}catch(GenericExcepcion ge){
			data.put("data", null);
			data.put("success", Boolean.FALSE);
			data.put("message", ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "deleteopcion.app")
	public @ResponseBody Map<String, ? extends Object> deleteOpcion(Integer idOpcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			opcionService.deleteByPk(idOpcion);
			data.put("success", Boolean.TRUE);
			data.put("message", "La opcion se elimin&oacute; de forma satisfactoria.");
		}catch(GenericExcepcion ge){
			data.put("success", Boolean.FALSE);
			log.debug(ge.getMessage());
			data.put("message", ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "rolopciontree.app")
	public void testTreeMenu(HttpServletResponse response,HttpSession sesion,Integer idRol) throws Exception {
		Usuario usuario=(Usuario)sesion.getAttribute("usuario");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(usuario!=null){
			if (idRol == null) {
				out.write("[]");
			} else {
				out.write(seguridadService.obtenerTreeOpcionesPorRol(idRol));
			}
			
		}else{
			out.write("[]");
		}
	}
	
	@RequestMapping(value = "insertopcionxrol.app")
	public @ResponseBody Map<String, ? extends Object> insertOpcionPorRol(Rol rol) throws Exception {
		log.debug("insertOpcionPorRol()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", seguridadService.insertOpcionPorRol(rol));
			data.put("message", "Registro Satisfactorio.");
			data.put("success", Boolean.TRUE);
		}catch(GenericExcepcion e){
			data.put("data", null);
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			data.put("message", "Error Inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "geturltomcat.app")
	public @ResponseBody Map<String, ? extends Object> getIpAddressAndPort() throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", seguridadService.getIpAddressAndPort());			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getIpAcceso.app")
	public @ResponseBody Map<String, ? extends Object> getIpAcceso(String pip) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", seguridadService.getIpAcceso(pip));
			data.put("success", Boolean.TRUE);			
		}catch(GenericExcepcion ge){
			data.put("data", null);
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);			
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}	
	
	@RequestMapping(value = "getPublicIP.app")
	public @ResponseBody Map<String, ? extends Object> getPublicIP() throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", seguridadService.getPublicIpAddressAndPort());			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
}
