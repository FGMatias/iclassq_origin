package pe.gob.ep.iclassq.seguridad.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.seguridad.bean.Rol;
import pe.gob.ep.iclassq.seguridad.bean.RolCriteria;
import pe.gob.ep.iclassq.seguridad.bean.RolOpcion;
import pe.gob.ep.iclassq.seguridad.bean.RolOpcionCriteria;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRol;
import pe.gob.ep.iclassq.seguridad.bean.UsuarioRolCriteria;
import pe.gob.ep.iclassq.seguridad.bean.RolCriteria.Criteria;
import pe.gob.ep.iclassq.seguridad.dao.RolDAO;
import pe.gob.ep.iclassq.seguridad.dao.RolOpcionDAO;
import pe.gob.ep.iclassq.seguridad.dao.UsuarioRolDAO;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Util;

@Service
public class RolServiceImpl implements RolService {

	@Autowired
	private RolDAO rolDAO;
	
	@Autowired
	private UsuarioRolDAO usuarioRolDAO;
	
	@Autowired
	private RolOpcionDAO rolOpcionDAO;
	
	@Override
	public List<Rol> findAll(Rol rol) throws Exception {
		// TODO Auto-generated method stub
		
		RolCriteria rolCriteria=new RolCriteria();
		Criteria criteria=rolCriteria.createCriteria();
		
		if(rol.getiRolId()!=null){
			criteria.andIRolEstadoEqualTo(rol.getiRolId());
		}else{
			criteria.andIRolEstadoEqualTo(Constante.ESTADO_ACTIVO);
		}
		
		if(rol.getvRolNombre()!=null){
			criteria.andVRolNombreLike(rol.getvRolNombre());
		}
			
		List<Rol> list=rolDAO.selectByExample(rolCriteria);
		
		return list;
	}

	@Override
	public Rol findByPk(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		return rolDAO.selectByPrimaryKey(idRol);
	}

	private void validarRolExistente(Rol rol) throws Exception{
		RolCriteria rc=new RolCriteria();
		rc.createCriteria().andVRolNombreEqualTo(rol.getvRolNombre()).andIRolEstadoEqualTo(Constante.ESTADO_ACTIVO);
		if(rolDAO.countByExample(rc)>0){
			throw new GenericExcepcion("El nombre del rol ingresado ya existe");
		}
	}
	
	@Override
	public Rol save(Rol rol) throws Exception {
		// TODO Auto-generated method stub
		
		if(rol.getiRolId()==null){
			validarRolExistente(rol);
			rol.setiRolEstado(Constante.ESTADO_ACTIVO);
			rolDAO.insertSelective(rol);
		}else{
			Rol rolActual=rolDAO.selectByPrimaryKey(rol.getiRolId());
			if(!rolActual.getvRolNombre().equalsIgnoreCase(rol.getvRolNombre())){
				validarRolExistente(rol);
			}
			rolDAO.updateByPrimaryKeySelective(rol);
		}
		
		return rol;
	}

	@Override
	public void delete(Rol rol) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByPk(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		
		RolOpcionCriteria roc=new RolOpcionCriteria();
		roc.createCriteria().andIRolxopcionRolIdEqualTo(idRol);
		
		if(rolOpcionDAO.countByExample(roc)>0){
			throw new GenericExcepcion("El rol no puede ser eliminado debido a que tiene relacionado opciones del sistema.");
		}
		
		Rol rol=new Rol();
		rol.setiRolId(idRol);
		rol.setiRolEstado(Constante.ESTADO_INACTIVO);
		rolDAO.updateByPrimaryKeySelective(rol);

	}

	@Override
	public List<UsuarioRol> getRolesByIdUsuario(Integer idUsuario)
			throws Exception {
		// TODO Auto-generated method stub

		UsuarioRolCriteria usuarioRolCriteria = new UsuarioRolCriteria();
		usuarioRolCriteria.createCriteria().andIUsuarioxrolUsuarioIdEqualTo(idUsuario);

		List<UsuarioRol> rolesPorUsuario = usuarioRolDAO.selectByExample(usuarioRolCriteria);

		if (rolesPorUsuario == null) {
			rolesPorUsuario = new ArrayList<UsuarioRol>();
		} else {
			if (rolesPorUsuario.size() > 0) {
				for (UsuarioRol usuarioRol : rolesPorUsuario) {
					usuarioRol.setRol(this.findByPk(usuarioRol.getiUsuarioxrolRolId()));
				}
			}
		}
		return rolesPorUsuario;
	}
}
