package pe.gob.ep.iclassq.seguridad.service;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.entidad.BeanUsuariosPermiso;
import pe.gob.ep.iclassq.negocio.bean.Dni;
import pe.gob.ep.iclassq.negocio.bean.RolEquipo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupo;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.Test;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;

public interface UsuarioService {

	public Usuario login(String userName, Integer idSucursal, String password);
	public Usuario findUsuarioByUserName(String userName);
	public Usuario findUsuarioByUserNameAndSucursal(String userName, Integer idSucursal);
	public Usuario findUsuarioByPk(Integer idUsuario) throws Exception;
	public List<Usuario> findAll(Usuario usuario) throws Exception;
	
	public List<Usuario> getAllUsers(Integer idSucursal) throws Exception;
	public Usuario enableUser(Integer idUsuario) throws Exception;
	public Usuario disableUser(Integer idUsuario) throws Exception;
	public boolean userExist(String login, Integer idSucursal);
	public Map<String, Object> saveUser(Integer idSucursal, String aPaterno, String aMaterno, String nombres, String dni, String ip, 
			String login, String email, Integer idEmpresa, Integer idArea, Integer rol) throws Exception;
	public void assignUserRole(Integer idUsuario, Integer rol);
	public int determineRoleId(List<RolEquipo> listRolEquipo, List<Rol> listRol);
	public Usuario getUserById(Integer idUsuario) throws Exception;
	public Usuario editUser(Integer idSucursal, Integer idUsuario, String aPaternoEdit, String aMaternoEdit, String nombresEdit,
	        String dniEdit, String emailEdit, String loginEdit, String ipEdit, Integer idArea, Integer rolEdit) throws Exception;
	
	public Map<String, Object> saveUserAdminSucursal(Integer idSucursal, String aPaterno, String aMaterno, String nombres,
	        String dni, String login, String email, Integer idEmpresa) throws Exception;
	public Usuario editUserAdminSucursal(Integer idSucursal, Integer idUsuario, String aPaternoEdit, String aMaternoEdit, String nombresEdit,
	        String dniEdit, String emailEdit, String loginEdit) throws Exception;
	
//	public Usuario save(Usuario usuario) throws Exception;
	public Usuario deleteByPk(Integer idUsuario);
	public Usuario updateByPk(Usuario usuario) throws Exception;
	public void cambiarClave(Usuario usuario) throws Exception;
	public void cambiarEstadoUsuario(Usuario usuario) throws Exception;
	
	//reporte PDF
	
	public Map<String, Object> generarReporte() throws Exception;
	public byte[] obtenerReportJarGenerico(Map<String, Object> params,Collection coleccion, String pathJasper,String typeExporter) throws Exception;

	public Usuario findUsuarioByIP() throws Exception;
	
	public List<Usuario> listarUsuariosXRol(Integer idRol) throws Exception;
	
	
	public List<Usuario> editUsuarioKiosko(Integer idUsuario, Integer idSucursal, Integer iSolicitaIpEdit, String vIpEdit, Integer iTipoValidaDocEdit,
			Integer iPideDocumentoEdit, Integer iImprimeTicketEdit, Integer idRol, Integer iConfirmaImpresionEdit) throws Exception;  
	public List<Usuario> editUsuarioVentanilla(Integer idUsuario, Integer idSucursal, Integer idRol, Integer iVentanillaEdit, String vIpEdit, Integer iAreaEdit, Integer iControlAsistenciaEdit, Integer iEvaluaEdit, Integer iAnulaEdit, String puertoEdit, Integer iAtencionEdit) throws Exception;
	
	public List<Usuario> eliminarUsuarioMonitor(Integer idUsuario, Integer idRol) throws Exception;
	public List<Usuario> eliminarUsuarioKiosko(Integer idUsuario, Integer idRol) throws Exception;
	public List<Usuario> eliminarUsuarioVentanilla(Integer idUsuario, Integer idRol) throws Exception;
	
	public void resetearClave(Integer idUsuario) throws Exception;
	public void cambiarClaveUsuario(Integer idUsuario, String pass) throws Exception;
	
	public List<Usuario> findUsuariosVentanilla(Integer idSucursal) throws Exception;
	
	public Usuario  consultaUsuarioMonitorPrinicipal(Integer idSucursal, Integer idRol) throws Exception;

	public Object findAllPersonas() throws Exception;
	public Dni getPersonaById(Integer idPersona) throws Exception;
	public void editPersona(Integer idPersona, Integer idUsuario, String dni, String nombres, String apePaterno,
			String apeMaterno, Integer telefono, String correo) throws Exception;
	public Dni savePersonaDni(String dni, String nombres, String aPaterno, String aMaterno, Integer tipoRegistro, Integer telefono, String correo)
			throws Exception;
	public Boolean existsPerson(String numeroDocumento) throws Exception;
	
	public void inhabilitarPersona(Integer idPersona) throws Exception;
	public List<Usuario> getListUsuarios(Integer idSucursal) throws Exception;
	public List<Usuario> getListUsuariosVentanilla(Integer idSucursal) throws Exception;
	public List<Usuario> editUsuarioMonitor(Integer idSucursal, Integer idUsuario, Integer iSolicitaIpEdit, String vIpEdit, 
			Integer iTipoMonitorEdit, Integer idRol, Integer iAreaMonitorEdit, Integer usuarioPrincipalEdit) throws Exception;

	public List<Usuario> listarUsuarioPrincipal(Integer idSucursal) throws Exception;

	public List<Usuario> editUsuarioEncuestador(Integer idUsuario, Integer idRol, Integer idSucursal, Integer idUsuarioVentanilla) throws Exception;

}
