package pe.gob.ep.iclassq.ticket.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;

import org.apache.commons.lang.StringUtils;
//import org.omg.CORBA.portable.OutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

import pe.gob.ep.iclassq.entidad.BeanGrupoProporcion;
import pe.gob.ep.iclassq.entidad.BeanSubGrupoProporcion;
import pe.gob.ep.iclassq.entidad.BeanDni;
import pe.gob.ep.iclassq.entidad.BeanGrupo;
import pe.gob.ep.iclassq.entidad.BeanId;
import pe.gob.ep.iclassq.entidad.BeanTicketAreaproxTurno;
import pe.gob.ep.iclassq.entidad.BeanTicketId;
import pe.gob.ep.iclassq.entidad.BeanTicketIdSonido;
import pe.gob.ep.iclassq.entidad.BeanTicketLlamado;
import pe.gob.ep.iclassq.entidad.BeanTicketManagement;
import pe.gob.ep.iclassq.entidad.BeanTicketPreview;
import pe.gob.ep.iclassq.entidad.BeanTicketSecuencial;
import pe.gob.ep.iclassq.entidad.BeanTicketXArea;
import pe.gob.ep.iclassq.entidad.BeanTicketXGrupo;
import pe.gob.ep.iclassq.entidad.BeanTicketXReporte;
import pe.gob.ep.iclassq.entidad.BeanUsuario;
import pe.gob.ep.iclassq.entidad.BeanUsuarioAusencia;
import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.negocio.bean.*;
import pe.gob.ep.iclassq.negocio.dao.AdicionalesDAO;
import pe.gob.ep.iclassq.negocio.dao.AlgoritmoDAO;
import pe.gob.ep.iclassq.negocio.dao.AreaDAO;
import pe.gob.ep.iclassq.negocio.dao.AudioDAO;
import pe.gob.ep.iclassq.negocio.dao.EvaluadorDAO;
import pe.gob.ep.iclassq.negocio.dao.GrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.MonitorCajasDAO;
import pe.gob.ep.iclassq.negocio.dao.MonitorDAO;
import pe.gob.ep.iclassq.negocio.dao.MotivoAusenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.ParametroDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.RolEquipoSubGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.SecuenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.SubGrupoDAO;
import pe.gob.ep.iclassq.negocio.dao.SucursalDAO;
import pe.gob.ep.iclassq.negocio.dao.TablaGeneralDAO;
import pe.gob.ep.iclassq.negocio.dao.TicketDAO;
import pe.gob.ep.iclassq.negocio.dao.TipoDocumentoDAO;
import pe.gob.ep.iclassq.negocio.dao.UsuarioAusenciaDAO;
import pe.gob.ep.iclassq.negocio.dao.VentanillaDAO;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioCriteria;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioDAO;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.service.EssaludService;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.URLConnectionProxy;

@Service
public class TicketServiceImpl implements TicketService {	
	protected final Log log = LogFactory.getLog(getClass());
	@Autowired
	private TicketDAO ticketDAO;
	
	@Autowired
	private AreaDAO areaDAO;

	@Autowired
	private RolEquipoGrupoDAO rolEquipoGrupoDAO;

	
	@Autowired
	private RolEquipoSubGrupoDAO rolEquipoSubGrupoDAO;

	
	@Autowired
	private MonitorDAO monitorDAO;
	
	@Autowired
	private MonitorCajasDAO monitorCajasDAO;
	
	@Autowired
	private SubGrupoDAO subGrupoDAO;
	
	@Autowired
	private VentanillaDAO ventanillaDAO;
	
	@Autowired
	private EvaluadorDAO evaluadorDAO;
	
	@Autowired
	private GrupoDAO grupoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private SecuenciaDAO secuenciaDAO;
	
	@Autowired
	private ParametroDAO parametroDAO;
	
	@Autowired
	private AdicionalesDAO adicionalesDAO;

	@Autowired
	private AlgoritmoDAO algoritmoDAO;
	
	@Autowired
	private RolEquipoDAO rolEquipoDAO;
	
	@Autowired
	private TablaGeneralDAO tablaGeneralDAO;
	
	@Autowired
	private EssaludService essaludService;
	
	@Autowired
	private TipoDocumentoDAO tipoDocumentoDAO;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private MotivoAusenciaDAO motivoAusenciaDAO;
	
	@Autowired
	private SucursalDAO sucursalDAO;
	
	@Autowired
	private AudioDAO audioDAO;
	
	@Autowired
	private UsuarioAusenciaDAO usuarioAusenciaDAO;
	
	@Override
	public int getCantidadGrupoRolEquipo(Integer idRolEquipo) throws Exception {
		System.out.println("test_>>>>");
		System.out.println("test_333333>>>>");
		// TODO Auto-generated method stub
		RolEquipoGrupoCriteria regc = new RolEquipoGrupoCriteria();
		regc.createCriteria().andIdRolEquipoEqualTo(idRolEquipo);
		int cant = rolEquipoGrupoDAO.countByExample(regc);
		System.out.println("cant-->>>"+cant);
		return cant;
	}

	@Override
	public List<BeanGrupoProporcion> getGrupoByRolEquipo(Integer idUsuario, Integer idRolEquipo)
		throws Exception {
		// TODO Auto-generated method stub
		List<BeanGrupoProporcion> list = new ArrayList<>();
		List<BeanGrupoProporcion> listOrdenada = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		list = rolEquipoGrupoDAO.getGrupoByRolEquipo(param);
		//Algoritmo 4  se define en la tbl_sucursal, es alli cuando  se utiliza la proporcion.
		float sumaPorcentajeTeorico = 0;
		float sumaPorcentajePractico = 0;
		//a�adismos la cantida a cada bean
		int cant = list.size();
		for(int x=0; x<cant; x++){
			sumaPorcentajeTeorico = sumaPorcentajeTeorico + list.get(x).getProporcionTeorica();
		}
	
		for(int i=0; i<cant; i++){
			list.get(i).setRegistrosActuales(this.getRegistrosActuales(list.get(i).getIdGrupo(), idRolEquipo));
			if(sumaPorcentajeTeorico!=0){
				list.get(i).setPorcentajeTeorica((list.get(i).getProporcionTeorica())/(sumaPorcentajeTeorico));
			}
			else{
				list.get(i).setPorcentajeTeorica(0);
			}
		}
	
		for(int y=0; y<cant; y++){
			sumaPorcentajePractico = sumaPorcentajePractico + list.get(y).getRegistrosActuales();
		}
		for(int j=0; j<cant; j++){
			if(sumaPorcentajePractico !=0){
				list.get(j).setPorcentajePractico(list.get(j).getRegistrosActuales()/sumaPorcentajePractico);
			}else{
				list.get(j).setPorcentajePractico(0);
			}
		}
	
		for(int z=0; z<cant; z++){
			list.get(z).setDiferencia(list.get(z).getPorcentajePractico() -list.get(z).getPorcentajeTeorica());
		}
	
		int  xMin, m;
		float difMin;
		while (true)
		{
			difMin=list.get(0).getDiferencia();
			xMin=0;
			m=list.size();
			for(int y=0; y<m; y++){
			if (difMin>list.get(y).getDiferencia()) {
				xMin=y;
				difMin=list.get(y).getDiferencia();
			}
			// insert el registro en la nueva tabla
			}
			listOrdenada.add(list.get(xMin));
			list.remove(xMin);
			if (list.size()==0) break;
		}
		// Collections.sort(list, new Comparator<BeanGrupoProporcion>() {
		// public float compare(BeanGrupoProporcion p1, BeanGrupoProporcion p2) {
	//	            return p2.getDiferencia() - p1.getDiferencia();
	//	        }
		// });
		return listOrdenada;
	}

	@Override
	public List<BeanSubGrupoProporcion> getSubGrupoByRolEquipo(Integer idUsuario, Integer idRolEquipo, Integer idSucursal)
		throws Exception {
		// TODO Auto-generated method stub
		List<BeanSubGrupoProporcion> list = new ArrayList<>();
		List<BeanSubGrupoProporcion> listOrdenada = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		param.put("idSucursal", idSucursal);
		list = rolEquipoSubGrupoDAO.getSubGrupoByRolEquipo(param);
		//se define en cada Rolequiposubgrupo la proporcion de los subgrupos.
		float sumaPorcentajeTeorico = 0;
		float sumaPorcentajePractico = 0;
		//a�adimos la cantida a cada bean
		int cant = list.size();
		for(int x=0; x<cant; x++){
			sumaPorcentajeTeorico = sumaPorcentajeTeorico + list.get(x).getProporcionTeorica();
		}
	
		for(int i=0; i<cant; i++){
			list.get(i).setRegistrosActuales(this.getRegistrosActualesSubGrupo(list.get(i).getIdSubGrupo(), idRolEquipo));
			if(sumaPorcentajeTeorico!=0){
				list.get(i).setPorcentajeTeorica((list.get(i).getProporcionTeorica())/(sumaPorcentajeTeorico));
			}
			else{
				list.get(i).setPorcentajeTeorica(0);
			}
		}
	
		for(int y=0; y<cant; y++){
			sumaPorcentajePractico = sumaPorcentajePractico + list.get(y).getRegistrosActuales();
		}
		for(int j=0; j<cant; j++){
			if(sumaPorcentajePractico !=0){
				list.get(j).setPorcentajePractico(list.get(j).getRegistrosActuales()/sumaPorcentajePractico);
			}else{
				list.get(j).setPorcentajePractico(0);
			}
		}
	
		for(int z=0; z<cant; z++){
			list.get(z).setDiferencia(list.get(z).getPorcentajePractico() -list.get(z).getPorcentajeTeorica());
		}
		
		int  xMin, m;
		float difMin;
		while (true)
		{
			difMin=list.get(0).getDiferencia();
			xMin=0;
			m=list.size();
			for(int y=0; y<m; y++){
				if (difMin>list.get(y).getDiferencia()) {
					xMin=y;
					difMin=list.get(y).getDiferencia();
				}
			// insert el registro en la nueva tabla
			}
			listOrdenada.add(list.get(xMin));
			list.remove(xMin);
			if (list.size()==0) break;
		}
		return listOrdenada;
		
		/*boolean intercambio;

        do {
            intercambio = false;
            for (int i = 0; i < cant - 1; i++) {
                if (list.get(i).getDiferencia() > list.get(i + 1).getDiferencia()) {
                    BeanSubGrupoProporcion temp = list.get(i);
                    list.set(i, list.get(i + 1));
                    list.set(i + 1, temp);
                    intercambio = true;
                }
            }
        } while (intercambio);
        
        listOrdenada.addAll(list);
		return listOrdenada;*/
	}


