package pe.gob.ep.iclassq.controller.seguridad;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import pe.gob.ep.iclassq.entidad.BeanReporteAsistencia;
import pe.gob.ep.iclassq.entidad.BeanTicketManagement;
import pe.gob.ep.iclassq.entidad.BeanTicketPreview;
import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Asistencia;
import pe.gob.ep.iclassq.negocio.bean.Empresa;
import pe.gob.ep.iclassq.negocio.bean.Encuesta;
import pe.gob.ep.iclassq.negocio.bean.EncuestaCriteria;
import pe.gob.ep.iclassq.negocio.bean.MotivoAusencia;
import pe.gob.ep.iclassq.negocio.bean.Prioridad;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.Ticket;
import pe.gob.ep.iclassq.negocio.bean.TipoDocumento;
import pe.gob.ep.iclassq.negocio.bean.UsuarioAusencia;
import pe.gob.ep.iclassq.seguridad.bean.Test;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.service.RolService;
import pe.gob.ep.iclassq.seguridad.service.SeguridadService;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.service.EssaludService;
import pe.gob.ep.iclassq.ticket.service.TicketService;
import pe.gob.ep.iclassq.util.AudioZipExporter;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Util;

@Controller
public class TicketController {
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private EssaludService essaludService;

	@Autowired
	private  UsuarioService usuarioService;	
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value = "generarticketatencion.app")
	public @ResponseBody Map<String, ? extends Object> generarTicketAtencion(HttpServletRequest req) throws Exception {
		
		Integer idSubgrupo = Integer.parseInt(req.getParameter("idSubgrupo"));		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));		
		String prefijo = req.getParameter("prefijo").toUpperCase();		
		String nombre = req.getParameter("nombre").toUpperCase();
		String numDoc = req.getParameter("numDoc").trim();
		Integer tipoDoc = Integer.parseInt(req.getParameter("tipoDoc"));
		Integer validaDoc = Integer.parseInt(req.getParameter("validaDoc"));
		Map<String, Object> data = new HashMap<String, Object>();
		
		try{
			data.put("data", essaludService.generarTicketAtencion(idSubgrupo, idSucursal, prefijo, nombre, numDoc, tipoDoc));
			data.put("message", "Ticket generado satisfactoriamente");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "generarticketatencionpj.app")
	public @ResponseBody Map<String, ? extends Object> generarTicketAtencionPJ(HttpServletRequest req) throws Exception {
		
		//CONSULTA A RENIEC
		//SI LA PERSONA ES MAYOR DE EDAD
		
		Integer idGrupo = Integer.parseInt(req.getParameter("idGrupo"));		
		String prefijoGrupo = req.getParameter("prefijoGrupo").toUpperCase();		
		String nombre = req.getParameter("nombre").toUpperCase();
		String dni = req.getParameter("dniPaciente");
		Integer tipoDoc = Integer.parseInt(req.getParameter("tipoDoc"));
		String persona = req.getParameter("persona").toUpperCase();
		String prioridad = req.getParameter("prioridad").toUpperCase();
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		
		try{
			data.put("data", essaludService.generarTicketAtencionPJ(idGrupo, prefijoGrupo, nombre, dni, tipoDoc, persona, prioridad, idSucursal));
			data.put("message", "la empresa "+nombre+ "ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "generarticketatencionbalanceo.app")
	public @ResponseBody Map<String, ? extends Object> generarTicketAtencionByBalanceo(HttpServletRequest req) throws Exception {
		
		//CONSULTA A RENIEC
		//SI LA PERSONA ES MAYOR DE EDAD
		
		Integer idRol = Integer.parseInt(req.getParameter("idRol"));		
		Integer idAgrupador = Integer.parseInt(req.getParameter("idAgrupador"));		
		String dni = req.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(req.getParameter("tipoDoc"));
		String persona = req.getParameter("persona").toUpperCase();
		Map<String, Object> data = new HashMap<String, Object>();
		
		try{
			data.put("data", ticketService.generarTicketAtencionByBalanceo(idRol, idAgrupador, dni, tipoDoc, persona));
			data.put("message", "la empresa ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "generarticketatencion4.app")
	public @ResponseBody Map<String, ? extends Object> generarTicketAtencion4(HttpServletRequest req) throws Exception {
		
		Integer idSubgrupo = Integer.parseInt(req.getParameter("idSubgrupo"));		
		String prefijo = req.getParameter("prefijo").toUpperCase();		
		String nombre = req.getParameter("nombre").toUpperCase();
		String dni = req.getParameter("dniPaciente");
		Integer tipoDoc = Integer.parseInt(req.getParameter("tipoDoc"));
		String persona = req.getParameter("persona");
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		
		try{
			data.put("data", essaludService.generarTicketAtencion4(idSubgrupo, prefijo, nombre, dni, tipoDoc, persona, idSucursal));
			data.put("message", "la empresa "+nombre+ "ha sido grabado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "regresaratencion.app")
	public ModelAndView regresarAtencion(HttpSession sesion,HttpServletRequest request) throws Exception {
		String fw="main/menuGrupos";
		ModelAndView modelAndView = new ModelAndView(fw);		
		return modelAndView;
	}	
	
	
	@RequestMapping(value = "nextticket.app")
	public @ResponseBody Map<String, ? extends Object> obtenerTicket(HttpServletRequest req) throws Exception {		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idRolEquipo = Integer.parseInt(req.getParameter("idRolEquipo"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		Map<String, Object> data = new HashMap<String, Object>();		
		ticketService.getNextTicket(idUsuario, idSucursal, idRolEquipo, idVentanilla);
		try{
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
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
	
	
	@RequestMapping(value = "listarticket.app")
	public @ResponseBody Map<String, ? extends Object> listarTicket() throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarTicket());
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "actualizarticketxtiempo.app")
	public @ResponseBody Map<String, ? extends Object> actualizarticketxtiempo() throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarTicket());
			data.put("success", Boolean.TRUE);
			data.put("message", "el ticket ha sido actualizado con el algoritmo 2 ");
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "listaratencionesxarea.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXArea(Integer idSucursal, Integer idArea, Integer idVentanilla, 
			Integer idGrupo, String fechaInicio, String fechaFin) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXArea(idSucursal, idArea, idVentanilla, idGrupo, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "listaratencionesxalgoritmo.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXAlgoritmo(Integer idSucursal, Integer idArea, Integer idAlgoritmo, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXAlgoritmo(idSucursal, idArea, idAlgoritmo, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "listaratencionestotalxalgoritmo.app")
	public @ResponseBody Map<String, ? extends Object> listaratencionestotalxalgoritmo(Integer idSucursal, Integer idArea, Integer idAlgoritmo, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listaratencionestotalxalgoritmo(idSucursal, idArea, idAlgoritmo, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	@RequestMapping(value = "listaratencionesxusuario.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXUsuario(Integer idSucursal,Integer idArea, Integer idUsuario, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXUsuario(idSucursal, idArea, idUsuario, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "listaratencionesxgrupo.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXGrupo(Integer idSucursal, Integer idArea, Integer idGrupo, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXGrupo(idSucursal, idArea, idGrupo, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "mostraratenciones.app")
	public @ResponseBody Map<String, ? extends Object> mostrarAtenciones(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idTipoMonitor= Integer.parseInt(req.getParameter("idTipoMonitor"));		
		try{			
			data.put("data", ticketService.mostrarAtenciones(idUsuario, idSucursal, idTipoMonitor));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "verificarnuevoturno.app")
	public @ResponseBody Map<String, ? extends Object> verificarNuevoTurno(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idTipoMonitor= Integer.parseInt(req.getParameter("idTipoMonitor"));
		Integer iRolEquipo= Integer.parseInt(req.getParameter("iRolEquipo"));
		ticketService.verificarNuevoTurno(idUsuario, idSucursal, idTipoMonitor, iRolEquipo);		
		try{						
			data.put("data", 1);
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", 0);
			data.put("message", "no hay ticket en cola.");
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "eliminarturno.app")
	public @ResponseBody Map<String, ? extends Object> eliminarturno(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idTipoMonitor= Integer.parseInt(req.getParameter("idTipoMonitor"));
		Integer iRolEquipo= Integer.parseInt(req.getParameter("iRolEquipo"));
		ticketService.eliminarTurno(idUsuario, idSucursal, idTipoMonitor, iRolEquipo);		
		try{						
			data.put("data", 1);
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("data", 0);
			data.put("message", "no hay ticket en cola.");
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "evaluarAtencion.app")
	public @ResponseBody Map<String, ? extends Object> evaluarAtencion(HttpServletRequest req) throws Exception {
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket")); 
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla")); 
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario")); 

		Map<String, Object> data = new HashMap<String, Object>();
		
		try{			
			ticketService.evaluarAtencion(idTicket, idVentanilla, idUsuario);
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
//	@RequestMapping(value = "evaluaratencion.app")
//	public @ResponseBody Map<String, ? extends Object> evaluarAtencion(HttpServletRequest req, Integer idTicket, 
//			Integer idVentanilla, Integer idUsuario) throws Exception {
//		
////		String url2 = req.getRequestURL().toString();
//		String server = req.getServerName();
//		Integer port = req.getServerPort();
//		String puerto = port.toString();
//		String path = req.getContextPath();
//		String url = "http://"+server+":"+puerto+path; 
//		System.out.println("url: "+url);
////		System.out.println("url2: "+url2);
//		Map<String, Object> data = new HashMap<String, Object>();
//		ticketService.evaluarAtencion(url, idTicket, idVentanilla);
//		try{			
////			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
//			data.put("success", Boolean.TRUE);
//			data.put("message", "El ticket ah sido a�adido a su lista.");
//			
//		}catch (Exception e) {
//			// TODO: handle exception
////			data.put("data", new ArrayList<Curso>());
//			data.put("message", "no hay ticket en cola.");
//			log.debug(e.getMessage());
//			e.printStackTrace();
//		}
//		return data;
//	}
	
	@RequestMapping(value = "iniciarprevioVerificaenTv.app")
	public @ResponseBody Map<String, ? extends Object> iniciarprevioVerificaenTv(Integer idTicket) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{			
			data.put("data", ticketService.iniciarprevioVerificaenTv(idTicket));
			data.put("success", Boolean.TRUE);
			data.put("message", "El esta en la TV");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "Ticket no esta en la TV.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "iniciaratencion.app")
	public @ResponseBody Map<String, ? extends Object> iniciarAtencion(Integer idTicket, Integer idUsuario, Integer idEstado) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();

		try{			
			ticketService.iniciarAtencion(idTicket, idEstado);
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah iniciado correctamente.");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "finalizaratencion.app")
	public @ResponseBody Map<String, ? extends Object> finalizarAtencion(Integer idTicket, Integer idUsuario, Integer idEstado) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		ticketService.finalizarAtencion(idTicket);
		try{			
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "anularatencion.app")
	public @ResponseBody Map<String, ? extends Object> anularatencion(Integer idTicket, Integer idUsuario, Integer idSucursal, Integer tipoAnulacion, String descripcion, Integer motivo) throws Exception {

		Map<String, Object> data = new HashMap<String, Object>();

		ticketService.anularTicket(idTicket, idSucursal, tipoAnulacion, descripcion, motivo);	
		try{			
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	@RequestMapping(value = "listarticketbyidusuario.app")
	public @ResponseBody Map<String, ? extends Object> listarTicketByIdUsuario(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));				
		try{			
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "derivarticket.app")
	@ResponseBody
	public Map<String, Object> derivarTicket(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idGrupo= Integer.parseInt(req.getParameter("idGrupo"));
		Integer idTicket= Integer.parseInt(req.getParameter("idTicket"));
		Integer idVentanilla= Integer.parseInt(req.getParameter("idVentanilla"));
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		ticketService.derivarTicket(idTicket, idGrupo, idVentanilla, idSucursal);
		try{			
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("message", "El ticket ah sido derivado correctamente");
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
	
	@RequestMapping(value = "listargruposxparametroTipoDeriva.app")
	public @ResponseBody Map<String, ? extends Object> listargruposxparametroTipoDeriva(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));

		
		try{			
			data.put("data", ticketService.listargruposxparametroTipoDeriva(idSucursal, idUsuario));
			data.put("message", "Listado de Grupos");
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
	@RequestMapping(value = "listarventanillaxparametroTipoDeriva.app")
	public @ResponseBody Map<String, ? extends Object> listarventanillaxparametroTipoDeriva(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();		
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idUsuario= Integer.parseInt(req.getParameter("idUsuario"));

		
		try{			
			data.put("data", ticketService.listarventanillaxparametroTipoDeriva(idSucursal, idUsuario));
			data.put("message", "Listado de Ventanilla");
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

	
	@RequestMapping(value = "getventanillasxidarea.app")
	public @ResponseBody Map<String, ? extends Object> getVentanillasByIdArea(Integer idSucursal, Integer idArea) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.getVentanillasByIdArea(idSucursal, idArea));
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
	
	
	@RequestMapping(value = "obtenerticketxdni.app")
	public @ResponseBody Map<String, ? extends Object> obtenerTicketXDni(HttpServletRequest req) throws Exception {
		String dni = req.getParameter("txtDni");		
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.obtenerTicketXDni(dni));			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
		
	@RequestMapping(value = "saveevaluacionatencion.app")
	public @ResponseBody Map<String, ? extends Object> saveEvaluacionAtencion(HttpServletRequest req) throws Exception {
		
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer nota = Integer.parseInt(req.getParameter("nota"));
		
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			ticketService.saveEvaluacionAtencion(idTicket, nota);			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "saveevaluacionatencionpj.app")
	public @ResponseBody Map<String, ? extends Object> saveEvaluacionAtencionPJ(HttpServletRequest req) throws Exception {
		
		String dni = req.getParameter("dni");
		Integer nota = Integer.parseInt(req.getParameter("nota"));
		
		Map<String, Object> data = new HashMap<String, Object>();	
		ticketService.saveEvaluacionAtencionPJ(dni, nota);	
		try {
					
			data.put("success", Boolean.TRUE);		
		}
		catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getcantidadticketespera.app")
	public @ResponseBody Map<String, ? extends Object> getCantidadTicketEspera(Integer idGrupo) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.getCantidadTicketEspera(idGrupo));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "getcantidadticketesperaTodo.app")
	public @ResponseBody Map<String, ? extends Object> getcantidadticketesperaTodo(Integer idRol, Integer idUsuario, Integer idVentanilla) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.getCantidadTicketEsperaAllGrupo(idRol, idUsuario, idVentanilla));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Usuario>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "activarllamadoxaudio.app")
	public @ResponseBody Map<String, ? extends Object> activarLlamadoXAudio(HttpServletRequest req) throws Exception {
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			ticketService.activarLlamadoXAudio(idTicket);
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "verificarnuevollamadovoz.app")
	public @ResponseBody Map<String, ? extends Object> verificarNuevoLlamadoVoz(HttpServletRequest req) throws Exception {
//		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer iRolEquipo = Integer.parseInt(req.getParameter("iRolEquipo"));
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {			
			data.put("data", ticketService.verificarNuevoLlamadoVoz(iRolEquipo));
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("data", 0);
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", 0);
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "obtenerpersonabydni.app")
	public @ResponseBody Map<String, ? extends Object> obtenerPersonaByDni(HttpServletRequest req) throws Exception {
		String dni = req.getParameter("dni");
		Map<String, Object> data = new HashMap<String, Object>();		
//		ticketService.obtenerPersonaByDni(dni);					
		try{			
			data.put("data", ticketService.obtenerPersonaByDni(dni));
			data.put("data2", 1);//preferencial
			data.put("success", Boolean.TRUE);			
		}catch(GenericExcepcion ge){
			data.put("data", 0);
			data.put("success", Boolean.FALSE);
			data.put("message", ge.getMessage());
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			System.out.println(e.getMessage());
			data.put("message", "no existe un usuario con ese DNI");
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "obtenerpersonabydniSOAP.app")
	public @ResponseBody Map<String, ? extends Object> obtenerpersonabydniSOAP(HttpServletRequest req) throws Exception {
		String dni = req.getParameter("dni");
		Map<String, Object> data = new HashMap<String, Object>();		
//		ticketService.obtenerPersonaByDni(dni);					
		try{			
			data.put("data", ticketService.obtenerPersonaByDniSOAP(dni));
			data.put("data2", 1);//preferencial
			data.put("success", Boolean.TRUE);			
		}catch(GenericExcepcion ge){
			data.put("data", 0);
			data.put("success", Boolean.FALSE);
			data.put("message", ge.getMessage());
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			System.out.println(e.getMessage());
			data.put("message", "no existe un usuario con ese DNI");
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}	
	@RequestMapping(value = "reimiprimitticketessaludcusco.app")
	public @ResponseBody Map<String, ? extends Object> reimiprimitticketessaludcusco(HttpServletRequest req) throws Exception {
		String dni = req.getParameter("dni");
		String fecha = req.getParameter("fecha");
		String centro = req.getParameter("centro");
		Map<String, Object> data = new HashMap<String, Object>();		
//		ticketService.obtenerPersonaByDni(dni);					
		try{			
			data.put("data", ticketService.reimiprimitticketessaludcusco(dni, fecha,  centro));
			data.put("data2", 1);//preferencial
			data.put("success", Boolean.TRUE);			
		}catch(GenericExcepcion ge){
			data.put("data", 0);
			data.put("success", Boolean.FALSE);
			data.put("message", ge.getMessage());
			log.debug(ge.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			System.out.println(e.getMessage());
			data.put("message", "no existe un usuario con ese DNI");
			data.put("success", Boolean.FALSE);
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}	

	
	@RequestMapping(value = "verticketxconsulta.app")
	public @ResponseBody Map<String, ? extends Object> verTicketXConsulta(HttpServletRequest req) throws Exception {		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.listarTicketXGestion(idSucursal));
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
	@RequestMapping(value = "GestionTicket_1.app")
	public @ResponseBody Map<String, ? extends Object> GestionTicket_1(HttpServletRequest req) throws Exception {		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		Integer idGrupo = Integer.parseInt(req.getParameter("idGrupo"));
		Integer idOperador = Integer.parseInt(req.getParameter("idOperador"));
		Integer idEstado = Integer.parseInt(req.getParameter("idEstado"));		
		String cApellido = req.getParameter("cApellido");		

		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.GestionTicket_1(idUsuario, idSucursal, idArea, idVentanilla, idGrupo, idOperador, idEstado, cApellido));
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

	
	@RequestMapping(value = "anularticket.app")
	public @ResponseBody Map<String, ? extends Object> anularTicket(HttpServletRequest req) throws Exception {
		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer tipoAnulacion = Integer.parseInt(req.getParameter("tipoAnulacion"));
		String descripcion = req.getParameter("descripcion");
		Integer objEntero_1 = new Integer(0);
		Integer motivo = 70;
		
		ticketService.anularTicket(idTicket, idSucursal, tipoAnulacion, descripcion, motivo);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.GestionTicket_1(idUsuario, idSucursal, objEntero_1, objEntero_1, objEntero_1,objEntero_1, objEntero_1, "0"));
			data.put("message", "el usuario ha sido inhabilitado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "activaratencion.app")
	public @ResponseBody Map<String, ? extends Object> activaratencion(Integer idTicket, Integer idUsuario) throws Exception {

		Map<String, Object> data = new HashMap<String, Object>();
		ticketService.Reactivarticket(idTicket);
		try{			
			data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "El ticket ah sido a�adido a su lista.");
			
		}catch (Exception e) {
			// TODO: handle exception
//			data.put("data", new ArrayList<Curso>());
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}


	
	@RequestMapping(value = "activarticketpasado.app")
	public @ResponseBody Map<String, ? extends Object> activarticketpasado(HttpServletRequest req) throws Exception {
		
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer objEntero_1 = new Integer(0);
		ticketService.activarticketpasado(idTicket);				
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.GestionTicket_1(idUsuario, idSucursal, objEntero_1, objEntero_1, objEntero_1,objEntero_1, objEntero_1, "0"));
			data.put("message", "el usuario ha sido inhabilitado de forma satisfactoria");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "consultaApellidoSino.app")
	public @ResponseBody Map<String, ? extends Object> consultaApelidooTicket(HttpServletRequest req) throws Exception {
		
		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));

		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.consultaApellidoSino(idSucursal));
			data.put("message", "Se ejecuto con exito");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "ActivaNotificacionVentanilla.app")
	public @ResponseBody Map<String, ? extends Object> ActivaNotificacionVentanilla(HttpServletRequest req) throws Exception {
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.ActivaNotificacionVentanilla(idVentanilla));
			data.put("message", "Se ejecuto con exito");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "consultaParametroTipo.app")
	public @ResponseBody Map<String, ? extends Object> consultaParametroTipo(HttpServletRequest req) throws Exception {
		
		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String parametro = req.getParameter("parametro");
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.parametroNumero(parametro));
			data.put("message", "Se ejecuto con exito");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	
	@RequestMapping(value = "verticketxreporte.app")
	public @ResponseBody Map<String, ? extends Object> verTicketXReporte(HttpServletRequest req) throws Exception {		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		Integer idArea = Integer.parseInt(req.getParameter("idArea"));
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.listarTicketXReporte(idSucursal, idArea));
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
	
	@RequestMapping(value = "gruposcdg.app")
	public ModelAndView gruposCDG (HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer area = Integer.parseInt(request.getParameter("area"));
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String dni = request.getParameter("dni");
		String persona = request.getParameter("persona");
		String prioridad = request.getParameter("prioridad");
		
		String fw="main/gruposcdg";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("area", area);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("persona", persona);
		modelAndView.addObject("prioridad", prioridad);
		return modelAndView;
	}
	
	@RequestMapping(value = "subgruposcdg1_pji.app")
	public ModelAndView subgruposCDG1_pji(HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer area = Integer.parseInt(request.getParameter("area"));
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String dni = request.getParameter("dni");
		String persona = request.getParameter("persona");
		String prioridad = request.getParameter("prioridad");
		
		String fw="main/subgruposcdg1_pji";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("area", area);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("persona", persona);
		modelAndView.addObject("prioridad", prioridad);
		return modelAndView;
	}	
	@RequestMapping(value = "subgruposcdg.app")
	public ModelAndView subGruposCDG(HttpSession sesion,HttpServletRequest request) throws Exception {
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String dni = request.getParameter("dni");
		String persona = request.getParameter("persona");
		String prioridad = request.getParameter("prioridad");
		String fw="";
		if(tipo == 1) {
			fw="main/subgruposcdg1";
		}		
		else if(tipo == 2) {
			fw="main/subgruposcdg2";
		}
		else if(tipo == 3) {
			fw="main/subgruposcdg3";
		}
		else if(tipo == 4) {
			fw="main/subgruposcdg4";
		}
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("tipo", tipo);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("persona", persona);
		modelAndView.addObject("prioridad", prioridad);
		
		return modelAndView;
	}

	
	@RequestMapping(value = "mostrargrupospj.app")
	public ModelAndView mostrarGruposPJ(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String persona = request.getParameter("persona");
		String prioridad = request.getParameter("prioridad");
		
		String fw="main/poderjudicial";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("persona", persona);
		modelAndView.addObject("prioridad", prioridad);
		return modelAndView;
	}
	@RequestMapping(value = "sonidoatenciones.app")
	public @ResponseBody Map<String, ? extends Object> sonidoAtenciones(HttpServletRequest req) throws Exception {
//		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer iRolEquipo = Integer.parseInt(req.getParameter("iRolEquipo"));
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {			
			data.put("data", ticketService.sonidoTimbre(iRolEquipo));
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "getproximosturnos.app")
	public @ResponseBody Map<String, ? extends Object> getProximosTurnos(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		
		try{
			data.put("data", ticketService.getProximosTurnos(idSucursal));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {		
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
			return data;
	}	

	@RequestMapping(value = "getproximosturnosArea.app")
	public @ResponseBody Map<String, ? extends Object> getProximosTurnosArea(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idSucursal= Integer.parseInt(req.getParameter("idSucursal"));
		Integer idArea= Integer.parseInt(req.getParameter("idArea"));		
		try{
			data.put("data", ticketService.getProximosTurnosArea(idSucursal, idArea));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {		
			data.put("message", "no hay ticket en cola.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
			return data;
	}
	@RequestMapping(value = "menutotem1.app")
	public ModelAndView menuGrupos4(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String persona = request.getParameter("persona");
		String fw="main/menuTotem1";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("persona", persona);
		return modelAndView;
	}
	
	@RequestMapping(value = "menuGruposMensaje.app")
	public ModelAndView menuGruposMensaje(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String persona = request.getParameter("persona");
		String mensaje = request.getParameter("mensaje");
		String fw="main/menuGruposMensaje";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("persona", persona);
		modelAndView.addObject("mensaje", mensaje);
		return modelAndView;
	}
	@RequestMapping(value = "mostraropcionesnp.app")
	public ModelAndView mostraropcionesNP(HttpSession sesion,HttpServletRequest request) throws Exception {
		String dni = request.getParameter("dni");
		Integer tipoDoc = Integer.parseInt(request.getParameter("tipoDoc"));
		String persona = request.getParameter("persona");
		String fw="main/menuTotemNP";
		ModelAndView modelAndView = new ModelAndView(fw);
		modelAndView.addObject("dni", dni);
		modelAndView.addObject("tipoDoc", tipoDoc);
		modelAndView.addObject("persona", persona);
		return modelAndView;
	}
	
	@RequestMapping(value = "evaluarticket.app")
	public @ResponseBody Map<String, ? extends Object> evaluarTicket(HttpServletRequest req) throws Exception {
		String codigo = req.getParameter("codigo");		
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.evaluarTicket(codigo));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	// 20191124 VBR consulta tiempo de la tabla parametro General
	@RequestMapping(value = "ConsultaTiempoEvaluacion.app")
	public @ResponseBody Map<String, ? extends Object> ConsultaTiempoEvaluacion() throws Exception {
		String codigo="150";		
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.evaluarTicket(codigo));			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	//fin de cambio VBR
	
	@RequestMapping(value = "concluyeevaluacionespera.app")
	public @ResponseBody Map<String, ? extends Object> ConcluyeEvaluacionEspera(Integer idTicket, Integer idUsuario) throws Exception {
			Map<String, Object> data = new HashMap<String, Object>();
			ticketService.ConcluyeEvaluacionEspera(idTicket);
			try{			
				data.put("data", ticketService.listarTicketByIdUsuario(idUsuario));
				data.put("success", Boolean.TRUE);
				data.put("message", "El ticket ah sido a�adido a su lista.");
				
			}catch (Exception e) {
				// TODO: handle exception
//				data.put("data", new ArrayList<Curso>());
				data.put("message", "no hay ticket en cola.");
				log.debug(e.getMessage());
				e.printStackTrace();
			}
			return data;
	}
	

	@RequestMapping(value = "listaratencionesxmesusuario.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXMesUsuario(Integer idSucursal, Integer idArea, Integer idUsuario, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXMesUsuario(idSucursal, idArea, idUsuario, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	

	
	@RequestMapping(value = "listaratencionesxmesgrupo.app")
	public @ResponseBody Map<String, ? extends Object> listarAtencionesXMesGrupo(Integer idSucursal, Integer idArea, Integer idGrupo, 
			String fechaInicio, String fechaFin) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesXMesGrupo(idSucursal, idArea, idGrupo, fechaInicio, fechaFin));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "regresarmostrardnipj.app")
	public ModelAndView regresarMostrarDniPJ(HttpSession sesion,HttpServletRequest request) throws Exception {
		String fw="main/tecladopj";
		ModelAndView modelAndView = new ModelAndView(fw);
		return modelAndView;
	}
	
	@RequestMapping(value = "habilitarsacadoticketsino.app")
	public @ResponseBody Map<String, ? extends Object> habilitarSacadoTicketSiNo(String dni, Integer tipoDoc) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", ticketService.habilitarSacadoTicketSiNo(dni, tipoDoc));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "listaratencionesxDni.app")
	public @ResponseBody Map<String, ? extends Object> listaratencionesxDni(Integer idSucursal, String fechaInicio, 
			String fechaFin, Integer idArea, String identificacion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarAtencionesxDni(idSucursal, fechaInicio, fechaFin, idArea, identificacion));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "obtenerticketxnumero.app")
	public @ResponseBody Map<String, ? extends Object> obtenerTicketXNumero(HttpServletRequest req) throws Exception {
		String numero = req.getParameter("txtDni");
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.obtenerTicketXNumero(numero));			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "obtenerultimoticket.app")
	public @ResponseBody Map<String, ? extends Object> obtenerUltimoTicket(HttpServletRequest req) throws Exception {
//		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario")); 
		String pip = req.getParameter("pip");

		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.obtenerUltimoTicket(pip) );			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "consultaareaRolMonitor.app")
	public @ResponseBody Map<String, ? extends Object> consultaareaRolMonitor(HttpServletRequest req) throws Exception {
		Integer idUsuario = Integer.parseInt(req.getParameter("idUsuario")); 


		Map<String, Object> data = new HashMap<String, Object>();			
		try {
			data.put("data", ticketService.consultaAreaRolMonitor(idUsuario) );			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "consultaUsuarioMonitorPrinicipal.app")
	public @ResponseBody Map<String, ? extends Object> consultaUsuarioMonitorPrinicipal(HttpServletRequest req) throws Exception {
		Integer idRol = Integer.parseInt(req.getParameter("iRolEquipo"));
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));

		Map<String, Object> data = new HashMap<String, Object>();

		try {
			data.put("data", usuarioService.consultaUsuarioMonitorPrinicipal(idSucursal, idRol) );			
			data.put("success", Boolean.TRUE);		
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "consultaConfirmacion.app")
	public @ResponseBody Map<String, ? extends Object> consultaConfirmacion(HttpServletRequest req) throws Exception {
		
		
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));

		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.consultaConfirmacion(idSucursal));
			data.put("message", "Se ejecuto con exito");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	
	
	@RequestMapping(value = "listarreporteasistencia.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> listarReportesAsistencia(
		@RequestParam(defaultValue="0") Integer idSucursal,
		@RequestParam(defaultValue="0") Integer idUsuario,
		@RequestParam(defaultValue="0") Integer zona,
		@RequestParam(value="fechaInicio", required=false, defaultValue="") String fechaInicio,
		@RequestParam(value="fechaFin", required=false, defaultValue="") String fechaFin,
		@RequestParam(value="grupos", required=false) List<String> grupos,
		@RequestParam(defaultValue="false") boolean aplicaGrupos
	) throws Exception {
		
		if (grupos == null) {
			grupos = Collections.emptyList();
	    }
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("idSucursal", idSucursal);
		params.put("idUsuario", idUsuario);
		params.put("zona", zona);
		params.put("fechaInicio", fechaInicio);
		params.put("fechaFin", fechaFin);
		params.put("grupos", grupos);
		params.put("aplicaGrupos", aplicaGrupos);
		List<BeanReporteAsistencia> data = essaludService.listarReporteAsistencia(params);
		return Collections.singletonMap("data", data);
	}
	
	@RequestMapping(value = "listardetallereporte.app")
	public @ResponseBody Map<String, ? extends Object> listarDetalleReporte(Integer idUsuario, String fecha) throws Exception {		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarDetalleReporte(idUsuario, fecha));
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Asistencia>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "verificarnuevollamadovozsecundario.app")
	public @ResponseBody Map<String, ? extends Object> verificarNuevoLlamadoVozSecundario(HttpServletRequest req) throws Exception {
//		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer iRolEquipo = Integer.parseInt(req.getParameter("iRolEquipo"));
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {			
			data.put("data", ticketService.verificarNuevoLlamadoVozSecundario(iRolEquipo));
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("data", 0);
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", 0);
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	@RequestMapping(value = "sonidoatencionessecundario.app")
	public @ResponseBody Map<String, ? extends Object> sonidoAtencionesSecundario(HttpServletRequest req) throws Exception {
//		Integer idTicket = Integer.parseInt(req.getParameter("idTicket"));
		Integer iRolEquipo = Integer.parseInt(req.getParameter("iRolEquipo"));
				
		Map<String, Object> data = new HashMap<String, Object>();			
		try {			
			data.put("data", ticketService.sonidoTimbreSecundario(iRolEquipo));
			data.put("success", Boolean.TRUE);
		}catch (GenericExcepcion e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}

	//VBR 2024/1223 consulta por descripcion
	@RequestMapping(value = "consultaParametroTipoDescrip.app")
	public @ResponseBody Map<String, ? extends Object> consultaParametroTipoDescrip(HttpServletRequest req) throws Exception {
		Integer idSucursal = Integer.parseInt(req.getParameter("idSucursal"));
		String parametro = req.getParameter("parametro");
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{	
			data.put("data", ticketService.parametroDescripcion(parametro));
			data.put("message", "Se ejecuto con exito");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception			
			data.put("message", "Error inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "getLastTicketByWindow.app", method = RequestMethod.GET)
	public @ResponseBody Map<String, ? extends Object> getLastTicketByWindow(HttpServletRequest req) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		Integer idVentanilla = Integer.parseInt(req.getParameter("idVentanilla"));	
		try{
			data.put("data", ticketService.getLastTicketByWindow(idVentanilla));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {		
			data.put("message", "no se encuentran tickets.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "listarReporteEncuesta.app")
	public @ResponseBody Map<String, ? extends Object> listarReporteEncuesta(Integer idUsuario, Integer idVentanilla, String fechaInicio, String fechaFin) throws Exception {	
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", essaludService.listarReporteEncuesta(idUsuario, idVentanilla, fechaInicio, fechaFin)); 
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", new ArrayList<Ticket>());
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
		
	@RequestMapping(value = "listarMotivoAusencia.app")
	public @ResponseBody Map<String, Object> listarMotivoAusencia() throws Exception {
	    Map<String, Object> data = new HashMap<>();
	    try {
	        List<MotivoAusencia> result = ticketService.listarMotivoAusencia();
	        data.put("data", result);
	        data.put("success", true);
	        data.put("message", result.isEmpty() ? "No se encontraron los motivos de ausencia" : "Motivos de ausencia recuperadas exitosamente");
	    } catch (Exception e) {
	        data.put("data", new ArrayList<MotivoAusencia>());
	        data.put("success", false);
	        data.put("message", "Error al recuperar los subprocesos");
	        log.debug(e.getMessage());
			e.printStackTrace();
	    }
	    return data;
	}
	
	@RequestMapping(value = "getDataUserAbsence.app")
	@ResponseBody
	public Map<String, Object> getDataUserAbsence(
		@RequestParam("idUsuario") Integer idUsuario
	) throws Exception {
		Map<String, Object> data = new HashMap<>();
		try{
			BeanUsuarioAusencia result = ticketService.getDataUserAbsence(idUsuario);
			data.put("data", result);
			data.put("success", Boolean.TRUE);
			if (result == null) {
	            data.put("message", "No se encontraron datos de esta atención.");
	        }
		}catch (Exception e) {		
			data.put("success", Boolean.FALSE);
			data.put("message", "Error interno del servidor.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "registerUserAbsence.app", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerUserAbsence(@RequestBody BeanUsuarioAusencia ua) {
		Map<String, Object> data = new HashMap<>();
		UsuarioAusencia result;
		try {
			if (ua.getId() == null || ua.getId() == 0) {
				result = ticketService.insertUserAbsence(ua.getIdUsuario(), ua.getIdMotivoAusencia());
				data.put("data", result);
				data.put("message", "Ausencia registrada con éxito");				
			} else {
				result = ticketService.updateUserAbsence(ua.getId(), ua.getIdUsuario());
				data.put("data", result);
				data.put("message", "Retorno a operaciones");				
			}
			data.put("success", true);
		} catch (Exception e) {
			data.put("success", false);
			data.put("message", "Error interno del servidor.");
			log.debug(e.getMessage());
			e.printStackTrace();
		}
		
		return data;
	}
	
	@RequestMapping(value = "contarTicketAtendidosDia.app", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> contarTicketAtendidosDia (
		@RequestParam Integer idUsuario
	) {
		Map<String, Object> params = new HashMap<>();
		params.put("idUsuario", idUsuario);
		
		int count = ticketService.contarTicketAtendidosDia(params);
		return Collections.singletonMap("count", count);
	}
	
}

