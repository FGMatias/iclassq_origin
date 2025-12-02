package pe.gob.ep.iclassq.seguridad.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.gob.ep.iclassq.entidad.BeanEncuestaPreguntas;
import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.entidad.BeanUsuariosPermiso;
import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Dni;
import pe.gob.ep.iclassq.negocio.bean.DniCriteria;
import pe.gob.ep.iclassq.negocio.bean.Encuesta;
import pe.gob.ep.iclassq.negocio.bean.EncuestaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Grupo;
import pe.gob.ep.iclassq.negocio.bean.GrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.MonitorCajas;
import pe.gob.ep.iclassq.negocio.bean.MonitorCajasCriteria;
import pe.gob.ep.iclassq.negocio.bean.RolEquipo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoCriteria;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.SubGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.SucursalCriteria;
import pe.gob.ep.iclassq.negocio.dao.AreaDAO;
import pe.gob.ep.iclassq.negocio.dao.DniDAO;
import pe.gob.ep.iclassq.negocio.dao.GrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.MonitorCajasDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoDAO;
import pe.gob.ep.iclassq.negocio.dao.SubGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.SucursalDAO;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.RolCriteria;
import pe.gob.ep.iclassq.seguridad.bean.Test;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioCriteria;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRolCriteria;
import pe.gob.ep.iclassq.seguridad.dao.RolDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioRolDAO;
import pe.gob.ep.iclassq.seguridad.md5.AeSimpleMD5;
import pe.gob.ep.iclassq.seguridad.utilitarios.ReporteGenerico;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Util;


@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired 
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private RolService rolService;	
	
	@Autowired
	private UsuarioRolDAO usuarioRolDAO;
	
	@Autowired
	private AreaDAO areaDAO;
	
	@Autowired
	private MonitorCajasDAO monitorCajasDAO;
	
	@Autowired
	private DniDAO dniDAO;
	
	@Autowired
	private RolEquipoDAO rolEquipoDAO;
	
	@Autowired
	private RolDAO rolDAO;
	
	@Autowired
	private SubGrupoDAO subGrupoDAO;
	
	@Autowired
	private GrupoDAO grupoDAO;
	
	@Autowired
	private SucursalDAO sucursalDAO;
	
	@Override
	public Usuario login(String userName, Integer idSucursal, String password){
		// TODO Auto-generated method stub
		
		Usuario user=this.findUsuarioByUserName(userName);
		return user;
	}

	@Override
	public Usuario findUsuarioByUserName(String userName){
		// TODO Auto-generated method stub
		UsuarioCriteria uc=new UsuarioCriteria();
		uc.createCriteria().andVUsuarioUsernameEqualTo(userName.toUpperCase());
		
		Usuario user=null;
		
		List<Usuario> result=usuarioDAO.selectByExample(uc);
		
		if(result!=null && result.size()>0){
			user=result.get(0);
		}
		
		return user;
	}
	
	@Override
	public Usuario findUsuarioByUserNameAndSucursal(String userName, Integer idSucursal){
		// TODO Auto-generated method stub
		UsuarioCriteria uc=new UsuarioCriteria();
		uc.createCriteria().andVUsuarioUsernameEqualTo(userName.toUpperCase()).andISucursalEqualTo(idSucursal);
		
		Usuario user=null;
		
		List<Usuario> result=usuarioDAO.selectByExample(uc);
		
		if(result!=null && result.size()>0){
			user=result.get(0);
		}
		
		return user;
	}

	@Override
	public List<Usuario> findAll(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		UsuarioCriteria userCriteria=new UsuarioCriteria();
		userCriteria.createCriteria().andIUsuarioEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		List<Usuario> usuarios=usuarioDAO.selectByExample(userCriteria);
		List<UsuarioRol> roles=null;
		
		if(usuarios!=null && usuarios.size()>0){
			for (Usuario user : usuarios) {
				roles=rolService.getRolesByIdUsuario(user.getiUsuarioId());
				user.setRoles(roles);
			}
		}
		
		return usuarios;
	}
	