	@Override
	public List<BeanGrupoProporcion> getGrupoByRolEquipoBalanceo(Integer idRolEquipo)
		throws Exception {
		// TODO Auto-generated method stub
		List<BeanGrupoProporcion> list = new ArrayList<>();
		List<BeanGrupoProporcion> listOrdenada = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		list = rolEquipoGrupoDAO.getGrupoByRolEquipo(param);
		//Algoritmo 4  se define en la tbl_sucursal, es alli cuando  se utiliza la proporcion.
		float sumaPorcentajeTeorico = 0;
		float sumaPorcentajePractico = 0;
		//a�adismos la cantida a cada bean
		int cant = list.size();
		for(int x=0; x<cant; x++){
			sumaPorcentajeTeorico = sumaPorcentajeTeorico + list.get(x).getProporcionTeorica();
		}
	
		for(int i=0; i<cant; i++){
			list.get(i).setRegistrosActuales(this.getRegistrosActualesBalanceo(list.get(i).getIdGrupo(), idRolEquipo));
			if(sumaPorcentajeTeorico!=0){
				list.get(i).setPorcentajeTeorica((list.get(i).getProporcionTeorica())/(sumaPorcentajeTeorico));
			}
			else{
				list.get(i).setPorcentajeTeorica(0);
			}
		}
	
		for(int y=0; y<cant; y++){
			sumaPorcentajePractico = sumaPorcentajePractico + list.get(y).getRegistrosActuales();
		}
		for(int j=0; j<cant; j++){
			if(sumaPorcentajePractico !=0){
				list.get(j).setPorcentajePractico(list.get(j).getRegistrosActuales()/sumaPorcentajePractico);
			}else{
				list.get(j).setPorcentajePractico(0);
			}
		}
	
		for(int z=0; z<cant; z++){
			list.get(z).setDiferencia(list.get(z).getPorcentajePractico() -list.get(z).getPorcentajeTeorica());
		}
	
		int  xMin, m;
		float difMin;
		while (true)
		{
			difMin=list.get(0).getDiferencia();
			xMin=0;
			m=list.size();
			for(int y=0; y<m; y++){
			if (difMin>list.get(y).getDiferencia()) {
				xMin=y;
				difMin=list.get(y).getDiferencia();
			}
			// insert el registro en la nueva tabla
			}
			listOrdenada.add(list.get(xMin));
			list.remove(xMin);
			if (list.size()==0) break;
		}
		// Collections.sort(list, new Comparator<BeanGrupoProporcion>() {
		// public float compare(BeanGrupoProporcion p1, BeanGrupoProporcion p2) {
	//	            return p2.getDiferencia() - p1.getDiferencia();
	//	        }
		// });
	
		return listOrdenada;
	}

	@Override
	public int getRegistrosActuales(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idGrupo", idGrupo);
		param.put("idRolEquipo", idRolEquipo);
//		int cant = rolEquipoGrupoDAO.getRegistrosActuales(param);
		int cant = rolEquipoGrupoDAO.getCantidadRegistrosActuales(param);
		System.out.println("cant-->>>"+cant);
		return cant;
	}
	@Override
	public int getRegistrosActualesSubGrupo(Integer idSubGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idSubGrupo", idSubGrupo);
		param.put("idRolEquipo", idRolEquipo);
		int cant = rolEquipoSubGrupoDAO.getCantidadRegistrosActualesSG(param);
		System.out.println("cant-->>>"+cant);
		return cant;
	}
	public int getRegistrosActualesBalanceo(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idGrupo", idGrupo);
		param.put("idRolEquipo", idRolEquipo);
//		int cant = rolEquipoGrupoDAO.getRegistrosActuales(param);
		int cant = rolEquipoGrupoDAO.getCantidadRegistrosActualesBalanceo(param);
		System.out.println("cant-->>>"+cant);
		return cant;
	}
//	@Override
//	public void getNextTicket(Integer idUsuario, Integer idSucursal, 
//			Integer idRolEquipo, Integer idVentanilla) throws Exception {
//		// TODO Auto-generated method stub
//		Date fechaActual = new Date();
//		int idAlgoritomo = this.getGrupoByRolEquipo(idUsuario, idRolEquipo);		
//		if(idAlgoritomo==1 || idAlgoritomo==2){
//			System.out.println("---");
//			
//			System.out.println("USUARIO: "+idUsuario);
//			Ticket t = new Ticket();
//			Map<String, Object> param = new HashMap<String, Object>();
//			param.put("ventanillaIdUsuario", idUsuario);
//			t = ticketDAO.listarTicketSecuencial(param);
//			
//			List<RolEquipoGrupo> listEsquipoGrupo = this.getGrupoByIdRolEquipo(idRolEquipo);
//			int cant = listEsquipoGrupo.size();//3
//			List<SubGrupo> listSubGrupo = new ArrayList<>();
//			for(int i=0; i<cant; i++){
//				listSubGrupo.addAll(this.getSubGrupoByIdGrupo(listEsquipoGrupo.get(i).getIdGrupo()));			
//			}
//			int cantSubGrupos = listSubGrupo.size();
//			List<Ticket> list = new ArrayList<>();
//			TicketCriteria tc = new TicketCriteria();
//			for(int j=0; j<cantSubGrupos; j++){
//				tc.createCriteria().andEstadoEqualTo(0).andIdSubgrupoEqualTo(listSubGrupo.get(j).getId()).andFechaAtencionEqualTo(fechaActual);
//				tc.setOrderByClause("id asc");
//				list = ticketDAO.selectByExample(tc);
//				list.addAll(list);
//			}
////			tc.setOrderByClause("id asc");
////			list = ticketDAO.selectByExample(tc);
//			for(int i=0; i<list.size(); i++){
//				if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO){
//					list.get(i).setDescripcionEstado("LLAMANDO");
//				}
//				else if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO_MONITOR){
//					list.get(i).setDescripcionEstado("LLAMANDO MONITOR");
//				}
//				else if(list.get(i).getEstado()==Constante.ESTADO_ATENCION){
//					list.get(i).setDescripcionEstado("ATENDIENDO");
//				}
//				else if(list.get(i).getEstado()==Constante.ESTADO_FINALIZADO){
//					list.get(i).setDescripcionEstado("FINALIZADO");
//				}
//				else{
//					list.get(i).setDescripcionEstado("EVALUANDO");
//				}
//			}
//			t.setEstado(Constante.ESTADO_LLAMANDO);
//			t.setVentanillaIdUsuario(idUsuario);
//			t.setVentanillaCaja(idVentanilla);
//			ticketDAO.updateByPrimaryKeySelective(t);
//			
//		}
//	}

	@Override
	public List<MonitorCajas> mostrarAtenciones(Integer idUsuario, Integer idSucursal, Integer idTipoMonitor) {
		// TODO Auto-generated method stub
		MonitorCajasCriteria mcc = new MonitorCajasCriteria();
		mcc.createCriteria().andIdUsuarioEqualTo(idUsuario).andIdSucursalEqualTo(idSucursal);
		List<MonitorCajas> list = new ArrayList<>();
		list = monitorCajasDAO.selectByExample(mcc);
		return list;
	}
	
//	@Override
//	public void evaluarAtencion(String url, Integer idTicket, Integer idVentanilla) throws IOException {
//		// TODO Auto-generated method stub
//		Date fecha = new Date();
//		Ticket ticket = new Ticket();
//		ticket.setId(idTicket);
//		ticket.setEstado(51);
//		ticket.setHoraFinAtencion(fecha);
//		ticketDAO.updateByPrimaryKeySelective(ticket);
//		this.escribirArchivoTxt(url, idTicket, idVentanilla);
//	}
	
	@Override
	public void evaluarAtencion(Integer idTicket, Integer idVentanilla, Integer idUsuario) throws IOException {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setVentanillaIdUsuario(idUsuario);
		ticket.setEstado(51);
		ticket.setHoraFinAtencion(fecha);
		ticketDAO.updateByPrimaryKeySelective(ticket);
	}

	@Override
	public List<Ticket> actualizarEstadoTicket(Integer idTicket,
			Integer idEstado) throws Exception {
		// TODO Auto-generated method stub
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEstado(idEstado);
		ticketDAO.updateByPrimaryKeySelective(ticket);
		
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria();
		List<Ticket> list= new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		return list;
	}

	@Override
	public void escribirArchivoTxt(String url, Integer idTicket, Integer idVentanilla) throws IOException {
	//VBR 20191125
		String directorio;
		Writer out = null;
		try {
//			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("\\\\192.168.1.13\\evaluador\\"+idVentanilla.toString()+".txt")));
			ParametroCriteria parc = new ParametroCriteria();
			parc.createCriteria().andCodigoEqualTo("005");
			List<Parametro> list = new ArrayList<>();
			list = parametroDAO.selectByExampleWithoutBLOBs(parc);

			directorio=list.get(0).getDescripcionLarga();
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(directorio+idVentanilla.toString()+".txt")));
			// Escribimos linea a linea en el fichero
			try {
				out.write(idTicket.toString());
			} catch (IOException ex) {
				System.out.println("Mensaje excepcion escritura: " + ex.getMessage());
			}

		} catch (Exception ex2) {
			System.out.println("Mensaje error 2: " + ex2.getMessage());
		} finally {
			try {
				out.close();
			} catch (IOException ex3) {
				System.out.println("Mensaje error cierre fichero: " + ex3.getMessage());
			}
		}

	}
