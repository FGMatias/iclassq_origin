package pe.gob.ep.iclassq.service;

import java.io.File;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.gob.ep.iclassq.entidad.BeanDni;
import pe.gob.ep.iclassq.entidad.BeanEncuesta;
import pe.gob.ep.iclassq.entidad.BeanEncuestaPreguntas;
import pe.gob.ep.iclassq.entidad.BeanGrupo;
import pe.gob.ep.iclassq.entidad.BeanGrupoProporcion;
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
import pe.gob.ep.iclassq.entidad.BeanUsuario;
import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.Agrupador;
import pe.gob.ep.iclassq.negocio.bean.AgrupadorCriteria;
import pe.gob.ep.iclassq.negocio.bean.Algoritmo;
import pe.gob.ep.iclassq.negocio.bean.AlgoritmoCriteria;
import pe.gob.ep.iclassq.negocio.bean.AlgoritmoXGrupo;
import pe.gob.ep.iclassq.negocio.bean.AlgoritmoXGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.Area;
import pe.gob.ep.iclassq.negocio.bean.AreaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Asistencia;
import pe.gob.ep.iclassq.negocio.bean.AsistenciaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Dni;
import pe.gob.ep.iclassq.negocio.bean.DniCriteria;
import pe.gob.ep.iclassq.negocio.bean.Empresa;
import pe.gob.ep.iclassq.negocio.bean.EmpresaCriteria;
import pe.gob.ep.iclassq.negocio.bean.Encuesta;
import pe.gob.ep.iclassq.negocio.bean.EncuestaCriteria;
import pe.gob.ep.iclassq.negocio.bean.EncuestaOpciones;
import pe.gob.ep.iclassq.negocio.bean.EncuestaOpcionesCriteria;
import pe.gob.ep.iclassq.negocio.bean.EncuestaPreguntas;
import pe.gob.ep.iclassq.negocio.bean.EncuestaPreguntasCriteria;
import pe.gob.ep.iclassq.negocio.bean.EncuestaRespuesta;
import pe.gob.ep.iclassq.negocio.bean.Grupo;
import pe.gob.ep.iclassq.negocio.bean.GrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.GrupoXKiosko;
import pe.gob.ep.iclassq.negocio.bean.GrupoXSede;
import pe.gob.ep.iclassq.negocio.bean.GrupoXSedeCriteria;
import pe.gob.ep.iclassq.negocio.bean.Maestra;
import pe.gob.ep.iclassq.negocio.bean.MaestraCriteria;
import pe.gob.ep.iclassq.negocio.bean.MonitorCajas;
import pe.gob.ep.iclassq.negocio.bean.MonitorCajasCriteria;
import pe.gob.ep.iclassq.negocio.bean.Prioridad;
import pe.gob.ep.iclassq.negocio.bean.PrioridadCriteria;
import pe.gob.ep.iclassq.negocio.bean.Proyecto;
import pe.gob.ep.iclassq.negocio.bean.ProyectoCriteria;
import pe.gob.ep.iclassq.negocio.bean.Publicidad;
import pe.gob.ep.iclassq.negocio.bean.PublicidadCriteria;
import pe.gob.ep.iclassq.negocio.bean.RolEquipo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoCriteria;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoSubGrupo;
import pe.gob.ep.iclassq.negocio.bean.RolEquipoSubGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.Secuencia;
import pe.gob.ep.iclassq.negocio.bean.SecuenciaCriteria;
import pe.gob.ep.iclassq.negocio.bean.SubGrupo;
import pe.gob.ep.iclassq.negocio.bean.SubGrupoCriteria;
import pe.gob.ep.iclassq.negocio.bean.Sucursal;
import pe.gob.ep.iclassq.negocio.bean.SucursalCriteria;
import pe.gob.ep.iclassq.negocio.bean.Ticket;
import pe.gob.ep.iclassq.negocio.bean.TicketCriteria;
import pe.gob.ep.iclassq.negocio.bean.Ventanilla;
import pe.gob.ep.iclassq.negocio.bean.VentanillaCriteria;
import pe.gob.ep.iclassq.negocio.dao.AgrupadorDAO;
import pe.gob.ep.iclassq.negocio.dao.AlgoritmoDAO;
import pe.gob.ep.iclassq.negocio.dao.AlgoritmoXGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.AreaDAO;
import pe.gob.ep.iclassq.negocio.dao.AsistenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.DniDAO;
import pe.gob.ep.iclassq.negocio.dao.EmpresaDAO;
import pe.gob.ep.iclassq.negocio.dao.EncuestaDAO;
import pe.gob.ep.iclassq.negocio.dao.EncuestaOpcionesDAO;
import pe.gob.ep.iclassq.negocio.dao.EncuestaPreguntasDAO;
import pe.gob.ep.iclassq.negocio.dao.EncuestaRespuestaDAO;
import pe.gob.ep.iclassq.negocio.dao.GrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.GrupoXKioskoDAO;
import pe.gob.ep.iclassq.negocio.dao.GrupoXSedeDAO;
import pe.gob.ep.iclassq.negocio.dao.MaestraDAO;
import pe.gob.ep.iclassq.negocio.dao.MonitorCajasDAO;
import pe.gob.ep.iclassq.negocio.dao.PrioridadDAO;
import pe.gob.ep.iclassq.negocio.dao.ProyectoDAO;
import pe.gob.ep.iclassq.negocio.dao.PublicidadDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoSubGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.SecuenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.SubGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.SucursalDAO;
import pe.gob.ep.iclassq.negocio.dao.TicketDAO;
import pe.gob.ep.iclassq.negocio.dao.VentanillaDAO;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.RolCriteria;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioCriteria;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioRolDAO;
import pe.gob.ep.iclassq.seguridad.md5.AeSimpleMD5;
import pe.gob.ep.iclassq.seguridad.service.SeguridadService;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.ticket.service.TicketService;
import pe.gob.ep.iclassq.util.Constante;

@Service
public class EssaludServiceImpl implements EssaludService{

	@Autowired
	private MaestraDAO maestraDAO;
	
	@Autowired
	private ProyectoDAO proyectoDAO;
	
	@Autowired
	private GrupoXSedeDAO grupoXSedeDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private UsuarioRolDAO usuarioRolDAO;
	
	@Autowired
	private GrupoDAO grupoDAO;
	
	@Autowired
	private SubGrupoDAO subGrupoDAO;
	
	@Autowired
	private GrupoXKioskoDAO grupoXKioskoDAO;
	
	@Autowired
	private AlgoritmoXGrupoDAO algoritmoXGrupoDAO;
	
	@Autowired
	private AreaDAO areaDAO;
	
	@Autowired
	private AlgoritmoDAO algoritmoDAO;
	
	@Autowired
	private PrioridadDAO prioridadDAO;
	
	@Autowired
	private EmpresaDAO empresaDAO;
	
	@Autowired
	private SecuenciaDAO secuenciaDAO;
	
	@Autowired
	private TicketDAO ticketDAO;

	@Autowired
	private SucursalDAO sucursalDAO;	
	
	@Autowired
	private RolEquipoDAO rolEquipoDAO;
	
	@Autowired
	private RolEquipoGrupoDAO rolEquipoGrupoDAO;
	
	@Autowired
	private MonitorCajasDAO monitorCajasDAO;
	
	@Autowired
	private VentanillaDAO ventanillaDAO;
	
	@Autowired
	private PublicidadDAO publicidadDAO;
	
	@Autowired
	private AgrupadorDAO agrupadorDAO;
	
	@Autowired
	private AsistenciaDAO asistenciaDAO;
	
	@Autowired
	private DniDAO dniDAO;
	
	@Autowired
	private RolEquipoSubGrupoDAO rolEquipoSubGrupoDAO;
	
	@Autowired
	private AuditoriaService auditoriaService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private SeguridadService seguridadService;
	
	@Autowired
	private EncuestaDAO encuestaDAO;
	
	@Autowired
	private EncuestaPreguntasDAO encuestaPreguntasDAO;
	
	@Autowired
	private EncuestaOpcionesDAO encuestaOpcionesDAO;
	
	@Autowired
	private EncuestaRespuestaDAO encuestaRespuestaDAO;
	
	@Override
	public List<Maestra> listarTablaMaestraByGrupo(Integer grupo)
			throws Exception {
		// TODO Auto-generated method stub
		List<Maestra> list = new ArrayList<>();
		MaestraCriteria mc = new MaestraCriteria();
		mc.createCriteria().andGrupoEqualTo(grupo);
		list = maestraDAO.selectByExample(mc);
		return list;
	}

	@Override
	public List<Proyecto> listarProyectosXUsuarioAndEtapa(Integer estado)
			throws Exception {
		// TODO Auto-generated method stub
		List<Proyecto> list = new ArrayList<>();
		ProyectoCriteria pc = new ProyectoCriteria();
		pc.createCriteria().andEstadoEqualTo(estado);
		list = proyectoDAO.selectByExample(pc);
		return list;
	}

	@Override
	public List<Grupo> saveGruposXSede(Integer idSucursal, String nombreGrupo, String prefijoGrupo,  			
			Integer idAlgoritmo, Integer idArea, String descripcionCorta, String descripcionLarga,  		
			Integer kioskoAlg3Entrada, Integer kioskoAlg3Minimo, String horaInicio, 
			String horaFin) throws Exception {
		// TODO Auto-generated method stub
		DateFormat sdf = new SimpleDateFormat("hh:mm");
		GrupoCriteria gr = new GrupoCriteria();
		gr.createCriteria().andNombreEqualTo(nombreGrupo).andPrefijoEqualTo(prefijoGrupo).andIdSucursalEqualTo(idSucursal);
		List<Grupo> list = grupoDAO.selectByExample(gr);
		
		if( list.size() == 0){
			Grupo grupo = new Grupo();
			grupo.setIdSucursal(idSucursal);		
			grupo.setNombre(nombreGrupo);
			grupo.setPrefijo(prefijoGrupo);
			grupo.setDescripcionCorta(descripcionCorta);
			grupo.setDescripcionLarga(descripcionLarga);
			grupo.setIdAlgoritmo(idAlgoritmo);
			grupo.setIdArea(idArea);
			grupo.setKioskoAlg3Entrada(kioskoAlg3Entrada);
			grupo.setKioskoAlg3Minimo(kioskoAlg3Minimo);
			
			Date hInicio = sdf.parse(horaInicio);
			Date hFin = sdf.parse(horaFin);
			grupo.setHoraInicio(hInicio);
			grupo.setHoraFin(hFin);
			grupo.setEstado(1);
			grupoDAO.insertSelective(grupo);
			
			GrupoCriteria gc = new GrupoCriteria();
			gc.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Grupo> listgrupo= new ArrayList<>();
			listgrupo = grupoDAO.selectByExample(gc);
			for(int i=0; i<listgrupo.size(); i++){
				listgrupo.get(i).setNombreAlgoritmo(algoritmoDAO.selectByPrimaryKey(listgrupo.get(i).getIdAlgoritmo()).getDescripcion().toString());
			}
			return listgrupo;
		}
		else{
			System.out.println("Este grupo ya existe");
			throw new GenericExcepcion("Ya existe un grupo con este nombre");
		}
			
	}

