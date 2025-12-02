package pe.gob.ep.iclassq.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.gob.ep.iclassq.seguridad.bean.ReinicioServicio;
import pe.gob.ep.iclassq.seguridad.dao.ReinicioServicioDAO;

@Service
public class AuditoriaServiceImpl implements AuditoriaService {

	@Autowired
	private ReinicioServicioDAO reinicioServicioDAO;
	
	@Override
	public void insert(Integer idUsuario) throws Exception {
		Date fecha = new Date();
		ReinicioServicio re = new ReinicioServicio();
		re.setIdUsuario(idUsuario);
		re.setHora(fecha);
		re.setFecha(fecha);
		reinicioServicioDAO.insertSelective(re);
	}
	
}
