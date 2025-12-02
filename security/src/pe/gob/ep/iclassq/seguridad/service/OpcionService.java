package pe.gob.ep.iclassq.seguridad.service;

import java.util.List;

import pe.gob.ep.iclassq.seguridad.bean.Opcion;

public interface OpcionService {
	public List<Opcion> findAll(Opcion opcion) throws Exception;
	public Opcion findByPk(Integer idOpcion) throws Exception;
	public Opcion save(Opcion opcion) throws Exception;
	public void delete(Opcion opcion) throws Exception;
	public void deleteByPk(Integer idOpcion) throws Exception;
}