	@Override
	public List<Usuario> saveUsuarioXSede(Integer idSucursal, String codSede, String aPaterno,
			String aMaterno, String vNombre, Integer iRol, String vIp,
			String vLogin, String vEmail, Integer iGrupo) throws Exception {
		// TODO Auto-generated method stub
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andVUsuarioUsernameEqualTo(vNombre);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		
		if( list.size() == 0){
			AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();		
			String password="123456";
			String newPasswordMD5=aeSimpleMD5.getMD5Spring(password);
			Usuario usuario = new Usuario();
			usuario.setvUsuarioApPaterno(aPaterno);
			usuario.setvUsuarioApMaterno(aMaterno);
			usuario.setvUsuarioNombres(vNombre);
			usuario.setvUsuarioUsername(vLogin);
			usuario.setvUsuarioEmail(vEmail);
			usuario.setcUsuarioIp(vIp);
			usuario.setiSucursal(idSucursal);
			usuario.setiArea(0);
			usuario.setcUsuarioSolicitaIp("1");
			usuario.setvUsuarioPassword(newPasswordMD5);
			
			usuarioDAO.insertSelective(usuario);
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();		
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			int max = usuarios.size();
			int idUsuario = usuarios.get(max-1).getiUsuarioId();
			System.out.println();
			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario);
			usuarioRol.setiUsuarioxrolRolId(iRol);
			usuarioRolDAO.insertSelective(usuarioRol);
			
			//aqui va la condicional
			if(iRol==6){
				System.out.println("sss");
				GrupoXKiosko grupoXKiosko = new GrupoXKiosko();
				grupoXKiosko.setIdGrupo(iGrupo);
				grupoXKiosko.setIdKiosko(idUsuario);
				grupoXKioskoDAO.insertSelective(grupoXKiosko);
			}
			return usuarios;
		}
		else{
			System.out.println("Este usuario ya existe");
			throw new Exception("Exception message");
		}
	}

	@Override
	public List<Grupo> listarGruposXSede(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		GrupoCriteria gc = new GrupoCriteria();
		gc.createCriteria().andIdSucursalEqualTo(idSucursal);
		gc.setOrderByClause("NOMBRE ASC");
		List<Grupo> list= new ArrayList<>();
		list = grupoDAO.selectByExample(gc);
		
		for(int i=0; i<list.size(); i++){
			list.get(i).setNombreAlgoritmo(algoritmoDAO.selectByPrimaryKey(list.get(i).getIdAlgoritmo()).getDescripcion().toString());
			list.get(i).setNombreArea(areaDAO.selectByPrimaryKey(list.get(i).getIdArea()).getDescripcion().toString());
		}
		return list;
	}	
	@Override
	public List<Grupo> listarGruposxventanilla(Integer idSucursal, Integer idVentanilla) throws Exception{

		Map<String, Object> param = new HashMap<String, Object>();		
		List<Grupo> listG= new ArrayList<>();
		try {
			param.put("idSucursal", idSucursal);
			param.put("idVentanilla", idVentanilla);

			listG = grupoDAO.listarGruposxventanilla(param);

		} catch (Exception npe) {
			System.out.println("algun error");
	    }finally{

	        System.out.println("finaliza ok listgrupo");
	    }
		
		return listG;
	}	

	
	@Override
	public List<SubGrupo> listarSubGruposXIdGrupo(Integer idGrupo)
			throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
		List<SubGrupo> list = subGrupoDAO.selectByExample(sgc);
		return list;
	}

	@Override
	public List<Area> listarAreaXSucursal(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		AreaCriteria ac = new AreaCriteria();
		ac.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Area> list = areaDAO.selectByExample(ac);
		return list;
	}

	@Override
	public List<Area> listarareaxsurcursalxPerfil(Integer idSucursal, Integer idArea) throws Exception {
		// TODO Auto-generated method stub
		AreaCriteria ac = new AreaCriteria();
		if (idArea==0) {
			ac.createCriteria().andIdSucursalEqualTo(idSucursal);			
		} else
		{
			ac.createCriteria().andIdEqualTo(idArea);			
		}
		List<Area> list = areaDAO.selectByExample(ac);
		return list;
	}	
	@Override
	public List<Algoritmo> listarAlgoritmos() throws Exception {
		// TODO Auto-generated method stub
		AlgoritmoCriteria ac = new AlgoritmoCriteria();
		ac.createCriteria();
		List<Algoritmo> list = algoritmoDAO.selectByExample(ac);
		return list;
	}

	@Override
	public List<Prioridad> listarPrioridad() throws Exception {
		// TODO Auto-generated method stub
		PrioridadCriteria pc = new PrioridadCriteria();
		pc.createCriteria().andEstadoEqualTo(1);
		List<Prioridad> list = prioridadDAO.selectByExample(pc);
		return list;
	}

	@Override
	public List<SubGrupo> saveSubGruposXSede(Integer idGrupo, String nombreSubGrupo,
			String prefijoSubGrupo, Integer idPrioridad, Integer idSecuencia,
			String descCortaSubGrupo, String descLargaSubGrupo,
			Integer prioridadAlgoritmo2, Integer prioridadAlgoritmo3,
			Integer idAgrupador)
			throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria sg = new SubGrupoCriteria();
		sg.createCriteria().andNombreEqualTo(nombreSubGrupo).andPrefijoEqualTo(prefijoSubGrupo).andIdGrupoEqualTo(idGrupo);
		List<SubGrupo> list = subGrupoDAO.selectByExample(sg);
		
		if( list.size() == 0){
			SubGrupo subGrupo = new SubGrupo();
			subGrupo.setIdGrupo(idGrupo);
			subGrupo.setNombre(nombreSubGrupo);
			subGrupo.setPrefijo(prefijoSubGrupo);
			subGrupo.setIdPrioridad(idPrioridad);
			subGrupo.setSecueciaKiosko(idSecuencia);
			subGrupo.setDescripcionCorta(descCortaSubGrupo);
			subGrupo.setDescripcion(descLargaSubGrupo);
			subGrupo.setPriorTiempoAlg2(prioridadAlgoritmo2);
			subGrupo.setPriorRatioAlg3(prioridadAlgoritmo3);
			subGrupo.setAgrupador(idAgrupador);
			subGrupo.setEstado(1);
			
			subGrupoDAO.insertSelective(subGrupo);
			
			SubGrupoCriteria sgc = new SubGrupoCriteria();
			sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
			List<SubGrupo> listsubgrupo = subGrupoDAO.selectByExample(sgc);
			return listsubgrupo;
		}
		else{
			System.out.println("Este subgrupo ya existe");
			throw new GenericExcepcion("Ya existe un subgrupo con este nombre");
		}
	}

	@Override
	public List<Empresa> listarEmpresas() throws Exception {
		// TODO Auto-generated method stub
		EmpresaCriteria ec = new EmpresaCriteria();
		ec.createCriteria().andEstadoEqualTo(1);
		List<Empresa> list = empresaDAO.selectByExample(ec);
		
		for (Empresa empresa : list) {
			if (empresa.getIdUsuario() != 0) {
				Usuario usuario = usuarioDAO.selectByPrimaryKey(empresa.getIdUsuario());
				String username = usuario.getvUsuarioUsername();
				empresa.setUsuario(username);
			} else {
				empresa.setUsuario("NO CONTIENE");
			}
		}
		return list;
	}

	@Override
	public void saveEmpresa(String nombre, String urlLogo, String ruc,
			String telef, String direccion) throws Exception {
		// TODO Auto-generated method stub
		
		EmpresaCriteria em = new EmpresaCriteria();
		em.createCriteria().andNombreEqualTo(nombre);
		List<Empresa> list = empresaDAO.selectByExample(em);
		
		if( list.size() == 0){
			Empresa empresa = new Empresa();
			empresa.setIdUsuario(0);
			empresa.setNombre(nombre);
			empresa.setUrlLogo(urlLogo);
			empresa.setRuc(ruc);
			empresa.setTelefono(telef);
			empresa.setDireccion(direccion);
			empresa.setEstado(1);
			empresa.setIdioma("Espa�ol");
			empresaDAO.insertSelective(empresa);
		}
		else{
			System.out.println("Este empresa ya existe");
			throw new Exception("invalido");
		}
		
	}
	
	@Override
	public List<BeanSubGrupo> listarSubGruposXGrupoAndSucursal(
			Integer idSucursal, Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params=new HashMap<String, Object>();		
		params.put("idSucursal", idSucursal);
		params.put("idGrupo", idGrupo);
		return subGrupoDAO.listarSubGruposXGrupoAndSucursal(params);
	}

	@Override
	public Empresa getEmpresaById(Integer idEmpresa) throws Exception {
		// TODO Auto-generated method stub
		Empresa empresa = new Empresa();
		empresa = empresaDAO.selectByPrimaryKey(idEmpresa);
		return empresa;
	}	

	@Override
	public Ticket generarTicketAtencion(Integer idSubgrupo, Integer idSucursal, String prefijo,
			String nombre, String numDoc, Integer tipoDoc) throws Exception {
		// TODO Auto-generated method stub
		Secuencia sec = new Secuencia();
		sec = this.ultimoTicketRegistrado(idSubgrupo, prefijo, idSucursal);
		int secuenciador = sec.getSecuencia();
		int valor = secuenciador+1;
		Date fechaMod = new Date();
		Secuencia secuencia = new Secuencia();
		secuencia.setSecuencia(valor);
		secuencia.setIdSubgrupo(idSubgrupo);
		secuencia.setCodGrupo(prefijo);
		secuencia.setIdSucursal(idSucursal);
		secuenciaDAO.insertSelective(secuencia);
		System.out.println("prefijo: "+prefijo);
		String codigo = prefijo+valor;
		
		System.out.println("valor: "+valor);
	    Date date = new Date();
	    
	    List<Dni> listPersona = this.getPersonabydni(numDoc);
		String nombrePersona = "";
		if (!listPersona.isEmpty()) {
			Dni persona = listPersona.get(0);
			nombrePersona = persona.getNombres() + " " + persona.getApePaterno() + " " + persona.getApeMaterno();
		}
	    
	    Ticket ticket = new Ticket();
		ticket.setCodigo(codigo);
		ticket.setIdSucursal(idSucursal);
		ticket.setHoraEmision(date);
		ticket.setHoraInicioAtencion(null);
		ticket.setHoraFinAtencion(null);
		ticket.setIdSubgrupo(idSubgrupo);
		ticket.setNumeroIdentificacion(numDoc);
		ticket.setDescripcion(nombrePersona);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(ticket.getHoraEmision());
		
		Date tempDate = cal.getTime();
		System.out.println("Fecha actual: " + tempDate);
		
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE) + getSubGrupoById(idSubgrupo).getPriorTiempoAlg2());
		tempDate = cal.getTime();
		System.out.println("Hora modificada: " + tempDate);

		ticket.setFechaHoraProgAlg2Tiempo(cal.getTime());
		
		ticket.setEstado(Constante.ESTADO_INICIO);
		ticket.setSecuenciaAlgo3Proporcion(0);
		ticket.setIdTicketDerivado(0);
		ticket.setNombreSubgrupo(nombre);
		ticket.setPrefijo(prefijo);
		ticket.setActivaAudioTexto(0);
		ticket.setTipoIdentificacion(tipoDoc);
		ticket.setIdVentanillaDerivacion(0);
		ticket.setVentanillaIdUsuario(0);
		ticket.setTicketSecuencia(0);
		ticket.setEnviaAudio(1);
		ticket.setVentanillaCaja(0);
		ticket.setEvaluacion(0);
		ticket.setFechaAtencion(date);
		ticketDAO.insertSelective(ticket);
		return ticket;
	}
	
	@Override
	public Ticket generarTicketAtencionPJ(Integer idGrupo, String prefijoGrupo,
			String nombre, String dni, Integer tipoDoc, String persona, String prioridad, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		
		//obtener subGrupo y Prefijo por idGrupo
		AgrupadorCriteria ac = new AgrupadorCriteria();
		ac.createCriteria().andPrefijoEqualTo(prioridad);
		List<Agrupador> list = new ArrayList<>();
		list = agrupadorDAO.selectByExample(ac);
		int idAgrupador = list.get(0).getId();//obtengo el id del agrupador
		
		GrupoCriteria gc = new GrupoCriteria();
		gc.createCriteria().andIdEqualTo(idGrupo);
		List<Grupo> listGrupo = new ArrayList<Grupo>();
		listGrupo = grupoDAO.selectByExample(gc);
		int idGrupo_v = listGrupo.get(0).getId();
		String nombre_grupo=listGrupo.get(0).getDescripcionCorta();
		
		
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo).andAgrupadorEqualTo(idAgrupador);
		List<SubGrupo> listSubGrupo = new ArrayList<SubGrupo>();
		listSubGrupo = subGrupoDAO.selectByExample(sgc);
		int idSubgrupo = listSubGrupo.get(0).getId();
		String prefijoSubGrupo = listSubGrupo.get(0).getPrefijo();
		String prefijo = prefijoGrupo+""+prefijoSubGrupo;
		
		//idSubrGrupo prefijo
		Secuencia sec = new Secuencia();
		sec = this.ultimoTicketRegistrado(idSubgrupo, prefijo, idSucursal);
		int secuenciador = sec.getSecuencia();
		int valor = secuenciador+1;
		Date fechaMod = new Date();
		Secuencia secuencia = new Secuencia();
		secuencia.setSecuencia(valor);
		secuencia.setCodGrupo(prefijo);
		secuencia.setIdSubgrupo(idSubgrupo);
		secuenciaDAO.insertSelective(secuencia);
		System.out.println("prefijo: "+prefijo);
		String codigo = prefijo+"-"+valor;
		
		System.out.println("valor: "+valor);
		
	    Date date = new Date();

		Ticket ticket = new Ticket();
		ticket.setCodigo(codigo);
		ticket.setHoraEmision(date);
		ticket.setHoraInicioAtencion(null);
		ticket.setHoraFinAtencion(null);
		ticket.setIdSubgrupo(idSubgrupo);
		ticket.setNumeroIdentificacion(dni);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(ticket.getHoraEmision());
		
		Date tempDate = cal.getTime();
		System.out.println("Fecha actual: " + tempDate);
		
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE) + getSubGrupoById(idSubgrupo).getPriorTiempoAlg2());
		tempDate = cal.getTime();
		System.out.println("Hora modificada: " + tempDate);

		ticket.setFechaHoraProgAlg2Tiempo(cal.getTime());
		
		ticket.setEstado(Constante.ESTADO_INICIO);
		ticket.setSecuenciaAlgo3Proporcion(0);
		ticket.setIdTicketDerivado(0);
		ticket.setNombreSubgrupo(nombre_grupo);
		ticket.setPrefijo(prefijo);
		ticket.setActivaAudioTexto(0);
		ticket.setTipoIdentificacion(tipoDoc);
		ticket.setIdVentanillaDerivacion(0);
		ticket.setVentanillaIdUsuario(0);
		ticket.setTicketSecuencia(0);
		ticket.setEnviaAudio(1);
		ticket.setVentanillaCaja(0);
		ticket.setEvaluacion(0);
		ticket.setDescripcion(persona);
		ticket.setFechaAtencion(date);
		ticketDAO.insertSelective(ticket);
		return ticket;
	}

	@Override
	public Secuencia ultimoTicketRegistrado(int subgrupo, String prefijo, Integer idSucursal) {
		// TODO Auto-generated method stub
		SecuenciaCriteria sc = new SecuenciaCriteria();
		sc.createCriteria()
			.andIdSubgrupoEqualTo(subgrupo)
			.andIdSucursalEqualTo(idSucursal);
		Secuencia secuencia = null;
		List<Secuencia> result = secuenciaDAO.selectByExample(sc);
		if(result!= null && result.size()>0){
			int i = result.size();
			secuencia = result.get(i-1);
		}
		else{
			Secuencia s = new Secuencia();
			s.setCodGrupo(prefijo);
			s.setSecuencia(0);
			s.setIdSubgrupo(subgrupo);
			s.setIdSucursal(idSucursal);
			secuenciaDAO.insertSelective(s);
			secuencia = s;
		}
		return secuencia;
	}
	
	@Override
	public List<Sucursal> listarSucursal(Integer idEmpresa) throws Exception {
	    SucursalCriteria sc = new SucursalCriteria();
	    sc.createCriteria().andEstadoEqualTo(1).andIdEmpresaEqualTo(idEmpresa);
	    List<Sucursal> list = sucursalDAO.selectByExample(sc);
	    
	    for (Sucursal sucursal : list) {
	        sucursal.setNombreAlgoritmo(
	            algoritmoDAO.selectByPrimaryKey(sucursal.getIdTipoAlgoritmo()).getDescripcion()
	        );
	        
	        if (sucursal.getIdUsuario() != 0) {
	            Usuario usuario = usuarioDAO.selectByPrimaryKey(sucursal.getIdUsuario());
	            
	            String nombreCompleto = usuario.getvUsuarioNombres() + " " 
	                                  + usuario.getvUsuarioApPaterno() + " " 
	                                  + usuario.getvUsuarioApMaterno();
	            
	            String username = usuario.getvUsuarioUsername();

	            sucursal.setUsuario(username); 
	            sucursal.setNombreUsuario(nombreCompleto); 
	        } else {
	            sucursal.setUsuario("NO INGRESO");
	            sucursal.setNombreUsuario("NO INGRESO");
	        }
	    }
	    return list;
	}
	
	public Sucursal saveSucursal(Integer idEmpresa, String nombre, String ruc,
			String telef, String direccion) throws Exception {
		// TODO Auto-generated method stub
		
		SucursalCriteria sc = new SucursalCriteria();
		sc.createCriteria().andNombreEqualTo(nombre);
		List<Sucursal> list = sucursalDAO.selectByExample(sc);
		
		if( list.size() == 0){
			Sucursal sucursal = new Sucursal();
			sucursal.setIdEmpresa(idEmpresa);
			sucursal.setNombre(nombre);
			sucursal.setUrl("");
			sucursal.setRuc(ruc);
			sucursal.setTelefono(telef);
			sucursal.setDireccion(direccion);
			sucursal.setIdTipoAlgoritmo(1);
			sucursal.setIdEvalua(0);
			sucursal.setLogoTicket("");
			sucursal.setEstado(1);
			sucursal.setIdUsuario(0);
			sucursal.setAdmIdUsuario(0);
			sucursal.setEncuesta(0);
			sucursalDAO.insertSelective(sucursal);
			
			return sucursal;
		} else{
			System.out.println("Esta sucursal ya existe");
			throw new GenericExcepcion("Ya existe una sucursal con este nombre");
		}
	}
	
	@Override
	public Sucursal getSucursalById(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		Sucursal sucursal= new Sucursal();
		sucursal = sucursalDAO.selectByPrimaryKey(idSucursal);
		return sucursal;
	}

	@Override
	public Sucursal editSucursal(Integer idSucursal, Integer idEmpresa, String nombreEdit, String rucEdit,
			String telefEdit, String direccionEdit) throws Exception {

		Sucursal actual = sucursalDAO.selectByPrimaryKey(idSucursal);
		
		if (actual == null) {
			throw new GenericExcepcion("La sucursal no existe.");
		}
		
		actual.setIdEmpresa(idEmpresa);
		actual.setNombre(nombreEdit);
		actual.setRuc(rucEdit);
		actual.setTelefono(telefEdit);
		actual.setDireccion(direccionEdit);
		sucursalDAO.updateByPrimaryKey(actual);
		return actual;
	}
	
	@Override
	@Transactional
	public void disableSucursalAndMaybeUser(Integer idSucursal, int idUsuario) throws Exception {
	    Sucursal s = new Sucursal();
	    s.setId(idSucursal);
	    s.setEstado(0);
	    int rows = sucursalDAO.updateByPrimaryKeySelective(s);
	    if (rows == 0) throw new GenericExcepcion("Sucursal no encontrada.");

	    if (idUsuario > 0) {
	        Usuario u = new Usuario();
	        u.setiUsuarioId(idUsuario);
	        u.setiUsuarioEstado(0);
	        usuarioDAO.updateByPrimaryKeySelective(u);
	    }
	}

	@Override
	@Transactional
	public void enableSucursalAndMaybeUser(Integer idSucursal, int idUsuario) throws Exception {
	    Sucursal s = new Sucursal();
	    s.setId(idSucursal);
	    s.setEstado(1);
	    int rows = sucursalDAO.updateByPrimaryKeySelective(s);
	    if (rows == 0) throw new GenericExcepcion("Sucursal no encontrada.");

	    if (idUsuario > 0) {
	        Usuario u = new Usuario();
	        u.setiUsuarioId(idUsuario);
	        u.setiUsuarioEstado(1);
	        usuarioDAO.updateByPrimaryKeySelective(u);
	    }
	}

	
	@Override
	public List<BeanSucursal> listarSucursalByEmpresa(Integer idEmpresa) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idEmpresa", 4);
		List<BeanSucursal> list = new ArrayList<>();
		list = sucursalDAO.listarSucursalByEmpresa(param);
		
		return list;
	}
	
	@Override
	public Grupo getGrupoById(Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		Grupo grupo= new Grupo();
		grupo = grupoDAO.selectByPrimaryKey(idGrupo);
		return grupo;
	}
	
	@Override
	public List<Grupo> editGrupos(Integer idGrupo,Integer idSucursal, String nombreEdit,
			String prefijoEdit, Integer algEdit, Integer areaEdit,
			String descripCortaEdit, Integer kioskoEntradaEdit,
			Integer kioskoMinimoEdit, String descripLargaEdit,
			String horaInicioEdit, String horaFinEdit) throws Exception {
		// TODO Auto-generated method stub
		DateFormat sdf = new SimpleDateFormat("hh:mm");
		GrupoCriteria gr = new GrupoCriteria();
		gr.createCriteria().andNombreEqualTo(nombreEdit).andPrefijoEqualTo(prefijoEdit).andIdSucursalEqualTo(idSucursal);
		List<Grupo> list = grupoDAO.selectByExample(gr);
		
		if( list.size() == 0 || list.get(0).getId().intValue() == idGrupo){
			Grupo grupo = new Grupo();
			grupo.setId(idGrupo);
			grupo.setIdSucursal(idSucursal);
			grupo.setNombre(nombreEdit);
			grupo.setPrefijo(prefijoEdit);
			grupo.setIdAlgoritmo(algEdit);
			grupo.setIdArea(areaEdit);
			grupo.setDescripcionCorta(descripCortaEdit);
			grupo.setKioskoAlg3Entrada(kioskoEntradaEdit);
			grupo.setKioskoAlg3Minimo(kioskoMinimoEdit);
			grupo.setDescripcionLarga(descripLargaEdit);
			
			Date hInicio = sdf.parse(horaInicioEdit);
			Date hFin = sdf.parse(horaFinEdit);
			grupo.setHoraInicio(hInicio);
			grupo.setHoraFin(hFin);
			grupo.setEstado(1);
			grupoDAO.updateByPrimaryKeySelective(grupo);
			
			GrupoCriteria gc = new GrupoCriteria();
			gc.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Grupo> listgrupo= new ArrayList<>();
			listgrupo = grupoDAO.selectByExample(gc);
			for(int i=0; i<listgrupo.size(); i++){
				listgrupo.get(i).setNombreAlgoritmo(algoritmoDAO.selectByPrimaryKey(listgrupo.get(i).getIdAlgoritmo()).getDescripcion().toString());
			}
			return listgrupo;
		}
		else{
			System.out.println("Este grupo ya existe");
			throw new GenericExcepcion("Ya existe un grupo con este nombre");
		}
		
	}
	
	@Override
	public SubGrupo getSubGrupoById(Integer idSubGrupo) throws Exception {
		// TODO Auto-generated method stub
		SubGrupo subGrupo= new SubGrupo();
		subGrupo = subGrupoDAO.selectByPrimaryKey(idSubGrupo);
		return subGrupo;
	}
	
	@Override
	public List<SubGrupo> editSubGrupos(Integer idGrupo, Integer idSubGrupo,
			String nombreSubGrupoEdit, String prefijoSubGrupoEdit,
			Integer idPrioridadEdit, Integer idSecuenciaEdit,
			String descCortaSubGrupoEdit, String descLargaSubGrupoEdit,
			Integer prioridadAlgoritmo2Edit, Integer prioridadAlgoritmo3Edit,
			Integer idAgrupadorEdit) throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria sg = new SubGrupoCriteria();
		sg.createCriteria().andNombreEqualTo(nombreSubGrupoEdit).andPrefijoEqualTo(prefijoSubGrupoEdit).andIdGrupoEqualTo(idGrupo);
		List<SubGrupo> list = subGrupoDAO.selectByExample(sg);
		
		if( list.size() == 0 || list.get(0).getId().intValue() == idSubGrupo){
			SubGrupo subGrupo = new SubGrupo();
			subGrupo.setId(idSubGrupo);
			subGrupo.setIdGrupo(idGrupo);
			subGrupo.setNombre(nombreSubGrupoEdit);
			subGrupo.setPrefijo(prefijoSubGrupoEdit);
			subGrupo.setIdPrioridad(idPrioridadEdit);
			subGrupo.setSecueciaKiosko(idSecuenciaEdit);
			subGrupo.setDescripcionCorta(descCortaSubGrupoEdit);
			subGrupo.setDescripcion(descLargaSubGrupoEdit);
			subGrupo.setPriorTiempoAlg2(prioridadAlgoritmo2Edit);
			subGrupo.setPriorRatioAlg3(prioridadAlgoritmo3Edit);
			subGrupo.setAgrupador(idAgrupadorEdit);
			subGrupo.setEstado(1);
			subGrupoDAO.updateByPrimaryKeySelective(subGrupo);
			
			SubGrupoCriteria sgc = new SubGrupoCriteria();
			sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
			List<SubGrupo> listsubgrupo = subGrupoDAO.selectByExample(sgc);
			return listsubgrupo;
		}
		else{
			System.out.println("Este subgrupo ya existe");
			throw new GenericExcepcion("Ya existe un subgrupo con este nombre");
		}
	}
	
	
	
	@Override
	public void editEmpresa(Integer idEmpresa, String nombreEdit,
			String urlLogoEdit, String rucEdit, String telefEdit,
			String direccionEdit) throws Exception {
		// TODO Auto-generated method stub
		Empresa empresa = new Empresa();
		empresa.setId(idEmpresa);
		empresa.setNombre(nombreEdit);
		empresa.setUrlLogo(urlLogoEdit);
		empresa.setRuc(rucEdit);
		empresa.setTelefono(telefEdit);
		empresa.setDireccion(direccionEdit);
		empresa.setIdioma("Espa�ol");
		empresa.setEstado(1);
		empresaDAO.updateByPrimaryKeySelective(empresa);
	}
	
	@Override
	public void eliminarEmpresa(Integer idEmpresa) throws Exception {
		// TODO Auto-generated method stub
		empresaDAO.deleteByPrimaryKey(idEmpresa);
	}
	
	@Override
	public void eliminarSucursal(Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		sucursalDAO.deleteByPrimaryKey(idSucursal);
	}
	
	@Override
	public List<SubGrupo> eliminarSubGrupo(Integer idSubGrupo, Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		subGrupoDAO.deleteByPrimaryKey(idSubGrupo);
		
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
		List<SubGrupo> list = subGrupoDAO.selectByExample(sgc);
		return list;
	}
	
	@Override
	public List<Ticket> listarTicket() throws Exception {
		// TODO Auto-generated method stub
		TicketCriteria tk = new TicketCriteria();
		tk.createCriteria();
		List<Ticket> list = ticketDAO.selectByExample(tk);
		return list;
	}
	
	@Override
	public List<RolEquipo> listarRolEquipo(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("idSucursal->>"+idSucursal);
		RolEquipoCriteria rq = new RolEquipoCriteria();
		rq.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<RolEquipo> list = rolEquipoDAO.selectByExample(rq);
		return list;
	}
	
	@Override
	public List<Usuario> saveUsuarioSucursal(Integer idSucursal, String aPaterno,
			String aMaterno, String nombres, String ip, String login,
			String email, Integer idEmpresa) throws Exception {
		// TODO Auto-generated method stub
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andVUsuarioUsernameEqualTo(login).andISucursalEqualTo(idSucursal);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		
		if( list.size() == 0){
			System.out.println("Este usuario no existe");
			AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();		
			String password="123456";
			String newPasswordMD5=aeSimpleMD5.getMD5Spring(password);
			Usuario usuario = new Usuario();
			usuario.setvUsuarioApPaterno(aPaterno);
			usuario.setvUsuarioApMaterno(aMaterno);
			usuario.setvUsuarioNombres(nombres);
			usuario.setvUsuarioUsername(login);
			usuario.setvUsuarioEmail(email);
			usuario.setcUsuarioIp(ip);
			usuario.setiSucursal(idSucursal);
			usuario.setiArea(0);
			usuario.setiEmpresa(idEmpresa);
			usuario.setiRolEquipo(0);
			usuario.setcUsuarioSolicitaIp("1");
			usuario.setvUsuarioPassword(newPasswordMD5);
			
			usuarioDAO.insertSelective(usuario);
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();
			uc.setOrderByClause("I_USUARIO_ID desc");
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			int idUsuario = usuarios.get(0).getiUsuarioId();

			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario);
			usuarioRol.setiUsuarioxrolRolId(6);
			usuarioRolDAO.insertSelective(usuarioRol);
			
			//update sucursal
			Sucursal sc = new Sucursal();
			sc.setId(idSucursal);
			sc.setIdUsuario(idUsuario);
			sucursalDAO.updateByPrimaryKeySelective(sc);
			return usuarios;
		}
		else{
			System.out.println("Este usuario ya existe");
			throw new GenericExcepcion("Ya existe un usuario con este nombre");
		}
	}
	
	@Override
	public List<Usuario> saveUsuarioAdmin(String aPaterno,String aMaterno, String nombres, String login, String email, Integer idEmpresa) throws Exception {
		// TODO Auto-generated method stub
		
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andVUsuarioUsernameEqualTo(login).andIEmpresaEqualTo(idEmpresa);
		List<Usuario> list = usuarioDAO.selectByExample(us);
		
		if( list.size() == 0){
			System.out.println("Este usuario no existe");
			AeSimpleMD5  aeSimpleMD5 = new AeSimpleMD5();		
			String password="123456";
			String newPasswordMD5=aeSimpleMD5.getMD5Spring(password);
			Usuario usuario = new Usuario();
			usuario.setvUsuarioApPaterno(aPaterno);
			usuario.setvUsuarioApMaterno(aMaterno);
			usuario.setvUsuarioNombres(nombres);
			usuario.setvUsuarioUsername(login);
			usuario.setvUsuarioEmail(email);
			usuario.setiArea(0);
			usuario.setiSucursal(0);
			usuario.setiEmpresa(idEmpresa);
			usuario.setiRolEquipo(0);
			usuario.setcUsuarioSolicitaIp("1");
			usuario.setvUsuarioPassword(newPasswordMD5);
			
			usuarioDAO.insertSelective(usuario);
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();
			uc.setOrderByClause("I_USUARIO_ID desc");
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			int idUsuario = usuarios.get(0).getiUsuarioId();
			
			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario);
			usuarioRol.setiUsuarioxrolRolId(1);
			usuarioRolDAO.insertSelective(usuarioRol);

			//update empresa
			Empresa ep = new Empresa();
			ep.setId(idEmpresa);
			ep.setIdUsuario(idUsuario);
			empresaDAO.updateByPrimaryKeySelective(ep);
			
			return usuarios;
		}
		else{
			System.out.println("Este usuario ya existe");
			throw new GenericExcepcion("Ya existe un usuario con este nombre");
		}
	}
	
	@Override
	public List<BeanSucursal> listarSucursalByUsuario(Integer idEmpresa,
			Integer adminIdUsuario) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idEmpresa", idEmpresa);
		param.put("adminIdUsuario", adminIdUsuario);
		List<BeanSucursal> list = new ArrayList<>();
		list = sucursalDAO.listarSucursalByUsuario(param);
		
		return list;
	}
	
	@Override
	public void getGrupoProporcionByIdUsuario(Integer idUsuario)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Empresa> obtenerImagen() {
		// TODO Auto-generated method stub
		EmpresaCriteria ec = new EmpresaCriteria();
		ec.createCriteria().andEstadoEqualTo(1);
		List<Empresa> list = empresaDAO.selectByExample(ec);
		String ruta = list.get(0).getUrlLogo();
		return list;
	}
	

	@Override
	public List<RolEquipo> saveRolEquipo(Integer idSucursal, String rol, String tipoEquipo, Integer algoritmo)
			throws Exception {
		// TODO Auto-generated method stub
		RolEquipoCriteria re = new RolEquipoCriteria();
		re.createCriteria().andNombreEqualTo(rol).andIdSucursalEqualTo(idSucursal);
		List<RolEquipo> list = rolEquipoDAO.selectByExample(re);
		
		if( list.size() == 0){
			RolEquipo rolEquipo = new RolEquipo();
			rolEquipo.setIdSucursal(idSucursal);
			rolEquipo.setNombre(rol);
			rolEquipo.setTipoEquipo(tipoEquipo);
			rolEquipo.setAlgoritmo(algoritmo);
			rolEquipoDAO.insertSelective(rolEquipo);
			
			RolEquipoCriteria rq = new RolEquipoCriteria();
			rq.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<RolEquipo> listrol = rolEquipoDAO.selectByExample(rq);
			return listrol;
		}
		else{
			System.out.println("Este rol ya existe");
			throw new GenericExcepcion("Ya existe un rol con este nombre");
		}
	}

	@Override
	public List<RolEquipoGrupo> agregarGrupoXRol(Integer idRol, Integer idGrupoRol,
			BigDecimal proporcion) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoGrupoCriteria reg = new RolEquipoGrupoCriteria();
		reg.createCriteria().andIdRolEquipoEqualTo(idRol).andIdGrupoEqualTo(idGrupoRol);
		List<RolEquipoGrupo> list = rolEquipoGrupoDAO.selectByExample(reg);
		
		if( list.size() == 0){
			RolEquipoGrupo rolGrupo = new RolEquipoGrupo();
			rolGrupo.setIdRolEquipo(idRol);
			rolGrupo.setIdGrupo(idGrupoRol);
			rolGrupo.setProporcion(proporcion);
			rolEquipoGrupoDAO.insertSelective(rolGrupo);
			
			RolEquipoGrupoCriteria gc = new RolEquipoGrupoCriteria();
			gc.createCriteria().andIdRolEquipoEqualTo(idRol);
			List<RolEquipoGrupo> listrolgrupo = rolEquipoGrupoDAO.selectByExample(gc);		
			for (int i=0; i<listrolgrupo.size();i++){
				listrolgrupo.get(i).setNombreGrupo(grupoDAO.selectByPrimaryKey(listrolgrupo.get(i).getIdGrupo()).getNombre().toString());
				listrolgrupo.get(i).setPrefijoGrupo(grupoDAO.selectByPrimaryKey(listrolgrupo.get(i).getIdGrupo()).getPrefijo().toString());
			}
			return listrolgrupo;
		}
		else{
			System.out.println("Este grupo ya esta agregado");
			throw new GenericExcepcion("Ya esta agregado un grupo con este nombre");
		}
	}

	
	@Override
	public List<RolEquipoGrupo> listarGruposXRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		Date fActual = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		RolEquipoGrupoCriteria gc = new RolEquipoGrupoCriteria();
		gc.createCriteria().andIdRolEquipoEqualTo(idRol);
		List<RolEquipoGrupo> list = rolEquipoGrupoDAO.selectByExample(gc);
		for (int i=0; i<list.size();i++){
			list.get(i).setNombreGrupo(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getNombre().toString());
			list.get(i).setPrefijoGrupo(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getPrefijo().toString());
			list.get(i).setHoraInicio(sdf.format(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getHoraInicio()).toString());
			list.get(i).setHoraFin(sdf.format(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getHoraFin()).toString());
		}
	
		return list;
	}
	
	@Override
	public List<BeanGrupoXTiempo> listarGruposXTiempo(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRol);
		System.out.println("idRol: "+idRol);
		List<BeanGrupoXTiempo> list = new ArrayList<>();
		list = rolEquipoGrupoDAO.listarGruposByTiempo(param);
		return list;

	}


	@Override
	public List<Usuario> grabarUsuarioKiosko(Integer idSucursal, Integer iSolicitaIp, String vIp, 
			Integer iTipoValidaDoc, Integer iPideDocumento, Integer iImprimeTicket, Integer 
			idRolEquipo, Integer idEmpresa, Integer iConfirmaImpresion, Integer idUsuario) throws Exception {  
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setcUsuarioIp(vIp);
			usuario.setiSucursal(idSucursal);
			usuario.setiArea(0);
			usuario.setiEmpresa(idEmpresa);
			usuario.setiConfirmaImpresion(iConfirmaImpresion);
			usuario.setcUsuarioSolicitaIp(iSolicitaIp.toString());
			usuario.setiValidaDocumento(iTipoValidaDoc);
			usuario.setiPideDocumento(iPideDocumento);
			usuario.setiImprimeTicket(iImprimeTicket);
			usuario.setiRolEquipo(idRolEquipo);			
			usuarioDAO.updateByPrimaryKeySelective(usuario);
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();
			uc.setOrderByClause("I_USUARIO_ID desc");
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			
			int idUsuario1 = usuarios.get(0).getiUsuarioId();
			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario1);
			usuarioRol.setiUsuarioxrolRolId(3);
			usuarioRolDAO.insertSelective(usuarioRol);

			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRolEquipo);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}

	@Override
	public List<Ventanilla> getVentanillasByIdSucursal(
			Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		VentanillaCriteria vc = new VentanillaCriteria();
		vc.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Ventanilla> list = new ArrayList<>();
		list = ventanillaDAO.selectByExample(vc);
		for (int i=0;i<list.size();i++){
			list.get(i).setNombreArea(areaDAO.selectByPrimaryKey(list.get(i).getIdArea()).getDescripcion().toString());
		}
		return list;
	}

	@Override
	public List<Ventanilla> getVentanillasByIdSucursalRolEquipo( Integer idSucursal, Integer IdRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("el rol es:"+IdRolEquipo);
		System.out.println("sucuersal es:"+idSucursal);
		UsuarioCriteria us = new UsuarioCriteria();
		us.createCriteria().andIRolEquipoEqualTo(IdRolEquipo).andISucursalEqualTo(idSucursal);
		List<Usuario> listu = usuarioDAO.selectByExample(us);
		List<Ventanilla> listventanillaAll = new ArrayList<>();	
		for (int i=0;i<listu.size();i++)
		{
			VentanillaCriteria vc = new VentanillaCriteria();
			vc.createCriteria().andIdEqualTo(listu.get(i).getiVentanilla());
			List<Ventanilla> list = new ArrayList<>();	
			list = ventanillaDAO.selectByExample(vc);
			listventanillaAll.addAll(list);
		}
		for (int i=0;i<listventanillaAll.size();i++){
			listventanillaAll.get(i).setNombreArea(areaDAO.selectByPrimaryKey(listventanillaAll.get(i).getIdArea()).getDescripcion().toString());
		}
		return listventanillaAll;
	}
	
	@Override
	public List<Ventanilla> saveVentanilla(String nombreVentanilla,
			String ubicacionVentanilla, Integer idArea, Integer idSucursal,
			String descripcionVentanilla, Integer iEvalua, String puerto, Integer notifica) throws Exception {
		// TODO Auto-generated method stub
		
		VentanillaCriteria ve = new VentanillaCriteria();
		ve.createCriteria().andNombreEqualTo(nombreVentanilla).andIdAreaEqualTo(idArea);
		List<Ventanilla> list = ventanillaDAO.selectByExample(ve);
		
		if( list.size() == 0){
			Ventanilla ventanilla = new Ventanilla();
			ventanilla.setNombre(nombreVentanilla);
			ventanilla.setUbicacion(ubicacionVentanilla);
			ventanilla.setDescripcion(descripcionVentanilla);
			ventanilla.setIdArea(idArea);
			ventanilla.setIdSucursal(idSucursal);
			ventanilla.setTipoEvaluacion(iEvalua);
			ventanilla.setPuerto(puerto);
			ventanilla.setNotificacionId(notifica);
			ventanillaDAO.insertSelective(ventanilla);
			
			VentanillaCriteria vc = new VentanillaCriteria();
			vc.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Ventanilla> listvent = new ArrayList<>();
			listvent = ventanillaDAO.selectByExample(vc);
			for (int i=0;i<listvent.size();i++){
				listvent.get(i).setNombreArea(areaDAO.selectByPrimaryKey(listvent.get(i).getIdArea()).getDescripcion().toString());
			}
			return listvent;
		}
		else{
			System.out.println("Esta ventanilla ya existe");
			throw new GenericExcepcion("Ya existe una ventanilla con este nombre");
		}
		
	}

	@Override
	public List<BeanTicketXArea> listarAtencionesXArea(Integer idSucursal, Integer idArea, 	Integer idVentanilla, Integer idGrupo, String fechaInicio, String fechaFin) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		param.put("idVentanilla", idVentanilla);
		param.put("idGrupo", idGrupo);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXArea> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXArea(param);
		return list;
	}

	@Override
	public List<BeanTicketXAlgoritmo> listarAtencionesXAlgoritmo(Integer idSucursal, Integer idArea,
			Integer idAlgoritmo, String fechaInicio, String fechaFin) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		System.out.println("idArea: "+idArea);
		param.put("idAlgoritmo", idAlgoritmo);
		System.out.println("idAlg: "+idAlgoritmo);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXAlgoritmo> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXAlgoritmo(param);
		return list;
	}
	
	@Override
	public List<BeanTicketXAlgoritmo> listaratencionestotalxalgoritmo(Integer idSucursal, Integer idArea,
			Integer idAlgoritmo, String fechaInicio, String fechaFin) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		System.out.println("idArea: "+idArea);
		param.put("idAlgoritmo", idAlgoritmo); 
		System.out.println("idAlg: "+idAlgoritmo);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXAlgoritmo> list = new ArrayList<>();
		list = ticketDAO.listaratencionestotalxalgoritmo(param);
		return list;
	}
	

	@Override
	public List<BeanTicketXUsuario> listarAtencionesXUsuario(Integer idSucursal, Integer idArea,
			Integer idUsuario, String fechaInicio,
			String fechaFin) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		param.put("idUsuario", idUsuario);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXUsuario> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXUsuario(param);
		return list;
	}
	
	@Override
	public List<BeanTicketXGrupo> listarAtencionesXGrupo(Integer idSucursal, Integer idArea,
			Integer idGrupo, String fechaInicio, String fechaFin) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		param.put("idGrupo", idGrupo);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXGrupo> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXGrupo(param);
		return list;
	}
	
	@Override
	public String getTextoPublicidad(Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		PublicidadCriteria pb = new PublicidadCriteria();
		pb.createCriteria().andIdSucursalEqualTo(idSucursal).andTipoPublicidadEqualTo("1");
		List<Publicidad> list = publicidadDAO.selectByExample(pb);
		return list.get(0).getPubTexto();
	}

	@Override
	public List<Publicidad> getAllPublicityText(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		PublicidadCriteria pb = new PublicidadCriteria();
		pb.createCriteria()
			.andIdSucursalEqualTo(idSucursal)
			.andTipoPublicidadEqualTo("1");
		pb.setOrderByClause("secuencia_texto asc");
		List<Publicidad> list = new ArrayList<>();
		list = publicidadDAO.selectByExample(pb);
		return list;
	}
	
	@Override
	public Publicidad savePublicityText(Integer idSucursal, String texto, Integer secuencia) throws Exception {
		// TODO Auto-generated method stub
		Date date = new Date();
		Publicidad pub = new Publicidad();
		pub.setIdSucursal(idSucursal);
		pub.setTipoPublicidad("1");
		pub.setFechaInicio(date);
		pub.setFechaFin(date);
		pub.setPubTexto(texto);
		pub.setSecuenciaTexto(secuencia);
		pub.setEstado(1);
		publicidadDAO.insertSelective(pub);
		return pub;
	}
	
	@Override
	public Publicidad getPublicidadById(Integer idPublicidad) throws Exception {
		return publicidadDAO.selectByPrimaryKey(idPublicidad);
	}
	
	@Override
	public Publicidad editPublicityText(Integer idSucursal, Integer idPublicidad, String textoEdit, Integer secuenciaEdit) throws Exception {
		// TODO Auto-generated method stub
		Publicidad publicity = new Publicidad();
		publicity.setIdSucursal(idSucursal);
		publicity.setId(idPublicidad);
		publicity.setPubTexto(textoEdit);
		publicity.setSecuenciaTexto(secuenciaEdit);
		publicidadDAO.updateByPrimaryKeySelective(publicity);
		return publicity;
	}
	
	@Override
	public Publicidad deletePublicity(Integer idPublicidad) throws Exception {
		Publicidad publicity = publicidadDAO.selectByPrimaryKey(idPublicidad);
	    
	    if (publicity != null) {
	        int rowsAffected = publicidadDAO.deleteByPrimaryKey(idPublicidad);

	        if (rowsAffected <= 0) {
	            return null; 
	        }
	    }

	    return publicity;
	}
	
	@Override
	public List<Publicidad> getAllPublicityVideo(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		PublicidadCriteria pb = new PublicidadCriteria();
		pb.createCriteria()
			.andIdSucursalEqualTo(idSucursal)
			.andTipoPublicidadEqualTo("2");
		pb.setOrderByClause("secuencia_video asc");
		List<Publicidad> list = new ArrayList<>();
		list = publicidadDAO.selectByExample(pb);
		return list;
	}
	
	@Override
	public Publicidad savePublicityVideo(Integer idSucursal, String fileName, Integer secuencia) throws Exception {
		Date date = new Date();
		String urlVideo = "/videos/" + idSucursal + "_" + fileName;
		Publicidad publicity = new Publicidad();
		publicity.setIdSucursal(idSucursal);
		publicity.setTipoPublicidad("2");
		publicity.setFechaInicio(date);
		publicity.setFechaFin(date);
		publicity.setEstado(1);
		publicity.setUrlVideo(urlVideo);
		publicity.setSecuenciaVideo(secuencia);
		publicidadDAO.insertSelective(publicity);
		return publicity;
	}
	
	private String generateVideoUrl(Integer idSucursal, String fileName) throws Exception {
	    String filePrefix = idSucursal + "_" + fileName;

	    Integer isPublicIpActive = ticketService.parametroNumero("043").intValue();
	    Integer isLocalDirectoryActive = ticketService.parametroNumero("045").intValue();

	    if (isPublicIpActive == 1) {
	        String publicIp = seguridadService.getPublicIpAddressAndPort();
	        return "http://" + publicIp + "/videos/" + filePrefix;
	    } else if (isLocalDirectoryActive == 1) {
	        String localDirectory = ticketService.parametroDescripcion("045");
	        return localDirectory + filePrefix;
	    } else {
	        String localIp = seguridadService.getIpAddressAndPort();
	        return "http://" + localIp + "/videos/" + filePrefix;
	    }
	}
	
	@Override
	public Publicidad editPublicityVideo(Integer idSucursal, Integer idPublicidad, String fileName, Integer secuenciaEdit) throws Exception {
		String urlVideo = generateVideoUrl(idSucursal, fileName);
		Publicidad publicity = new Publicidad();
		publicity.setIdSucursal(idSucursal);
		publicity.setId(idPublicidad);
		publicity.setUrlVideo(urlVideo);
		publicity.setSecuenciaVideo(secuenciaEdit);
		publicidadDAO.updateByPrimaryKeySelective(publicity);
		return publicity;
	}

	@Override
	public List<Usuario> grabarUsuarioVentanilla(Integer idSucursal, Integer idUsuario,
			Integer iVentanilla, String vIp, Integer iArea, Integer iControlAsistencia, Integer iEvalua,
			Integer iAnula, String puerto, Integer idRolEquipo, Integer idEmpresa) throws Exception { //String aPaterno, String aMaterno, String vNombre, Integer vDNI, String vLogin,
		// TODO Auto-generated method stub
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setcUsuarioIp(vIp);
			usuario.setiSucursal(idSucursal);
			usuario.setiArea(iArea);
			usuario.setiEmpresa(idEmpresa);
			usuario.setiControlAsistencia(iControlAsistencia);
			usuario.setiEvalua(iEvalua);
			usuario.setiAnula(iAnula);
			usuario.setvPuerto(puerto);
			usuario.setiVentanilla(iVentanilla);
			usuario.setiRolEquipo(idRolEquipo);
			usuarioDAO.updateByPrimaryKeySelective(usuario);
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();
			uc.setOrderByClause("I_USUARIO_ID desc");
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			int idUsuario1 = usuarios.get(0).getiUsuarioId();					
			System.out.println();
			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario1);
			usuarioRol.setiUsuarioxrolRolId(5);
			usuarioRolDAO.insertSelective(usuarioRol);
			//update sucursal			
			
			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRolEquipo);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}

	@Override
	public List<Agrupador> listarAgrupadores() throws Exception {
		// TODO Auto-generated method stub
		AgrupadorCriteria ac = new AgrupadorCriteria();
		ac.createCriteria().andEstadoEqualTo(1);
		List<Agrupador> list = new ArrayList<>();
		list = agrupadorDAO.selectByExample(ac);
		return list;
	}
	
	@Override
	public Ventanilla getVentanillaById(Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		Ventanilla ventanilla = new Ventanilla();
		ventanilla = ventanillaDAO.selectByPrimaryKey(idVentanilla);
		return ventanilla;
	}
	
	@Override
	public List<Ventanilla> editVentanilla(Integer idVentanilla, String nombreVentanillaEdit,
			String ubicacionVentanillaEdit, Integer idAreaEdit, Integer idSucursal,
			String descripcionVentanillaEdit, Integer iEvaluaEdit, String puertoEdit, Integer notificaEdit) throws Exception {
		// TODO Auto-generated method stub
		VentanillaCriteria ve = new VentanillaCriteria();
		ve.createCriteria().andNombreEqualTo(nombreVentanillaEdit).andIdAreaEqualTo(idAreaEdit);
		List<Ventanilla> list = ventanillaDAO.selectByExample(ve);
		
		if( list.size() == 0 || list.get(0).getId().intValue() == idVentanilla){
			Ventanilla ventanilla = new Ventanilla();
			ventanilla.setId(idVentanilla);
			ventanilla.setNombre(nombreVentanillaEdit);
			ventanilla.setUbicacion(ubicacionVentanillaEdit);
			ventanilla.setDescripcion(descripcionVentanillaEdit);
			ventanilla.setIdArea(idAreaEdit);
			ventanilla.setTipoEvaluacion(iEvaluaEdit);
			ventanilla.setPuerto(puertoEdit);
			ventanilla.setNotificacionId(notificaEdit);
			
			ventanillaDAO.updateByPrimaryKeySelective(ventanilla);
			
			VentanillaCriteria vc = new VentanillaCriteria();
			vc.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Ventanilla> listvent = new ArrayList<>();
			listvent = ventanillaDAO.selectByExample(vc);
			for (int i=0;i<listvent.size();i++){
				listvent.get(i).setNombreArea(areaDAO.selectByPrimaryKey(listvent.get(i).getIdArea()).getDescripcion().toString());
			}
			return listvent;
		}
		else{
			System.out.println("Esta ventanilla ya existe");
			throw new GenericExcepcion("Ya existe una ventanilla con este nombre");
		}
	}

	@Override
	public List<Area> listarArea(Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		AreaCriteria ar = new AreaCriteria();
		ar.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Area> list = new ArrayList<>();
		list = areaDAO.selectByExample(ar);
		return list;
	}
	
	@Override
	public List<Area> saveArea(Integer idSucursal, String nombreArea) throws Exception {
		// TODO Auto-generated method stub
		
		AreaCriteria ar = new AreaCriteria();
		ar.createCriteria().andDescripcionEqualTo(nombreArea).andIdSucursalEqualTo(idSucursal);
		List<Area> list = areaDAO.selectByExample(ar);
		
		if( list.size() == 0){
			Area area = new Area();
			area.setIdSucursal(idSucursal);
			area.setDescripcion(nombreArea);
			areaDAO.insertSelective(area);
			
			AreaCriteria ar1 = new AreaCriteria();
			ar1.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Area> listarea = new ArrayList<>();
			listarea = areaDAO.selectByExample(ar1);
			return listarea;
		}
		else{
			System.out.println("Este area ya existe");
			throw new GenericExcepcion("Ya existe un area con este nombre");
		}
	}
	
	@Override
	public Area getAreaById(Integer idArea) throws Exception {
		// TODO Auto-generated method stub
		Area area = new Area();
		area = areaDAO.selectByPrimaryKey(idArea);
		return area;
	}
	
	@Override
	public List<Area> editArea(Integer idSucursal, Integer idArea,
			String nombreAreaEdit) throws Exception {
		// TODO Auto-generated method stub
		AreaCriteria ar = new AreaCriteria();
		ar.createCriteria().andDescripcionEqualTo(nombreAreaEdit).andIdSucursalEqualTo(idSucursal);
		List<Area> list = areaDAO.selectByExample(ar);
		
		if(list.size() == 0){			
			Area area = new Area();
			area.setIdSucursal(idSucursal);
			area.setId(idArea);
			area.setDescripcion(nombreAreaEdit);
			areaDAO.updateByPrimaryKeySelective(area);
			
			AreaCriteria ar1 = new AreaCriteria();
			ar1.createCriteria().andIdSucursalEqualTo(idSucursal);
			List<Area> listarea = new ArrayList<>();
			listarea = areaDAO.selectByExample(ar1);
			return listarea;
		}
		else{
			System.out.println("Este area ya existe");
			throw new GenericExcepcion("Ya existe un area con este nombre");
		}
	}

	
	@Override
	public Grupo getGrupoByPrefijo(String prefijo, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		
		GrupoCriteria gr = new GrupoCriteria();
		gr.createCriteria().andPrefijoEqualTo(prefijo).andIdSucursalEqualTo(idSucursal);
		List<Grupo> list = grupoDAO.selectByExample(gr);
		Grupo grupo= list.get(0);
		return grupo;
	}
	
	@Override
	public List<Grupo> eliminarGrupo(Integer idGrupo, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		grupoDAO.deleteByPrimaryKey(idGrupo);
		
		RolEquipoGrupoCriteria reg = new RolEquipoGrupoCriteria();
		reg.createCriteria().andIdGrupoEqualTo(idGrupo);
		rolEquipoGrupoDAO.deleteByExample(reg);
		
		SubGrupoCriteria sg = new SubGrupoCriteria();
		sg.createCriteria().andIdGrupoEqualTo(idGrupo);
		subGrupoDAO.deleteByExample(sg);
		
		GrupoCriteria gc = new GrupoCriteria();
		gc.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Grupo> list= new ArrayList<>();
		list = grupoDAO.selectByExample(gc);
		for(int i=0; i<list.size(); i++){
			list.get(i).setNombreAlgoritmo(algoritmoDAO.selectByPrimaryKey(list.get(i).getIdAlgoritmo()).getDescripcion().toString());
		}
		return list;
	}
	
	@Override
	public List<Ventanilla> eliminarVentanilla(Integer idVentanilla, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		ventanillaDAO.deleteByPrimaryKey(idVentanilla);
		
		VentanillaCriteria vc = new VentanillaCriteria();
		vc.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Ventanilla> list = new ArrayList<>();
		list = ventanillaDAO.selectByExample(vc);
		for (int i=0;i<list.size();i++){
			list.get(i).setNombreArea(areaDAO.selectByPrimaryKey(list.get(i).getIdArea()).getDescripcion().toString());
		}
		return list;
	}
	
	@Override
	public RolEquipo getRolById(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		RolEquipo rol= new RolEquipo();
		rol = rolEquipoDAO.selectByPrimaryKey(idRol);
		return rol;
	}

	@Override
	public List<RolEquipoGrupo> eliminarGrupoXRol(Integer idRol, Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoGrupoCriteria reg = new RolEquipoGrupoCriteria();
		reg.createCriteria().andIdGrupoEqualTo(idGrupo).andIdRolEquipoEqualTo(idRol);
		rolEquipoGrupoDAO.deleteByExample(reg);
		
		RolEquipoGrupoCriteria gc = new RolEquipoGrupoCriteria();
		gc.createCriteria().andIdRolEquipoEqualTo(idRol);
		List<RolEquipoGrupo> list = rolEquipoGrupoDAO.selectByExample(gc);		
		for (int i=0; i<list.size();i++){
			list.get(i).setNombreGrupo(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getNombre().toString());
			list.get(i).setPrefijoGrupo(grupoDAO.selectByPrimaryKey(list.get(i).getIdGrupo()).getPrefijo().toString());
		}
		return list;
	}
	
		
	@Override
	public List<RolEquipo> eliminarRolEquipo(Integer idRol, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		rolEquipoDAO.deleteByPrimaryKey(idRol);
		
		RolEquipoGrupoCriteria reg = new RolEquipoGrupoCriteria();
		reg.createCriteria().andIdRolEquipoEqualTo(idRol);
		rolEquipoGrupoDAO.deleteByExample(reg);

		RolEquipoCriteria rq = new RolEquipoCriteria();
		rq.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<RolEquipo> listrol = rolEquipoDAO.selectByExample(rq);
		return listrol;
		
	}
	
	@Override
	public List<Publicidad> listarVideos(Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		PublicidadCriteria pb = new PublicidadCriteria();
		pb.createCriteria().andIdSucursalEqualTo(idSucursal).andTipoPublicidadBetween("2","3");
		pb.setOrderByClause("secuencia_video asc");
		List<Publicidad> list = new ArrayList<>();
		list = publicidadDAO.selectByExample(pb);
		return list;
	}

	@Override
	public Ticket generarTicketAtencion4(Integer idSubgrupo, String prefijo,
			String nombre, String dni, Integer tipoDoc, String persona, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		Secuencia sec = new Secuencia();
		sec = this.ultimoTicketRegistrado(idSubgrupo, prefijo, idSucursal);
		int secuenciador = sec.getSecuencia();
		int valor = secuenciador+1;
		Date fechaMod = new Date();
		Secuencia secuencia = new Secuencia();
		secuencia.setSecuencia(valor);
		secuencia.setCodGrupo(prefijo);
		secuencia.setIdSubgrupo(idSubgrupo);
		secuenciaDAO.insertSelective(secuencia);
		System.out.println("prefijo: "+prefijo);
		String codigo = prefijo+valor;
		
		System.out.println("valor: "+valor);
		
	    Date date = new Date();

		Ticket ticket = new Ticket();
		ticket.setCodigo(codigo);
		ticket.setHoraEmision(date);
		ticket.setHoraInicioAtencion(null);
		ticket.setHoraFinAtencion(null);
		ticket.setIdSubgrupo(idSubgrupo);
		ticket.setNumeroIdentificacion(dni);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(ticket.getHoraEmision());
		
		Date tempDate = cal.getTime();
		System.out.println("Fecha actual: " + tempDate);
		
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE) + getSubGrupoById(idSubgrupo).getPriorTiempoAlg2());
		tempDate = cal.getTime();
		System.out.println("Hora modificada: " + tempDate);

		ticket.setFechaHoraProgAlg2Tiempo(cal.getTime());
		
		ticket.setEstado(Constante.ESTADO_INICIO);
		ticket.setSecuenciaAlgo3Proporcion(0);
		ticket.setIdTicketDerivado(0);
		ticket.setNombreSubgrupo(nombre);
		ticket.setPrefijo(prefijo);
		ticket.setActivaAudioTexto(0);
		ticket.setTipoIdentificacion(tipoDoc);
		ticket.setIdVentanillaDerivacion(0);
		ticket.setVentanillaIdUsuario(0);
		ticket.setTicketSecuencia(0);
		ticket.setEnviaAudio(1);
		ticket.setVentanillaCaja(0);
		ticket.setEvaluacion(0);
		ticket.setFechaAtencion(date);
		ticket.setDescripcion(persona);
		ticketDAO.insertSelective(ticket);
		return ticket;
	}

	@Override
	public List<BeanTicketXMesUsuario> listarAtencionesXMesUsuario( Integer idSucursal, Integer idArea,
			Integer idUsuario, String fechaInicio,
			String fechaFin) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		param.put("idUsuario", idUsuario);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXMesUsuario> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXMesUsuario(param);
		return list;
	}
	
	
	@Override
	public List<BeanTicketXMesGrupo> listarAtencionesXMesGrupo(Integer idSucursal, Integer idArea,
			Integer idGrupo, String fechaInicio, String fechaFin) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);		
		param.put("idArea", idArea);
		param.put("idGrupo", idGrupo);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanTicketXMesGrupo> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXMesGrupo(param);
		return list;
	}
	
	@Override
	public List<BeanTicketXArea> listarAtencionesxDni(Integer idSucursal, String fechaInicio, String fechaFin, Integer idArea, String identificacion) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		param.put("idArea", idArea);
		param.put("identificacion", identificacion);
		List<BeanTicketXArea> list = new ArrayList<>();
		list = ticketDAO.listarAtencionesXDni(param);
		return list;
	}

	
	@Override
	public void actualizarVentanilla(Integer idUsuario, Integer idSucursal,
			Integer idArea, Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		Usuario usuario = new Usuario();
		usuario.setiUsuarioId(idUsuario);
		usuario.setiSucursal(idSucursal);
		usuario.setiArea(idArea);
		usuario.setiVentanilla(idVentanilla);
		usuarioDAO.updateByPrimaryKeySelective(usuario);
	}
	
	@Override
	public void saveAsistencia(Integer idUsuario) throws Exception {
		closeAsistenciasAbiertas(idUsuario);
		Date now = new Date();
		java.sql.Date hoy = new java.sql.Date(System.currentTimeMillis());
		
		Asistencia asist = new Asistencia();
		asist.setIdUsuario(idUsuario);
		asist.setFecha(hoy);
		asist.setHoraIngreso(now);
		asist.setEstado(1);
		asistenciaDAO.insertSelective(asist);
		System.out.println("Entrada registrada para usuario " + idUsuario);
	}
	
	@Override
	public void closeAsistenciasAbiertas(Integer idUsuario) throws Exception {
		Date now = new Date();
		java.sql.Date hoy = new java.sql.Date(System.currentTimeMillis());
		
		AsistenciaCriteria asistencia = new AsistenciaCriteria();
		asistencia.createCriteria()
					.andIdUsuarioEqualTo(idUsuario)
					.andFechaEqualTo(hoy)
					.andEstadoEqualTo(1)
					.andHoraSalidaIsNull();
		
		List<Asistencia> abiertas = asistenciaDAO.selectByExample(asistencia);
		
		for (Asistencia asist : abiertas) {
			asist.setHoraSalida(now);
			asist.setEstado(0);
			asistenciaDAO.updateByPrimaryKeySelective(asist);
		}
	}
	
	@Override
	public void closeAsistencia(Integer idUsuario) throws Exception {
		Date now = new Date();
		java.sql.Date hoy = new java.sql.Date(System.currentTimeMillis());
		
		AsistenciaCriteria ac = new AsistenciaCriteria();
		ac.createCriteria()
			.andIdUsuarioEqualTo(idUsuario)
			.andFechaEqualTo(hoy)
			.andEstadoEqualTo(1);
		List<Asistencia> regs = asistenciaDAO.selectByExample(ac);
		
		if (!regs.isEmpty()) {
			Asistencia asist = regs.get(0);
			asist.setHoraSalida(now);
			asist.setEstado(0);
			asistenciaDAO.updateByPrimaryKeySelective(asist);
			System.out.println("Salida registrada para usuario " + idUsuario);
		}
	}
	
	@Override
	public List<SubGrupo> listarSubgruposXGrupo(Integer idGrupoRol) throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria gc = new SubGrupoCriteria();
		gc.createCriteria().andIdGrupoEqualTo(idGrupoRol);
		gc.setOrderByClause("NOMBRE ASC");
		List<SubGrupo> list= new ArrayList<>();
		list = subGrupoDAO.listarSubgrupoXOpcion(gc);
		return list;
	}
	
	@Override
	public List<Dni> getPersonabydni(String numeroDocumento) throws Exception {
		DniCriteria dc = new DniCriteria();
		dc.createCriteria().andDniEqualTo(numeroDocumento);
		List<Dni> list = new ArrayList<>();
		list = dniDAO.selectByExample(dc);
		return list;
	}	
	
	@Override
	public List<SubGrupo> listarSubGruposXSede(Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria gc = new SubGrupoCriteria();
		gc.createCriteria().andIdGrupoEqualTo(idGrupo);
		gc.setOrderByClause("NOMBRE ASC");
		List<SubGrupo> list= new ArrayList<>();
		list = subGrupoDAO.selectByExample(gc);
		return list;
	}	
	
	@Override
	public List<BeanReporteAsistencia> listarReporteAsistencia(Map<String,Object> params) {
		return asistenciaDAO.listarReporteAsistencia(params);
	}
	
	@Override
	public List<BeanReporteAsistencia> listarDetalleReporte(Integer idUsuario, String fecha) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		param.put("fecha", fecha);
		List<BeanReporteAsistencia> list = new ArrayList<>();
		list = asistenciaDAO.listarDetalleReporte(param);
		return list;
	}
	
	@Override
	public List<BeanRolEquipoSubGrupo> listarSubGruposXRol(Integer idRolEquipo) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		
		List<BeanRolEquipoSubGrupo> list = new ArrayList<>();
		list = rolEquipoSubGrupoDAO.listarSubGrupoXRol(param);
		return list;
	}
	

	@Override
	public List<BeanRolEquipoSubGrupo> agregarSubGrupoXRol(Integer idRol, Integer idSubGrupo, BigDecimal proporcionSG) throws Exception {
		// TODO Auto-generated method stub
			RolEquipoSubGrupoCriteria reg = new RolEquipoSubGrupoCriteria();
			reg.createCriteria().andIdRolEquipoEqualTo(idRol).andIdSubgrupoEqualTo(idSubGrupo);
			List<RolEquipoSubGrupo> list = rolEquipoSubGrupoDAO.selectByExample(reg);
			
			if( list.size() == 0){
				RolEquipoSubGrupo SubGrupo = new RolEquipoSubGrupo();
				SubGrupo.setIdRolEquipo(idRol);
				SubGrupo.setIdSubgrupo(idSubGrupo);
				SubGrupo.setProporcion(proporcionSG);
				rolEquipoSubGrupoDAO.insertSelective(SubGrupo);
				
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("idRolEquipo", idRol);
				List<BeanRolEquipoSubGrupo> listrolsubgrupo = new ArrayList<>();
				listrolsubgrupo = rolEquipoSubGrupoDAO.listarSubGrupoXRol(param);
				return listrolsubgrupo;
			}
			else{
				System.out.println("Este subgrupo ya esta agregado");
				throw new GenericExcepcion("Ya esta agregado un subgrupo con este nombre");
			}
	}
	
	@Override
	public List<BeanRolEquipoSubGrupo> eliminarSubGrupoXRol(Integer idRolEquipoSubGrupo, Integer idSubGrupo, Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoSubGrupoCriteria reg = new RolEquipoSubGrupoCriteria();
		reg.createCriteria().andIdEqualTo(idRolEquipoSubGrupo).andIdSubgrupoEqualTo(idSubGrupo);
		rolEquipoSubGrupoDAO.deleteByExample(reg);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRol);
		List<BeanRolEquipoSubGrupo> listrolsubgrupo = new ArrayList<>();
		listrolsubgrupo = rolEquipoSubGrupoDAO.listarSubGrupoXRol(param);
		return listrolsubgrupo;
	}
	
	@Override
	public List<RolEquipo> editRolEquipo(Integer idSucursal, Integer idRol, String rolEdit, String tipoEquipoEdit, Integer algoritmoEdit)
			throws Exception {
		// TODO Auto-generated method stub
		RolEquipoCriteria dupCheck = new RolEquipoCriteria();
		dupCheck .createCriteria()
			.andNombreEqualTo(rolEdit)
			.andIdSucursalEqualTo(idSucursal)
			.andIdNotEqualTo(idRol);
		List<RolEquipo> dups = rolEquipoDAO.selectByExample(dupCheck);
		
		if (!dups.isEmpty()) {
	        throw new GenericExcepcion("Ya existe un rol con este nombre");
	    }
		
		RolEquipo rolEquipo = new RolEquipo();
		rolEquipo.setId(idRol);
		rolEquipo.setIdSucursal(idSucursal);
		rolEquipo.setNombre(rolEdit);
		rolEquipo.setTipoEquipo(tipoEquipoEdit);
		rolEquipo.setAlgoritmo(algoritmoEdit);
		rolEquipoDAO.updateByPrimaryKeySelective(rolEquipo);
		
		RolEquipoCriteria allInSucursal = new RolEquipoCriteria();
	    allInSucursal.createCriteria().andIdSucursalEqualTo(idSucursal);
	    return rolEquipoDAO.selectByExample(allInSucursal);
	}
	
	@Override
	public List<Usuario> grabarUsuarioMonitor(Integer idSucursal, Integer iSolicitaIp, String vIp, Integer iTipoMonitor,
			Integer idRolEquipo, Integer idEmpresa, Integer iAreaMonitor, Integer usuarioPrincipal, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
			System.out.println("Este usuario no existe");
			Usuario usuario = new Usuario();
			usuario.setiUsuarioId(idUsuario);
			usuario.setcUsuarioIp(vIp);
			usuario.setiSucursal(idSucursal);
			usuario.setiArea(iAreaMonitor);
			usuario.setiEmpresa(idEmpresa);
			usuario.setcUsuarioSolicitaIp(iSolicitaIp.toString());
			usuario.setiMonitorTipo(iTipoMonitor);
			usuario.setiRolEquipo(idRolEquipo);
			usuario.setiUsuarioPrincipalId(usuarioPrincipal);		
			usuarioDAO.updateByPrimaryKeySelective(usuario);

			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria();
			uc.setOrderByClause("I_USUARIO_ID desc");
			List<Usuario> usuarios=usuarioDAO.selectByExample(uc);
			
			int idUsuario1 = usuarios.get(0).getiUsuarioId();
			UsuarioRol usuarioRol = new UsuarioRol();
			usuarioRol.setiUsuarioxrolUsuarioId(idUsuario1);
			usuarioRol.setiUsuarioxrolRolId(4);
			usuarioRolDAO.insertSelective(usuarioRol);
			//update sucursal
			if (iTipoMonitor!=20) {
				int numCajas=0;
				
				MonitorCajasCriteria mcc=new MonitorCajasCriteria();
				mcc.createCriteria().andIdUsuarioEqualTo(idUsuario1);
				monitorCajasDAO.deleteByExample(mcc);
				
				MonitorCajas mc = new MonitorCajas();
				
				if(iTipoMonitor ==1){
					numCajas=6;
				}
				else if(iTipoMonitor ==2){
					numCajas=4;
				}			
				else if(iTipoMonitor ==3){
					numCajas=4;
				}			
				else if(iTipoMonitor ==4){
					numCajas=4;
				}			
				else if(iTipoMonitor ==5){
					numCajas=12;
				}	
				else if ( iTipoMonitor == 23 ) {
					numCajas = 6;
				}
	
				else{
					numCajas=4;
					}
				for(int i=0; i<numCajas; i++){
					mc.setIdUsuario(idUsuario1);
					mc.setIdSucursal(idSucursal);
					mc.setSecuencia(i+1);
					mc.setTicketTexto("--");
					mc.setNombreVentanilla("--");
					mc.setEstado(0);
					monitorCajasDAO.insertSelective(mc);
	
				}
				
			}
			
			UsuarioCriteria user = new UsuarioCriteria();
			user.createCriteria().andIRolEquipoEqualTo(idRolEquipo);
			List<Usuario> listuser = usuarioDAO.selectByExample(user);
			return listuser;
	}
	
	@Override
	public List<RolEquipo> listarRolUsuario(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		RolEquipoCriteria ac = new RolEquipoCriteria();
		ac.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<RolEquipo> list = rolEquipoDAO.selectByExample(ac);
		return list;
	}
	
	@Override
	@Transactional
	public void reiniciarServicio(Integer idSucursal, Integer idUsuario) throws Exception {
		sucursalDAO.reiniciarServicio(idSucursal);
		
		auditoriaService.insert(idUsuario);
	}
	
	@Override
	public List<Encuesta> getAllSurveys(Integer idSucursal) throws Exception {
		EncuestaCriteria eqc = new EncuestaCriteria();
		eqc.createCriteria().andIdSucursalEqualTo(idSucursal);
		List<Encuesta> list = new ArrayList<>();
		list = encuestaDAO.selectByExample(eqc);
		return list;
	}
	
	@Override
	public Encuesta saveSurvey(Integer idSucursal, String descripcion, String fechaInicio, String fechaFin) throws Exception {
		// TODO Auto-generated method stub
		SimpleDateFormat fechaFormat =new SimpleDateFormat("yyyy-MM-dd");  
		Date fechaInicioEncuesta = (fechaInicio == "") ? null : fechaFormat.parse(fechaInicio);
		Date fechaFinEncuesta = (fechaFin == "") ? null : fechaFormat.parse(fechaFin);
		
		Date fecha = new Date();
		Encuesta survey = new Encuesta();
		survey.setIdSucursal(idSucursal);
		survey.setDescripcion(descripcion);
		survey.setFechaCreacion(fecha);
		survey.setFechaInicio(fechaInicioEncuesta);
		survey.setFechaFin(fechaFinEncuesta);
		survey.setEstado(1);
		encuestaDAO.insertSelective(survey);
		return survey;
	}
	
	@Override
	public Encuesta getSurveyById(Integer idEncuesta) throws Exception {
		// TODO Auto-generated method stub
		return encuestaDAO.selectByPrimaryKey(idEncuesta);
	}
	
	@Override
	public Encuesta editSurvey(Integer idSucursal, Integer idEncuesta, String descripcionEit, String fechaInicioEdit, String fechaFinEdit) throws Exception {
		
		SimpleDateFormat fechaFormat =new SimpleDateFormat("yyyy-MM-dd");  
		Date fechaInicioEncuesta = (fechaInicioEdit == "") ? null : fechaFormat.parse(fechaInicioEdit);
		Date fechaFinEncuesta = (fechaFinEdit == "") ? null : fechaFormat.parse(fechaFinEdit);
		
		Encuesta survey = new Encuesta();
		survey.setIdSucursal(idSucursal);
		survey.setId(idEncuesta);
		survey.setDescripcion(descripcionEit);
		survey.setFechaInicio(fechaInicioEncuesta);
		survey.setFechaFin(fechaFinEncuesta);
		encuestaDAO.updateByPrimaryKeySelective(survey);
		return survey;
	}
	
	@Override
	public Encuesta enableSurvey(Integer idEncuesta) throws Exception {
		Encuesta survey = new Encuesta();
		survey.setId(idEncuesta);
		survey.setEstado(1);
		encuestaDAO.updateByPrimaryKeySelective(survey);
		return survey;
	}
	
	@Override
	public Encuesta disableSurvey(Integer idEncuesta) throws Exception {
		Encuesta survey = new Encuesta();
		survey.setId(idEncuesta);
		survey.setEstado(0);
		encuestaDAO.updateByPrimaryKeySelective(survey);
		return survey;
	}
	
	@Override
	public List<BeanEncuesta> getSurveysByRangeDate(Integer idSucursal)
			throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSucursal", idSucursal);
		List<BeanEncuesta> list = new ArrayList<>();
		list = encuestaDAO.getEncuestasByRangeDate(param); 
		return list;
	}
	
	@Override
	public List<BeanEncuestaPreguntas> getActiveQuestionsBySurvey(Integer idEncuesta)
			throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idEncuesta", idEncuesta);
		List<BeanEncuestaPreguntas> list = new ArrayList<>();
		list = encuestaPreguntasDAO.getActiveQuestionsBySurvey(param);
		return list;
	}
	
	@Override
	public List<EncuestaPreguntas> getQuestionsByIdSurvey(Integer idEncuesta) throws Exception {
		EncuestaPreguntasCriteria eqc = new EncuestaPreguntasCriteria();
		eqc.createCriteria().andIdEncuestaEqualTo(idEncuesta);
		List<EncuestaPreguntas> list = new ArrayList<>();
		list = encuestaPreguntasDAO.selectByExample(eqc);
		return list;
	}
	
	@Override
	public EncuestaPreguntas saveQuestion(Integer idSucursal, Integer idEncuesta, String pregunta) throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		EncuestaPreguntas question = new EncuestaPreguntas();
		question.setIdSucursal(idSucursal);
		question.setIdEncuesta(idEncuesta);
		question.setDescripcion(pregunta);
		question.setFechaCreacion(fecha);
		question.setFechaModificacion(fecha);
		question.setEstado(1);
		encuestaPreguntasDAO.insertSelective(question);
		return question;
	}
	
	@Override
	public EncuestaPreguntas getPreguntaById(Integer idPregunta) throws Exception {
		// TODO Auto-generated method stub
		return encuestaPreguntasDAO.selectByPrimaryKey(idPregunta);
	}
	
	@Override
	public EncuestaPreguntas editQuestion(Integer idSucursal, Integer idPregunta, String preguntaEdit) throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		EncuestaPreguntas question = new EncuestaPreguntas();
		question.setIdSucursal(idSucursal);
		question.setId(idPregunta);
		question.setDescripcion(preguntaEdit);
		question.setFechaModificacion(fecha);
		encuestaPreguntasDAO.updateByPrimaryKeySelective(question);
		return question;
	}
	
	@Override
	public EncuestaPreguntas enableQuestion(Integer idPregunta) throws Exception {
		EncuestaPreguntas question = new EncuestaPreguntas();
		question.setId(idPregunta);
		question.setEstado(1);
		encuestaPreguntasDAO.updateByPrimaryKeySelective(question);
		return question;
	}
	
	@Override
	public EncuestaPreguntas disableQuestion(Integer idPregunta) throws Exception {
		EncuestaPreguntas question = new EncuestaPreguntas();
		question.setId(idPregunta);
		question.setEstado(0);
		encuestaPreguntasDAO.updateByPrimaryKeySelective(question);
		return question;
	}
	
	@Override
	public List<EncuestaOpciones> getOptionsSurvey() throws Exception {
		// TODO Auto-generated method stub
		EncuestaOpcionesCriteria eoc = new EncuestaOpcionesCriteria();
		eoc.createCriteria();
		List<EncuestaOpciones> list = new ArrayList<>();
		list = encuestaOpcionesDAO.selectByExample(eoc);
		return list;
	}
	
	@Override
	public EncuestaRespuesta saveAnswer(Integer idTicket, Integer idUsuario, Integer idVentanilla, Integer idSucursal, Integer idEncuesta, Integer idPregunta, Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		EncuestaRespuesta answer = new EncuestaRespuesta();
		answer.setIdTicket(idTicket);
		answer.setIdUsuario(idUsuario);
		answer.setIdVentanilla(idVentanilla); 
		answer.setIdSucursal(idSucursal);
		answer.setIdEncuesta(idEncuesta);
		answer.setIdPregunta(idPregunta);
		answer.setIdOpcion(idOpcion);
		answer.setHora(fecha);
		answer.setFecha(fecha);
		encuestaRespuestaDAO.insertSelective(answer);
		
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEvaluacion(1);
		ticketDAO.updateByPrimaryKey(ticket);
		return answer;
	}
	
	@Override
	public List<BeanReporteEncuesta> listarReporteEncuesta(Integer idUsuario, Integer idVentanilla, String fechaInicio, String fechaFin) { 
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		param.put("idVentanilla", idVentanilla);
		param.put("fechaInicio", fechaInicio);
		param.put("fechaFin", fechaFin);
		List<BeanReporteEncuesta> list = new ArrayList<>();
		list = encuestaRespuestaDAO.listarReporteEncuesta(param);
		return list;
	}
	
	@Override
	public List<Sucursal> getAllSucursal(Integer idEmpresa) throws Exception {
	    SucursalCriteria sc = new SucursalCriteria();
	    sc.createCriteria().andIdEmpresaEqualTo(idEmpresa);
	    List<Sucursal> list = sucursalDAO.selectByExample(sc);
	    
	    for (Sucursal sucursal : list) {
	        sucursal.setNombreAlgoritmo(
	            algoritmoDAO.selectByPrimaryKey(sucursal.getIdTipoAlgoritmo()).getDescripcion()
	        );
	        
	        if (sucursal.getIdUsuario() != 0) {
	            Usuario usuario = usuarioDAO.selectByPrimaryKey(sucursal.getIdUsuario());
	            
	            BeanUsuario bu = new BeanUsuario();
	            bu.setIdUsuario(usuario.getiUsuarioId());
	            bu.setNombre(usuario.getvUsuarioNombres());
	            bu.setApePaterno(usuario.getvUsuarioApPaterno());
	            bu.setApeMaterno(usuario.getvUsuarioApMaterno());
	            bu.setUsername(usuario.getvUsuarioUsername());
	            bu.setCorreo(usuario.getvUsuarioEmail());
	            bu.setNumeroDocumento(usuario.getDni());
	            
	            sucursal.setUser(bu);
	        } else {
	        	BeanUsuario bu = new BeanUsuario();
	        	bu.setNombre("NO INGRESO");
	        	bu.setApePaterno("");
	        	bu.setApeMaterno("");
	        	bu.setUsername("");
	        	sucursal.setUser(bu);
	        }
	    }
	    return list;
	}
}
