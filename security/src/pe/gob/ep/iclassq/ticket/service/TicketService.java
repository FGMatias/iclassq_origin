package pe.gob.ep.iclassq.ticket.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import pe.gob.ep.iclassq.entidad.BeanGrupo;
import pe.gob.ep.iclassq.entidad.BeanGrupoProporcion;
import pe.gob.ep.iclassq.entidad.BeanSubGrupoProporcion;
import pe.gob.ep.iclassq.entidad.BeanId;
import pe.gob.ep.iclassq.entidad.BeanTicket;
import pe.gob.ep.iclassq.entidad.BeanTicketAreaproxTurno;
import pe.gob.ep.iclassq.entidad.BeanTicketLlamado;
import pe.gob.ep.iclassq.entidad.BeanTicketManagement;
import pe.gob.ep.iclassq.entidad.BeanTicketPreview;
import pe.gob.ep.iclassq.entidad.BeanTicketXArea;
import pe.gob.ep.iclassq.entidad.BeanTicketXGrupo;
import pe.gob.ep.iclassq.entidad.BeanTicketXReporte;
import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.negocio.bean.Area;
import pe.gob.ep.iclassq.negocio.bean.Grupo;
import pe.gob.ep.iclassq.negocio.bean.Monitor;
import pe.gob.ep.iclassq.negocio.bean.MonitorCajas;
import pe.gob.ep.iclassq.negocio.bean.MotivoAusencia;
import pe.gob.ep.iclassq.negocio.bean.Parametro;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoSubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Secuencia;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.TablaGeneral;
import pe.gob.ep.iclassq.negocio.bean.Ticket;
import pe.gob.ep.iclassq.negocio.bean.TipoDocumento;
import pe.gob.ep.iclassq.negocio.bean.UsuarioAusencia;
import pe.gob.ep.iclassq.negocio.bean.Ventanilla;

public interface TicketService {

	public int getCantidadGrupoRolEquipo(Integer idRolEquipo) throws Exception;
	public List<BeanGrupoProporcion> getGrupoByRolEquipo(Integer idUsuario, Integer idRolEquipo) throws Exception;
	public List<BeanSubGrupoProporcion> getSubGrupoByRolEquipo(Integer idUsuario, Integer idRolEquipo, Integer idSucursal) throws Exception;
	public void getNextTicket(Integer idUsuario, Integer idSucursal, 
			Integer idRolEquipo, Integer idVentanilla) throws Exception;
	
	public int getRegistrosActuales(Integer idGrupo, Integer idRolEquipo) throws Exception;
	public int getRegistrosActualesSubGrupo(Integer idSubGrupo, Integer idRolEquipo) throws Exception;
	
	public List<MonitorCajas> mostrarAtenciones(Integer idUsuario, Integer idSucursal, Integer idTipoMonitor);
	
	public void verificarNuevoTurno(Integer idUsuario, Integer idSucursal, Integer idTipoMonitor, Integer iRolEquipo) throws Exception;
	
//	public void evaluarAtencion(String url, Integer idTicket, Integer idVentanilla) throws IOException;
	public void evaluarAtencion(Integer idTicket, Integer idVentanilla, Integer idUsuario) throws IOException;
	public int iniciarprevioVerificaenTv(Integer idTicket) throws Exception;
	public void iniciarAtencion(Integer idTicket, Integer idEstado) throws Exception;
	public void finalizarAtencion(Integer idTicket) throws Exception;
	
	public List<Ticket> actualizarEstadoTicket(Integer idTicket, Integer idEstado) throws Exception;
	
	public void escribirArchivoTxt(String url, Integer idTicket, Integer idVentanilla) throws IOException;
	
	public List<RolEquipoGrupo> getGrupoByIdRolEquipo(Integer iRolEquipo) throws Exception;
	
	public List<SubGrupo> getSubGrupoByIdGrupo(Integer idGrupo) throws Exception;
	
	public Ticket getTicketBySubGrpoAndEstadoLlamando(Integer idSubGrupo) throws Exception;
	
	public List<Ticket> listarTicketByIdUsuario(Integer idUsuario) throws Exception;
	
	public Ventanilla getVentanillaByIdVentanilla(Integer idVentanilla) throws Exception;
	
	public Ticket derivarTicket(Integer idTicket, Integer idGrupo, Integer idVentanilla, Integer idSucursal) throws Exception;
	public  List<BeanGrupo> listargruposxparametroTipoDeriva(Integer idSucursal, Integer idUsuario) throws Exception;
	
	public  List<Ventanilla> listarventanillaxparametroTipoDeriva(Integer idSucursal,   Integer idUsuario) throws Exception;
		
	public List<Ventanilla> getVentanillasByIdArea(Integer idSucursal, Integer idArea) throws Exception;
	
	public Ticket obtenerTicketXDni(String dni) throws Exception;
	
	public void saveEvaluacionAtencion(Integer idTicket, Integer nota) throws Exception;
	public void saveEvaluacionAtencionPJ(String dni, Integer nota) throws Exception;
	
	public int getCantidadTicketGrupoEst31_Alg3(Integer idGrupo, Integer idRolEquipo)   throws Exception;
	public int getNextTicketEst0_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception;
	public int getCantidadTicketEst30_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception;
	public int getMaximaSecuencia31_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception;
	
