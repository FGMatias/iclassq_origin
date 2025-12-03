package pe.gob.ep.iclassq.controller.seguridad;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;  

import org.apache.commons.io.IOUtils;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pe.gob.ep.iclassq.entidad.BeanEncuesta;
import pe.gob.ep.iclassq.entidad.BeanEncuestaPreguntas;
import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.entidad.BeanUsuariosPermiso;
import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Area;
import pe.gob.ep.iclassq.negocio.bean.Dni;
import pe.gob.ep.iclassq.negocio.bean.Empresa;
import pe.gob.ep.iclassq.negocio.bean.Encuesta;
import pe.gob.ep.iclassq.negocio.bean.EncuestaOpciones;
import pe.gob.ep.iclassq.negocio.bean.EncuestaPreguntas;
import pe.gob.ep.iclassq.negocio.bean.EncuestaRespuesta;
import pe.gob.ep.iclassq.negocio.bean.Prioridad;
import pe.gob.ep.iclassq.negocio.bean.Publicidad;
import pe.gob.ep.iclassq.negocio.bean.RolEquipo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.Test;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.service.RolService;
import pe.gob.ep.iclassq.seguridad.service.SeguridadService;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.service.EssaludService;
import pe.gob.ep.iclassq.ticket.service.TicketService;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Util;
import ws.schild.jave.Encoder;
import ws.schild.jave.MultimediaObject;
import ws.schild.jave.encode.AudioAttributes;
import ws.schild.jave.encode.EncodingAttributes;