//fin VBR 20191125
	@Override
	public void verificarNuevoTurno(Integer idUsuario,  
			Integer idSucursal,
			Integer idTipoMonitor, 
			Integer iRolEquipo) throws Exception {
		// TODO Auto-generated method stub wjpm
		int ApellidoSino=parametroNumero("110").intValue();
		List<RolEquipoGrupo> listEsquipoGrupo = this.getGrupoByIdRolEquipo(iRolEquipo);
		Ticket ticket_nuevo;
		int cant = listEsquipoGrupo.size();//3
		List<SubGrupo> listSubGrupo = new ArrayList<>();
		for(int i=0; i<cant; i++){		
			listSubGrupo.addAll(this.getSubGrupoByIdGrupo(listEsquipoGrupo.get(i).getIdGrupo()));			
		}
		int cantSubGrupos = listSubGrupo.size();
//		VBR 20191124 cambiar a un valor
		for(int j=0; j<cantSubGrupos; j++){	
				ticket_nuevo=this.getTicketBySubGrpoAndEstadoLlamando(listSubGrupo.get(j).getId());

				//actualizar el ticket a estado llamando 41				
				if(ticket_nuevo!= null){
//					Ticket ticket;
//					list = ticketDAO.selectByExample(tc);
					
					Ticket t = new Ticket();
					t.setId(ticket_nuevo.getId());
					t.setEstado(Constante.ESTADO_LLAMANDO_MONITOR);
					
					//crear el aleatorio para ese monitor
					MonitorCajasCriteria mcc = new MonitorCajasCriteria();
					mcc.createCriteria()
						.andIdUsuarioEqualTo(idUsuario)
						.andIdSucursalEqualTo(idSucursal)
						.andEstadoEqualTo(0);
					List<MonitorCajas> listMonitorCajas = new ArrayList<>();
					listMonitorCajas = monitorCajasDAO.selectByExample(mcc);
					if (listMonitorCajas.isEmpty()) {
						log.debug("No monitor slot available for user " + idUsuario);
						return;
					}
					Random rand = new Random();
					int randomIndex = rand.nextInt(listMonitorCajas.size());	//4	
					
					// analizar si todo esta lleno
					
					MonitorCajas mc = new MonitorCajas();
					mc.setId(listMonitorCajas.get(randomIndex).getId());				
					mc.setIdUsuario(idUsuario);
					mc.setIdSucursal(idSucursal);
					mc.setIdTicket(ticket_nuevo.getId());
					mc.setTicketTexto( ApellidoSino == 0 ? ticket_nuevo.getCodigo() : ticket_nuevo.getDescripcion());
					 //muestra ticket en la tele
					mc.setNombreVentanilla(this.getVentanillaByIdVentanilla(ticket_nuevo.getVentanillaCaja()).getNombre());
					mc.setEstado(1);
					//preguntar si no ha sido cambiado
					TicketCriteria tc1 = new TicketCriteria();
					tc1.createCriteria().andIdEqualTo(ticket_nuevo.getId());
					List<Ticket> listrevtk = new ArrayList<>();
	
					listrevtk = ticketDAO.selectByExample(tc1);
					if (listrevtk.get(0).getEstado()==40 || listrevtk.get(0).getEstado()==91) {
						ticketDAO.updateByPrimaryKeySelective(t);
						monitorCajasDAO.updateByPrimaryKeySelective(mc);
						
					}
					
				}
		}
	}
	@Override
	public void eliminarTurno(Integer idUsuario,  
			Integer idSucursal,
			Integer idTipoMonitor, 
			Integer iRolEquipo) throws Exception {
		// TODO Auto-generated method stub wjpm
		MonitorCajasCriteria mcca = new MonitorCajasCriteria();
		mcca.createCriteria().andIdUsuarioEqualTo(idUsuario).andIdSucursalEqualTo(idSucursal).andEstadoEqualTo(1);
		List<MonitorCajas> listMonitorCajas = new ArrayList<>();
		listMonitorCajas = monitorCajasDAO.selectByExample(mcca);

		int cant = listMonitorCajas.size();//3
		for(int i=0; i<cant; i++){		
			// revisar los tickets en la base de datos si ya fueron finalizados
			TicketCriteria tb = new TicketCriteria();
			tb.createCriteria().andIdEqualTo(listMonitorCajas.get(i).getIdTicket());
			List<Ticket> listTicketAnalisis = new ArrayList<>();
			listTicketAnalisis = ticketDAO.selectByExample(tb);
			int cantTicket =listTicketAnalisis.size();
			if (cantTicket>0){
				//actualizar el ticket a estado llamando 41				
					if (listTicketAnalisis.get(0).getEstado()>41) {
						MonitorCajas mc = new MonitorCajas();
						mc.setId(listMonitorCajas.get(i).getId());				
						mc.setEstado(0);	
						monitorCajasDAO.updateByPrimaryKeySelective(mc);
					}
			}
		}
	}

	
	
	@Override
	public List<RolEquipoGrupo> getGrupoByIdRolEquipo(Integer iRolEquipo)
			throws Exception {
		// TODO Auto-generated method stub
		RolEquipoGrupoCriteria regc = new RolEquipoGrupoCriteria();
		regc.createCriteria().andIdRolEquipoEqualTo(iRolEquipo);
		List<RolEquipoGrupo> list = new ArrayList<>();
		list = rolEquipoGrupoDAO.selectByExample(regc);
		return list;
	}

	@Override
	public List<SubGrupo> getSubGrupoByIdGrupo(Integer idGrupo)
			throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
		List<SubGrupo> list = new ArrayList<>();
		list = subGrupoDAO.selectByExample(sgc);
		return list;
	}
	@Override
	public Ticket getTicketBySubGrpoAndEstadoLlamando(Integer idSubGrupo)
			throws Exception {
		// TODO Auto-generated method stub
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria()
			.andIdSubgrupoEqualTo(idSubGrupo)
			.andEstadoIn(Arrays.asList(40, 91));
		List<Ticket> list = new ArrayList<>();
		Ticket ticket;
		list = ticketDAO.selectByExample(tc);
		int cant =list.size();
		if(list.size()>0){
			ticket = list.get(0);
			return ticket;
		}else{
			return null;
		}
	}
	
	@Override
	public List<Ticket> listarTicketByIdUsuario(Integer idUsuario)
			throws Exception {
		// TODO Auto-generated method stub
		List<BeanTicketXGrupo> grupo = null;
		Date fechaActual = new Date(); 
		TicketCriteria tc  = new TicketCriteria();
		tc.createCriteria().andVentanillaIdUsuarioEqualTo(idUsuario).andFechaAtencionEqualTo(fechaActual);
		tc.setOrderByClause("estado, hora_fin_atencion DESC");
		List<Ticket> list = new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		for(int i=0; i<list.size(); i++){
			Ticket ticket = list.get(i);
			if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO){
				list.get(i).setDescripcionEstado("LLAMANDO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO_MONITOR){
				list.get(i).setDescripcionEstado("LLAMANDO MONITOR");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_ATENCION){
				list.get(i).setDescripcionEstado("ATENDIENDO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_ANULADO){
				list.get(i).setDescripcionEstado("ANULADO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_FINALIZADO){
				list.get(i).setDescripcionEstado("FINALIZADO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_DERIVADO){
				list.get(i).setDescripcionEstado("DERIVADO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_REACTIVADO){
				list.get(i).setDescripcionEstado("REACTIVADO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_CANCELADO){
				list.get(i).setDescripcionEstado("CANCELADO");
			}
			else if(list.get(i).getEstado()==Constante.ESTADO_AUSENTE){
				list.get(i).setDescripcionEstado("AUSENTE");
			}
			else{
				list.get(i).setDescripcionEstado("EVALUANDO");
			}
			
			Integer idSubGrupo = list.get(i).getIdSubgrupo();
			grupo = this.getNombreGrupo(idSubGrupo);
			Integer idGrupo = grupo.get(0).getId();
			
			if (grupo != null && !grupo.isEmpty()) {
				ticket.setIdGrupo(grupo.get(0).getId());
	            ticket.setNombreGrupo(grupo.get(0).getnombreGrupo());
	        }
		}
		return list;
		
	}	
	
	// MATIAS: traer Nombre del grupo segun id subgrupo
	@Override
	public List<BeanTicketXGrupo> getNombreGrupo(Integer idSubGrupo) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idSubGrupo", idSubGrupo);
		List<BeanTicketXGrupo> list = ticketDAO.getNombreGrupoByIdSucursal(param);
		return list;
	}
	
	@Override
	public Ventanilla getVentanillaByIdVentanilla(Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		Ventanilla ventanilla = new Ventanilla();
		ventanilla = ventanillaDAO.selectByPrimaryKey(idVentanilla);
		return ventanilla;
	}

	@Override
	public int iniciarprevioVerificaenTv(Integer idTicket) throws Exception {
		// TODO Auto-generated method stub
		int vSiseMuestra=0;
		MonitorCajasCriteria mcc = new MonitorCajasCriteria();
		mcc.createCriteria().andIdTicketEqualTo(idTicket);
		List<MonitorCajas> list = new ArrayList<>();
		list = monitorCajasDAO.selectByExample(mcc);
		MonitorCajas mc = new MonitorCajas();
		if (list.size()>0) 	vSiseMuestra=1;
		return vSiseMuestra;
	}
	
	@Override
	public void iniciarAtencion(Integer idTicket, Integer idEstado) throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		if ( idEstado == Constante.ESTADO_REACTIVADO ) {
			ticket.setHoraInicioReactivacion(fecha);
		} else {
			ticket.setHoraInicioAtencion(fecha);
		}
		ticket.setEstado(Constante.ESTADO_ATENCION);			
		ticketDAO.updateByPrimaryKeySelective(ticket);
		
		MonitorCajasCriteria mcc = new MonitorCajasCriteria();
		mcc.createCriteria().andIdTicketEqualTo(ticket.getId());
		
		List<MonitorCajas> list = new ArrayList<>();
		list = monitorCajasDAO.selectByExample(mcc);
		MonitorCajas mc = new MonitorCajas();
		if (list.size()>0) {
			mc = list.get(0);
			mc.setEstado(0);				
			monitorCajasDAO.updateByPrimaryKeySelective(mc);
		}
		
	}
	
	@Override
	public void finalizarAtencion(Integer idTicket) throws Exception {
		// TODO Auto-generated method stub
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andIdEqualTo(idTicket);
		List<Ticket> listtc = new ArrayList<>();
		listtc = ticketDAO.selectByExample(tc);
		
		if(listtc.size() > 0) {
			Date fecha = new Date();
			Ticket ticket = new Ticket();
			ticket.setId(idTicket);
			if( listtc.get(0).getHoraInicioReactivacion() != null ) {
				ticket.setHoraFinReactivacion(fecha);
			} else {
				ticket.setHoraFinAtencion(fecha);			
			}
			ticket.setEstado(Constante.ESTADO_FINALIZADO);
			ticketDAO.updateByPrimaryKeySelective(ticket);		
			
			//VERIFICAR MONITOR CAJAS Y PASAR A ESTADO 0
			MonitorCajasCriteria mcc = new MonitorCajasCriteria();
			mcc.createCriteria().andIdTicketEqualTo(ticket.getId());
			List<MonitorCajas> listmc = new ArrayList<>();
			listmc = monitorCajasDAO.selectByExample(mcc);
			if (listmc.size()>0) {
				MonitorCajas mc = new MonitorCajas();
				mc = listmc.get(0);
				if (mc.getEstado()==1) {
					mc.setEstado(0);				
					monitorCajasDAO.updateByPrimaryKeySelective(mc);
				}
			}	
		}

	}
	@Override
	public List<BeanGrupo> listargruposxparametroTipoDeriva(Integer idSucursal, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		List<BeanGrupo> listgrupo= new ArrayList<>();
		int tipoParametro=parametroNumero("160").intValue();
		try {
			param.put("idSucursal", idSucursal);
			param.put("tipoParametro", tipoParametro);
			param.put("idUsuario", idUsuario);

			listgrupo = grupoDAO.listargruposxparametroTipoDeriva(param);

		} catch (Exception npe) {
			System.out.println("algun error");
        }finally{

            System.out.println("finaliza ok listgrupo");
        }

		return listgrupo;
	}
	@Override

	public  List<Ventanilla> listarventanillaxparametroTipoDeriva(Integer idSucursal,  Integer idUsuario) throws Exception
	{
	// TODO Auto-generated method stub
	Map<String, Object> param = new HashMap<String, Object>();		
	List<Ventanilla> listV= new ArrayList<>();
	try {
		int tipoParametro=parametroNumero("160").intValue();
		param.put("idSucursal", idSucursal);
		param.put("tipoParametro", tipoParametro);
		param.put("idUsuario", idUsuario);

		listV = ventanillaDAO.listarventanillasxparametroTipoDeriva(param);
		for(int i=0; i<listV.size(); i++){
			System.out.println("ENTRO");
			if(listV.get(i).getIdArea()!=0){
				listV.get(i).setNombreArea(areaDAO.selectByPrimaryKey(listV.get(i).getIdArea()).getDescripcion().toString());	
			}
			else{
				listV.get(i).setNombreArea("");
			}
			
		}
	} catch (Exception npe) {
		System.out.println("algun error");
    }finally{

        System.out.println("finaliza ok listgrupo");
    }

	return listV;
}
	public int ObtenerSubgrupo(int idSubgrupoInicio, int idGrupo) throws Exception  {
		int iAgrupador=0, idSubGrupoFin=0;
		SubGrupoCriteria sgcc =new SubGrupoCriteria();
		sgcc.createCriteria().andIdEqualTo(idSubgrupoInicio);
		List<SubGrupo> listsgc = new ArrayList<>();
		listsgc = subGrupoDAO.selectByExample(sgcc);
		if (listsgc.size()>0) {
			iAgrupador=listsgc.get(0).getAgrupador();
		}
		SubGrupoCriteria sgccf =new SubGrupoCriteria();
		sgccf.createCriteria().andIdGrupoEqualTo(idGrupo).andAgrupadorEqualTo(iAgrupador);
		List<SubGrupo> listsgcf = new ArrayList<>();
		listsgcf = subGrupoDAO.selectByExample(sgccf);
		for(int j=0; j<listsgcf.size(); j++){
			idSubGrupoFin = listsgcf.get(j).getId();
		} 
		return idSubGrupoFin;
	}
	
	@Override
	public Ticket derivarTicket(Integer idTicket, Integer idGrupo, Integer idVentanilla, Integer idSucursal)
			throws Exception {
		Date fecha = new Date();
		
		Ticket ticket = new Ticket();
		ticket = ticketDAO.selectByPrimaryKey(idTicket);

		ticket.setEstado(Constante.ESTADO_DERIVADO);
		ticket.setHoraFinAtencion(fecha);            
	    ticketDAO.updateByPrimaryKeySelective(ticket);
		//VERIFICAR MONITOR CAJAS Y PASAR A ESTADO 0
		// cargar los subgrupos de la ventanilla.
		int idSubGrupo=ObtenerSubgrupo(ticket.getIdSubgrupo(), idGrupo);
		MonitorCajasCriteria mcc = new MonitorCajasCriteria();
		mcc.createCriteria().andIdTicketEqualTo(ticket.getId());
		
		List<MonitorCajas> listmc = new ArrayList<>();
		
		listmc = monitorCajasDAO.selectByExample(mcc);
		if (listmc.size()>0) {
			MonitorCajas mc = new MonitorCajas();
			mc = listmc.get(0);
			if (mc.getEstado()==1) {
				mc.setEstado(0);				
				monitorCajasDAO.updateByPrimaryKeySelective(mc);
			}
		}	
		
		Ticket td = new Ticket();
		td.setCodigo(ticket.getCodigo()); 
		td.setIdSucursal(idSucursal);
		td.setHoraEmision(fecha); // ticket.getHoraEmision()
		td.setHoraInicioAtencion(null);
		td.setHoraFinAtencion(null);
		td.setEstado(Constante.ESTADO_INICIO);
		td.setNombreSubgrupo(ticket.getNombreSubgrupo());
		td.setPrefijo(ticket.getPrefijo());
		td.setTipoIdentificacion(ticket.getTipoIdentificacion());		
		td.setNumeroIdentificacion(ticket.getNumeroIdentificacion());
		td.setDescripcion(ticket.getDescripcion());
		td.setSecuenciaAlgo3Proporcion(ticket.getSecuenciaAlgo3Proporcion());
		td.setFechaHoraProgAlg2Tiempo(ticket.getFechaHoraProgAlg2Tiempo());
		td.setIdTicketDerivado(0);
		td.setActivaAudioTexto(0);
		td.setVentanillaIdUsuario(0);
		td.setTicketSecuencia(ticket.getTicketSecuencia());
		td.setEnviaAudio(1);
		td.setVentanillaCaja(0);
		td.setEvaluacion(0);
		td.setFechaAtencion(ticket.getFechaAtencion());
		td.setIdSubgrupo(idSubGrupo);
		if(idVentanilla!=0) {
			td.setIdVentanillaDerivacion(idVentanilla);
		} else{
			td.setIdVentanillaDerivacion(0);
		}

		ticketDAO.insert(td);
		
		return td;
	}
	
	@Override
	public List<Ventanilla> getVentanillasByIdArea(
			Integer idSucursal, Integer idArea) throws Exception {
		// TODO Auto-generated method stub
		VentanillaCriteria vc = new VentanillaCriteria();
		vc.createCriteria().andIdSucursalEqualTo(idSucursal).andIdAreaEqualTo(idArea);
		List<Ventanilla> list = new ArrayList<>();
		list = ventanillaDAO.selectByExample(vc);
		return list;
	}
	
	@Override
	public Ticket obtenerTicketXDni(String dni) throws Exception {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andNumeroIdentificacionEqualTo(dni).andFechaAtencionEqualTo(fechaActual);
		List<Ticket> list= new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		return list.get(0);//mostramos el ultimo registro de la persona en caso tenga una derivacion
	}

	@Override
	public void saveEvaluacionAtencion(Integer idTicket, Integer nota)
			throws Exception {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();
		Evaluador evaluador = new Evaluador();
		evaluador.setIdTicket(idTicket);
		evaluador.setCalificacion(nota);
		evaluador.setFecha(fechaActual);
		
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEvaluacion(nota);
		ticket.setEstado(60);
		ticketDAO.updateByPrimaryKeySelective(ticket);
		evaluadorDAO.insert(evaluador);
	}
	
	@Override
	public void saveEvaluacionAtencionPJ(String dni, Integer nota)
			throws Exception {
		// TODO Auto-generated method stub
		
		
		Date fechaActual = new Date();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andNumeroIdentificacionEqualTo(dni).andFechaAtencionEqualTo(fechaActual);
		List<Ticket> list = new ArrayList<>();
		Ticket ticket = null;
		list = ticketDAO.selectByExample(tc);
		if(list!=null && list.size()>0) {
			ticket = list.get(0);
		}
		else {
			throw new GenericExcepcion("error");
		}
		
		Evaluador evaluador = new Evaluador();
		evaluador.setIdTicket(ticket.getId());
		evaluador.setCalificacion(nota);
		evaluador.setFecha(fechaActual);

		Ticket ticket2 = new Ticket();
		ticket2.setId(ticket.getId());
		ticket2.setEvaluacion(nota);
		ticketDAO.updateByPrimaryKeySelective(ticket2);
		evaluadorDAO.insert(evaluador);
	}
	
	
	@Override
	public int getCantidadTicketGrupoEst31_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		int cant=0;
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idGrupo", idGrupo);
		param.put("idRolEquipo", idRolEquipo);
		try {
		 cant = ticketDAO.getCantidadTicketGrupoEst31_Alg3(param);
			System.out.println("TicketAlg3-->>>"+cant);
		} catch (Exception npe) {
        	cant=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("Finaliza controlado getCantidadTicketGrupoEst31_Alg3");
        }
		return cant;
	}
	@Override
	public int getMaximaSecuencia31_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub

		Map<String, Object> param = new HashMap<String, Object>();		
		int idtMaximaSecuencia=0;
		try {
			param.put("idGrupo", idGrupo);
			param.put("idRolEquipo", idRolEquipo);
			idtMaximaSecuencia = ticketDAO.getMaximaSecuencia31_Alg3(param);
			System.out.println("TicketAlg3-->>>"+idtMaximaSecuencia);
		} catch (Exception npe) {
        	idtMaximaSecuencia=0;
			System.out.println("algun error");
           
        }finally{
            System.out.println("finaliza controlado getMaximaSecuencia31_Alg3");
        }

		return idtMaximaSecuencia;
	}	
	@Override
	public int getCantidadTicketEst30_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int idcantidadticketAlg3=0;
		try {
			param.put("idGrupo", idGrupo);
			param.put("idRolEquipo", idRolEquipo);
			idcantidadticketAlg3 = ticketDAO.getCantidadTicketEst30_Alg3(param);
			System.out.println("TicketAlg3-->>>"+idcantidadticketAlg3);
		} catch (Exception npe) {
			idcantidadticketAlg3=0;
			System.out.println("algun error");
        }finally{

            System.out.println("finaliza controlado: getCantidadTicketEst30_Alg3");
        }

		return idcantidadticketAlg3;
	}	
	
	@Override
	public int getNextTicketEst0_Alg3(Integer idGrupo, Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();	
		int idticketAlg3;
		try {
			param.put("idGrupo", idGrupo);
			param.put("idRolEquipo", idRolEquipo);
			BeanTicketId beanTicketId = ticketDAO.getNextTicketEst0_Alg3(param);
			if (beanTicketId ==null ) idticketAlg3=0; else idticketAlg3=beanTicketId.getId();  
			System.out.println("TicketAlg3-->>>"+idticketAlg3);
		} catch (Exception npe) {
        	idticketAlg3=0;
			System.out.println("algun error");
        }finally{

            System.out.println("finaliza controlado");
        }

		return idticketAlg3;
	}	
	
	@Override
	public int getNextTicketSubGrupoEst30_Alg3(Integer idSubGrupo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		int idticketAlg3=0;
		try {
			param.put("idSubGrupo", idSubGrupo);
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketSubGrupoEst30_Alg3(param);
			 idticketAlg3=beanTicketId.getId();
			System.out.println("TicketAlg3-->>>"+idticketAlg3);
			
		} catch (Exception npe) {
        	idticketAlg3=0;
			System.out.println("algun error");
           
        }finally{
            System.out.println("finaliza controlada getNextTicketSubGrupoEst30_Alg3");
        }

		return idticketAlg3;
	}
	
		
	
	@Override
	public int getNextTicketGrupoEst31_Alg3(Integer idGrupo, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();	
		int iTicket_alg3=0;
		try {
			param.put("idGrupo", idGrupo);
			param.put("idUsuario", idUsuario);			
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketGrupoEst31_Alg3(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg3-->>>"+iTicket_alg3);
		} catch (Exception npe) {
        	iTicket_alg3=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("finaliza controlado getNextTicketGrupoEst31_Alg3");
        }

		return iTicket_alg3;
		
	}
	

	/*@Override
	public int getNextTicketGrupo_Alg_1_2(Integer idGrupo, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int iTicket_alg3=0;
		try {
			param.put("idGrupo", idGrupo);
			param.put("idUsuario", idUsuario);	
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketGrupo_Alg_1_2(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg2-->>>"+iTicket_alg3);
		} catch (Exception npe) {
        	iTicket_alg3=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("finaliza controlado getNextTicketGrupo_Alg_1_2");
        }

		return iTicket_alg3;
		
	}*/
	
	@Override
	public int getNextTicketGrupo_Alg_1_2(Integer idRolEquipo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int iTicket_alg3=0;
		try {
			param.put("idRolEquipo", idRolEquipo);	
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketGrupo_Alg_1_2(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg2-->>>"+iTicket_alg3);
		} catch (Exception npe) {
        	iTicket_alg3=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("finaliza controlado getNextTicketGrupo_Alg_1_2");
        }

		return iTicket_alg3;
		
	}
	
	@Override
	public int getNextTicketSubGrupo_Alg_1_2_VS(Integer idRolEquipo, Integer idSucursal, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int iTicket_alg3=0;
		try {
			param.put("idRolEquipo", idRolEquipo);	
			param.put("idSucursal", idSucursal);	
			param.put("idUsuario", idUsuario);	
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketSubGrupo_Alg_1_2_VS(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg2-->>>"+iTicket_alg3);
		} catch (Exception npe) {
        	iTicket_alg3=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("finaliza controlado getNextTicketGrupo_Alg_1_2");
        }

		return iTicket_alg3;
		
	}
	
	@Override
	public int getNextTicketSubGrupo_Alg_1_2_VA(Integer idRolEquipo, Integer idSucursal, Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int iTicket_alg3=0;
		try {
			param.put("idRolEquipo", idRolEquipo);	
			param.put("idSucursal", idSucursal);	
			param.put("idUsuario", idUsuario);	
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketSubGrupo_Alg_1_2_VA(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg2-->>>"+iTicket_alg3);
		} catch (Exception npe) {
			iTicket_alg3=0;
			System.out.println("algun error");
			
		}finally{
			System.out.println("finaliza controlado getNextTicketGrupo_Alg_1_2_VA");
		}
		return iTicket_alg3;
	}
	
	@Override
	public int getNextTicketSubGrupo(Integer idSubGrupo, Integer idRolEquipo, Integer idUsuario, Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		int iTicket_alg3=0;
		try {
			param.put("idSubGrupo", idSubGrupo);
			param.put("idRolEquipo", idRolEquipo);
			param.put("idUsuario", idUsuario);
			param.put("idSucursal", idSucursal);
			BeanTicketId beanTicketId =  ticketDAO.getNextTicketSubGrupo_Alg_1_2(param);
			iTicket_alg3=beanTicketId.getId();
			System.out.println("TicketAlg2-->>>"+iTicket_alg3);
		} catch (Exception npe) {
        	iTicket_alg3=0;
			System.out.println("algun error");
           
        }finally{

            System.out.println("finaliza controlado getNextTicketSuvGrupo_Alg_1_2");
        }

		return iTicket_alg3;
		
	}
	
	@Override
	public int getNextTicketObtiene(Integer idUsuario, Integer idSucursal, 
			Integer idRolEquipo, Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();
		int idTicket=0, npriorRatioAlg3=0;
		RolEquipoCriteria gcr = new RolEquipoCriteria();
		gcr.createCriteria().andIdEqualTo(idRolEquipo);
		List<RolEquipo> listRE = new ArrayList<>();
		listRE = rolEquipoDAO.selectByExample(gcr);
		if(listRE.get(0).getTipoEquipo().equals("VS")){
			if(listRE.get(0).getAlgoritmo() == 2) {
				List<BeanSubGrupoProporcion> listSubGrupoRolEquipo = this.getSubGrupoByRolEquipo(idUsuario, idRolEquipo, idSucursal);
				int cant1 = listSubGrupoRolEquipo.size();
				for(int k=0; k<cant1; k++) {
					/*if(listSubGrupoRolEquipo.get(k).getProporcionTeorica() == 1) {
						idTicket=this.getNextTicketSubGrupo_Alg_1_2_VS( idRolEquipo );
					}else {*/
						idTicket=this.getNextTicketSubGrupo(listSubGrupoRolEquipo.get(k).getIdSubGrupo(), idRolEquipo, idUsuario, idSucursal);
						if (idTicket==0){
							continue;
						}else{
							break;
						}	
					//}
						
				}
			}else if (listRE.get(0).getAlgoritmo() == 1){
				idTicket=this.getNextTicketSubGrupo_Alg_1_2_VS( idRolEquipo, idSucursal, idUsuario ); //getNextTicketSubGrupo_Alg_1_2_VS agregar nueva funcion
			}	
		} else if(listRE.get(0).getTipoEquipo().equals("VA")){
			if(listRE.get(0).getAlgoritmo() == 2) {
				List<BeanSubGrupoProporcion> listSubGrupoRolEquipo = this.getSubGrupoByRolEquipo(idUsuario, idRolEquipo, idSucursal);
				int cant1 = listSubGrupoRolEquipo.size();
				for(int k=0; k<cant1; k++) {
					idTicket=this.getNextTicketSubGrupo(listSubGrupoRolEquipo.get(k).getIdSubGrupo(), idRolEquipo, idUsuario, idSucursal);
					if (idTicket==0){
						continue;
					}else{
						break;
					}	
					//}
					
				}
			}else if (listRE.get(0).getAlgoritmo() == 1){
				idTicket=this.getNextTicketSubGrupo_Alg_1_2_VA( idRolEquipo, idSucursal, idUsuario );
			}	
		}
		else {
			List<BeanGrupoProporcion> listGrupoRolEquipo = this.getGrupoByRolEquipo(idUsuario, idRolEquipo);
			int cant1 = listGrupoRolEquipo.size();
			for(int k=0; k<cant1; k++) {
				List<SubGrupo> listSubGrupo = new ArrayList<>();
				listSubGrupo.addAll(this.getSubGrupoByIdGrupo(listGrupoRolEquipo.get(k).getIdGrupo()));			
				int cantSubGrupos = listSubGrupo.size();
				if  ( listGrupoRolEquipo.get(k).getIdAlgoritmo() ==1 || listGrupoRolEquipo.get(k).getIdAlgoritmo() ==2 ) {
					idTicket=this.getNextTicketGrupo_Alg_1_2(idRolEquipo); //listGrupoRolEquipo.get(k).getIdGrupo(), idUsuario
					if (idTicket==0){
						continue;
					}else{
						break;
					}
				} 
				else if (listGrupoRolEquipo.get(k).getIdAlgoritmo() ==3) {
					int cantReg3, cantMinima3, cantEntrada3, i, cantidadReg30_Alg3, maximaSecuenciaEst31_Alg3,cant_maximaSecuenciaEst31_Alg3, iSubgrupo;
					int priorRatioAlg3, cant_priorRatioAlg3;
					GrupoCriteria gcc = new GrupoCriteria();
					gcc.createCriteria().andIdEqualTo(listGrupoRolEquipo.get(k).getIdGrupo());
					List<Grupo> listG = new ArrayList<>();
					listG = grupoDAO.selectByExample(gcc);
					cantMinima3 = listG.get(0).getKioskoAlg3Minimo();
					cantEntrada3=listG.get(0).getKioskoAlg3Entrada();
					cantReg3=this.getCantidadTicketGrupoEst31_Alg3(listGrupoRolEquipo.get(k).getIdGrupo(),idRolEquipo);
					i=0;
					if (cantMinima3>=cantReg3) {
						//realizar el proceso de codificacion del Algoritmo3 para al estado 31
						while (i<cantEntrada3) {
							
							idTicket=this.getNextTicketEst0_Alg3(listGrupoRolEquipo.get(k).getIdGrupo(),idRolEquipo);
							i++;
							if (idTicket==0) break;
							//cambiando a estado 30.
							Ticket ticket = new Ticket();
							ticket.setId(idTicket);
							ticket.setEstado(30);
							ticketDAO.updateByPrimaryKeySelective(ticket);
						}
						cantidadReg30_Alg3=this.getCantidadTicketEst30_Alg3(listGrupoRolEquipo.get(k).getIdGrupo(),idRolEquipo);
						maximaSecuenciaEst31_Alg3=this.getMaximaSecuencia31_Alg3(listGrupoRolEquipo.get(k).getIdGrupo(),idRolEquipo);
						cant_maximaSecuenciaEst31_Alg3=0;
						List<SubGrupo> listSubGrupo3 = new ArrayList<>();
						listSubGrupo3.addAll(this.getSubGrupoByIdGrupoAlg3(listGrupoRolEquipo.get(k).getIdGrupo()));
						
						for(i=0; i<listSubGrupo3.size();i++) {
							priorRatioAlg3=listSubGrupo3.get(i).getPriorRatioAlg3();
							cant_priorRatioAlg3=0;
							while( true) {
								idTicket=this.getNextTicketSubGrupoEst30_Alg3(listSubGrupo3.get(i).getId());
								if (idTicket  >0) {
									if ((cant_priorRatioAlg3+1)>priorRatioAlg3)	break;
									cant_priorRatioAlg3++;
									maximaSecuenciaEst31_Alg3++;
									cant_maximaSecuenciaEst31_Alg3++;

									Ticket ticket = new Ticket();
									ticket.setId(idTicket);
									ticket.setEstado(31);
									ticket.setSecuenciaAlgo3Proporcion(maximaSecuenciaEst31_Alg3);
									ticketDAO.updateByPrimaryKeySelective(ticket);								
								}
								else break; // sale del while para el siguiente for

							}
							if (i==listSubGrupo3.size()-1)  
								if (cant_maximaSecuenciaEst31_Alg3<cantidadReg30_Alg3 ) i=-1;
							if (cantidadReg30_Alg3<=cant_maximaSecuenciaEst31_Alg3) break;
						}
						//entrega el siguiente ticket 31

					
					} 
					idTicket=this.getNextTicketGrupoEst31_Alg3(listGrupoRolEquipo.get(k).getIdGrupo(), idUsuario);
					if ( idTicket > 0 ) break;
				}
			}
		}
		return idTicket;
	}

	public int getValidaTicketPendiente(Integer idUsuario, Integer idSucursal, 
			Integer idRolEquipo, Integer idVentanilla)
	{
		Date fechaAtencion = new Date();
		int Cantidad=0;
		List<Ticket> list = new ArrayList<>();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria()
			.andFechaAtencionEqualTo(fechaAtencion)
			.andVentanillaIdUsuarioEqualTo(idUsuario)
			.andIdSucursalEqualTo(idSucursal)
			.andEstadoBetween(39, 59);
		tc.setOrderByClause("id asc");
		list = ticketDAO.selectByExample(tc);
		Cantidad=list.size();
		return Cantidad;
		
	}
	@Override
	public void getNextTicket(Integer idUsuario, Integer idSucursal, 
			Integer idRolEquipo, Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		int iNuevoTicket,cantidad_ticket_40_41_50_60=0;
		Date fechallamado = new Date();
		//revisar si no  hay ticket con estado
		cantidad_ticket_40_41_50_60=getValidaTicketPendiente(idUsuario, idSucursal, idRolEquipo, idVentanilla);
		if (cantidad_ticket_40_41_50_60==0)
		{
			iNuevoTicket=getNextTicketObtiene(idUsuario, idSucursal, idRolEquipo, idVentanilla);
			List<Ticket> list = new ArrayList<>();
			TicketCriteria tc = new TicketCriteria();
			tc.createCriteria().andIdEqualTo(iNuevoTicket);
			tc.setOrderByClause("id asc");
			list = ticketDAO.selectByExample(tc);
	//				tc.setOrderByClause("id asc");
	//				list = ticketDAO.selectByExample(tc);
			for(int i=0; i<list.size(); i++){
				if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO){
					list.get(i).setDescripcionEstado("LLAMANDO");
				}
				else if(list.get(i).getEstado()==Constante.ESTADO_LLAMANDO_MONITOR){
					list.get(i).setDescripcionEstado("LLAMANDO MONITOR");
				}
				else if(list.get(i).getEstado()==Constante.ESTADO_ATENCION){
					list.get(i).setDescripcionEstado("ATENDIENDO");
				}
				else if(list.get(i).getEstado()==Constante.ESTADO_FINALIZADO){
					list.get(i).setDescripcionEstado("FINALIZADO");
				}
				else if(list.get(i).getEstado()==Constante.ESTADO_REACTIVADO) {
					list.get(i).setDescripcionEstado("REACTIVADO");
				}
				else{
					list.get(i).setDescripcionEstado("EVALUANDO");
				}
			}
					
			if (list.size() > 0) {
				Ticket t = new Ticket(); 
				t = list.get(0);	
				t.setEstado(Constante.ESTADO_LLAMANDO);
				t.setVentanillaIdUsuario(idUsuario);
				t.setVentanillaCaja(idVentanilla);
				ticketDAO.updateByPrimaryKeySelective(t);
				
				try {
                    this.verificarNuevoTurno(idUsuario, idSucursal, null, idRolEquipo);
	            } catch (Exception e) {
                    e.printStackTrace();
	            }
			}
		}
	}
	
	@Override
	public void getNextTicketByGrupo(Integer idUsuario, Integer idSucursal, Integer idRolEquipo, Integer idVentanilla, Integer idGrupo) throws Exception {
		int iNuevoTicket, cantidad_ticket_40_41_50_60 = 0;
		Date fechallamado = new Date();
		
		cantidad_ticket_40_41_50_60 = getValidaTicketPendiente(idUsuario, idSucursal, idRolEquipo, idVentanilla);
		
		if (cantidad_ticket_40_41_50_60 == 0) {
			iNuevoTicket = getNextTicketObtieneByGrupo(idUsuario, idSucursal, idRolEquipo, idVentanilla, idGrupo);
			
			if (iNuevoTicket > 0) {
				List<Ticket> list = new ArrayList<>();
				TicketCriteria tc = new TicketCriteria();
				tc.createCriteria().andIdEqualTo(iNuevoTicket);
				tc.setOrderByClause("id asc");
				list = ticketDAO.selectByExample(tc);
				
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getEstado() == Constante.ESTADO_LLAMANDO) {
						list.get(i).setDescripcionEstado("LLAMANDO");
					} else if (list.get(i).getEstado() == Constante.ESTADO_LLAMANDO_MONITOR) {
						list.get(i).setDescripcionEstado("LLAMANDO MONITOR");
					} else if (list.get(i).getEstado() == Constante.ESTADO_ATENCION) {
						list.get(i).setDescripcionEstado("ATENDIENDO");
					} else if (list.get(i).getEstado() == Constante.ESTADO_FINALIZADO) {
						list.get(i).setDescripcionEstado("FINALIZADO");
					} else if (list.get(i).getEstado() == Constante.ESTADO_REACTIVADO) {
						list.get(i).setDescripcionEstado("REACTIVADO");
					} else {
						list.get(i).setDescripcionEstado("EVALUANDO");
					}
				}
				
				if (list.size() > 0) {
					Ticket t = new Ticket(); 
					t = list.get(0);	
					t.setEstado(Constante.ESTADO_LLAMANDO);
					t.setVentanillaIdUsuario(idUsuario);
					t.setVentanillaCaja(idVentanilla);
					ticketDAO.updateByPrimaryKeySelective(t);
					
					try {
						this.verificarNuevoTurno(idUsuario, idSucursal, null, idRolEquipo);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public int getNextTicketObtieneByGrupo(Integer idUsuario, Integer idSucursal, Integer idRolEquipo, Integer idVentanilla, Integer idGrupo) throws Exception {
		int idTicket = 0;
		BeanTicketId beanTicketId = null;
		RolEquipoCriteria gcr = new RolEquipoCriteria();
		gcr.createCriteria().andIdEqualTo(idRolEquipo);
		List<RolEquipo> listRE = new ArrayList<>();
		listRE = rolEquipoDAO.selectByExample(gcr);
		
		if (listRE.isEmpty()) {
			return 0;
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		param.put("idGrupo", idGrupo);
		param.put("idUsuario", idUsuario);
		param.put("idSucursal", idSucursal);
		
		if (listRE.get(0).getTipoEquipo().equals("VS")) {
			if (listRE.get(0).getAlgoritmo() == 2) {
				beanTicketId = ticketDAO.getNextTicketByGrupoAlg2(param);
				idTicket = beanTicketId.getId();
			} else if (listRE.get(0).getAlgoritmo() == 1) {
				beanTicketId = ticketDAO.getNextTicketByGrupoAlg1(param);
				idTicket = beanTicketId.getId();
			}
		} else if (listRE.get(0).getTipoEquipo().equals("VA")) {
			if (listRE.get(0).getAlgoritmo() == 2) {
				beanTicketId = ticketDAO.getNextTicketByGrupoAlg2(param);
				idTicket = beanTicketId.getId();
			} else if (listRE.get(0).getAlgoritmo() == 1) {
				beanTicketId = ticketDAO.getNextTicketByGrupoAlg1(param);
				idTicket = beanTicketId.getId();
			}
		}
		
		return idTicket;
	}

	@Override
	public List<SubGrupo> getSubGrupoByIdGrupoAlg3(Integer idGrupo)
			throws Exception {
		// TODO Auto-generated method stub
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo);
		sgc.setOrderByClause("id_prioridad asc");
		List<SubGrupo> list = new ArrayList<>();
		list = subGrupoDAO.selectByExample(sgc);
		return list;
	}
	
	
	@Override
	public int getCantidadTicketEspera(Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("estado", 0);
		param.put("idGrupo", idGrupo);
		int cant = ticketDAO.getCantidadTicketEspera(param);
		return cant;
	}
	@Override
	public int getCantidadTicketEsperaAllGrupo(Integer idRol, Integer idUsuario, Integer idVentanilla) throws Exception {
		// TODO Auto-generated method stub
		int cant;
		RolEquipoCriteria gcr = new RolEquipoCriteria();
		gcr.createCriteria().andIdEqualTo(idRol);
		List<RolEquipo> listRE = new ArrayList<>();
		listRE = rolEquipoDAO.selectByExample(gcr);
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("estado", 0);
		param.put("idRol", idRol);
		param.put("idUsuario", idUsuario);
		param.put("idVentanilla", idVentanilla);
		if	(listRE.get(0).getTipoEquipo().equals("VS")){
			cant = ticketDAO.getCantidadTicketEsperaAllSubGrupo(param);
		} else if (listRE.get(0).getTipoEquipo().equals("VA")){
			cant = ticketDAO.getCantidadTicketEsperaAllVentAdmin(param);
		} else {
			cant = ticketDAO.getCantidadTicketEsperaAllGrupo(param);
		}
		return cant;
	}	
	
	@Override
	public Integer getCantidadTicketEsperaByGrupo(Integer idRolEquipo, Integer idUsuario, Integer idVentanilla, Integer idGrupo) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idRolEquipo", idRolEquipo);
		param.put("idUsuario", idUsuario);
		param.put("idVentanilla", idVentanilla);
		param.put("idGrupo", idGrupo);
		
		return ticketDAO.getCantidadTicketEsperaByGrupo(param);
	}
	
	@Override
	public void activarLlamadoXAudio(Integer idTicket)
			throws Exception {
		// TODO Auto-generated method stub
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setActivaAudioTexto(1);
//		llamado.setvCodigo(codigo);
//		llamado.setiSubGrupo(idSubGrupo);
//		llamado.setvCaja(vNombreVentanilla);		
		ticketDAO.updateByPrimaryKeySelective(ticket);		
		
	}
	
	@Override
	public BeanTicketLlamado verificarNuevoLlamadoVoz(Integer iRolEquipo)
			throws Exception {
		// TODO Auto-generated method stub		
		
		Ticket ticket = new Ticket();
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idRolEquipo", iRolEquipo);
		List<BeanTicketLlamado> list= new ArrayList<>();
		list = ticketDAO.getListTicketCallVoz(param);
		if(list.size()>0){
			ticket.setId(list.get(0).getId());
			ticket.setActivaAudioTexto(0);
			ticketDAO.updateByPrimaryKeySelective(ticket);
			return list.get(0);
		}
		else{
			throw new GenericExcepcion("error");
		}
	}

	public static String peticionHttpGet(String urlParaVisitar) throws Exception {
		  // Esto es lo que vamos a devolver
		  StringBuilder resultado = new StringBuilder();
		  // Crear un objeto de tipo URL
		  URL url = new URL(urlParaVisitar);

		  // Abrir la conexi�n e indicar que ser� de tipo GET
		  HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
		  conexion.setRequestMethod("GET");
		  // B�feres para leer
		  BufferedReader rd = new BufferedReader(new InputStreamReader(conexion.getInputStream()));
		  String linea;
		  // Mientras el BufferedReader se pueda leer, agregar contenido a resultado
		  while ((linea = rd.readLine()) != null) {
		    resultado.append(linea);
		  }
		  // Cerrar el BufferedReader
		  rd.close();
		  // Regresar resultado, pero como cadena, no como StringBuilder
		  return resultado.toString();
		}
	public  String peticionHttpPost(String urlllamado, String sXMLdata) throws Exception {
		  // Esto es lo que vamos a devolver
		  StringBuilder resultado = new StringBuilder();
		  String respuesta="";
		  int nRastreo=0;
		  // Crear un objeto de tipo URL
		  URL url = new URL(urlllamado);

		  // Abrir la conexi�n e indicar que ser� de tipo GET
		  
		  HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
			// Set Headers
		  conexion.setConnectTimeout(20000);
		  conexion.setReadTimeout(20000);	
		  conexion.setDoOutput(true);
		  conexion.setUseCaches(true);

		  conexion.setRequestMethod("POST");

		  conexion.setRequestProperty("Accept", "application/xml");
		  conexion.setRequestProperty("Content-Type", "application/xml");
	  
		  // Write XML
		  DataOutputStream wr  = new DataOutputStream(conexion.getOutputStream());

		  byte[] bdata = sXMLdata.getBytes("UTF-8");
		  wr.write(bdata);
		  wr.flush();
		  wr.close();
		  BufferedReader br = new BufferedReader(new InputStreamReader( (conexion.getInputStream())));

		  String         linea="012345678901234567";
		  String cadenaInicio ="<NS1:res_persona>";
		  String cadenaFin    ="</NS1:res_persona>";
		  int i, hayRegistroInicio=0, hayRegistroFin=0;    
		  String cadena_inicio="";
		  
		  while((i=br.read())!=-1){    
			  linea=(linea+(char)i).substring(1,19);
			  if (linea.indexOf(cadenaInicio)!=-1) {
				   System.out.println(" la cadena de inicio es:\n"+linea);
				  	  hayRegistroInicio=1;
			  }

			  if (linea.indexOf(cadenaFin)!=-1) {
				   System.out.println(" la cadena de Fin es:\n"+linea);				  
				  hayRegistroFin =1;
				  respuesta=respuesta +(char)i;
				  break;
			  }
			  if ((hayRegistroInicio==1) && (hayRegistroFin==0)){
				  respuesta=respuesta +(char)i;
			  }			  
			  
		   }  
		  if ((hayRegistroInicio==1) && (hayRegistroFin==1)){
			  respuesta=cadenaInicio.substring(0,16)+respuesta;
		  }	
		  else {
			  respuesta= cadenaInicio+cadenaFin;
		  }
		   System.out.println(" la cadena de respuesta es:"+respuesta);
		  br.close();      
		  conexion.disconnect();
		  return respuesta;
	}
	@Override
	public String obtenerPersonaByDni(String nroDni) throws Exception {
		// TODO Auto-generated method stub
		String url;
		int tiene_proxy=parametroNumero("009").intValue();

		String proxy_server=parametroDescripcion("010");
		String proxy_puertodesc=parametroDescripcion("011");
		int proxy_puerto = Integer.parseInt(proxy_puertodesc);
		String proxy_usuario=parametroDescripcion("012");
		String proxy_passqword=parametroDescripcion("013");
		int tiene_url_passw=parametroNumero("014").intValue();
		String url_ini=parametroDescripcion("015");
		String pass=parametroDescripcion("016");
		url=cambiaparametroEspecial(url_ini, "##Dni##", nroDni);
		if (tiene_url_passw==1){
			url=cambiaparametroEspecial(url, "##pass##", pass);
		}
		String respuesta="";
		URL obj = new URL(url);
		if (tiene_proxy==1){
			Proxy proxy =new Proxy(Proxy.Type.HTTP, new InetSocketAddress(proxy_server, proxy_puerto));
			URLConnectionProxy conn = new URLConnectionProxy();
			conn.setProxy(proxy_server, proxy_puerto, proxy_usuario, proxy_passqword);
			respuesta=conn.getString(url);
		} else {
			try {
				respuesta = peticionHttpGet(url);
				System.out.println("La respuesta  es: \n "+ respuesta);
			}
			catch (Exception e) {
			
				e.printStackTrace();
			}

			
		}
		return respuesta;
	}
	@Override
	public String obtenerPersonaByDniSOAP(String nroDni) throws Exception {
		// TODO Auto-generated method stub
		String url="";
		String respuesta="";
		int tiene_proxy=parametroNumero("009").intValue();

		String proxy_server=parametroDescripcion("010");
		String proxy_puertodesc=parametroDescripcion("011");
		int proxy_puerto = Integer.parseInt(proxy_puertodesc);
		String proxy_usuario=parametroDescripcion("012");
		String proxy_passqword=parametroDescripcion("013");

		url=parametroDescripcion("300");
		int tiene_xml=parametroNumero("300").intValue();
		byte[] datablob_xml=parametroBlob("300");
		String datablob_string="";
	   InputStream is = null;
	   BufferedReader bfReader = null;

	   is = new ByteArrayInputStream(datablob_xml);
	   bfReader = new BufferedReader(new InputStreamReader(is));
	   String temp = null;
	   while((temp = bfReader.readLine()) != null){
		   datablob_string=datablob_string+temp;
	   }
		if (tiene_xml==1){
			datablob_string=cambiaparametroEspecial(datablob_string, "##Dni##", nroDni);
		}


		if (tiene_proxy==1){
			respuesta=null;
		} else {
			try {
				respuesta = peticionHttpPost(url, datablob_string);
				System.out.println("sale del POST function \n ");
			}
			catch (Exception e) {
			
				e.printStackTrace();
			}
		}
		return respuesta;
	}	

	@Override
	public String reimiprimitticketessaludcusco(String dni, String fecha, String centro) throws Exception {
		// TODO Auto-generated method stub
		String url;
		int tiene_proxy=parametroNumero("009").intValue();

		String proxy_server=parametroDescripcion("010");
		String proxy_puertodesc=parametroDescripcion("011");
		int proxy_puerto = Integer.parseInt(proxy_puertodesc);
		String proxy_usuario=parametroDescripcion("012");
		String proxy_passqword=parametroDescripcion("013");
		int tiene_url_passw=parametroNumero("014").intValue();
		String url_ini=parametroDescripcion("200");
		String pass=parametroDescripcion("016");
		url=cambiaparametroEspecial(url_ini, "##Dni##", dni);
		url=cambiaparametroEspecial(url, "##fecha##", fecha);
		url=cambiaparametroEspecial(url, "##centro##", centro);
		if (tiene_url_passw==1){
			url=cambiaparametroEspecial(url, "##pass##", pass);
		}
		String respuesta="";
		URL obj = new URL(url);		
		if (tiene_proxy==1){
			Proxy proxy =new Proxy(Proxy.Type.HTTP, new InetSocketAddress(proxy_server, proxy_puerto));
			URLConnectionProxy conn = new URLConnectionProxy();
			conn.setProxy(proxy_server, proxy_puerto, proxy_usuario, proxy_passqword);
			respuesta=conn.getString(url);
		} else {
			try {	
				System.out.println(url);
				respuesta = peticionHttpGet(url);
				System.out.println("La respuesta  es: \n "+ respuesta);
			}
			catch (Exception e) {
			
				e.printStackTrace();
			}

			
		}
		return respuesta;
	}
	
	
	public String cambiaparametroEspecial(String pcadena, String pparametro, String pcambio)
	{
		 return pcadena.replaceAll(pparametro, pcambio);
	}
	@Override
	public List<BeanTicketXReporte> listarTicketXGestion(Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		Date fechaAtencion = new Date(); 
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fechaAtencion", fechaAtencion);
		param.put("estado", 0);
		List<BeanTicketXReporte> list = new ArrayList<>();
		list = ticketDAO.getResultGestionTicket(param);
		return list;
	}
	@Override
	public List<BeanTicketXArea> GestionTicket_1(Integer idUsuario, Integer idSucursal, Integer idArea, Integer idVentanilla, Integer idGrupo, Integer idOperador, Integer idEstado, String cApellido) 
			throws Exception{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		param.put("idSucursal", idSucursal);
		param.put("idArea", idArea);
		param.put("idVentanilla", idVentanilla);
		param.put("idGrupo", idGrupo);
		param.put("idOperador", idOperador);
		param.put("idEstado", idEstado);
		param.put("cApellido", cApellido);
		int ApellidoSino=parametroNumero("110").intValue();
		List<BeanTicketXArea> list = new ArrayList<>();
		
		if (ApellidoSino==1) 	{list = ticketDAO.GestionTicket_1_Apellido(param);}
		else list = ticketDAO.GestionTicket_1_Codigo(param);
		return list;		
		
	};
		
	@Override
	public void anularTicket(Integer idTicket, Integer idSucursal, Integer tipoAnulacion, String descripcion, Integer motivo)
			throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		Adicionales adicionales = new Adicionales();
		adicionales.setIdTicket(idTicket);
		adicionales.setIdSucursal(idSucursal);
		adicionales.setTipo(tipoAnulacion);
		adicionales.setDescripcion(descripcion);
		adicionales.setFechaAnulacion(fecha);
		adicionalesDAO.insertSelective(adicionales);
		
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEstado(motivo);
		ticketDAO.updateByPrimaryKeySelective(ticket);
	}

	@Override
	public void activarticketpasado(Integer idTicket)
			throws Exception {
		// TODO Auto-generated method stub
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEstado(0);
		ticket.setActivaAudioTexto(0);
		ticketDAO.updateByPrimaryKeySelective(ticket);
	}

	@Override
	public void Reactivarticket(Integer idTicket)
			throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		Ticket ticket = new Ticket();
		ticket.setId(idTicket);
		ticket.setEstado(91);
		ticket.setActivaAudioTexto(0);
		ticketDAO.updateByPrimaryKeySelective(ticket);
	}
	
	@Override
	public List<BeanTicketXReporte> listarTicketXReporte(Integer idSucursal, Integer idArea)
			throws Exception {
		// TODO Auto-generated method stub
		Date fechaAtencion = new Date(); 
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fechaAtencion", fechaAtencion);
		param.put("estado", 0);
		param.put("idArea", idArea);
		List<BeanTicketXReporte> list = new ArrayList<>();
		list = ticketDAO.getResultConsultaTicket(param);
		return list;
	}
	
	@Override
	public List<Ticket> getProximosTurnos(Integer idSucursal) throws Exception {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();		
		TicketCriteria tk = new TicketCriteria();
		tk.createCriteria().andEstadoEqualTo(0).andFechaAtencionEqualTo(fechaActual);		
		tk.setOrderByClause("id asc");		
		List<Ticket> list= new ArrayList<>();
		list = ticketDAO.selectByExample(tk);
		return list;
	}
	@Override
	public List<BeanTicketAreaproxTurno> getProximosTurnosArea(Integer idSucursal, Integer idArea) throws Exception {
		Date fechaAtencion = new Date(); 
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fechaAtencion", fechaAtencion);
		param.put("estado", 0);
		param.put("idArea", idArea);
		param.put("idSucursal", idSucursal);
		
		List<BeanTicketAreaproxTurno> list = new ArrayList<>();
		list = ticketDAO.getProximosTurnosArea(param);
		return list;

	}
	@Override
	public Ticket generarTicketAtencionByBalanceo(Integer idRol, Integer idAgrupador, String dni, Integer tipoDoc,
			String persona) throws Exception {
		// TODO Auto-generated method stub

		List<BeanGrupoProporcion> listGrupoRolEquipo = this.getGrupoByRolEquipoBalanceo(idRol);
		int cant1 = listGrupoRolEquipo.size();
		int idGrupo=0, idSubgrupo=0;
		String prefijoGrupo="";
		idGrupo= listGrupoRolEquipo.get(0).getIdGrupo();
		
		Grupo grupo = new Grupo();
		grupo = grupoDAO.selectByPrimaryKey(idGrupo);
		prefijoGrupo = grupo.getPrefijo();
		
		SubGrupoCriteria sgc = new SubGrupoCriteria();
		sgc.createCriteria().andIdGrupoEqualTo(idGrupo).andAgrupadorEqualTo(idAgrupador);
		List<SubGrupo> listSubGrupo = new ArrayList<>();
		listSubGrupo = subGrupoDAO.selectByExample(sgc);
		SubGrupo subGrupo = new SubGrupo();
		if(listSubGrupo.size()>=0) {
			subGrupo = listSubGrupo.get(0);
		}
		
		//generar ticket
		Secuencia sec = new Secuencia();
		idSubgrupo=subGrupo.getId().intValue();
		sec = this.ultimoTicketRegistradoBalanceo(idSubgrupo, prefijoGrupo+"-"+subGrupo.getPrefijo());
		int secuenciador = sec.getSecuencia();
		int valor = secuenciador+1;
		Date fechaMod = new Date();
		Secuencia secuencia = new Secuencia();
		secuencia.setSecuencia(valor);
		secuencia.setIdSubgrupo(idSubgrupo);		
		secuencia.setCodGrupo(prefijoGrupo+"-"+subGrupo.getPrefijo());
		secuenciaDAO.insertSelective(secuencia);
		System.out.println("prefijo: "+prefijoGrupo+""+subGrupo.getPrefijo());
		String codigo = prefijoGrupo+"-"+subGrupo.getPrefijo()+""+valor;
		
		System.out.println("valor: "+valor);
		
	    Date date = new Date();

		Ticket ticket = new Ticket();
		ticket.setCodigo(codigo);
		ticket.setHoraEmision(date);
		ticket.setHoraInicioAtencion(null);
		ticket.setHoraFinAtencion(null);
		ticket.setIdSubgrupo(subGrupo.getId());
		ticket.setNumeroIdentificacion(dni);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(ticket.getHoraEmision());
		
		Date tempDate = cal.getTime();
		System.out.println("Fecha actual: " + tempDate);
		
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE) + getSubGrupoByIdBalanceo(subGrupo.getId()).getPriorTiempoAlg2());
		tempDate = cal.getTime();
		System.out.println("Hora modificada: " + tempDate);

		ticket.setFechaHoraProgAlg2Tiempo(cal.getTime());
		
		ticket.setEstado(Constante.ESTADO_INICIO);
		ticket.setSecuenciaAlgo3Proporcion(0);
		ticket.setIdTicketDerivado(0);
		ticket.setNombreSubgrupo(subGrupo.getNombre());
		ticket.setPrefijo(prefijoGrupo+""+subGrupo.getPrefijo());
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
	public Secuencia ultimoTicketRegistradoBalanceo(int subgrupo, String prefijo) {
		// TODO Auto-generated method stub
		SecuenciaCriteria sc = new SecuenciaCriteria();
		sc.createCriteria().andIdSubgrupoEqualTo(subgrupo);	
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
			secuenciaDAO.insertSelective(s);
			secuencia = s;
		}
		return secuencia;
	}

//20191201 VBR cambio de proceso
	@Override
	public Ticket sonidoTimbre(Integer iRolEquipo) throws Exception{
		// TODO Auto-generated method stub		
		
		Map<String, Object> param = new HashMap<String, Object>();	
		int idticket;

		param.put("iRolEquipo", iRolEquipo);
		BeanTicketIdSonido beanTicketId = ticketDAO.sonidoTimbreTicket(param);
		idticket = beanTicketId.getId();
		System.out.println("idticket->>>"+idticket);
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andIdEqualTo(idticket);
		tc.setOrderByClause("id asc");
		List<Ticket> list = new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		System.out.println("Ticket Sonido-->>>"+idticket);
		if(list.size()>0){
			Ticket ticket2 = new Ticket();
			ticket2.setId(list.get(0).getId());
			ticket2.setEnviaAudio(0);
			ticketDAO.updateByPrimaryKeySelective(ticket2);
			return list.get(0);
		}
		else{
			throw new GenericExcepcion("error");
		}			

	}	
	
	
	@Override
	public SubGrupo getSubGrupoByIdBalanceo(Integer idSubGrupo) throws Exception {
		// TODO Auto-generated method stub
		SubGrupo subGrupo= new SubGrupo();
		subGrupo = subGrupoDAO.selectByPrimaryKey(idSubGrupo);
		return subGrupo;
	}

	@Override
	public Parametro evaluarTicket(String codigo) throws Exception {
		// TODO Auto-generated method stub
		ParametroCriteria pr = new ParametroCriteria();
		pr.createCriteria().andCodigoEqualTo(codigo);
		List<Parametro> list= new ArrayList<>();
		list = parametroDAO.selectByExampleWithoutBLOBs(pr);
		return list.get(0);
	}

	
	
	//VBR
	public String parametroDescripcion(String codigo) throws Exception {
		// TODO Auto-generated method stub
		ParametroCriteria pr = new ParametroCriteria();
		pr.createCriteria().andCodigoEqualTo(codigo);
		List<Parametro> list= new ArrayList<>();
		list = parametroDAO.selectByExampleWithoutBLOBs(pr);
		return list.get(0).getDescripcionLarga();
	}	
	public byte[] parametroBlob(String codigo) throws Exception {
		// TODO Auto-generated method stub
		ParametroCriteria pr = new ParametroCriteria();
		pr.createCriteria().andCodigoEqualTo(codigo);
		List<Parametro> list= new ArrayList<>();
		list = parametroDAO.selectByExampleWithBLOBs(pr);
		return list.get(0).getBlobdata();
	}
	public BigDecimal parametroNumero(String codigo) throws Exception {
		// TODO Auto-generated method stub
		ParametroCriteria pr = new ParametroCriteria();
		pr.createCriteria().andCodigoEqualTo(codigo);
		List<Parametro> list= new ArrayList<>();
		list = parametroDAO.selectByExampleWithoutBLOBs(pr);
		return list.get(0).getValor();
	}		
	@Override
	public int ConcluyeEvaluacionEspera(Integer idTicket) throws Exception {
		// TODO Auto-generated method stub
		List<Ticket> list = new ArrayList<>();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andIdEqualTo(idTicket);
		tc.setOrderByClause("id asc");
		list = ticketDAO.selectByExample(tc);
//				tc.setOrderByClause("id asc");
//				list = ticketDAO.selectByExample(tc);
		if (list.size() > 0) {
			Ticket t = new Ticket();
			t = list.get(0);	
			if (list.get(0).getEstado().equals(51) ) {
				t.setEstado(60);
				t.setEvaluacion(1);
				ticketDAO.updateByPrimaryKeySelective(t);
			}

		}
		return 0;
	}
	@Override
	public int consultaApellidoSino( Integer idSucursal)	throws Exception{
		int rspta =0;
		 rspta=parametroNumero("110").intValue();
		 return rspta;
	}
	@Override
	public int ActivaNotificacionVentanilla(Integer idVentanilla)	throws Exception{	
		VentanillaCriteria v1 = new VentanillaCriteria();
		v1.createCriteria().andIdEqualTo(idVentanilla);
		List<Ventanilla> listv1 = new ArrayList<>();
		listv1 = ventanillaDAO.selectByExample(v1);
		if (listv1.size()>0) {
			return listv1.get(0).getNotificacionId();//mostramos el ultimo ticket  que tiene la ventanilla con estado 51  fecha actual
		}else return 0;

	}
	
	@Override
	public Integer habilitarSacadoTicketSiNo(String dni, int tipodoc) throws Exception {
		// TODO Auto-generated method stub
		
		int rspta =0;
		int tiempo=parametroNumero("013").intValue();


		
		System.out.println("tiempo->>>"+tiempo);
		Date fechaActual = new Date();
		int minPermitido=tiempo;
		System.out.println("minPermitido->>>"+minPermitido);
		if(this.findTicketByDniAndFechaActual(dni, tipodoc)!=null){
			DateFormat hora = new SimpleDateFormat("HH:mm:ss");
			String horaEmision = hora.format(this.findTicketByDniAndFechaActual(dni, tipodoc).getHoraEmision());
			String horaActual = hora.format(fechaActual);
			Date fechaEmision = hora.parse(horaEmision);
			Date fechaReal = hora.parse(horaActual);
			long tiempoFinal=fechaReal.getTime();
			long tiempoInicial=fechaEmision.getTime();
			long resta=tiempoFinal - tiempoInicial;
			resta=resta /(1000*60);
			int valor = (int)resta;
			System.out.println("valor->>>"+valor);
			if(valor<=minPermitido) {
				rspta=0;//no permite generar ticket
			}
			else {
				rspta=1;//permite generar ticket
			}
//			throw new GenericExcepcion("Ya existe un usuario con el nombre <b>"+usuario.getvUsuarioUsername()+"</b>.");
		}	
		else {
			rspta=1;
		}
		System.out.println("rspta->>>"+rspta);	
		return rspta;
	}
	
	@Override
	public Ticket findTicketByDniAndFechaActual(String dni, int tipodoc) {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andTipoIdentificacionEqualTo(tipodoc).andNumeroIdentificacionEqualTo(dni).andFechaAtencionEqualTo(fechaActual);
		tc.setOrderByClause("id desc");
		
		Ticket ticket = null;
		List<Ticket> listTicket = ticketDAO.selectByExample(tc);
		if(listTicket!=null && listTicket.size()>0) {
			ticket = listTicket.get(0);
		}
		return ticket;
		
	}
	
	@Override
	public Ticket obtenerTicketXNumero(String numero) throws Exception {
		// TODO Auto-generated method stub
		Date fechaActual = new Date();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andCodigoEqualTo(numero).andFechaAtencionEqualTo(fechaActual);
		List<Ticket> list= new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		return list.get(0);//mostramos el ultimo registro de la persona en caso tenga una derivacion
	}

	@Override
	public void actulizarMonitorcajas() throws Exception {
		// TODO Auto-generated method stub
		ticketDAO.actulizarMonitorcajas();
		
		MonitorCajasCriteria mcc = new MonitorCajasCriteria();
		mcc.createCriteria();
		
//		monitorCajasDAO.updateByExampleSelective(record, example);
	}
	
	@Override
	public Ticket obtenerUltimoTicket(String pip) throws Exception {
		VentanillaCriteria v1 = new VentanillaCriteria();
		v1.createCriteria().andPuertoEqualTo(pip);
		List<Ventanilla> listv1 = new ArrayList<>();
		listv1 = ventanillaDAO.selectByExample(v1);
		if (listv1.size()>0) {
			Date fechaActual = new Date();
			TicketCriteria tc = new TicketCriteria();
			tc.createCriteria().andVentanillaCajaEqualTo(listv1.get(0).getId()).andEstadoEqualTo(51).andFechaAtencionEqualTo(fechaActual);
			List<Ticket> list= new ArrayList<>();
			list = ticketDAO.selectByExample(tc);

			return list.get(0);//mostramos el ultimo ticket  que tiene la ventanilla con estado 51  fecha actual
			
		}else return null;
	}

	@Override
	public List<Area> consultaAreaRolMonitor(Integer idUsuario) throws Exception {
		
		Area area = new Area();
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idUsuario", idUsuario);
		List<BeanId> listAreaid= new ArrayList<>();
		listAreaid = areaDAO.listarAreaGrupoID(param);
		List<Area> list = new ArrayList<>();
		
		for(int j=0; j<listAreaid.size(); j++){
			area = areaDAO.selectByPrimaryKey(listAreaid.get(j).getId());
			list.add(area);
		}
		return list;
	}
	
	@Override
	public int consultaConfirmacion( Integer idSucursal)	throws Exception{
		int rspta =0;
		 rspta=parametroNumero("303").intValue();
		 return rspta;
	}

	@Override
	public BeanTicketLlamado verificarNuevoLlamadoVozSecundario(Integer iRolEquipo)
			throws Exception {
		// TODO Auto-generated method stub		
		
		Ticket ticket = new Ticket();
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("idRolEquipo", iRolEquipo);
		List<BeanTicketLlamado> list= new ArrayList<>();
		list = ticketDAO.getListTicketCallVoz(param);
		return list.get(0);
	}
	@Override
	public Ticket sonidoTimbreSecundario(Integer iRolEquipo) throws Exception{
		// TODO Auto-generated method stub		
		
		Map<String, Object> param = new HashMap<String, Object>();	
		int idticket;

		param.put("iRolEquipo", iRolEquipo);
		BeanTicketIdSonido beanTicketId = ticketDAO.sonidoTimbreTicket(param);
		idticket = beanTicketId.getId();
		System.out.println("idticket->>>"+idticket);
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria().andIdEqualTo(idticket);
		tc.setOrderByClause("id asc");
		List<Ticket> list = new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		System.out.println("Ticket Sonido-->>>"+idticket);		
		return list.get(0);
	}
	
	@Override
	public void saveRutaAudio(Integer idTicket, String rutaAudio, Integer idSucursal)
			throws Exception {
		// TODO Auto-generated method stub
		Date fecha = new Date();
		Audio audio = new Audio();
		audio.setIdTicket(idTicket);
		audio.setIdSucursal(idSucursal);
		audio.setRuta(rutaAudio);
		audio.setFecha(fecha);
		audioDAO.insertSelective(audio);
	}
	
	@Override
	public Ticket getLastTicketByWindow(Integer idVentanilla) throws Exception {
		Date fechaActual = new Date();
		TicketCriteria tc = new TicketCriteria();
		tc.createCriteria() 
			.andVentanillaCajaEqualTo(idVentanilla)
			.andEstadoEqualTo(Constante.ESTADO_EVALUANDO)
			.andFechaAtencionEqualTo(fechaActual);
		tc.setOrderByClause("id DESC");
		List<Ticket> list= new ArrayList<>();
		list = ticketDAO.selectByExample(tc);
		
		if (list.isEmpty()) {
		    return null; 
		}
		return list.get(0);
	}	
	
	@Override
	public List<MotivoAusencia> listarMotivoAusencia() throws Exception {
		MotivoAusenciaCriteria fbc = new MotivoAusenciaCriteria();
		fbc.createCriteria();
		List<MotivoAusencia> list = new ArrayList<>();
		list = motivoAusenciaDAO.selectByExample(fbc);
		return list;
	}
	
	@Override
	public BeanUsuarioAusencia getDataUserAbsence(Integer idUsuario) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		
		List<BeanUsuarioAusencia> list = usuarioAusenciaDAO.getDataUserAbsence(param);

		if (list.isEmpty()) {
			return null;
		}
		
		BeanUsuarioAusencia absence = list.get(0);
		
		return absence;
	}
	
	@Override
	public UsuarioAusencia insertUserAbsence(Integer idUsuario, Integer motivoAusencia) throws Exception {
		System.out.println("Entro a insertar ausencia");
		Date fecha = new Date();
		UsuarioAusencia ausencia = new UsuarioAusencia();
		ausencia.setIdUsuario(idUsuario);
		ausencia.setIdMotivoAusencia(motivoAusencia);
		ausencia.setHoraInicio(fecha);
		ausencia.setFecha(fecha);
		ausencia.setEstado(1);
		usuarioAusenciaDAO.insertSelective(ausencia);
		return ausencia;
	}
	
	@Override
	public UsuarioAusencia updateUserAbsence(Integer idAusencia, Integer idUsuario) throws Exception {
		System.out.println("Entro a editar ausencia");
		Date fecha = new Date();
		UsuarioAusencia ausencia = new UsuarioAusencia();
		ausencia.setId(idAusencia);
		ausencia.setIdUsuario(idUsuario);
		ausencia.setHoraFin(fecha);
		ausencia.setEstado(0);
		usuarioAusenciaDAO.updateByPrimaryKeySelective(ausencia);
		return ausencia;
	}
	
    @Override
	public int contarTicketAtendidosDia(Map<String,Object> params) {
		return ticketDAO.contarTicketAtendidosDia(params);
	}
    
    @Override
	public List<TipoDocumento> listarTipoDocumentoXGeneraTicket() throws Exception {
		TipoDocumentoCriteria ekc = new TipoDocumentoCriteria();
		ekc.createCriteria();
		List<TipoDocumento> list = new ArrayList<>();
		list = tipoDocumentoDAO.selectByExample(ekc);
		return list;
	}
}
