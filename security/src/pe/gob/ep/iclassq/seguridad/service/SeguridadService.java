package pe.gob.ep.iclassq.seguridad.service;

import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import javax.management.MalformedObjectNameException;
import javax.servlet.http.HttpSession;

import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.ticket.service.TicketService;

public interface SeguridadService {
	public List<UsuarioRol> findRolesByUserName(String username, HttpSession session) throws Exception;
	public String obtenerOpcionesPorRol(Integer idRol) throws Exception;
	public String strMenuRecursivo(List<Map<String, Object>> opcionesPorRol) throws Exception;
	
	public String obtenerTreeOpcionesPorRol(Integer idRol) throws Exception;
	public String strTreeRecursivo(List<Map<String, Object>> opcionesPorRol) throws Exception;
	public Map<String, Object> insertOpcionPorRol(Rol rol) throws Exception;
	
	public Integer getEmpresaByIdSucursal(Integer idSucursal) throws Exception;
	
	public String getIpAddressAndPort() throws MalformedObjectNameException, NullPointerException, UnknownHostException;
	public String getPublicIpAddressAndPort() throws Exception;
	public Usuario getIpAcceso(String pip)  throws Exception;
}
