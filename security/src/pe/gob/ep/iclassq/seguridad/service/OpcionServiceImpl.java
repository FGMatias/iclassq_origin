package pe.gob.ep.iclassq.seguridad.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.gob.ep.iclassq.excepcion.GenericExcepcion;
import pe.gob.ep.iclassq.seguridad.bean.Opcion;
import pe.gob.ep.iclassq.seguridad.bean.OpcionCriteria;
import pe.gob.ep.iclassq.seguridad.bean.RolOpcionCriteria;
import pe.gob.ep.iclassq.seguridad.bean.OpcionCriteria.Criteria;
import pe.gob.ep.iclassq.seguridad.dao.OpcionDAO;
import pe.gob.ep.iclassq.seguridad.dao.RolOpcionDAO;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.Util;

@Service
public class OpcionServiceImpl implements OpcionService {

	@Autowired
	private OpcionDAO opcionDAO;
	
	@Autowired
	private RolOpcionDAO rolOpcionDAO;
	
	@Override
	public List<Opcion> findAll(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		OpcionCriteria opcionCriteria=new OpcionCriteria();
		Criteria criteria=opcionCriteria.createCriteria();
			
		
		if(opcion.getiOpcionId()!=null){
			criteria.andIOpcionIdEqualTo(opcion.getiOpcionId());
		}else{
			if(opcion.getvOpcionNombre()!=null){
				criteria.andVOpcionNombreLike(opcion.getvOpcionNombre().toUpperCase());
			}
			if(opcion.getiOpcionIndpadre()!=null){
				criteria.andIOpcionIndpadreEqualTo(opcion.getiOpcionIndpadre());
			}
		}
		
		if(opcion.getiOpcionEstado()==null){
			criteria.andIOpcionEstadoEqualTo(Constante.ESTADO_ACTIVO);
		}else{
			criteria.andIOpcionEstadoEqualTo(opcion.getiOpcionEstado());
		}
		
		if(opcion.getNotOpciones()!=null && opcion.getNotOpciones().size()>0){
			criteria.andIOpcionIdNotIn(opcion.getNotOpciones());
		}
		
		List<Opcion> list=opcionDAO.selectByExample(opcionCriteria);
		
		if(opcion.getCountHijos()){
			Boolean esPadre=false;
			Integer numHijos;
			OpcionCriteria opcCriteria=null;
			for (Opcion opc : list) {
				opcCriteria=new OpcionCriteria();
				opcCriteria.clear();
				opcCriteria.createCriteria().andIOpcionIndpadreEqualTo(opc.getiOpcionId()).andIOpcionEstadoEqualTo(Constante.ESTADO_ACTIVO);
				numHijos=opcionDAO.countByExample(opcCriteria);
				if(numHijos>0){
					esPadre=true;
				}
				opc.setEsPadre(esPadre);
				opc.setNumHijos(numHijos);
			}
		}else{
			
			for (Opcion opc : list) {
				if(Util.equiv(opc.getiOpcionIndpadre(), Constante.ROOT_MENU)){
					opc.setDesPadre(Constante.DES_ROOT_MENU);	
				}else{
					opc.setDesPadre(this.findByPk(opc.getiOpcionIndpadre()).getvOpcionNombre());	
				}
			}
		}
		
		if(opcion!=null){
			if(opcion.getWithRoot()){
				Opcion root=new Opcion();
				root.setvOpcionNombre(Constante.DES_ROOT_MENU);
				root.setiOpcionId(Constante.ROOT_MENU);
				if(list!=null){
					list.add(0, root);
				}
			}
		}
		
		return list;
	}

	@Override
	public Opcion findByPk(Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		return opcionDAO.selectByPrimaryKey(idOpcion);
	}

	private void validarRegistroOpcion(Opcion opcion)throws Exception{
		OpcionCriteria opcCriteria=new OpcionCriteria();
		opcCriteria.createCriteria()
				.andVOpcionNombreEqualTo(opcion.getvOpcionNombre())
				.andIOpcionIndpadreEqualTo(opcion.getiOpcionIndpadre())
				.andIOpcionEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		if(opcionDAO.countByExample(opcCriteria)>0){
			throw new GenericExcepcion("Ya existe una opcion de nombre <b>"+opcion.getvOpcionNombre()+"</b>, para la opcion <b>"+this.findByPk(opcion.getiOpcionIndpadre()).getvOpcionNombre()+"</b>");
		}
		
	}
	
	@Override
	public Opcion save(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		if(opcion.getiOpcionId()==null){
			validarRegistroOpcion(opcion);
			opcion.setiOpcionEstado(Constante.ESTADO_ACTIVO);
			opcionDAO.insertSelective(opcion);
		}else{
			Opcion opcActual=this.findByPk(opcion.getiOpcionId());
			if(!(opcActual.getvOpcionNombre().equalsIgnoreCase(opcion.getvOpcionNombre())
				&& Util.equiv(opcActual.getiOpcionIndpadre(), opcion.getiOpcionIndpadre()))){
				validarRegistroOpcion(opcion);
			}
			opcionDAO.updateByPrimaryKeySelective(opcion);
		}
		return opcion;
	}

	@Override
	public void delete(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteByPk(Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		Opcion opcion=new Opcion();
		RolOpcionCriteria roc=new RolOpcionCriteria();
		roc.createCriteria().andIRolxopcionOpcionIdEqualTo(idOpcion);
		
		if(rolOpcionDAO.countByExample(roc)>0){
			throw new GenericExcepcion("La opcion no puede ser eliminada debido a que tiene relacion con un rol del sistema.");
		}
		
		OpcionCriteria opcCriteria=new OpcionCriteria();
		opcCriteria.createCriteria().andIOpcionIndpadreEqualTo(idOpcion).andIOpcionEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		if(opcionDAO.countByExample(opcCriteria)>0){
			throw new GenericExcepcion("La opcion no puede ser eliminada por que es una opcion padre de otras opciones.");
		}
		
		opcion.setiOpcionEstado(Constante.ESTADO_INACTIVO);
		opcion.setiOpcionId(idOpcion);
		opcionDAO.updateByPrimaryKeySelective(opcion);
	}

}
