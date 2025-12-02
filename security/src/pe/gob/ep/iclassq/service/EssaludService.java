package pe.gob.ep.iclassq.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import pe.gob.ep.iclassq.entidad.BeanDni;
import pe.gob.ep.iclassq.entidad.BeanEncuesta;
import pe.gob.ep.iclassq.entidad.BeanEncuestaPreguntas;
import pe.gob.ep.iclassq.entidad.BeanGrupo;
import pe.gob.ep.iclassq.entidad.BeanGrupoXTiempo;
import pe.gob.ep.iclassq.entidad.BeanReporteAsistencia;
import pe.gob.ep.iclassq.entidad.BeanReporteEncuesta;
import pe.gob.ep.iclassq.entidad.BeanRolEquipoSubGrupo;
import pe.gob.ep.iclassq.entidad.BeanSubGrupo;
import pe.gob.ep.iclassq.entidad.BeanSucursal;
import pe.gob.ep.iclassq.entidad.BeanTicketAreaproxTurno;
import pe.gob.ep.iclassq.entidad.BeanTicketXAlgoritmo;
import pe.gob.ep.iclassq.entidad.BeanTicketXArea;
import pe.gob.ep.iclassq.entidad.BeanTicketXGrupo;
import pe.gob.ep.iclassq.entidad.BeanTicketXMesGrupo;
import pe.gob.ep.iclassq.entidad.BeanTicketXMesUsuario;
import pe.gob.ep.iclassq.entidad.BeanTicketXUsuario;
import pe.gob.ep.iclassq.negocio.bean.Agrupador;
import pe.gob.ep.iclassq.negocio.bean.Algoritmo;
import pe.gob.ep.iclassq.negocio.bean.Area;
import pe.gob.ep.iclassq.negocio.bean.Dni;
import pe.gob.ep.iclassq.negocio.bean.Empresa;
import pe.gob.ep.iclassq.negocio.bean.Encuesta;
import pe.gob.ep.iclassq.negocio.bean.EncuestaOpciones;
import pe.gob.ep.iclassq.negocio.bean.EncuestaPreguntas;
import pe.gob.ep.iclassq.negocio.bean.EncuestaRespuesta;
import pe.gob.ep.iclassq.negocio.bean.Grupo;
import pe.gob.ep.iclassq.negocio.bean.GrupoXSede;
import pe.gob.ep.iclassq.negocio.bean.Maestra;
import pe.gob.ep.iclassq.negocio.bean.Prioridad;
import pe.gob.ep.iclassq.negocio.bean.Proyecto;
import pe.gob.ep.iclassq.negocio.bean.Publicidad;
import pe.gob.ep.iclassq.negocio.bean.RolEquipo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoSubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Secuencia;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.Ticket;
import pe.gob.ep.iclassq.negocio.bean.Ventanilla;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;


public interface EssaludService {

	public List<Maestra> listarTablaMaestraByGrupo(Integer grupo) throws Exception;
	public List<Proyecto> listarProyectosXUsuarioAndEtapa(Integer estado) throws Exception;
	public List<Grupo> saveGruposXSede(Integer idSucursal, String nombreGrupo, String prefijoGrupo,  			
			Integer idAlgoritmo, Integer idArea, String descripcionCorta, String descripcionLarga,  		
			Integer kioskoAlg3Entrada, Integer kioskoAlg3Minimo, String horaInicio, String horaFin, Integer tiempoObjetivo) throws Exception;
	
	public List<SubGrupo> saveSubGruposXSede(Integer idGrupo, String nombreSubGrupo, String prefijoSubGrupo,   			
			Integer idPrioridad , Integer idSecuencia , String descCortaSubGrupo, String descLargaSubGrupo,  		
			Integer prioridadAlgoritmo2, Integer prioridadAlgoritmo3, Integer idAgrupador) throws Exception;
	
	public List<Usuario> saveUsuarioXSede(Integer idSucursal, String codSede, String aPaterno, String aMaterno,	
			String vNombre, Integer iRol, String vIp, String vLogin, String vEmail, Integer iGrupo) throws Exception;
	
	public List<Grupo> listarGruposXSede(Integer idSucursal) throws Exception;
	public List<Grupo> listarGruposxventanilla(Integer idSucursal, Integer idVentanilla) throws Exception;
	
	public List<Area> listarAreaXSucursal(Integer idSucursal) throws Exception;
	public List<Area> listarareaxsurcursalxPerfil(Integer idSucursal, Integer idArea) throws Exception;
	public List<Algoritmo> listarAlgoritmos() throws Exception;
	public List<Prioridad> listarPrioridad() throws Exception;
	public List<Empresa> listarEmpresas() throws Exception;
	public List<SubGrupo> listarSubGruposXIdGrupo(Integer idGrupo) throws Exception; 
	