@Controller
public class UsuarioController {
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SeguridadService seguridadService;
	@Autowired
	private UsuarioService usuarioService;	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private EssaludService essaludService;
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value = "getAllUsers.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> getAllUsers(Integer idSucursal) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<Usuario> users = usuarioService.getAllUsers(idSucursal); 
			data.put("data", users);
			data.put("success", true);
			data.put("message", users.isEmpty() ? "No se encontraron usuarios" : "Usuarios recuperados exitosamente");
		}catch (Exception e) {
			data.put("data", new ArrayList<Usuario>());
			data.put("success", false);
			data.put("message", "Error al recuperar los usuarios");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "enableUser.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> enableUser(HttpServletRequest req) throws Exception {
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Usuario enabledUser= usuarioService.enableUser(idUsuario);
			data.put("data", enabledUser);
			data.put("message", "El usuario ha sido habilitado de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al habilitar el usuario");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "disableUser.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> disableUser(HttpServletRequest req) throws Exception {
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Usuario enabledUser= usuarioService.disableUser(idUsuario);
			data.put("data", enabledUser);
			data.put("message", "El usuario ha sido deshabilitado de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al deshabilitar el usuario");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//grabar usuario
	@RequestMapping(value = "saveUser.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> saveUser(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String aPaterno = req.getParameter("aPaterno").trim().toUpperCase();
		String aMaterno = req.getParameter("aMaterno").trim().toUpperCase();
		String nombres = req.getParameter("nombres").trim().toUpperCase();
		String dni = req.getParameter("dni").trim();
		String ip = req.getParameter("ip");
		String login = req.getParameter("login").trim().toUpperCase();
		String email = req.getParameter("email").trim().toUpperCase();
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		Integer rol = Integer.parseInt(req.getParameter("rol"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Map<String, Object> result = usuarioService.saveUser(idSucursal, aPaterno, aMaterno, nombres, dni, ip, login, email,idEmpresa, idArea, rol);
			
			boolean success = (boolean) result.get("success");
			data.put("success", success);
			data.put("message", result.get("message"));
			
			if (success) {
				Usuario savedUser = (Usuario) result.get("user");
				data.put("data", savedUser);
			}
		}catch (Exception e) {
			data.put("message", "Error al guardar el usuario: " + e.getMessage());
	        data.put("success", false);
	        log.debug(e.getMessage());
	        e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getUserById.app")
	public @ResponseBody Map<String, ? extends Object> getUserById(Integer idUsuario) throws Exception { 		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			Usuario user = usuarioService.getUserById(idUsuario);
			
			if (user != null) {
				data.put("data", user);
				data.put("success", true);
				data.put("message", "Usuario encontrado exitosamente");
			} else {
				data.put("data", null);
				data.put("message", "No se encontró el usuario con ID: " + idUsuario);
				data.put("success", false);
			}
			
		}catch (Exception e) {
			data.put("data", null);
			data.put("message", "Error al recuperar el usuario");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editUser.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> editUser(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		String aPaternoEdit = req.getParameter("aPaternoEdit").trim().toUpperCase();
		String aMaternoEdit = req.getParameter("aMaternoEdit").trim().toUpperCase();
		String nombresEdit = req.getParameter("nombresEdit").trim().toUpperCase();
		String dniEdit = req.getParameter("dniEdit").trim();
		String emailEdit = req.getParameter("emailEdit").trim().toUpperCase();
		String loginEdit = req.getParameter("loginEdit").toUpperCase();
		String ipEdit = req.getParameter("ipEdit");
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		Integer rolEdit = Integer.parseInt(req.getParameter("rolEdit"));
					
		Map<String, Object> data = new HashMap<String, Object>();

		try {
	        Usuario editedUser = usuarioService.editUser(idSucursal, idUsuario, aPaternoEdit, aMaternoEdit, nombresEdit, dniEdit, emailEdit, loginEdit, ipEdit, idArea, rolEdit);	
	        data.put("data", editedUser);
	        data.put("message", "El usuario ha sido editado de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al editar el usuario");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }

		return data;
	}
	
	@RequestMapping(value = "saveUserAdminSucursal.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> saveUserAdminSucursal(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String aPaterno = req.getParameter("aPaterno").trim().toUpperCase();
		String aMaterno = req.getParameter("aMaterno").trim().toUpperCase();
		String nombres = req.getParameter("nombres").trim().toUpperCase();
		String dni = req.getParameter("dni").trim();
		String login = req.getParameter("login").trim().toUpperCase();
		String email = req.getParameter("email").trim().toUpperCase();
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Map<String, Object> result = usuarioService.saveUserAdminSucursal(idSucursal, aPaterno, aMaterno, nombres, dni, login, email,idEmpresa);
			
			boolean success = (boolean) result.get("success");
			data.put("success", success);
			data.put("message", result.get("message"));
			
			if (success) {
				Usuario savedUser = (Usuario) result.get("user");
				data.put("data", savedUser);
			}
		}catch (Exception e) {
			data.put("message", "Error al guardar el usuario: " + e.getMessage());
	        data.put("success", false);
	        log.debug(e.getMessage());
	        e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editUserAdminSucursal.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> editUserAdminSucursal(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		String aPaternoEdit = req.getParameter("aPaternoEdit").trim().toUpperCase();
		String aMaternoEdit = req.getParameter("aMaternoEdit").trim().toUpperCase();
		String nombresEdit = req.getParameter("nombresEdit").trim().toUpperCase();
		String dniEdit = req.getParameter("dniEdit").trim();
		String emailEdit = req.getParameter("emailEdit").trim().toUpperCase();
		String loginEdit = req.getParameter("loginEdit").toUpperCase();
					
		Map<String, Object> data = new HashMap<String, Object>();

		try {
	        Usuario editedUser = usuarioService.editUserAdminSucursal(idSucursal, idUsuario, aPaternoEdit, aMaternoEdit, nombresEdit, dniEdit, emailEdit, loginEdit);	
	        data.put("data", editedUser);
	        data.put("message", "El usuario ha sido editado de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al editar el usuario");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }

		return data;
	}
	
	@RequestMapping(value = "closeAssistanceUser.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> closeAssistanceUser(HttpServletRequest req) throws Exception {
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			essaludService.closeAsistencia(idUsuario);
			data.put("message", "Se cerró la sesión del usuario");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "No se pudo cerrar la sesión del usuario");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//mostrar usuarios kiosko
	@RequestMapping(value = "findusuariosventanilla.app")
	public @ResponseBody Map<String, ? extends Object> findusuariosventanilla(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		try{			
			data.put("data", usuarioService.findUsuariosVentanilla(idSucursal));
			data.put("message", "Listado de Usuarios");
			data.put("success", Boolean.TRUE);			
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "listarusuarios.app")
	public ModelAndView listarUsuarios(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/usuarios";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "nuevousuario.app")
	public ModelAndView nuevoUsuario(HttpSession sesion, HttpServletRequest request) throws Exception {
		String fw="main/nuevoUsuario";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "listargrupos.app")
	public ModelAndView listarGrupos(HttpSession sesion, HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		
		String fw="main/grupos";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "mostrarempresas.app")
	public ModelAndView mostrarEmpresas(HttpSession sesion, HttpServletRequest request) throws Exception {
		String fw="main/empresa";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		
		return modelAndView;
	}
	
	//20191128 VBR agrega para el linicio del consultor
	
	@RequestMapping(value = "mostrarestadoticketconsultor.app")
	public ModelAndView mostrarestadoticketconsultor(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		
		String fw="main/consultor";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		
		return modelAndView;
	}
	
	// fin 20191128 vbr
	//controller para adjuntar archivos	
	

	@RequestMapping(value = "findusuariobypk.app")
	public @ResponseBody Map<String, ? extends Object> findUsuarioByPk(Integer iUsuarioId) throws Exception {
		log.debug("findAllUsuarios()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.findUsuarioByPk(iUsuarioId));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
//	@RequestMapping(value = "saveusuario.app")
//	public @ResponseBody Map<String, ? extends Object> saveUsuario(Usuario usuario) throws Exception {
//		log.debug("saveUsuario()");
//		Map<String, Object> data = new HashMap<String, Object>();
//		try{
//			String type="registrado";
//			if(usuario.getiUsuarioId()!=null){
//				type="actualizado";
//			}
//			data.put("usuario", usuarioService.save(usuario));
//			data.put("message", "El usuario <b>"+usuario.getvUsuarioUsername()+"</b> ha sido "+type+" de forma satisfactoria");
//			data.put("success", Boolean.TRUE);
//		}catch (GenericExcepcion e) {
//			// TODO: handle exception
//			data.put("usuario", new Usuario());
//			data.put("message", e.getMessage());
//			data.put("success", Boolean.FALSE);
//		}catch (Exception e) {
//			// TODO: handle exception
//			data.put("usuario", new Usuario());
//			data.put("success", "Error inesperado");
//			data.put("success", Boolean.FALSE);
//			e.printStackTrace();
//		}
//		return data;
//	}
	
	@RequestMapping(value = "cambiarclaveuser.app")
	public @ResponseBody Map<String, ? extends Object> cambiarClaveUser(Usuario usuario) throws Exception {
		log.debug("cambiarClave()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			usuarioService.cambiarClave(usuario);
			data.put("success", Boolean.TRUE);
			data.put("message", "La contrase&ntilde;a se actualizo satisfactoriamente.");
			
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado.");
			e.printStackTrace();
		}
		return data;
	}	
	
	@RequestMapping(value = "cambiarestadouser.app")
	public @ResponseBody Map<String, ? extends Object> cambiarEstadoUser(Usuario usuario) throws Exception {
		log.debug("cambiarEstadoUser()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			usuarioService.cambiarEstadoUsuario(usuario);
			data.put("success", Boolean.TRUE);
			if(Util.equiv(usuario.getiUsuarioEstado(), Constante.ESTADO_ACTIVO)){
				data.put("message", "El usuario habilitado de forma satisfactoria.");
			}else{
				data.put("message", "El usuario fue deshabilitado de forma satisfactoria.");
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado.");
			e.printStackTrace();
		}
		return data;
	}	
	
	@RequestMapping(value = "personalizartema.app")
	public @ResponseBody Map<String, ? extends Object> personalizarTema(HttpSession sesion,String bgApp) throws Exception {
		log.debug("cambiarEstadoUser()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Usuario usuarioSesion=(Usuario)sesion.getAttribute("usuario");
			if(usuarioSesion!=null){
				Usuario u=new Usuario();
				u.setiUsuarioId(usuarioSesion.getiUsuarioId());				
				usuarioService.updateByPk(u);
				data.put("success", Boolean.TRUE);
				data.put("message", "Se cambio el tema de forma satisfactoria.");
			}else{
				data.put("message", "La sesion de usuario ha expirado.");
				data.put("success", Boolean.FALSE);
			}
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "No se pudo personalizar el tema.");
			e.printStackTrace();
		}
		return data;
	}
	
	//grabar usuario	
	@RequestMapping(value = "grabarusuario.app")
	public @ResponseBody Map<String, ? extends Object> saveUsuarioXSede(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String codSede = req.getParameter("codSede");
		String aPaterno = req.getParameter("aPaterno").toUpperCase();
		String aMaterno = req.getParameter("aMaterno").toUpperCase();
		String vNombre = req.getParameter("vNombre").toUpperCase();
		Integer iRol = Integer.parseInt(req.getParameter("iRol"));
		String vIp = req.getParameter("vIp");
		String vLogin = req.getParameter("vLogin").toUpperCase();
		String vEmail = req.getParameter("vEmail").toUpperCase();
		Integer iGrupo = Integer.parseInt(req.getParameter("iGrupo"));
		essaludService.saveUsuarioXSede(idSucursal, codSede, aPaterno, aMaterno, vNombre, iRol, vIp, vLogin, vEmail, iGrupo);
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.getAllUsers(idSucursal));
			data.put("message", "El usuario ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	//Guardar Grupo X sede
	@RequestMapping(value = "savegruposxsede.app")
	public @ResponseBody Map<String, ? extends Object> savegruposxsede(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String nombreGrupo = req.getParameter("nombreGrupo").toUpperCase();		
		String prefijoGrupo = req.getParameter("prefijoGrupo").toUpperCase();		
		Integer idAlgoritmo = Integer.parseInt(req.getParameter("idAlgoritmo"));
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		String descripcionCorta = req.getParameter("descripcionCorta").toUpperCase();
		String descripcionLarga = req.getParameter("descripcionLarga");
		Integer kioskoAlg3Entrada = Integer.parseInt(req.getParameter("kioskoAlg3Entrada"));
		Integer kioskoAlg3Minimo = Integer.parseInt(req.getParameter("kioskoAlg3Minimo"));
		String horaInicio = req.getParameter("horaInicio");
		String horaFin = req.getParameter("horaFin");
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.saveGruposXSede(idSucursal, nombreGrupo, prefijoGrupo, idAlgoritmo, idArea, 
					descripcionCorta, descripcionLarga, kioskoAlg3Entrada, kioskoAlg3Minimo, horaInicio, horaFin));
//			data.put("data", essaludService.listarGruposBySucursal(idSucursal));
			data.put("message", "El grupo ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "savesubgruposxsede.app")
	public @ResponseBody Map<String, ? extends Object> savesubgruposxsede(HttpServletRequest req) throws Exception {
		Integer idGrupo = Integer.parseInt(req.getParameter("idGrupo"));		
		String nombreSubGrupo = req.getParameter("nombreSubGrupo").toUpperCase();		
		String prefijoSubGrupo = req.getParameter("prefijoSubGrupo").toUpperCase();		
		Integer idPrioridad = Integer.parseInt(req.getParameter("idPrioridad"));
		Integer idSecuencia = Integer.parseInt(req.getParameter("idSecuencia"));
		String descCortaSubGrupo = req.getParameter("descCortaSubGrupo").toUpperCase();
		String descLargaSubGrupo = req.getParameter("descLargaSubGrupo").toUpperCase();
		Integer prioridadAlgoritmo2 = Integer.parseInt(req.getParameter("prioridadAlgoritmo2"));
		Integer prioridadAlgoritmo3 = Integer.parseInt(req.getParameter("prioridadAlgoritmo3"));
		Integer idAgrupador = Integer.parseInt(req.getParameter("idAgrupador"));
				
		Map<String, Object> data = new HashMap<String, Object>();
		try{			
			data.put("data", essaludService.saveSubGruposXSede(idGrupo, nombreSubGrupo, prefijoSubGrupo, idPrioridad, idSecuencia, 
					descCortaSubGrupo, descLargaSubGrupo, prioridadAlgoritmo2, prioridadAlgoritmo3, idAgrupador));
			data.put("message", "El Sub grupo "+nombreSubGrupo+ "ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	
	@RequestMapping(value = "/generarreporte.app")
	public ModelAndView reporteAgeanexo(HttpServletResponse response) throws Exception {
		
		Map<String, Object> resp = usuarioService.generarReporte();		
		byte[] bytes = (byte[]) resp.get("report");
		response.setContentType("application/" + "pdf");
		response.setHeader("Content-Disposition",
				"attachment; filename=reporte." + "pdf");
		response.setContentLength(bytes.length);
		ServletOutputStream ouputStream = response.getOutputStream();
		ouputStream.write(bytes, 0, bytes.length);
		ouputStream.flush();
		ouputStream.close();
		System.out.println("wwwwww");
//		ModelAndView modelAndView = new ModelAndView("private/printReport");
//		return modelAndView;
		return null;
	}
	
	@RequestMapping(value = "listartablamaestrabygrupo.app")
	public @ResponseBody Map<String, ? extends Object> listarTablaMaestraByGrupo(Integer grupo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarTablaMaestraByGrupo(grupo));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
//	listar grupos x Sede
	@RequestMapping(value = "listargruposxsede.app")
	public @ResponseBody Map<String, ? extends Object> listarGruposXSede(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarGruposXSede(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
//	listar grupos x Sede
	@RequestMapping(value = "listarGruposxventanilla.app")
	public @ResponseBody Map<String, ? extends Object> listarGruposxventanilla(Integer idSucursal, Integer idVentanilla) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarGruposxventanilla(idSucursal, idVentanilla));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarsubgruposxidgrupo.app")
	public @ResponseBody Map<String, ? extends Object> listarSubGruposXIdGrupo(Integer idGrupo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSubGruposXIdGrupo(idGrupo));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<SubGrupo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarareaxsurcursal.app")
	public @ResponseBody Map<String, ? extends Object> listarAreaXSucursal(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAreaXSucursal(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<SubGrupo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "listarareaxsurcursalxPerfil.app")
	public @ResponseBody Map<String, ? extends Object> listarareaxsurcursalxPerfil(Integer idSucursal, Integer idArea) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarareaxsurcursalxPerfil(idSucursal, idArea));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<SubGrupo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "listaalgoritmos.app")
	public @ResponseBody Map<String, ? extends Object> listarAlgoritmos() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAlgoritmos());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<SubGrupo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listaprioridad.app")
	public @ResponseBody Map<String, ? extends Object> listarPrioridad() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarPrioridad());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Prioridad>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarempresas.app")
	public @ResponseBody Map<String, ? extends Object> listarEmpresas() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarEmpresas());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Empresa>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "saveempresa.app")
	public @ResponseBody Map<String, ? extends Object> saveempresa(HttpServletRequest req) throws Exception {
				
		String nombre = req.getParameter("nombre").toUpperCase();		
		String urlLogo = req.getParameter("urlLogo").toUpperCase();
		String ruc = req.getParameter("ruc");
		String telef = req.getParameter("telef");
		String direccion = req.getParameter("direccion");
			
 		
		essaludService.saveEmpresa(nombre, urlLogo, ruc, telef, direccion);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.listarEmpresas());
			data.put("message", "la empresa "+nombre+ "ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "dni.app")
	public ModelAndView dni(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/dni";		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "lector.app")
	public ModelAndView lector(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/lector";		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "teclado.app")
	public ModelAndView teclado(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/teclado";		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "tecladopj.app")
	public ModelAndView tecladoPJ(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/tecladopj";		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "datosPersonales.app")
	public ModelAndView datosPersonales(HttpSession sesion, HttpServletRequest request) throws Exception {
		String numDoc = request.getParameter("numDoc").trim();
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		
		String fw="main/datosPersonales";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("numDoc", numDoc);
		modelAndView.addObject("tipoDoc", tipoDoc);
		return modelAndView;
	}
	
	@RequestMapping(value = "menugrupos.app")
	public ModelAndView menuGrupos(HttpSession sesion,HttpServletRequest request) throws Exception {
		String numDoc = request.getParameter("numDoc").trim();
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		
		String fw="main/menuGrupos";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("numDoc", numDoc);
		modelAndView.addObject("tipoDoc", tipoDoc);
		return modelAndView;
	}
	
	@RequestMapping(value = "menugrupos4.app")
	public ModelAndView menuGrupos4(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String persona = request.getParameter("persona");
		String fw="main/menuGrupos4";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("persona", persona);
		return modelAndView;
	}	
	
	@RequestMapping(value = "kiosco.app")
	public ModelAndView kiosco(HttpSession sesion,HttpServletRequest request) throws Exception {
		String numDoc = request.getParameter("numDoc").trim();
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String prefijo = request.getParameter("prefijo");
		String fw="main/kiosco";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("numDoc", numDoc);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("prefijo", prefijo);
		return modelAndView;
	}
	
	@RequestMapping(value = "kiosco4.app")
	public ModelAndView kiosco4(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String prefijo = request.getParameter("prefijo");
		String persona = request.getParameter("persona");
		String fw="main/kiosco4";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("prefijo", prefijo);
		modelAndView.addObject("persona", persona);
		return modelAndView;
	}
	
	@RequestMapping(value = "listarsubgruposxgrupoandsucursal.app")
	public @ResponseBody Map<String, ? extends Object> listarSubGruposXGrupoAndSucursal(Integer idSucursal, Integer idGrupo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSubGruposXGrupoAndSucursal(idSucursal, idGrupo));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Prioridad>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "mostrarsucursal.app")
	public ModelAndView mostrarSucursal(HttpSession sesion, HttpServletRequest request) throws Exception {
		String idEmpresa = request.getParameter("idEmpresa");
		
		String fw="main/sucursal";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idEmpresa", idEmpresa);
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "mostrarsucursalxusuario.app")
	public ModelAndView mostrarSucursalXUsuario(HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		String fw="main/sucursalxusuario";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idUsuario", idUsuario);
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "listarsucursal.app")
	public @ResponseBody Map<String, ? extends Object> listarSucursal(Integer idEmpresa) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSucursal(idEmpresa));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Empresa>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "savesucursal.app")
	public @ResponseBody Map<String, ? extends Object> savesucursal(
			@RequestParam Integer idEmpresa,
			@RequestParam(value="nombre", required=false, defaultValue="") String nombre,
			@RequestParam(value="ruc", required=false, defaultValue="") String ruc,
			@RequestParam(value="telef", required=false, defaultValue="") String telef,
			@RequestParam(value="direccion", required=false, defaultValue="") String direccion
	) throws Exception {
				
		nombre = nombre.trim().toUpperCase();		
				
		Sucursal branch = essaludService.saveSucursal(idEmpresa, nombre, ruc, telef, direccion);
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", branch);
			data.put("message", "la sucursal "+nombre+ " ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		} catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getsucursalbyid.app")
	public @ResponseBody Map<String, ? extends Object> getSucursalById(Integer idSucursal) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getSucursalById(idSucursal));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editsucursal.app")
	public @ResponseBody Map<String, ? extends Object> editsucursal(
		@RequestParam Integer idSucursal,
		@RequestParam Integer idEmpresa,
		@RequestParam(value="nombreEdit", required=false, defaultValue="") String nombreEdit,
		@RequestParam(value="rucEdit", required=false, defaultValue="") String rucEdit,
		@RequestParam(value="telefEdit", required=false, defaultValue="") String telefEdit,
		@RequestParam(value="direccionEdit", required=false, defaultValue="") String direccionEdit
	) throws Exception {
		
		nombreEdit = nombreEdit.trim().toUpperCase();
		
		Sucursal branch = essaludService.editSucursal(idSucursal, idEmpresa, nombreEdit, rucEdit, telefEdit, direccionEdit);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", branch);
			data.put("message", "la sucursal "+nombreEdit+ " ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		} catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarsucursal.app")
	public @ResponseBody Map<String, ? extends Object> eliminarSucursal(Integer idSucursal, Integer idEmpresa) throws Exception { 		
		
		essaludService.eliminarSucursal(idSucursal);
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.listarSucursal(idEmpresa));
			data.put("message", "la sucursal ha sido eliminada de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "enableSucursal.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> enableSucursal(
		@RequestParam Integer idSucursal,
	    @RequestParam(value="idUsuario", defaultValue="0") int idUsuario
	) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			essaludService.enableSucursalAndMaybeUser(idSucursal, idUsuario);
			data.put("message", "La sucursal ha sido habilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al habilitar la sucursal");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "disableSucursal.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> disableSucursal(
		@RequestParam Integer idSucursal,
	    @RequestParam(value="idUsuario", defaultValue="0") int idUsuario
	) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			essaludService.disableSucursalAndMaybeUser(idSucursal, idUsuario);
			data.put("message", "La sucursal ha sido deshabilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al habilitar la sucursal");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getgrupobyid.app")
	public @ResponseBody Map<String, ? extends Object> getGrupoById(Integer idGrupo) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getGrupoById(idGrupo));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editgrupos.app")
	public @ResponseBody Map<String, ? extends Object> editgrupos(HttpServletRequest req) throws Exception {
		
		Integer idGrupo = Integer.parseInt(req.getParameter("idGrupo"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String nombreEdit = req.getParameter("nombreEdit").toUpperCase();
		String prefijoEdit = req.getParameter("prefijoEdit").toUpperCase();
		Integer algEdit = Integer.parseInt(req.getParameter("algEdit"));
		Integer areaEdit = Integer.parseInt(req.getParameter("areaEdit"));
		String descripCortaEdit = req.getParameter("descripCortaEdit");
		Integer kioskoEntradaEdit = Integer.parseInt(req.getParameter("kioskoEntradaEdit"));
		Integer kioskoMinimoEdit = Integer.parseInt(req.getParameter("kioskoMinimoEdit"));
		String descripLargaEdit = req.getParameter("descripLargaEdit");
		String horaInicioEdit= req.getParameter("horaInicioEdit");
		String horaFinEdit = req.getParameter("horaFinEdit");
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.editGrupos(idGrupo, idSucursal, nombreEdit, prefijoEdit, algEdit, areaEdit, descripCortaEdit, 
					kioskoEntradaEdit, kioskoMinimoEdit,descripLargaEdit, horaInicioEdit, horaFinEdit));
			data.put("message", "el grupo ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	
	@RequestMapping(value = "getsubgrupobyid.app")
	public @ResponseBody Map<String, ? extends Object> getSubGrupoById(Integer idSubGrupo) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getSubGrupoById(idSubGrupo));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editsubgrupos.app")
	public @ResponseBody Map<String, ? extends Object> editsubgrupos(HttpServletRequest req) throws Exception {
		
		Integer idGrupo = Integer.parseInt(req.getParameter("idGrupo"));
		Integer idSubGrupo = Integer.parseInt(req.getParameter("idSubGrupo"));
		String nombreSubGrupoEdit =  req.getParameter("nombreSubGrupoEdit").toUpperCase();	
		String prefijoSubGrupoEdit = req.getParameter("prefijoSubGrupoEdit").toUpperCase();			
		Integer idPrioridadEdit = Integer.parseInt(req.getParameter("idPrioridadEdit"));
		Integer idSecuenciaEdit = Integer.parseInt(req.getParameter("idSecuenciaEdit"));
		String descCortaSubGrupoEdit = req.getParameter(("descCortaSubGrupoEdit"));
		String descLargaSubGrupoEdit = req.getParameter(("descLargaSubGrupoEdit"));
		Integer prioridadAlgoritmo2Edit = Integer.parseInt(req.getParameter("prioridadAlgoritmo2Edit"));
		Integer prioridadAlgoritmo3Edit = Integer.parseInt(req.getParameter("prioridadAlgoritmo3Edit"));
		Integer idAgrupadorEdit = Integer.parseInt(req.getParameter("idAgrupadorEdit"));
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.editSubGrupos(idGrupo, idSubGrupo, nombreSubGrupoEdit, prefijoSubGrupoEdit, idPrioridadEdit, 
					idSecuenciaEdit, descCortaSubGrupoEdit, descLargaSubGrupoEdit, prioridadAlgoritmo2Edit,
					prioridadAlgoritmo3Edit, idAgrupadorEdit));
			data.put("message", "el subgrupo ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarsubgrupo.app")
	public @ResponseBody Map<String, ? extends Object> eliminarSubGrupo(Integer idSubGrupo, Integer idGrupo) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarSubGrupo(idSubGrupo, idGrupo));
			data.put("message", "el subgrupo ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "getempresabyid.app")
	public @ResponseBody Map<String, ? extends Object> getEmpresaById(Integer idEmpresa) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getEmpresaById(idEmpresa));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editempresa.app")
	public @ResponseBody Map<String, ? extends Object> editempresa(HttpServletRequest req) throws Exception {
		
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		String nombreEdit = req.getParameter("nombreEdit").toUpperCase();
		String urlLogoEdit = req.getParameter("urlLogoEdit").toUpperCase();
		String rucEdit = req.getParameter("rucEdit");
		String telefEdit = req.getParameter("telefEdit");
		String direccionEdit = req.getParameter("direccionEdit");
		
		
		essaludService.editEmpresa(idEmpresa, nombreEdit, urlLogoEdit, rucEdit, telefEdit, direccionEdit);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.listarEmpresas());
			data.put("message", "la empresa ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarempresa.app")
	public @ResponseBody Map<String, ? extends Object> eliminarEmpresa(Integer idEmpresa) throws Exception { 		
		
		essaludService.eliminarEmpresa(idEmpresa);
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.listarEmpresas());
			data.put("message", "la empresa ha sido eliminada de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}	
	
	@RequestMapping(value = "reportexarea.app")
	public ModelAndView reporte1(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/reporte1";
		System.out.println("idsucurs: "+idSucursal);
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "reportexdni.app")
	public ModelAndView reporte1_dni(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/reporte1_dni";
		System.out.println("idsucurs: "+idSucursal);
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}	
	
	@RequestMapping(value = "reportexalgoritmo.app")
	public ModelAndView reporte2(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/reporte2";
		System.out.println("idsucurs: "+idSucursal);
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportexgrupo.app")
	public ModelAndView reporte3(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte3";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportexusuario.app")
	public ModelAndView reporte4(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte4";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportexventanilla.app")
	public ModelAndView reporte5(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte5";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportemesxusuario.app")
	public ModelAndView reporte6(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte6";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportemesxgrupo.app")
	public ModelAndView reporte7(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte7";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportemesxarea.app")
	public ModelAndView reporte8(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporte8";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportecomparativo.app")
	public ModelAndView reporte9(HttpSession sesion,HttpServletRequest request) throws Exception {
		String fw="main/reporte9";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "reporteencuesta.app")
	public ModelAndView reporteencuesta(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporteEncuesta";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "grabarusuariomonitor.app")
	public @ResponseBody Map<String, ? extends Object> grabarUsuarioMonitor(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer iSolicitaIp = Integer.parseInt(req.getParameter("iSolicitaIp"));
		String vIp = req.getParameter("vIp");
		Integer iTipoMonitor = Integer.parseInt(req.getParameter("iTipoMonitor"));
		Integer idRolEquipo = Integer.parseInt(req.getParameter("idRolEquipo"));
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		Integer iAreaMonitor = Integer.parseInt(req.getParameter("iAreaMonitor"));
		Integer usuarioPrincipal = Integer.parseInt(req.getParameter("usuarioPrincipal"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.grabarUsuarioMonitor(idSucursal, iSolicitaIp, vIp, iTipoMonitor, idRolEquipo, idEmpresa, iAreaMonitor, usuarioPrincipal, idUsuario));
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "grabarusuariokiosko.app")
	public @ResponseBody Map<String, ? extends Object> grabarUsuarioKiosko(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		Integer iSolicitaIp = Integer.parseInt(req.getParameter("iSolicitaIp"));
		String vIp = req.getParameter("vIp");		
		Integer iTipoValidaDoc = Integer.parseInt(req.getParameter("iTipoValidaDoc"));
		Integer iPideDocumento = Integer.parseInt(req.getParameter("iPideDocumento"));
		Integer iImprimeTicket = Integer.parseInt(req.getParameter("iImprimeTicket"));
		Integer idRolEquipo = Integer.parseInt(req.getParameter("idRolEquipo"));
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		Integer iConfirmaImpresion = Integer.parseInt(req.getParameter("iConfirmaImpresion"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));	
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.grabarUsuarioKiosko(idSucursal, iSolicitaIp, vIp, 
					iTipoValidaDoc, iPideDocumento, iImprimeTicket, idRolEquipo, idEmpresa, iConfirmaImpresion, idUsuario)); 
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "grabarusuarioventanilla.app")
	public @ResponseBody Map<String, ? extends Object> grabarUsuarioVentanilla(HttpServletRequest req) throws Exception {		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer iVentanilla = Integer.parseInt(req.getParameter("iVentanilla"));
		String vIp = req.getParameter("vIp");	
		Integer iArea = Integer.parseInt(req.getParameter("iArea"));
		Integer iControlAsistencia = Integer.parseInt(req.getParameter("iControlAsistencia"));
		Integer iEvalua = Integer.parseInt(req.getParameter("iEvalua"));
		Integer iAnula = Integer.parseInt(req.getParameter("iAnula"));
		String puerto = req.getParameter("puerto").toUpperCase();
		Integer idRolEquipo = Integer.parseInt(req.getParameter("idRolEquipo"));
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.grabarUsuarioVentanilla(idSucursal, idUsuario, iVentanilla, vIp, iArea, iControlAsistencia, iEvalua, iAnula, puerto, idRolEquipo, idEmpresa)); //aPaterno, aMaterno, vNombre, vDNI, vLogin,
			data.put("message", "El usuario ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarventanillasxsucursal.app")
	public ModelAndView listarVentanillaXSucursal(HttpSession sesion,HttpServletRequest request) throws Exception {		
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/ventanillasxsucursal";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "getventanillasxidsucursal.app")
	public @ResponseBody Map<String, ? extends Object> getVentanillasByIdSucursal(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.getVentanillasByIdSucursal(idSucursal));
			data.put("success", Boolean.TRUE);
			data.put("message", "la sucursal ");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Sucursal>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
//vbr 20191216 jalar solo ventanillas del rol.
	
	@RequestMapping(value = "getventanillasxidsucursalRolEquipo.app")
	public @ResponseBody Map<String, ? extends Object> getVentanillasByIdSucursalRolEquipo(Integer idSucursal, Integer idRolEquipo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.getVentanillasByIdSucursalRolEquipo(idSucursal, idRolEquipo));
			data.put("success", Boolean.TRUE);
			data.put("message", "la sucursal ");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Sucursal>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}	
	//end vbr 20191216 jalar solo ventanillas del grupo.
	@RequestMapping(value = "saveventanilla.app")
	public @ResponseBody Map<String, ? extends Object> saveVentanilla(HttpServletRequest req) throws Exception {
				
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String nombreVentanilla = req.getParameter("nombreVentanilla").toUpperCase();		
		String ubicacionVentanilla = req.getParameter("ubicacionVentanilla").toUpperCase();		
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));		
		String descripcionVentanilla = req.getParameter("descripcionVentanilla").toUpperCase();
		Integer iEvalua = Integer.parseInt(req.getParameter("iEvalua"));
		String puerto = req.getParameter("puerto").toUpperCase();
		Integer notifica = Integer.parseInt(req.getParameter("notifica"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.saveVentanilla(nombreVentanilla, ubicacionVentanilla, 
					idArea, idSucursal, descripcionVentanilla,iEvalua, puerto, notifica));			
			data.put("message", "La ventanilla ha sido grabada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getventanillabyid.app")
	public @ResponseBody Map<String, ? extends Object> getVentanillaById(Integer idVentanilla) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getVentanillaById(idVentanilla));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editventanilla.app")
	public @ResponseBody Map<String, ? extends Object> editVentanilla(HttpServletRequest req) throws Exception {
				
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		String nombreVentanillaEdit = req.getParameter("nombreVentanillaEdit").toUpperCase();		
		String ubicacionVentanillaEdit = req.getParameter("ubicacionVentanillaEdit").toUpperCase();		
		Integer idAreaEdit = Integer.parseInt(req.getParameter("idAreaEdit"));
		String descripcionVentanillaEdit = req.getParameter("descripcionVentanillaEdit").toUpperCase();
		Integer iEvaluaEdit = Integer.parseInt(req.getParameter("iEvaluaEdit"));
		String puertoEdit = req.getParameter("puertoEdit").toUpperCase();
		Integer notificaEdit = Integer.parseInt(req.getParameter("notificaEdit"));
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.editVentanilla(idVentanilla, nombreVentanillaEdit, ubicacionVentanillaEdit, 
					idAreaEdit, idSucursal, descripcionVentanillaEdit, iEvaluaEdit, puertoEdit, notificaEdit));			
			data.put("message", "La ventanilla ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "mostrarrolequipo.app")
	public ModelAndView mostrarRolEquipo(HttpSession sesion,HttpServletRequest request) throws Exception {		
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/rolequipo";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "listarrolequipo.app")
	public @ResponseBody Map<String, ? extends Object> listarRolEquipo(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarRolEquipo(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<RolEquipo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	//grabar usuario	
	@RequestMapping(value = "grabarusuariosucursal.app")
	public @ResponseBody Map<String, ? extends Object> grabarusuariosucursal(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String aPaterno = req.getParameter("aPaterno").toUpperCase();
		String aMaterno = req.getParameter("aMaterno").toUpperCase();
		String nombres = req.getParameter("nombres").toUpperCase();
		String ip = req.getParameter("ip");
		String login = req.getParameter("login").toUpperCase();
		String email = req.getParameter("email").toUpperCase();
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		essaludService.saveUsuarioSucursal(idSucursal, aPaterno, aMaterno, nombres, ip, login, email, idEmpresa);
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSucursal(idEmpresa));
			data.put("message", "El usuario admin ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	//grabar usuario	
	@RequestMapping(value = "grabarusuarioadmin.app")
	public @ResponseBody Map<String, ? extends Object> grabarusuarioadmin(HttpServletRequest req) throws Exception {
		String aPaterno = req.getParameter("aPaterno").toUpperCase();
		String aMaterno = req.getParameter("aMaterno").toUpperCase();
		String nombres = req.getParameter("nombres").toUpperCase();
		String login = req.getParameter("login").toUpperCase();
		String email = req.getParameter("email").toUpperCase();
		Integer idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
		essaludService.saveUsuarioAdmin(aPaterno, aMaterno, nombres, login, email, idEmpresa);
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarEmpresas());
			data.put("message", "El usuario admin ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarsucursalxusuario.app")
	public @ResponseBody Map<String, ? extends Object> listarSucursalXUsuario(Integer idEmpresa, Integer idUsuario) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSucursalByUsuario(idEmpresa, idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "la sucursal ");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Sucursal>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
//	obtener ruta imagen
	@RequestMapping(value = "obtenerimagen.app")
	public @ResponseBody Map<String, ? extends Object> obtenerImagen() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarEmpresas());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Empresa>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//Guardar Rol Equipo
	@RequestMapping(value = "saverolequipo.app")
	public @ResponseBody Map<String, ? extends Object> saverolequipo(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String rol = req.getParameter("rol").toUpperCase();
		String tipoEquipo = req.getParameter("tipoEquipo").toUpperCase();
		Integer algoritmo = Integer.parseInt(req.getParameter("algoritmo"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.saveRolEquipo(idSucursal, rol, tipoEquipo, algoritmo));
			data.put("message", "El rol ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "agregargrupoxrol.app")
	public @ResponseBody Map<String, ? extends Object> agregargrupoxrol(HttpServletRequest req) throws Exception {
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));		
		Integer idGrupoRol = Integer.parseInt(req.getParameter("idGrupoRol"));		
		BigDecimal proporcion = new BigDecimal(req.getParameter("proporcion"));	
		Map<String, Object> data = new HashMap<String, Object>();
		try{			
			data.put("data", essaludService.agregarGrupoXRol(idRol, idGrupoRol, proporcion));
			data.put("message", "El grupo "+idGrupoRol+ "ha sido agregado al rol de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listargruposxrol.app")
	public @ResponseBody Map<String, ? extends Object> listarGruposXRol(Integer idRol) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarGruposXRol(idRol));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<RolEquipoGrupoCriteria>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarsubgruposxrol.app")
	public @ResponseBody Map<String, ? extends Object> listarSubGruposXRol(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idRolEquipo= Integer.parseInt(req.getParameter("idRol"));	
		try{
			data.put("data", essaludService.listarSubGruposXRol(idRolEquipo));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {		
			data.put("message", "no se encuentran subgrupos");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarsubgrupoxrol.app")
	public @ResponseBody Map<String, ? extends Object> eliminarSubGrupoXRol(Integer idRolEquipoSubGrupo, Integer idSubGrupo, Integer idRol) throws Exception { 		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarSubGrupoXRol(idRolEquipoSubGrupo, idSubGrupo, idRol));
			data.put("message", "el subgrupo ha sido eliminado del rol de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listargruposxtiempo.app")
	public @ResponseBody Map<String, ? extends Object> listarGruposXTiempo(Integer idRol) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarGruposXTiempo(idRol));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<RolEquipoGrupoCriteria>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "findusuariobyip.app")
	public @ResponseBody Map<String, ? extends Object> findUsuarioByIP() throws Exception {
		log.debug("findUsuarioByIP()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.findUsuarioByIP());
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "accederkiosko.app")
	public ModelAndView accederkiosco(HttpSession sesion,HttpServletRequest request) throws Exception {
		Usuario usuario = (Usuario) usuarioService.findUsuarioByIP();
		Integer idUsuario = usuario.getiUsuarioId();
		System.out.println("kiosco");
		String fw="";
		if(usuario.getiUsuarioId()==null){
			fw="main/login";
			System.out.println("kiosco1");
		}
		else{
			System.out.println(usuario.getiUsuarioId());
			fw="main/dni";
			System.out.println("kiosco2");
		}
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idUsuario", idUsuario);
		return modelAndView;
		
	}
	
	@RequestMapping(value = "gettextopublicidad.app")
	public @ResponseBody Map<String, ? extends Object> getTextoPublicidad(Integer idSucursal) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getTextoPublicidad(idSucursal));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "publicidadtexto.app")
	public ModelAndView publicidadTexto(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/publicidad_texto";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "publicidadvideo.app")
	public ModelAndView publicidadVideo(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/publicidad_video";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "getAllPublicityText.app")
	public @ResponseBody Map<String, ? extends Object> getAllPublicityText(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<Publicidad> publicity = essaludService.getAllPublicityText(idSucursal);
			data.put("data", publicity);
			data.put("success", true);
			data.put("message", publicity.isEmpty() ? "No se encontraron textos" : "Textos recuperados exitosamente");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Publicidad>());
			data.put("success", false);
			data.put("message", "Error al recuperar los textos");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//Guardar publicidad
	@RequestMapping(value = "savePublicityText.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> savePublicityText(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String texto = req.getParameter("texto").trim().toUpperCase();
		Integer secuencia = Integer.parseInt(req.getParameter("secuencia"));	
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Publicidad savedPublicity = essaludService.savePublicityText(idSucursal, texto, secuencia);
			data.put("data", savedPublicity);
			data.put("message", "La publicidad ha sido grabada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error al guardar la publicidad");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getPublicityById.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> getPublicityById(Integer idPublicidad) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			Publicidad publicity = essaludService.getPublicidadById(idPublicidad);
			
			if (publicity != null) {
				data.put("data", publicity);
				data.put("success", true);
				data.put("message", "Publicidad encontrada exitosamente");
			} else {
				data.put("data", null);
	            data.put("success", false);
	            data.put("message", "No se encontró la publicidad con ID: " + idPublicidad);
			}	
		}catch (Exception e) {
			data.put("data", null);
	        data.put("success", false);
	        data.put("message", "Error al recuperar la publicidad");
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "editPublicityText.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> editPublicityText(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idPublicidad = Integer.parseInt(req.getParameter("idPublicidad"));
		String textoEdit = req.getParameter("textoEdit").trim().toUpperCase();
		Integer secuenciaEdit = Integer.parseInt(req.getParameter("secuenciaEdit"));
				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			Publicidad editedPublicity = essaludService.editPublicityText(idSucursal, idPublicidad, textoEdit, secuenciaEdit);	
			data.put("data", editedPublicity);
			data.put("message", "la publicidad ha sido editada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al editar la publicidad");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "deletePublicity.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> deletePublicity(Integer idPublicidad) throws Exception { 		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{		
			Publicidad deletedPublicity  = essaludService.deletePublicity(idPublicidad);
			if (deletedPublicity != null) {
				data.put("data", deletedPublicity);
				data.put("success", true);
				data.put("message", "Publicidad eliminada exitosamente");
			} else {
				data.put("data", null);
	            data.put("success", false);
	            data.put("message", "No se encontró la publicidad con ID: " + idPublicidad);
			}	
		}catch (Exception e) {
			data.put("data", null);
	        data.put("success", false);
	        data.put("message", "Error al eliminar la publicidad");
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getAllPublicityVideo.app")
	public @ResponseBody Map<String, ? extends Object> getAllPublicityVideo(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<Publicidad> publicity = essaludService.getAllPublicityVideo(idSucursal);
			data.put("data", publicity);
			data.put("success", true);
			data.put("message", publicity.isEmpty() ? "No se encontraron videos" : "Videos recuperados exitosamente");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Publicidad>());
			data.put("success", false);
			data.put("message", "Error al recuperar los textos");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//Guardar publicidad
	@RequestMapping(value = "savePublicityVideo.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> savePublicityVideo(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String fileName = req.getParameter("fileName").trim();
		Integer secuencia = Integer.parseInt(req.getParameter("secuencia"));

		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Publicidad savedPublicity = essaludService.savePublicityVideo(idSucursal, fileName, secuencia);	
			data.put("data", savedPublicity);
			data.put("message", "La publicidad ha sido grabada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error al guardar la publicidad");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editPublicityVideo.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> editPublicityVideo(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idPublicidad = Integer.parseInt(req.getParameter("idPublicidad"));
		String fileName = req.getParameter("fileName").trim();
		Integer secuenciaEdit = Integer.parseInt(req.getParameter("secuenciaEdit"));
					
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			Publicidad editedPublicity = essaludService.editPublicityVideo(idSucursal, idPublicidad, fileName, secuenciaEdit);	
			data.put("data", editedPublicity);
			data.put("message", "la publicidad ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			data.put("message", "Error al editar la publicidad");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "subirAudio.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> subirAudio(@RequestBody byte[] audioBytes, HttpServletRequest req ) throws Exception {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Integer idUsuario = Integer.parseInt(req.getHeader("X-ID-Usuario"));
			Integer idTicket = Integer.parseInt(req.getHeader("X-ID-Ticket"));
			Integer idSucursal = Integer.parseInt(req.getHeader("X-ID-Sucursal"));
			
			LocalDateTime now = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
	        String formattedDateTime = now.format(formatter);
	        
	        String nombreTemp = "temp_" + formattedDateTime + ".webm";
	        String nombreFinal = "iclassqAudio_" + idUsuario + "_" + formattedDateTime + ".opus";
	        
	        String carpeta = ticketService.parametroDescripcion("046");
	        
			File directorio = new File(carpeta);
			
			if (!directorio.exists()) {
				directorio.mkdirs();
	        }
			
			File archivoTemp = new File(carpeta, nombreTemp);
			File archivoFinal = new File(carpeta, nombreFinal);
			
			FileOutputStream fos = new FileOutputStream(archivoTemp);
			fos.write(audioBytes);
			fos.close();
			
			Encoder encoder = new Encoder();
			
			AudioAttributes audioAttribs = new AudioAttributes();
			audioAttribs.setCodec("libopus");
			audioAttribs.setBitRate(64000);
			audioAttribs.setChannels(1);
			audioAttribs.setSamplingRate(48000);
			
			EncodingAttributes attrs = new EncodingAttributes();
			attrs.setOutputFormat("opus");
			attrs.setAudioAttributes(audioAttribs);
			
			encoder.encode(new MultimediaObject(archivoTemp), archivoFinal, attrs);
			
			archivoTemp.delete();
			
			String rutaAudio = "/audio/" + nombreFinal;
		
			ticketService.saveRutaAudio(idTicket, rutaAudio, idSucursal);
			
			response.put("success", Boolean.TRUE);
	        response.put("message", "El audio se guardó correctamente");
		} catch (IOException e) {
			response.put("success", Boolean.FALSE);
	        response.put("message", "Error al guardar el audio: " + e.getMessage());
		} 

	    return response;
	}
	
	@RequestMapping(value = "subirVideo.app")
	public @ResponseBody Map<String, Object> subirVideo(@RequestBody byte[] videoBytes, HttpServletRequest req) throws Exception {
	    String nombreArchivo = req.getHeader("X-Nombre-Archivo");
	    Integer idSucursal = Integer.parseInt(req.getHeader("X-ID-Sucursal"));
	    String fileType = req.getHeader("X-File-Type");
	    
	    List<String> allowedVideoTypes = Arrays.asList(
			"video/mp4", "video/avi", "video/quicktime", "video/x-matroska",
	        "video/x-ms-wmv", "video/x-flv", "video/webm", "video/3gpp", "video/ogg"
	    );
	    
	    if (fileType == null || !allowedVideoTypes.contains(fileType)) {
	        Map<String, Object> data = new HashMap<>();
	        data.put("message", "Tipo de archivo no permitido. Solo se aceptan archivos de video.");
	        data.put("success", false);
	        return data;
	    }
	    
	    String carpeta = ticketService.parametroDescripcion("045");
	    File directorio = new File(carpeta);
		
		if (!directorio.exists()) {
			directorio.mkdirs();
        }
		String carpetaDestino = carpeta + idSucursal + "_" + nombreArchivo;

	    try {
	        File archivoDestino = new File(carpetaDestino);
	        FileOutputStream fos = new FileOutputStream(archivoDestino);
	        fos.write(videoBytes);
	        fos.close();
	        Map<String, Object> data = new HashMap<>();
	        data.put("message", "El video se guardo correctamente");
	        data.put("success", true);
	        return data;
	    } catch (IOException e) {
	        e.printStackTrace();
	        Map<String, Object> data = new HashMap<>();
	        data.put("message", "Error al guardar el video");
	        data.put("success", false);
	        return data;
	    }
	}
	
	@RequestMapping(value = "getpublicidadbyid.app")
	public @ResponseBody Map<String, ? extends Object> getPublicidadById(Integer idPublicidad) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getPublicidadById(idPublicidad));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listaragrupadores.app")
	public @ResponseBody Map<String, ? extends Object> listarAgrupadores() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAgrupadores());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "mostrarareas.app")
	public ModelAndView mostrarArea(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/area";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "listararea.app")
	public @ResponseBody Map<String, ? extends Object> listarArea(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarArea(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "savearea.app")
	public @ResponseBody Map<String, ? extends Object> saveArea(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String nombreArea = req.getParameter("nombreArea").toUpperCase();
 		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.saveArea(idSucursal, nombreArea));
			data.put("message", "El area ha sido grabada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getareabyid.app")
	public @ResponseBody Map<String, ? extends Object> getAreaById(Integer idArea) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getAreaById(idArea));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editarea.app")
	public @ResponseBody Map<String, ? extends Object> editArea(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		String nombreAreaEdit = req.getParameter("nombreAreaEdit").toUpperCase();

		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.editArea(idSucursal, idArea, nombreAreaEdit));
			data.put("message", "El area ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}		
	
	@RequestMapping(value = "getAreaByUser.app")
	public @ResponseBody Map<String, ? extends Object> getAreaByUser(Integer idUsuario) throws Exception { 		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			Usuario user = usuarioService.getUserById(idUsuario);
			Integer idArea = user.getiArea();
			Area area = essaludService.getAreaById(idArea);
			
			if (area != null) {
				data.put("data", area);
				data.put("success", true);
				data.put("message", "Area encontrado exitosamente");
			} else {
				data.put("data", null);
				data.put("message", "No se encontró el area con ID: " + area);
				data.put("success", false);
			}
			
		}catch (Exception e) {
			data.put("data", null);
			data.put("message", "Error al recuperar el area");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "getgrupobyprefijo.app")
	public @ResponseBody Map<String, ? extends Object> getGrupoByPrefijo(String prefijo, Integer idSucursal) throws Exception { 		
						
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getGrupoByPrefijo(prefijo, idSucursal));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminargrupo.app")
	public @ResponseBody Map<String, ? extends Object> eliminarGrupo(Integer idGrupo, Integer idSucursal) throws Exception { 		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarGrupo(idGrupo, idSucursal));
			data.put("message", "el subgrupo ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarventanilla.app")
	public @ResponseBody Map<String, ? extends Object> eliminarVentanilla(Integer idSucursal, Integer idVentanilla) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarVentanilla(idVentanilla, idSucursal));
			data.put("message", "la ventanilla ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarusuariosxrol.app")
	public @ResponseBody Map<String, ? extends Object> listarUsuariosXRol(Integer idRol) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.listarUsuariosXRol(idRol));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<RolEquipoGrupoCriteria>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getrolbyid.app")
	public @ResponseBody Map<String, ? extends Object> getRolById(Integer idRol) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", essaludService.getRolById(idRol));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "editusuariomonitor.app")
	public @ResponseBody Map<String, ? extends Object> editUsuarioMonitor(HttpServletRequest req) throws Exception {		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer iSolicitaIpEdit = Integer.parseInt(req.getParameter("iSolicitaIpEdit"));
		String vIpEdit = req.getParameter("vIpEdit");
		Integer iTipoMonitorEdit = Integer.parseInt(req.getParameter("iTipoMonitorEdit"));
		Integer iAreaMonitorEdit = Integer.parseInt(req.getParameter("iAreaMonitorEdit"));
		Integer usuarioPrincipalEdit = Integer.parseInt(req.getParameter("usuarioPrincipalEdit"));
					
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.editUsuarioMonitor(idSucursal, idUsuario, iSolicitaIpEdit, vIpEdit, iTipoMonitorEdit, idRol, iAreaMonitorEdit, usuarioPrincipalEdit));
			data.put("message", "el usuario ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editusuariokiosko.app")
	public @ResponseBody Map<String, ? extends Object> editUsuarioKiosco(HttpServletRequest req) throws Exception {	
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));
		Integer iSolicitaIpEdit = Integer.parseInt(req.getParameter("iSolicitaIpEdit"));
		String vIpEdit = req.getParameter("vIpEdit");		
		Integer iTipoValidaDocEdit = Integer.parseInt(req.getParameter("iTipoValidaDocEdit"));
		Integer iPideDocumentoEdit = Integer.parseInt(req.getParameter("iPideDocumentoEdit"));
		Integer iImprimeTicketEdit = Integer.parseInt(req.getParameter("iImprimeTicketEdit"));
		Integer iConfirmaImpresionEdit = Integer.parseInt(req.getParameter("iConfirmaImpresionEdit"));
					
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.editUsuarioKiosko(idUsuario, idSucursal, iSolicitaIpEdit, vIpEdit, iTipoValidaDocEdit,
					iPideDocumentoEdit, iImprimeTicketEdit, idRol, iConfirmaImpresionEdit)); 
			data.put("message", "el usuario ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editusuarioventanilla.app")
	public @ResponseBody Map<String, ? extends Object> editUsuarioVentanilla(HttpServletRequest req) throws Exception {
		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));	
		Integer iVentanillaEdit = Integer.parseInt(req.getParameter("iVentanillaEdit"));
		String vIpEdit = req.getParameter("vIpEdit");
		Integer iAreaEdit = Integer.parseInt(req.getParameter("iAreaEdit"));
		Integer iControlAsistenciaEdit = Integer.parseInt(req.getParameter("iControlAsistenciaEdit"));
		Integer iEvaluaEdit = Integer.parseInt(req.getParameter("iEvaluaEdit"));
		Integer iAnulaEdit = Integer.parseInt(req.getParameter("iAnulaEdit"));
		String puertoEdit = req.getParameter("puertoEdit").toUpperCase();
		Integer iAtencionEdit = Integer.parseInt(req.getParameter("iAtencionEdit"));
					
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.editUsuarioVentanilla(idUsuario, idSucursal, idRol, iVentanillaEdit, vIpEdit, iAreaEdit, iControlAsistenciaEdit, iEvaluaEdit, iAnulaEdit, puertoEdit, iAtencionEdit));
			data.put("message", "el usuario ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarusuariomonitor.app")
	public @ResponseBody Map<String, ? extends Object> eliminarUsuarioMonitor(Integer idRol, Integer idUsuario) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", usuarioService.eliminarUsuarioMonitor(idUsuario, idRol));
			data.put("message", "el usuario ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "eliminarusuariokiosko.app")
	public @ResponseBody Map<String, ? extends Object> eliminarUsuarioKiosko(Integer idRol, Integer idUsuario) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", usuarioService.eliminarUsuarioKiosko(idUsuario, idRol));
			data.put("message", "el usuario ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "eliminarusuarioventanilla.app")
	public @ResponseBody Map<String, ? extends Object> eliminarUsuarioVentanilla(Integer idRol, Integer idUsuario) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", usuarioService.eliminarUsuarioVentanilla(idUsuario, idRol));
			data.put("message", "el usuario ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminargrupoxrol.app")
	public @ResponseBody Map<String, ? extends Object> eliminarGrupoXRol(Integer idRol, Integer idGrupo) throws Exception { 		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarGrupoXRol(idRol, idGrupo));
			data.put("message", "el grupo ha sido eliminado del rol de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	//Editar Rol Equipo
	@RequestMapping(value = "editrolequipo.app")
	public @ResponseBody Map<String, ? extends Object> editrolequipo(HttpServletRequest req) throws Exception {
		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));
		String rolEdit = req.getParameter("rolEdit").toUpperCase();
		String tipoEquipoEdit = req.getParameter("tipoEquipoEdit").toUpperCase();
		Integer algoritmoEdit = Integer.parseInt(req.getParameter("algoritmoEdit"));
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.editRolEquipo(idSucursal, idRol, rolEdit, tipoEquipoEdit, algoritmoEdit));
			data.put("message", "El rol ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "eliminarrolequipo.app")
	public @ResponseBody Map<String, ? extends Object> eliminarRolEquipo(Integer idSucursal, Integer idRol) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarRolEquipo(idRol, idSucursal));
			data.put("message", "el rol ha sido eliminado de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarvideos.app")
	public @ResponseBody Map<String, ? extends Object> listarVideos(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
//			List<Publicidad> videos = essaludService.listarVideos(idSucursal);
//			List<String> urls = new ArrayList<>();
//			for ( Publicidad video : videos ) {
//				urls.add(video.getUrlVideo());
//			}
			data.put("data", essaludService.listarVideos(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<>());
			log.error("Error al listar videos: " + e.getMessage(), e);
		}
		return data;
	}
	
	@RequestMapping(value = "cambiarclaveusuario.app")
	public @ResponseBody Map<String, ? extends Object> cambiarClaveUsuario(HttpServletRequest req) throws Exception {
		log.debug("resetarClave()");		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		String pass = req.getParameter("pass");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			usuarioService.cambiarClaveUsuario(idUsuario, pass);
			data.put("success", Boolean.TRUE);
			data.put("message", "La contrase&ntilde;a se cambio satisfactoriamente.");
			
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "resetearclaveuser.app")
	public @ResponseBody Map<String, ? extends Object> resetarClaveUser(HttpServletRequest req) throws Exception {
		log.debug("resetarClave()");
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		try{
			usuarioService.resetearClave(idUsuario);
			data.put("success", Boolean.TRUE);
			data.put("message", "La contrase&ntilde;a se reseteo satisfactoriamente.");
			
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error inesperado.");
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "mostrarevaluador.app")
	public ModelAndView mostrarEvaluador(HttpSession sesion,HttpServletRequest request) throws Exception {

		String fw="main/evaluador";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	@RequestMapping(value = "mostrarevaluadorGN.app")
	public ModelAndView mostrarevaluadorGN(HttpSession sesion,HttpServletRequest request) throws Exception {

		String fw="main/evaluadorGN";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "getempresabyidsucursal.app")
	public @ResponseBody Map<String, ? extends Object> getEmpresaByIdSucursal(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", seguridadService.getEmpresaByIdSucursal(idSucursal));
			data.put("success", Boolean.TRUE);
			data.put("message", "la sucursal ");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Sucursal>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "gruposarea1.app")
	public ModelAndView gruposArea1(HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer area = Integer.parseInt(request.getParameter("area"));
		String fw="main/gruposArea1";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("area", area);
		return modelAndView;
	}
	
	@RequestMapping(value = "gruposarea2.app")
	public ModelAndView gruposArea2(HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer area = Integer.parseInt(request.getParameter("area"));
		
		String fw="main/gruposArea2";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("area", area);
		return modelAndView;
	}
	
	@RequestMapping(value = "notaria.app")
	public ModelAndView notaria(HttpSession sesion,HttpServletRequest request) throws Exception {
		System.out.println("tester--->>>");
		String fw="main/notaria";		
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "actualizarventanilla.app")
	public @ResponseBody Map<String, ? extends Object> actualizarVentanilla(HttpServletRequest req) throws Exception {
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		
		essaludService.actualizarVentanilla(idUsuario, idSucursal, idArea, idVentanilla);
		Map<String, Object> data = new HashMap<String, Object>();
		try{
//			data.put("data", essaludService.actualizarVentanilla(idUsuario, idSucursal, idArea, idVentanilla));
			data.put("message", "La ventanilla ha sido actualizada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listartipoAtencionfmv.app")
	public ModelAndView tiposAtencion(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/tipoAtencionfmv"
				+ "";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "dnifmv.app")
	public ModelAndView dnifmv(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/dnifmv"
				+ "";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "findallpersonas.app")
	public @ResponseBody Map<String, ? extends Object> findAllPersonas() throws Exception {
		log.debug("findAllPersonas()");
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.findAllPersonas());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getpersonabyid.app")
	public @ResponseBody Map<String, ? extends Object> getPersonaById(Integer idPersona) throws Exception { 		
						
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.getPersonaById(idPersona));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "inhabilitarpersona.app")
	public @ResponseBody Map<String, ? extends Object> inhabilitarPersona(HttpServletRequest req) throws Exception {
		Integer idPersona = Integer.parseInt(req.getParameter("idPersona"));
		usuarioService.inhabilitarPersona(idPersona);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.findAllPersonas());
			data.put("message", "la persona ha sido inhabilitada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "editPerson.app")
	public @ResponseBody Map<String, ? extends Object> editPerson(HttpServletRequest req) throws Exception {
		
		Integer idPersona = Integer.parseInt(req.getParameter("idPersona"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		String dni = req.getParameter("dni");
		String nombres = req.getParameter("nombres").toUpperCase();
		String apePaterno = req.getParameter("apePaterno").toUpperCase();
		String apeMaterno = req.getParameter("apeMaterno").toUpperCase();
		Integer telefono = Integer.parseInt(req.getParameter("telefono"));
		String correo = req.getParameter("correo").toUpperCase();
		
		usuarioService.editPersona(idPersona, idUsuario, dni, nombres, apePaterno, apeMaterno, telefono, correo);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.findAllPersonas());
			data.put("message", "La persona ha sido editada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	//grabar persona
	@RequestMapping(value = "savePerson.app")
	public @ResponseBody Map<String, ? extends Object> savePerson(HttpServletRequest req) throws Exception {
		String dni = req.getParameter("dni");
		String nombres = req.getParameter("nombres").toUpperCase();
		String aPaterno = req.getParameter("aPaterno").toUpperCase();
		String aMaterno = req.getParameter("aMaterno").toUpperCase();
		Integer tipoRegistro = null;
	    String tipoRegistroParam = req.getParameter("tipoRegistro");
	    if (tipoRegistroParam != null && !tipoRegistroParam.isEmpty()) {
	        tipoRegistro = Integer.parseInt(tipoRegistroParam);
	    }
	    String telefonoStr = req.getParameter("telefono");
	    Integer telefono = null;
	    if (telefonoStr != null && !telefonoStr.trim().isEmpty()) {
	        try {
	            telefono = Integer.parseInt(telefonoStr.trim());
	        } catch (NumberFormatException e) {
	            telefono = null; 
	        }
	    }

	    String correo = null;
	    String correoParam = req.getParameter("correo");
	    if (correoParam != null && !correoParam.trim().isEmpty()) {
	        correo = correoParam.trim().toUpperCase();
	    }
	    
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			Dni persona = usuarioService.savePersonaDni(dni, nombres, aPaterno, aMaterno, tipoRegistro, telefono, correo);
			data.put("data", persona);
			data.put("message", "La persona ha sido grabada de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		} catch (GenericExcepcion e) {
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
			log.warn("Error de negocio al guardar persona con DNI: " + dni, e);
		} catch (Exception e) {
			data.put("message", "Error inesperado al guardar la persona");
			data.put("success", Boolean.FALSE);
			log.error("Error inesperado al guardar persona con DNI: " + dni, e);
		}
		return data;
	}
	
	@RequestMapping(value = "existsPerson.app")
	public @ResponseBody Map<String, Object> existsPerson(HttpServletRequest req) throws Exception{
	    Map<String, Object> data = new HashMap<>();

	    String numeroDocumento = req.getParameter("numeroDocumento");
	    if (numeroDocumento == null || numeroDocumento.isEmpty()) {
	        data.put("message", "El número de documento es obligatorio");
	        data.put("success", Boolean.FALSE);
	        return data;
	    }
	    
	    try {
	        Boolean result = usuarioService.existsPerson(numeroDocumento);
	        data.put("data", result);
	        data.put("message", result ? "La persona existe" : "La persona no existe");
	        data.put("success", Boolean.TRUE);
	    } catch (IllegalArgumentException e) {
	        data.put("message", "Número de documento con formato incorrecto: " + e.getMessage());
	        data.put("success", Boolean.FALSE);
	        log.debug("Error de validación al verificar número de documento: " + numeroDocumento, e);
	    } catch (Exception e) {
	        data.put("message", "Error al verificar la existencia de la persona");
	        data.put("success", Boolean.FALSE);
	        log.debug("Error inesperado al verificar persona con número de documento: " + numeroDocumento, e);
	    }
	    
	    return data;
	}
		
	
	@RequestMapping(value = "eliminardesplegable.app")
	public @ResponseBody Map<String, ? extends Object> eliminarDesplegable(Integer idSucursal, Integer idDesplegable) throws Exception { 		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{				
			data.put("success", Boolean.TRUE);
			data.put("data", essaludService.eliminarRolEquipo(idDesplegable, idSucursal));
			data.put("message", "la lista ha sido eliminada de forma satisfactoria");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
//	listar subgrupos x grupo
	@RequestMapping(value = "listarsubgruposxgrupo.app")
	public @ResponseBody Map<String, ? extends Object> listarSubgruposXGrupo(Integer idGrupoRol) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSubgruposXGrupo(idGrupoRol));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getPersonabydni.app")
	public @ResponseBody Map<String, ? extends Object> getPersonabydni(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		String dniCliente= req.getParameter("dniCliente").trim();	
		try{
			data.put("data", essaludService.getPersonabydni(dniCliente));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {		
			data.put("success", Boolean.FALSE);
			data.put("message", "no se encuentran personas en la base de datos.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "listarsubgruposxsede.app")
	public @ResponseBody Map<String, ? extends Object> listarSubGruposXSede(Integer idGrupo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarSubGruposXSede(idGrupo));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "reporteasistencias.app")
	public ModelAndView reporteAsistencias(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporteAsistencias";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "reportegestiontickets.app")
	public ModelAndView reportegestiontickets(HttpSession sesion,HttpServletRequest request) throws Exception {
		
		String fw="main/reporteTicketGestion";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "listarNombresUsuarios.app")
	public @ResponseBody Map<String, ? extends Object> listarNombresUsuarios(HttpServletRequest req) throws Exception {			
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.getListUsuarios(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarUsuariosVentanilla.app")
	public @ResponseBody Map<String, ? extends Object> listarUsuariosVentanilla(HttpServletRequest req) throws Exception {			
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.getListUsuariosVentanilla(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "agregarsubgrupoxrol.app")
	public @ResponseBody Map<String, ? extends Object> agregarsubgrupoxrol(HttpServletRequest req) throws Exception {
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));		
		Integer idSubGrupo = Integer.parseInt(req.getParameter("idSubGrupo"));		
		BigDecimal proporcionSG = new BigDecimal(req.getParameter("proporcionSG"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{			
			data.put("data", essaludService.agregarSubGrupoXRol(idRol, idSubGrupo, proporcionSG));
			data.put("message", "El grupo "+idSubGrupo+ "ha sido agregado al rol de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listarUsuariosPrincipal.app")
	public @ResponseBody Map<String, ? extends Object> listarUsuariosPrincipal(HttpServletRequest req) throws Exception {	
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", usuarioService.listarUsuarioPrincipal(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "verificarVideoExistente.app", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> verificarVideoExistente(@RequestParam("nombreVideo") String nombreVideo) {
        String rutaCarpeta = null;
		try {
			rutaCarpeta = ticketService.parametroDescripcion("045");
		} catch (Exception e) {
			e.printStackTrace();
		}
        String rutaVideo = rutaCarpeta + nombreVideo;
        System.out.println("nombre del video: " + rutaVideo);
        System.out.println("ruta: " + rutaCarpeta);
        File videoFile = new File(rutaVideo);
        boolean exists = videoFile.exists();
        
        Map<String, Object> response = new HashMap<>();
        response.put("exists", exists);
        return response;
    }
	
	@RequestMapping(value = "listarrolusuario.app")
	public @ResponseBody Map<String, ? extends Object> listarRolUsuario(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarRolUsuario(idSucursal));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<SubGrupo>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "reiniciarServicio.app")
	public @ResponseBody Map<String, ? extends Object> reiniciarServicio(HttpServletRequest req) throws Exception {

		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			essaludService.reiniciarServicio(idSucursal, idUsuario);
			data.put("success", Boolean.TRUE);
			data.put("message", "Proceso ejecutado correctamente");
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getIdEmpresa.app")
	public @ResponseBody Map<String, ? extends Object> getIdEmpresa() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idEmpresa = 0;
		try{
			idEmpresa = ticketService.parametroNumero("044").intValue();
			data.put("data", essaludService.getEmpresaById(idEmpresa));	
		}catch (Exception e) {
			data.put("data", new ArrayList<>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar la empresa");
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "encuesta.app")
	public ModelAndView encuesta(HttpSession sesion,HttpServletRequest request) throws Exception {
		String idSucursal = request.getParameter("idSucursal");
		String fw="main/encuesta";
		
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("idSucursal", idSucursal);
		return modelAndView;
	}
	
	@RequestMapping(value = "getAllSurveys.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAllSurveys(Integer idSucursal) throws Exception {
	    Map<String, Object> data = new HashMap<>();
	    try {
	        List<Encuesta> surveys = essaludService.getAllSurveys(idSucursal);
	        data.put("data", surveys);
	        data.put("success", true);
	        data.put("message", surveys.isEmpty() ? "No se encontraron encuestas" : "Encuestas recuperadas exitosamente");
	    } catch (Exception e) {
	        data.put("data", new ArrayList<Encuesta>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar encuestas");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	@RequestMapping(value = "saveSurvey.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> saveSurvey(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String descripcion = req.getParameter("descripcion").trim().toUpperCase();
		String fechaInicio = req.getParameter("fechaInicio");
		String fechafin = req.getParameter("fechafin");
 		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Encuesta savedSurvey = essaludService.saveSurvey(idSucursal, descripcion, fechaInicio, fechafin);
			data.put("data", savedSurvey);
			data.put("message", "La encuesta ha sido grabada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al guardar la encuesta");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getSurveyById.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSurveyById(Integer idEncuesta) throws Exception {
	    Map<String, Object> data = new HashMap<>();
	    try {
	        Encuesta survey = essaludService.getSurveyById(idEncuesta);
	        
	        if (survey != null) {
	            data.put("data", survey);
	            data.put("success", true);
	            data.put("message", "Encuesta encontrada exitosamente");
	        } else {
	            data.put("data", null);
	            data.put("success", false);
	            data.put("message", "No se encontró la encuesta con ID: " + idEncuesta);
	        }
	    } catch (Exception e) {
	        data.put("data", null);
	        data.put("success", false);
	        data.put("message", "Error al recuperar la encuesta");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	@RequestMapping(value = "editSurvey.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> editSurvey(HttpServletRequest req) throws Exception {
	    Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
	    Integer idEncuesta = Integer.parseInt(req.getParameter("idEncuesta"));
	    String descripcionEdit = req.getParameter("descripcionEdit").trim().toUpperCase();
	    String fechaInicioEdit = req.getParameter("fechaInicioEdit");
	    String fechaFinEdit = req.getParameter("fechaFinEdit");

	    Map<String, Object> data = new HashMap<>();
	    try {
	        Encuesta editedSurvey = essaludService.editSurvey(idSucursal, idEncuesta, descripcionEdit, fechaInicioEdit, fechaFinEdit);
	        data.put("data", editedSurvey);
	        data.put("message", "La encuesta ha sido editada de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al editar la encuesta");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}	
	
	@RequestMapping(value = "enableSurvey.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> enableSurvey(HttpServletRequest req) throws Exception {
		Integer idEncuesta = Integer.parseInt(req.getParameter("idEncuesta"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Encuesta enabledSurvey = essaludService.enableSurvey(idEncuesta);
			data.put("data", enabledSurvey);
			data.put("message", "La encuesta ha sido habilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al habilitar la encuesta");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "disableSurvey.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> disableSurvey(HttpServletRequest req) throws Exception {
		Integer idEncuesta = Integer.parseInt(req.getParameter("idEncuesta"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			Encuesta disabledSurvey = essaludService.disableSurvey(idEncuesta);
			data.put("data", disabledSurvey);
			data.put("message", "La encuesta ha sido deshabilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al deshabilitada la encuesta");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getSurveysByRangeDate.app", method = RequestMethod.GET)
	public @ResponseBody Map<String, ? extends Object> getSurveysByRangeDate(Integer idSucursal) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<BeanEncuesta> surveys = essaludService.getSurveysByRangeDate(idSucursal);
			
			if (surveys != null && !surveys.isEmpty()) {
				data.put("data", surveys);
				data.put("success", true);
				data.put("message", "Encuestas recuperadas exitosamente");
			} else {
				data.put("data", new ArrayList<>());
				data.put("success", false);
				data.put("message", "No se encontraron encuestas para la sucursal con ID: " + idSucursal);
			}
		}catch (Exception e) {
			data.put("data", new ArrayList<>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar encuestas");
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getActiveQuestionsBySurvey.app", method = RequestMethod.GET)
	public @ResponseBody Map<String, ? extends Object> getQuestions(Integer idEncuesta) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<BeanEncuestaPreguntas> questions = essaludService.getActiveQuestionsBySurvey(idEncuesta);
			
			if (questions != null && !questions.isEmpty()) {
				data.put("data", questions);
				data.put("success", true);
				data.put("message", "Preguntas recuperadas exitosamente");
			} else {
				data.put("data", new ArrayList<>());
				data.put("success", false);
				data.put("message", "No se encontraron preguntas para la encuesta con ID: " + idEncuesta);
			}
			
		}catch (Exception e) {
			data.put("data", new ArrayList<>());
			data.put("success", false);
			data.put("message", "Error al recuperar preguntas");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getQuestionsByIdSurvey.app", method = RequestMethod.GET)
	public @ResponseBody Map<String, ? extends Object> getQuestionsByIdEncuesta(Integer idEncuesta) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			List<EncuestaPreguntas> questions = essaludService.getQuestionsByIdSurvey(idEncuesta);
			
			if (questions != null && !questions.isEmpty()) {
				data.put("data", questions);
				data.put("success", true);
				data.put("message", "Preguntas recuperadas exitosamente");
			} else {
				data.put("data", new ArrayList<>());
				data.put("success", false);
				data.put("message", "No se encontraron preguntas para la encuesta con ID: " + idEncuesta);
			}
			
		}catch (Exception e) {
			data.put("data", new ArrayList<>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar preguntas");
	        log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	
	@RequestMapping(value = "saveQuestion.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> saveQuestion(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		Integer idEncuesta = Integer.parseInt(req.getParameter("idEncuesta"));		
		String pregunta = req.getParameter("pregunta").trim().toUpperCase();
 		
		Map<String, Object> data = new HashMap<String, Object>();
		try {
	        EncuestaPreguntas savedQuestion = essaludService.saveQuestion(idSucursal, idEncuesta, pregunta);
	        data.put("data", savedQuestion);
	        data.put("message", "La pregunta ha sido guardada de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al guardar la pregunta");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
		return data;
	}
	
	@RequestMapping(value = "getQuestionById.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> getPreguntaById(Integer idPregunta) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			EncuestaPreguntas question = essaludService.getPreguntaById(idPregunta);
	        
	        if (question != null) {
	            data.put("data", question);
	            data.put("success", true);
	            data.put("message", "Pregunta encontrada exitosamente");
	        } else {
	            data.put("data", null);
	            data.put("success", false);
	            data.put("message", "No se encontró la pregunta con ID: " + idPregunta);
	        }
	    } catch (Exception e) {
	        data.put("data", null);
	        data.put("success", false);
	        data.put("message", "Error al recuperar la pregunta");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
		return data;
	}

	@RequestMapping(value = "editQuestion.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> editQuestion(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idPregunta = Integer.parseInt(req.getParameter("idPregunta"));
		String preguntaEdit = req.getParameter("preguntaEdit").toUpperCase();

		Map<String, Object> data = new HashMap<String, Object>();
		try {
	        EncuestaPreguntas editedQuestion = essaludService.editQuestion(idSucursal, idPregunta, preguntaEdit);
	        data.put("data", editedQuestion);
	        data.put("message", "La pregunta ha sido editada de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al editar la pregunta");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
		return data;
	}	
	
	@RequestMapping(value = "enableQuestion.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> enableQuestion(HttpServletRequest req) throws Exception {
		Integer idPregunta = Integer.parseInt(req.getParameter("idPregunta"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			EncuestaPreguntas enabledQuestion = essaludService.enableQuestion(idPregunta);
			data.put("data", enabledQuestion);
			data.put("message", "La pregunta ha sido habilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al habilitar la encuesta");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "disableQuestion.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> disableQuestion(HttpServletRequest req) throws Exception {
		Integer idPregunta = Integer.parseInt(req.getParameter("idPregunta"));		
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			EncuestaPreguntas disabledQuestion = essaludService.disableQuestion(idPregunta);
			data.put("data", disabledQuestion);
			data.put("message", "La pregunta ha sido deshabilitada de forma satisfactoria");
			data.put("success", true);
		}catch (Exception e) {
			data.put("message", "Error al deshabilitar la encuesta");
			data.put("success", false);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getOptionsSurvey.app", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getOptionsSurvey() throws Exception {
	    Map<String, Object> data = new HashMap<>();
	    try {
	        List<EncuestaOpciones> options = essaludService.getOptionsSurvey();
	        data.put("data", options);
	        data.put("success", true);
	        data.put("message", options.isEmpty() ? "No se encontraron las opciones" : "Opciones recuperadas exitosamente");
	    } catch (Exception e) {
	        data.put("data", new ArrayList<EncuestaOpciones>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar las opciones");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	@RequestMapping(value = "saveAnswer.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> saveAnswer(HttpServletRequest req) throws Exception {
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idEncuesta = Integer.parseInt(req.getParameter("idEncuesta"));
		Integer idPregunta = Integer.parseInt(req.getParameter("idPregunta")); 
		Integer idOpcion = Integer.parseInt(req.getParameter("idOpcion"));
	    Map<String, Object> data = new HashMap<String, Object>();

	    try {
	        EncuestaRespuesta savedAnswer = essaludService.saveAnswer(idTicket, idUsuario, idVentanilla, idSucursal, idEncuesta, idPregunta, idOpcion);
	        data.put("data", savedAnswer);
	        data.put("message", "La respuesta ha sido guardada de forma satisfactoria");
	        data.put("success", true);
	    } catch (Exception e) {
	        data.put("message", "Error al guardar la respuesta");
	        data.put("success", false);
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	@RequestMapping(value = "editusuarioencuestador.app")
	public @ResponseBody Map<String, ? extends Object> editusuarioencuestador(HttpServletRequest req) throws Exception {		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
					
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", usuarioService.editUsuarioEncuestador(idUsuario, idRol, idSucursal, idVentanilla));
			data.put("message", "el usuario ha sido editado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion ge) {
			// TODO: handle exception
			data.put("usuario", new Usuario());
			data.put("message", ge.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getAllSucursal.app")
	public @ResponseBody Map<String, Object> getAllSucursal(
			@RequestParam("idEmpresa") Integer idEmpresa
	) throws Exception {
	    Map<String, Object> data = new HashMap<>();
	    try {
	        List<Sucursal> sucursal = essaludService.getAllSucursal(idEmpresa);
	        data.put("data", sucursal);
	        data.put("success", true);
	        data.put("message", sucursal.isEmpty() ? "No se encontro lista de sucursales" : "Sucursales recuperadas exitosamente");
	    } catch (Exception e) {
	        data.put("data", new ArrayList<Sucursal>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar la lista de sucursales");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	
}