	public List<SubGrupo> getSubGrupoByIdGrupoAlg3(Integer idGrupo)   throws Exception;
	public int getNextTicketSubGrupoEst30_Alg3(Integer idSubGrupo) throws Exception ;
	public int getNextTicketGrupoEst31_Alg3(Integer idGrupo, Integer idUsuario) throws Exception ;	
	public int getNextTicketObtiene(Integer idUsuario, Integer idSucursal, 	Integer idRolEquipo, Integer idVentanilla) throws Exception ;
	public int getNextTicketGrupo_Alg_1_2(Integer idRolEquipo) throws Exception ;
	/*public int getNextTicketGrupo_Alg_1_2(Integer idGrupo, Integer idUsuario) throws Exception ;*/
	
	public int getCantidadTicketEspera(Integer idGrupo) throws Exception ;
	public int getCantidadTicketEsperaAllGrupo(Integer idRol, Integer idUsuario, Integer idVentanilla) throws Exception ;	
	public void activarLlamadoXAudio(Integer idTicket)	throws Exception;
			
	public BeanTicketLlamado verificarNuevoLlamadoVoz(Integer iRolEquipo) throws Exception;
	
	public String obtenerPersonaByDni(String dni) throws Exception;
	public String obtenerPersonaByDniSOAP(String dni) throws Exception;
	public String reimiprimitticketessaludcusco(String dni, String fecha, String centro) throws Exception;
	
//	public List<Ticket> listarTicketXConsulta(Integer idSucursal) throws Exception;

	public void anularTicket(Integer idTicket, Integer idSucursal, Integer tipoAnulacion, String descripcion, Integer motivo) throws Exception;
	public void activarticketpasado(Integer idTicket) throws Exception;
	public void Reactivarticket(Integer idTicket) throws Exception;
	public List<BeanTicketXReporte> listarTicketXReporte(Integer idSucursal, Integer idArea) throws Exception;

	public List<BeanTicketXReporte> listarTicketXGestion(Integer idSucursal) throws Exception;
	public List<BeanTicketXArea> GestionTicket_1(Integer idUsuario, Integer idSucursal, Integer idArea, Integer idVentanilla, Integer idGrupo, Integer idOperador, Integer idEstado, String cApellido)  throws Exception;
	
	public List<Ticket> getProximosTurnos(Integer idSucursal) throws Exception;
	
	public Ticket generarTicketAtencionByBalanceo(Integer idRol, Integer idAgrupador, 	
			String dni, Integer tipoDoc, String persona) throws Exception;
	
	public Secuencia ultimoTicketRegistradoBalanceo(int idSubgrupo, String prefijo);
	public SubGrupo getSubGrupoByIdBalanceo(Integer idSubGrupo) throws Exception;
	public List<BeanGrupoProporcion> getGrupoByRolEquipoBalanceo(Integer idRolEquipo)throws Exception ;
	public int getRegistrosActualesBalanceo(Integer idGrupo, Integer idRolEquipo) throws Exception;
	
	
	public Ticket sonidoTimbre(Integer iRolEquipo) throws Exception;
	public Parametro evaluarTicket(String codigo) throws Exception;
	
	public int ConcluyeEvaluacionEspera(Integer idTicket) throws Exception;
	
	public Integer habilitarSacadoTicketSiNo(String dni, int tipodoc) throws Exception;
	
	public Ticket findTicketByDniAndFechaActual(String dni, int tipodoc);
	public String parametroDescripcion(String codigo) throws Exception;

	public BigDecimal parametroNumero(String codigo) throws Exception;
	public byte[] parametroBlob(String codigo) throws Exception;	
	public List<BeanTicketAreaproxTurno> getProximosTurnosArea(Integer idSucursal, Integer idArea) throws Exception;
	public int consultaApellidoSino( Integer idSucursal)	throws Exception;
	public int ActivaNotificacionVentanilla( Integer idVentanilla)	throws Exception;	
	public Ticket obtenerTicketXNumero(String numero) throws Exception;
	
	public void actulizarMonitorcajas() throws Exception;
	public Ticket obtenerUltimoTicket(String pip) throws Exception;
	public void eliminarTurno(Integer idUsuario, Integer idSucursal, Integer idTipoMonitor, Integer iRolEquipo) throws Exception;
	public List<Area>  consultaAreaRolMonitor(Integer idUsuario) throws Exception;
	public int consultaConfirmacion(Integer idSucursal) throws Exception;
	public int getNextTicketSubGrupo(Integer idRol, Integer idRolEquipo, Integer idUsuario, Integer idSucursal) throws Exception;
	public Ticket sonidoTimbreSecundario(Integer iRolEquipo) throws Exception;
	public BeanTicketLlamado verificarNuevoLlamadoVozSecundario(Integer iRolEquipo) throws Exception;
	public int getNextTicketSubGrupo_Alg_1_2_VS(Integer idRolEquipo, Integer idSucursal, Integer idUsuario) throws Exception;
	
	public void saveRutaAudio(Integer idTicket, String rutaAudio, Integer idSucursal) throws Exception;
	
	// MATIAS: traer Nombre del grupo segun id subgrupo
	public List<BeanTicketXGrupo> getNombreGrupo(Integer idSubGrupo) throws Exception;
	
	public Ticket getLastTicketByWindow(Integer idVentanilla) throws Exception;
//	public Ticket verifyTicketServiceEnd(Integer idVentanilla, Integer idTicket) throws Exception;
	
	public List<MotivoAusencia> listarMotivoAusencia() throws Exception;
	public BeanUsuarioAusencia getDataUserAbsence(Integer idUsuario) throws Exception;
	public UsuarioAusencia insertUserAbsence(Integer idUsuario, Integer motivoAusencia) throws Exception;
	public UsuarioAusencia updateUserAbsence(Integer idAusencia, Integer idUsuario) throws Exception;
    
    public int contarTicketAtendidosDia(Map<String,Object> params);
    
}