	public void saveEmpresa(String nombre,	String urlLogo,	String ruc,	String telef, String direccion) throws Exception;	
	public List<BeanSubGrupo> listarSubGruposXGrupoAndSucursal(Integer idSucursal, Integer idGrupo) throws Exception;
		
	public List<Sucursal> listarSucursal(Integer idEmpresa) throws Exception;
	public Sucursal saveSucursal(Integer idEmpresa, String nombre, String ruc, String telef, String direccion) throws Exception;
	public Sucursal getSucursalById(Integer idSucursal) throws Exception;
	public Sucursal editSucursal(Integer idSucursal, Integer idEmpresa, String nombreEdit, String rucEdit,
			String telefEdit, String direccionEdit) throws Exception;
	public void enableSucursalAndMaybeUser(Integer idSucursal, int idUsuario) throws Exception;
	public void disableSucursalAndMaybeUser(Integer idSucursal, int idUsuario) throws Exception;	
	
	public Ticket generarTicketAtencion(Integer idSubgrupo, Integer idSucursal, String prefijo, String nombre, 
			String numDoc, Integer tipoDoc) throws Exception;
	
	public Ticket generarTicketAtencionPJ(Integer idGrupo, String prefijoGrupo, String nombre, 
			String dni, Integer tipoDoc, String persona, String prioridad, Integer idSucursal) throws Exception;
	
	
	public Secuencia ultimoTicketRegistrado(int subgrupo, String prefijo, Integer idSucursal);
	public List<BeanSucursal> listarSucursalByEmpresa(Integer idEmpresa);
	
	public Grupo getGrupoById(Integer idGrupo) throws Exception;
	public List<Grupo> editGrupos(Integer idGrupo, Integer idSucursal, String nombreEdit, String prefijoEdit, Integer algEdit,
			Integer areaEdit, String descripCortaEdit, Integer kioskoEntradaEdit, Integer kioskoMinimoEdit, 
			String descripLargaEdit, String horaInicioEdit, String horaFinEdit, Integer tiempoObjetivoEdi) throws Exception;
	
	public SubGrupo getSubGrupoById(Integer idSubGrupo) throws Exception;
	public List<SubGrupo> editSubGrupos(Integer idGrupo, Integer idSubGrupo, String nombreSubGrupoEdit, String prefijoSubGrupoEdit,
			Integer idPrioridadEdit, Integer idSecuenciaEdit, String descCortaSubGrupoEdit, String descLargaSubGrupoEdit,
			Integer prioridadAlgoritmo2Edit, Integer prioridadAlgoritmo3Edit, Integer idAgrupadorEdit) throws Exception;
	
	public List<SubGrupo> eliminarSubGrupo(Integer idSubGrupo, Integer idGrupo) throws Exception;
	
	public Empresa getEmpresaById(Integer idEmpresa) throws Exception;
	public void editEmpresa(Integer idEmpresa, String nombreEdit, String urlLogoEdit, String rucEdit, 
			String telefEdit, String direccionEdit) throws Exception;
	public void eliminarEmpresa(Integer idEmpresa) throws Exception;
	
	public void eliminarSucursal(Integer idSucursal) throws Exception;
	
	public List<Ticket> listarTicket() throws Exception;
	
	public List<RolEquipo> listarRolEquipo(Integer idSucursal) throws Exception;
	
	public List<Usuario> saveUsuarioSucursal(Integer idSucursal, String aPaterno, String aMaterno, String nombres, String ip, 
			String login, String email, Integer idEmpresa) throws Exception;
	public List<Usuario> saveUsuarioAdmin(String aPaterno, String aMaterno, String nombres, String login, String email, Integer idEmpresa) throws Exception;
	
	
	public List<BeanSucursal> listarSucursalByUsuario(Integer idEmpresa, Integer adminIdUsuario);
	public List<Empresa> obtenerImagen();
	
	public List<RolEquipo> saveRolEquipo(Integer idSucursal, String rol, String tipoEquipo, Integer algoritmo) throws Exception;
	public List<RolEquipoGrupo> agregarGrupoXRol(Integer idRol, Integer idGrupoRol, BigDecimal proporcion) throws Exception;
	
	public List<RolEquipoGrupo> listarGruposXRol(Integer idRol) throws Exception;
	public List<BeanGrupoXTiempo> listarGruposXTiempo(Integer idRol) throws Exception;
	
	public void getGrupoProporcionByIdUsuario(Integer idUsuario) throws Exception;
	
	

	
	