//	@Override
//	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
//	public Usuario save(Usuario usuario) throws Exception {
//		// TODO Auto-generated method stub
//		boolean create=false;
//		String password="";
//		Integer idusuario=usuario.getiUsuarioId();
//		boolean validaUserDuplicate=true;
//		Usuario userInicial=null;
//		if(idusuario!=null){
//			userInicial=this.findUsuarioByPk(idusuario);
//			if(userInicial.getvUsuarioUsername().equalsIgnoreCase(usuario.getvUsuarioUsername())){
//				validaUserDuplicate=false;
//			}
//		}
//		
//		if(validaUserDuplicate){
//			if(this.findUsuarioByUserName(usuario.getvUsuarioUsername())!=null){
//				throw new GenericExcepcion("Ya existe un usuario con el nombre <b>"+usuario.getvUsuarioUsername()+"</b>.");
//			}
//		}
//		
//		if(usuario.getiUsuarioId()==null){
//			password=Util.generateAleatorioAlphaNumeric(8);
//			AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();
//			String passwordMD5=aeSimpleMD5.getMD5Spring(password);
//			usuario.setvUsuarioPassword(passwordMD5);
//			usuario.setiUsuarioEstado(Constante.ESTADO_ACTIVO);
//			usuarioDAO.insertSelective(usuario);
//			create=true;
//		}else{
//			usuarioDAO.updateByPrimaryKeySelective(usuario);
//		}
//		
//		if(usuario.getRoles()!=null){
//			UsuarioRolCriteria urc=new UsuarioRolCriteria();
//			urc.createCriteria().andIUsuarioxrolUsuarioIdEqualTo(usuario.getiUsuarioId());
//			usuarioRolDAO.deleteByExample(urc);
//			
//			for (UsuarioRol usuarioRol : usuario.getRoles()) {
//				usuarioRol.setiUsuarioxrolUsuarioId(usuario.getiUsuarioId());
//				usuarioRolDAO.insertSelective(usuarioRol);
//			}
//		}
//		return usuario;
//	}

	@Override
	public Usuario deleteByPk(Integer idUsuario) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Usuario findUsuarioByPk(Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		return usuarioDAO.selectByPrimaryKey(idUsuario);
	}

	@Override
	public Usuario updateByPk(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		usuarioDAO.updateByPrimaryKeySelective(usuario);
		usuario=this.findUsuarioByPk(usuario.getiUsuarioId());
		return usuario;
	}

	@Override
	public void cambiarClave(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		if(usuario.getiUsuarioId()==null){throw new GenericExcepcion("El usuario no existe.");}
		String passwordActual=usuario.getPasswordActual();
		String newPassword=usuario.getvUsuarioPassword();
		String modeChangePassword=usuario.getModeChangePassword();
		usuario=this.findUsuarioByPk(usuario.getiUsuarioId());
		if(usuario==null){throw new GenericExcepcion("El usuario no existe.");}
		AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();
		
		String passwordMD5Actual="";
		if(passwordActual!=null){
			passwordMD5Actual=aeSimpleMD5.getMD5Spring(passwordActual);
		}
		
		if (modeChangePassword.equals(
				Constante.MODE_CHANGE_PASS_PERFIL)) {
			if (!passwordMD5Actual.equals(usuario.getvUsuarioPassword())) {
				throw new GenericExcepcion("La contrase&ntilde;a actual del usuario no es correcta.");
			}
		}
		
		String newPasswordMD5=aeSimpleMD5.getMD5Spring(newPassword);
		
		Usuario usuarioUpdate=new Usuario();
		usuarioUpdate.setiUsuarioId(usuario.getiUsuarioId());
		usuarioUpdate.setvUsuarioPassword(newPasswordMD5);
		
		usuarioDAO.updateByPrimaryKeySelective(usuarioUpdate);		
		
		
	}

	@Override
	public void cambiarEstadoUsuario(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		this.updateByPk(usuario);
	}
	
	
	//reporte PDF
	public Map<String, Object> generarReporte()throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();		
		Collection<ReporteGenerico> repor=new ArrayList<ReporteGenerico>();
		for(int i=0; i<5; i++){
			ReporteGenerico gn=new ReporteGenerico();
			gn.setParam1("param1");
			gn.setParam2("param2");
			gn.setParam3("param3");
			gn.setParam4("param4");
			gn.setParam5("param5");
			gn.setParam6("param6");
			gn.setParam7("param7");
			gn.setParam8("param8");
			gn.setParam9("param9");
			gn.setParam10("param10");
			repor.add(gn);
		}		
				
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("CONTEXT_PATH", Constante.URL);
		System.out.println("ingenieria de sistemas->>>>");		
		byte[] reporteBytes=this.obtenerReportJarGenerico(parametros, repor, "http://localhost:8082/iclassq/librerias/reporte/report5.jasper", Constante.TIPO_ARCHIVO_PDF);
		result.put("report", reporteBytes);		
		return result;
	}
	
	public byte[] obtenerReportJarGenerico(Map<String, Object> params,Collection coleccion, String pathJasper,String typeExporter) throws Exception {
		byte[] ficheroReporte = null;
		if(typeExporter.toUpperCase().equals(Constante.TIPO_ARCHIVO_PDF.toUpperCase())){				
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(coleccion);		
			JasperPrint jrPrint = JasperFillManager.fillReport(pathJasper, params, dataSource);
			ficheroReporte = JasperExportManager.exportReportToPdf(jrPrint);
		}
		return ficheroReporte;
		
	}

	@Override
	public List<Usuario> getAllUsers(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		UsuarioCriteria uc = new UsuarioCriteria();
		uc.createCriteria().andISucursalEqualTo(idSucursal);
		List<Usuario> usuarios = new ArrayList<>();
		usuarios = usuarioDAO.selectByExample(uc);
		for(int i=0; i<usuarios.size(); i++){
			System.out.println("ENTRO");
			if(usuarios.get(i).getiArea()!=0){
				usuarios.get(i).setNombreArea(areaDAO.selectByPrimaryKey(usuarios.get(i).getiArea()).getDescripcion().toString());	
			}
			else{
				usuarios.get(i).setNombreArea("");
			}
			
		}
		
		List<UsuarioRol> roles=null;
		
		if(usuarios!=null && usuarios.size()>0){
			for (Usuario user : usuarios) {
				roles=rolService.getRolesByIdUsuario(user.getiUsuarioId());
				user.setRoles(roles);
			}
		}
		
		return usuarios;
	}	
	
	@Override
	public Usuario enableUser(Integer idUsuario) throws Exception {
		Usuario user = new Usuario();
		user.setiUsuarioId(idUsuario);
		user.setiUsuarioEstado(1);
		usuarioDAO.updateByPrimaryKeySelective(user);
		return user;
	}
	
	@Override
	public Usuario disableUser(Integer idUsuario) throws Exception {
		Usuario user = new Usuario();
		user.setiUsuarioId(idUsuario);
		user.setiUsuarioEstado(0);
		usuarioDAO.updateByPrimaryKeySelective(user);
		return user;
	}
	
	public boolean userExist(String login, Integer idSucursal) {
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andVUsuarioUsernameEqualTo(login).andISucursalEqualTo(idSucursal);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list.size() > 0;
	}
	
	@Override
	public Map<String, Object> saveUser(Integer idSucursal, String aPaterno, String aMaterno, String nombres,
	        String dni, String ip, String login, String email, Integer idEmpresa, Integer idArea, Integer rol) throws Exception {
	    
	    Map<String, Object> result = new HashMap<>();
	    
	    if ( !userExists(login, idSucursal) ) {
	        System.out.println("Este usuario no existe");
	        AeSimpleMD5 aeSimpleMD5 = new AeSimpleMD5();        
	        String password = "123456";
	        String newPasswordMD5 = aeSimpleMD5.getMD5Spring(password);
	        Usuario user = new Usuario();
	        user.setvUsuarioApPaterno(aPaterno);
	        user.setvUsuarioApMaterno(aMaterno);
	        user.setvUsuarioNombres(nombres);
	        user.setDni(dni);
	        user.setvUsuarioUsername(login);
	        user.setvUsuarioEmail(email);
	        user.setcUsuarioIp(ip);
	        user.setiSucursal(idSucursal);
	        user.setiArea(idArea);
	        user.setiEmpresa(idEmpresa);
	        user.setiRolEquipo(rol);
	        user.setcUsuarioSolicitaIp("1");
	        user.setvUsuarioPassword(newPasswordMD5);
	        usuarioDAO.insertSelective(user);
    
	        UsuarioCriteria criteria = new UsuarioCriteria();
	        criteria.createCriteria().andVUsuarioUsernameEqualTo(login).andISucursalEqualTo(idSucursal);
	        List<Usuario> insertedUsers = usuarioDAO.selectByExample(criteria);
	        if (!insertedUsers.isEmpty()) {
	            Integer idUsuario = insertedUsers.get(0).getiUsuarioId();
	            if (idUsuario != null) assignUserRole(idUsuario, rol);
	        }
	        
	        result.put("success", true);
	        result.put("user", user);
	        result.put("message", "Usuario " + user.getvUsuarioUsername() + " creado exitosamente");
	    } else {
	        System.out.println("Este usuario ya existe");
	        result.put("success", false);
	        result.put("message", "Ya existe un usuario con el nombre de usuario: " + login);
	    }
	    
	    return result;
	}

	public boolean userExists(String login, Integer idSucursal) {
		UsuarioCriteria us = new UsuarioCriteria();
	    UsuarioCriteria.Criteria criteria = us.createCriteria();
	    criteria.andVUsuarioUsernameEqualTo(login);
	    
	    if (idSucursal != null) {
	        criteria.andISucursalEqualTo(idSucursal);
	    }

	    List<Usuario> list = usuarioDAO.selectByExample(us);
	    return list.size() > 0;
	}
	
	public void assignUserRole(Integer idUsuario, Integer rol) {
		RolCriteria rc = new RolCriteria();
		rc.createCriteria().andIRolEstadoEqualTo(1);
		List<Rol> listRol = rolDAO.selectByExample(rc);
		
		RolEquipoCriteria rec = new RolEquipoCriteria();
		rec.createCriteria().andIdEqualTo(rol);
		List<RolEquipo> listRolEquipo = rolEquipoDAO.selectByExample(rec);

		Integer rolId = determineRoleId(listRolEquipo, listRol);

		UsuarioRol usuarioRol = new UsuarioRol();
		usuarioRol.setiUsuarioxrolUsuarioId(idUsuario);
		usuarioRol.setiUsuarioxrolRolId(rolId);
		usuarioRolDAO.insertSelective(usuarioRol);
	}
	
	public int determineRoleId(List<RolEquipo> listRolEquipo, List<Rol> listRol) {
	    for (RolEquipo re : listRolEquipo) {
	        String tipoEquipo = re.getTipoEquipo();
	        for (Rol r : listRol) {
	            String prefijo = r.getvPrefijo();
	            if (tipoEquipo != null && prefijo != null && tipoEquipo.equals(prefijo)) {
	                return r.getiRolId();
	            }
	        }
	    }
	    return 0;
	}
	
	@Override
	public Usuario getUserById(Integer idUsuario) throws Exception {
		Usuario user = usuarioDAO.selectByPrimaryKey(idUsuario);
	    if (user == null) {
	        return null;
	    }

	    List<UsuarioRol> userRoles = rolService.getRolesByIdUsuario(idUsuario);

	    for (UsuarioRol ur : userRoles) {
	        Integer rolId = ur.getiUsuarioxrolRolId();
	        Rol rol = rolDAO.selectByPrimaryKey(rolId);
	        ur.setRol(rol);
	    }

	    user.setRoles(userRoles);

	    return user;
	}
	
	@Override
	public Usuario editUser(Integer idSucursal, Integer idUsuario, String aPaternoEdit, String aMaternoEdit, String nombresEdit,
	        String dniEdit, String emailEdit, String loginEdit, String ipEdit, Integer idArea, Integer rolEdit)
			throws Exception {
        Usuario user = new Usuario();
		user.setiUsuarioId(idUsuario);
		user.setiSucursal(idSucursal);
		user.setvUsuarioApPaterno(aPaternoEdit);
        user.setvUsuarioApMaterno(aMaternoEdit);
        user.setvUsuarioNombres(nombresEdit);
        user.setDni(dniEdit);
        user.setvUsuarioEmail(emailEdit);
		user.setvUsuarioUsername(loginEdit);
		user.setcUsuarioIp(ipEdit);
		user.setiArea(idArea);
		user.setiRolEquipo(rolEdit);
		usuarioDAO.updateByPrimaryKeySelective(user);
	    return user;
	}

	@Override
	public Map<String, Object> saveUserAdminSucursal(Integer idSucursal, String aPaterno, String aMaterno, String nombres,
	        String dni, String login, String email, Integer idEmpresa) throws Exception {
	    
	    Map<String, Object> result = new HashMap<>();
	    
	    AeSimpleMD5 aeSimpleMD5 = new AeSimpleMD5();        
        String password = "123456";
        String newPasswordMD5 = aeSimpleMD5.getMD5Spring(password);
        Usuario user = new Usuario();
        user.setvUsuarioApPaterno(aPaterno);
        user.setvUsuarioApMaterno(aMaterno);
        user.setvUsuarioNombres(nombres);
        user.setDni(dni);
        user.setvUsuarioUsername(login);
        user.setvUsuarioEmail(email);
        user.setiSucursal(idSucursal);
        user.setiEmpresa(idEmpresa);
        user.setcUsuarioSolicitaIp("1");
        user.setvUsuarioPassword(newPasswordMD5);
        usuarioDAO.insertSelective(user);

        Integer idUsuario = user.getiUsuarioId();
        
        if (idUsuario != null) {
        	UsuarioRol usuarioRol = new UsuarioRol();
    		usuarioRol.setiUsuarioxrolUsuarioId(idUsuario);
    		usuarioRol.setiUsuarioxrolRolId(6);
    		usuarioRolDAO.insertSelective(usuarioRol);
    		
    		Sucursal sucursal = new Sucursal();
    		sucursal.setId(idSucursal);
    		sucursal.setIdUsuario(idUsuario);
    		sucursalDAO.updateByPrimaryKeySelective(sucursal);
        }
        
        result.put("success", true);
        result.put("user", user);
        result.put("message", "Usuario " + user.getvUsuarioUsername() + " creado exitosamente");
	    
	    return result;
	}
	
	@Override
	public Usuario editUserAdminSucursal(Integer idSucursal, Integer idUsuario, String aPaternoEdit, String aMaternoEdit, String nombresEdit,
	        String dniEdit, String emailEdit, String loginEdit) throws Exception {
        Usuario user = new Usuario();
		user.setiUsuarioId(idUsuario);
		user.setiSucursal(idSucursal);
		user.setvUsuarioApPaterno(aPaternoEdit);
        user.setvUsuarioApMaterno(aMaternoEdit);
        user.setvUsuarioNombres(nombresEdit);
        user.setDni(dniEdit);
        user.setvUsuarioEmail(emailEdit);
		user.setvUsuarioUsername(loginEdit);
		usuarioDAO.updateByPrimaryKeySelective(user);
	    return user;
	}
	
	@Override
	public Usuario findUsuarioByIP() throws Exception{
		InetAddress localhost = InetAddress.getLocalHost();
		String ip = (localhost.getHostAddress()).trim();
		System.out.println("ip: "+ip);
		UsuarioCriteria userCrit = new UsuarioCriteria();	
		userCrit.createCriteria().andCUsuarioIpEqualTo(ip);
		
		Usuario user=null;
		List<Usuario> result=usuarioDAO.selectByExample(userCrit);
		if(result!=null && result.size()>0){
			user=result.get(0);
		}
		return user;
		
	}
	
	@Override
	public List<Usuario> listarUsuariosXRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(idRol);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list;
	}

	@Override
	public List<Usuario> editUsuarioMonitor(Integer idSucursal, Integer idUsuario, Integer iSolicitaIpEdit, String vIpEdit, 
			Integer iTipoMonitorEdit, Integer idRol, Integer iAreaMonitorEdit, Integer usuarioPrincipalEdit) throws Exception {
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setiSucursal(idSucursal);
			usuario.setcUsuarioSolicitaIp(iSolicitaIpEdit.toString());
			usuario.setcUsuarioIp(vIpEdit);
			usuario.setiMonitorTipo(iTipoMonitorEdit);
			usuario.setiArea(iAreaMonitorEdit);			
			usuario.setiUsuarioPrincipalId(usuarioPrincipalEdit);
			usuarioDAO.updateByPrimaryKeySelective(usuario);
			int numCajas=0;
			if ( iTipoMonitorEdit!= 20) 
			{

				MonitorCajas mc = new MonitorCajas();
				// borrar monitor cajas
				
				MonitorCajasCriteria mcc=new MonitorCajasCriteria();
				mcc.createCriteria().andIdUsuarioEqualTo(idUsuario);
				monitorCajasDAO.deleteByExample(mcc);
		
				
				if(iTipoMonitorEdit ==1 || iTipoMonitorEdit == 21 || iTipoMonitorEdit == 22){
					numCajas=6;
				}
				else if(iTipoMonitorEdit ==2){
					numCajas=4;
				}
				else if(iTipoMonitorEdit ==3){
					numCajas=4;
				}
				else if(iTipoMonitorEdit ==4){
					numCajas=4;
				}
				else if(iTipoMonitorEdit ==5){
					numCajas=12;
				}
				else if ( iTipoMonitorEdit == 23 ) {
					numCajas = 6;
				}
				else{
					numCajas=0;
				}

				for(int i=0; i<numCajas; i++){
					mc.setIdUsuario(idUsuario);
					mc.setIdSucursal(idSucursal);
					mc.setSecuencia(i+1);
					mc.setTicketTexto("--");
					mc.setNombreVentanilla("--");
					mc.setPersona("--");
					mc.setGrupo("--");
					mc.setEstado(0);
					monitorCajasDAO.insertSelective(mc);
				}
			}
			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRol);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}

	@Override
	public List<Usuario> editUsuarioKiosko(Integer idUsuario, Integer idSucursal,  Integer iSolicitaIpEdit, String vIpEdit,
			Integer iTipoValidaDocEdit, Integer iPideDocumentoEdit, Integer iImprimeTicketEdit, Integer idRol,
			Integer iConfirmaImpresionEdit) throws Exception {  
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setiSucursal(idSucursal);
			usuario.setcUsuarioSolicitaIp(iSolicitaIpEdit.toString());
			usuario.setcUsuarioIp(vIpEdit);
			usuario.setiPideDocumento(iPideDocumentoEdit);
			usuario.setiValidaDocumento(iTipoValidaDocEdit);
			usuario.setiImprimeTicket(iImprimeTicketEdit);
			usuario.setiConfirmaImpresion(iConfirmaImpresionEdit);
			usuarioDAO.updateByPrimaryKeySelective(usuario);
			
			
			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRol);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;			
	}

	@Override
	public List<Usuario> editUsuarioVentanilla(Integer idUsuario, Integer idSucursal,
			Integer idRol, Integer iVentanillaEdit, String vIpEdit, Integer iAreaEdit,
			Integer iControlAsistenciaEdit, Integer iEvaluaEdit, Integer iAnulaEdit, String puertoEdit, Integer iAtencionEdit)	throws Exception {
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setiSucursal(idSucursal);
			usuario.setiVentanilla(iVentanillaEdit);
			usuario.setcUsuarioIp(vIpEdit);
			usuario.setiArea(iAreaEdit);
			usuario.setiControlAsistencia(iControlAsistenciaEdit);
			usuario.setiEvalua(iEvaluaEdit);
			usuario.setiAnula(iAnulaEdit);
			usuario.setiAtencion(iAtencionEdit);
			usuario.setvPuerto(puertoEdit);
			usuarioDAO.updateByPrimaryKeySelective(usuario);	

			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRol);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}

	@Override
	public List<Usuario> eliminarUsuarioMonitor(Integer idUsuario, Integer idRol)
			throws Exception {
		// TODO Auto-generated method stub
// borrando en la tabla usuario
		usuarioDAO.deleteByPrimaryKey(idUsuario);
// borrando en monitor cajas
		MonitorCajas mc = new MonitorCajas();
		// borrar monitor cajas
		
		MonitorCajasCriteria mcc=new MonitorCajasCriteria();
		mcc.createCriteria().andIdUsuarioEqualTo(idUsuario);
		monitorCajasDAO.deleteByExample(mcc);
// listando para mosetrar en clientes		
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(idRol);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list;
	}

	@Override
	public List<Usuario> eliminarUsuarioKiosko(Integer idUsuario, Integer idRol)
			throws Exception {
		// TODO Auto-generated method stub
		usuarioDAO.deleteByPrimaryKey(idUsuario);
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(idRol);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list;
	}

	@Override
	public List<Usuario> eliminarUsuarioVentanilla(Integer idUsuario, Integer idRol)
			throws Exception {
		// TODO Auto-generated method stub
		Usuario usuario = new Usuario();
		usuario.setiUsuarioId(idUsuario);
		usuario.setiRolEquipo(0);
		usuarioDAO.updateByPrimaryKeySelective(usuario);
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(idRol);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list;
	}
	
	@Override
	public void cambiarClaveUsuario(Integer idUsuario, String pass)
			throws Exception {
		// TODO Auto-generated method stub
		String newPassword = pass;
		AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();
		String newPasswordMD5=aeSimpleMD5.getMD5Spring(newPassword);
		Usuario usuarioUpdate=new Usuario();
		usuarioUpdate.setiUsuarioId(idUsuario);
		usuarioUpdate.setvUsuarioPassword(newPasswordMD5);
		usuarioDAO.updateByPrimaryKeySelective(usuarioUpdate);
	}
	
	@Override
	public void resetearClave(Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
//		if(usuario.getiUsuarioId()==null){throw new GenericExcepcion("El usuario no existe.");}
		
		String newPassword = "123456";
		AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();
		String newPasswordMD5=aeSimpleMD5.getMD5Spring(newPassword);
		Usuario usuarioUpdate=new Usuario();
		usuarioUpdate.setiUsuarioId(idUsuario);
		usuarioUpdate.setvUsuarioPassword(newPasswordMD5);
		usuarioDAO.updateByPrimaryKeySelective(usuarioUpdate);		
	}

	@Override
	public List<Usuario> findUsuariosVentanilla(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIVentanillaIsNotNull().andISucursalEqualTo(idSucursal);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		return list;
	}
	
	@Override
	public Usuario  consultaUsuarioMonitorPrinicipal(Integer idSucursal, Integer idRol) throws Exception {
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(idRol).andIMonitorTipoBetween(0, 15).andISucursalEqualTo(idSucursal);
		List<Usuario> listu1 = new ArrayList<>();
		listu1 = usuarioDAO.selectByExample(us);
	
		if (listu1.size()>0) {
			return listu1.get(0);
		}
		return null;
	}	

	@Override
	public List<Dni> findAllPersonas() throws Exception {
		// TODO Auto-generated method stub
		DniCriteria uc = new DniCriteria();
		uc.createCriteria().andEstadoEqualTo(1);
		List<Dni> personas = new ArrayList<>();
		personas = dniDAO.selectByExample(uc);		
		return personas;
		
	}	
	
	@Override
	public Dni getPersonaById(Integer idPersona) throws Exception {
		// TODO Auto-generated method stub
		Dni dni= new Dni();
		dni = dniDAO.selectByPrimaryKey(idPersona);
		return dni;
	}
	
	@Override
	public void editPersona(Integer idPersona, Integer idUsuario, String dni, String nombres, String apePaterno, String apeMaterno, Integer telefono, String correo)
			throws Exception {
		// TODO Auto-generated method stub
		Dni persona = new Dni();
		Date fechaHoy = new Date();
		persona.setId(idPersona);
		persona.setUsuarioModificacion(idUsuario);
		persona.setDni(dni);
		persona.setNombres(nombres);
		persona.setApePaterno(apePaterno);
		persona.setApeMaterno(apeMaterno);
		persona.setTelefono(telefono);
		persona.setCorreo(correo);
		persona.setFechaModificacion(fechaHoy);
		persona.setEstado(1);
		dniDAO.updateByPrimaryKeySelective(persona);
	}
	
	@Override
	public Dni savePersonaDni(String dni, String nombres, String aPaterno, String aMaterno, Integer tipoRegistro, Integer telefono, String correo) throws Exception {
	    if (!existsPerson(dni)) {
	        Dni persona = new Dni();
	        Date fechaActual = new Date();
	        persona.setDni(dni);
	        persona.setNombres(nombres);
	        persona.setApePaterno(aPaterno);
	        persona.setApeMaterno(aMaterno);
	        persona.setTelefono(telefono);
	        persona.setCorreo(correo);
	        persona.setEstado(1);
	        persona.setFechaRegistro(fechaActual);
	        persona.setTipoRegistro(tipoRegistro);
	        dniDAO.insertSelective(persona);
	     
	        return persona;
	    } else {
	        throw new GenericExcepcion("Ya existe una persona con este DNI");
	    }
	}

	@Override
	public Boolean existsPerson(String numeroDocumento) throws Exception {
	    if (numeroDocumento == null || numeroDocumento.trim().isEmpty()) {
	        throw new IllegalArgumentException("El número de documento no puede ser nulo o vacío");
	    }
	    
	    DniCriteria us = new DniCriteria();
	    us.createCriteria().andDniEqualTo(numeroDocumento);
	    return dniDAO.countByExample(us) > 0;
	}
	
	@Override
	public void inhabilitarPersona(Integer idPersona)
			throws Exception {
		// TODO Auto-generated method stub
		Dni persona = new Dni();
		persona.setId(idPersona);
		persona.setEstado(0);
		
		dniDAO.updateByPrimaryKeySelective(persona);
	}
	
	@Override
	public List<Usuario> getListUsuarios(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		UsuarioCriteria ec = new UsuarioCriteria();
		ec.createCriteria().andISucursalEqualTo(idSucursal);
		List<Usuario> list = usuarioDAO.selectByExample(ec);
		return list;
	}
	
	@Override
	public List<Usuario> getListUsuariosVentanilla(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoCriteria rec = new RolEquipoCriteria();
		rec.createCriteria()
			.andIdSucursalEqualTo(idSucursal)
			.andTipoEquipoLike("%V%");
		List<RolEquipo> listRolEquipo = rolEquipoDAO.selectByExample(rec);
		
		List<Integer> idsRolEquipo = new ArrayList<>();
		for (RolEquipo rolEquipo : listRolEquipo) {
			idsRolEquipo.add(rolEquipo.getId());
		}
		
		UsuarioCriteria ec = new UsuarioCriteria();
		ec.createCriteria()
			.andISucursalEqualTo(idSucursal)
			.andIRolEquipoIn(idsRolEquipo);
		List<Usuario> list = usuarioDAO.selectByExample(ec);
		return list;
	}

	@Override
	public List<Usuario> listarUsuarioPrincipal(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoCriteria rec = new RolEquipoCriteria();
		rec.createCriteria()
			.andIdSucursalEqualTo(idSucursal)
			.andTipoEquipoEqualTo("M");
		List<RolEquipo> listRolEquipo = rolEquipoDAO.selectByExample(rec);
		
		Integer idRolEquipo = listRolEquipo.get(0).getId();
		
		UsuarioCriteria ec = new UsuarioCriteria();
		ec.createCriteria().andIRolEquipoEqualTo(idRolEquipo);
		List<Usuario> list = usuarioDAO.selectByExample(ec);
		return list;
	}
	
	@Override
	public List<Usuario> editUsuarioEncuestador(Integer idUsuario, Integer idRol, Integer idSucursal, Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setiSucursal(idSucursal);	
			usuario.setiRolEquipo(idRol);
			usuario.setiVentanilla(idVentanilla);
			usuarioDAO.updateByPrimaryKeySelective(usuario);
			
			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria()
				.andIRolEquipoEqualTo(idRol)
				.andISucursalEqualTo(idSucursal);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}

}
 