	public List<Usuario> grabarUsuarioKiosko(Integer idSucursal, Integer iSolicitaIp, 
			String vIp,	Integer iTipoValidaDoc,	Integer iPideDocumento, Integer iImprimeTicket, 	
			Integer idRolEquipo, Integer idEmpresa, Integer iConfirmaImpresion, Integer idUsuario) throws Exception;   
	
	
	public List<Usuario> grabarUsuarioVentanilla(Integer idSucursal, Integer idUsuario, Integer iVentanilla, 
			String vIp,	Integer iArea, Integer iControlAsistencia, Integer iEvalua, Integer iAnula, String puerto, 
			Integer idRolEquipo, Integer idEmpresa) throws Exception; //String aPaterno, String aMaterno, String vNombre, Integer vDNI, String vLogin,
	
	public List<Ventanilla> getVentanillasByIdSucursal(Integer idSucursal) throws Exception;
	
	public Ventanilla getVentanillaById(Integer idVentanilla) throws Exception;
	
	public List<Ventanilla> saveVentanilla(String nombreVentanilla,	
			String ubicacionVentanilla,	Integer idArea, Integer idSucursal, 		
			String descripcionVentanilla, Integer iEvalua, String puerto, Integer notifica) throws Exception;

	//julio 16092019
	
	public List<BeanTicketXArea> listarAtencionesXArea(Integer idSucursal, Integer idArea, Integer idVentanilla, Integer idGrupo, String fechaInicio, 
			String fechaFin) throws Exception;
	
	public List<BeanTicketXAlgoritmo> listarAtencionesXAlgoritmo(Integer idSucursal, Integer idArea, Integer idAlgoritmo, String fechaInicio, 
			String fechaFin) throws Exception;
	
	public List<BeanTicketXAlgoritmo> listaratencionestotalxalgoritmo(Integer idSucursal, Integer idArea, Integer idAlgoritmo, String fechaInicio, 
			String fechaFin) throws Exception;
	
	public List<BeanTicketXUsuario> listarAtencionesXUsuario(Integer idSucursal, Integer idArea, Integer idUsuario, String fechaInicio, 
			String fechaFin) throws Exception;

	
	public List<BeanTicketXGrupo> listarAtencionesXGrupo(Integer idSucursal, Integer idArea, Integer idGrupo, String fechaInicio, 
			String fechaFin) throws Exception;

	
	public String getTextoPublicidad(Integer idSucursal) throws Exception;
	
	public List<Publicidad> getAllPublicityText(Integer idSucursal) throws Exception;
	public Publicidad savePublicityText(Integer idSucursal, String texto, Integer secuencia) throws Exception;
	public Publicidad getPublicidadById(Integer idPublicidad) throws Exception;
	public Publicidad editPublicityText(Integer idSucursal, Integer idPublicidad, String textoEdit, Integer secuenciaEdit) throws Exception;
	public Publicidad deletePublicity(Integer idPublicidad) throws Exception;
	public List<Publicidad> getAllPublicityVideo(Integer idSucursal) throws Exception;
	public Publicidad savePublicityVideo(Integer idSucursal, String fileName, Integer secuencia) throws Exception;
	public Publicidad editPublicityVideo(Integer idSucursal, Integer idPublicidad, String fileName, Integer secuenciaEdit) throws Exception;

	
	public List<Agrupador> listarAgrupadores() throws Exception;
	
	public List<Ventanilla> editVentanilla(Integer idVentanilla, String nombreVentanillaEdit,	String ubicacionVentanillaEdit,
			Integer idAreaEdit, Integer idSucursal, String descripcionVentanillaEdit, Integer iEvaluaEdit, String puertoEdit, Integer notificaEdit) throws Exception;

	public List<Area> listarArea(Integer idSucursal) throws Exception;
	public List<Area> saveArea(Integer idSucursal, String nombreArea)  throws Exception;
	public Area getAreaById(Integer idArea) throws Exception;
	public List<Area> editArea(Integer idSucursal, Integer idArea, String nombreAreaEdit) throws Exception;
	
	public Grupo getGrupoByPrefijo(String prefijo, Integer idSucursal) throws Exception;

	public List<Grupo> eliminarGrupo(Integer idGrupo, Integer idSucursal) throws Exception;
	public List<Ventanilla> eliminarVentanilla(Integer idVentanilla, Integer idSucursal) throws Exception;
	
	public RolEquipo getRolById(Integer idRol) throws Exception;
	
	public List<RolEquipoGrupo> eliminarGrupoXRol(Integer idRol, Integer idGrupo) throws Exception;
	
	public List<RolEquipo> editRolEquipo(Integer idSucursal, Integer idRol, String rolEdit, String tipoEquipoEdit, Integer algoritmoEdit) throws Exception;
	public List<RolEquipo> eliminarRolEquipo(Integer idRol, Integer idSucursal) throws Exception;
	
	public List<Publicidad> listarVideos(Integer idSucursal) throws Exception;

	public Ticket generarTicketAtencion4(Integer idSubgrupo, String prefijo, String nombre, 
			String dni, Integer tipoDoc, String persona, Integer idSucursal) throws Exception;
	
	public List<BeanTicketXMesUsuario> listarAtencionesXMesUsuario(Integer idSucursal, Integer idArea,
			Integer idUsuario, String fechaInicio,
			String fechaFin) throws Exception;

	public List<BeanTicketXMesGrupo> listarAtencionesXMesGrupo(Integer idSucursal, Integer idArea,
			Integer idGrupo, String fechaInicio, String fechaFin) throws Exception;
	
	public List<BeanTicketXArea> listarAtencionesxDni(Integer idSucursal, String fechaInicio, String fechaFin , Integer idArea, String identificacion) throws Exception;

	public List<Ventanilla> getVentanillasByIdSucursalRolEquipo( Integer idSucursal, Integer IdRolEquipo) throws Exception ;
	
	public void actualizarVentanilla(Integer idUsuario, Integer idSucursal, Integer idArea, Integer idVentanilla) throws Exception;

	public void saveAsistencia(Integer idUsuario) throws Exception;
	public void closeAsistenciasAbiertas(Integer idUsuario) throws Exception;
	public void closeAsistencia(Integer idUsuario) throws Exception;
	public List<SubGrupo> listarSubgruposXGrupo(Integer idGrupoRol) throws Exception;
	public List<Dni> getPersonabydni(String numeroDocumento) throws Exception;
	public List<SubGrupo> listarSubGruposXSede(Integer idGrupo) throws Exception;
	public List<BeanRolEquipoSubGrupo> agregarSubGrupoXRol(Integer idRol, Integer idSubGrupo, BigDecimal proporcionSG)	
			throws Exception;
	
	public List<BeanReporteAsistencia> listarReporteAsistencia(Map<String,Object> params);
	public List<BeanReporteAsistencia> listarDetalleReporte(Integer idUsuario, String fecha);
	public List<BeanRolEquipoSubGrupo> listarSubGruposXRol(Integer idRolEquipo) throws Exception;
	public List<BeanRolEquipoSubGrupo> eliminarSubGrupoXRol(Integer idRolEquipoSubGrupo, Integer idSubGrupo, Integer idRol) throws Exception;	
	public List<Usuario> grabarUsuarioMonitor(Integer idSucursal, Integer iSolicitaIp, String vIp, Integer iTipoMonitor, Integer idRolEquipo, Integer idEmpresa, Integer iAreaMonitor, Integer usuarioPrincipal, Integer idUsuario) throws Exception;
	
	public List<RolEquipo> listarRolUsuario(Integer idSucursal) throws Exception;

	public void reiniciarServicio(Integer idSucursal, Integer idUsuario) throws Exception;
	
	public List<Encuesta> getAllSurveys(Integer idSucursal) throws Exception;
	public Encuesta saveSurvey(Integer idSucursal, String pregunta, String fechaInicio, String fechaFin)  throws Exception;
	public Encuesta getSurveyById(Integer idEncuesta) throws Exception;
	public Encuesta editSurvey(Integer idSucursal, Integer idEncuesta, String descripcionEit, String fechaInicioEdit, String fechaFinEdit) throws Exception;
	public Encuesta enableSurvey(Integer idEncuesta)  throws Exception;
	public Encuesta disableSurvey(Integer idEncuesta)  throws Exception;
	public List<BeanEncuesta> getSurveysByRangeDate(Integer idSucursal) throws Exception;
	
	public List<BeanEncuestaPreguntas> getActiveQuestionsBySurvey(Integer idEncuesta) throws Exception;
	public List<EncuestaPreguntas> getQuestionsByIdSurvey(Integer idEncuesta) throws Exception;
	public EncuestaPreguntas saveQuestion(Integer idSucursal, Integer idEncuesta, String pregunta) throws Exception;
	public EncuestaPreguntas getPreguntaById(Integer idPregunta) throws Exception;
	public EncuestaPreguntas editQuestion(Integer idSucursal, Integer idPregunta, String preguntaEdit) throws Exception;
	public EncuestaPreguntas enableQuestion(Integer idPregunta)  throws Exception;
	public EncuestaPreguntas disableQuestion(Integer idPregunta)  throws Exception;
	
	public List<EncuestaOpciones> getOptionsSurvey() throws Exception;
	
	public EncuestaRespuesta saveAnswer(Integer idTicket, Integer idUsuario, Integer idVentanilla, Integer idSucursal, Integer idEncuesta, Integer idPregunta, Integer idOpcion)  throws Exception;

	public List<BeanReporteEncuesta> listarReporteEncuesta(Integer idUsuario, Integer idVentanilla, String fechaInicio, String fechaFin); 

	public List<Sucursal> getAllSucursal(Integer idEmpresa) throws Exception;
}

