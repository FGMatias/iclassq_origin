package pe.gob.ep.iclassq.seguridad.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pe.gob.ep.iclassq.seguridad.bean.PerfilSecurity;
import pe.gob.ep.iclassq.seguridad.bean.UserSecurity;
import pe.gob.ep.iclassq.seguridad.bean.Usuario;
import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
import pe.gob.ep.iclassq.util.Constante;
import pe.gob.ep.iclassq.util.SucursalHolder;
import pe.gob.ep.iclassq.util.Util;



@Service("securityService")
public class SecurityServiceImpl  implements UserDetailsService {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UsuarioService usuarioService;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
			Integer idSucursal = SucursalHolder.getSucursal();
			Usuario user=usuarioService.findUsuarioByUserNameAndSucursal(username, idSucursal);

			if(user==null){throw new UsernameNotFoundException("Usuario no encontrado");}
			
			UserSecurity userSecurity = new UserSecurity();
			userSecurity.setUsername(user.getvUsuarioUsername());
			userSecurity.setPassword(user.getvUsuarioPassword());
			userSecurity.setAccountNonExpired(true);
			userSecurity.setAccountNonLocked(true);
			userSecurity.setCredentialsNonExpired(true);
			userSecurity.setEnabled(Util.equiv(user.getiUsuarioEstado(), Constante.ESTADO_ACTIVO));			
			List<PerfilSecurity> listPerfilSecurity = new ArrayList<PerfilSecurity>();
			PerfilSecurity perfilSecurity = new PerfilSecurity();
			perfilSecurity.setNombrePerfil("ADMIN");
			listPerfilSecurity.add(perfilSecurity);
			userSecurity.setPerfiles(listPerfilSecurity);  
			userSecurity.setUsuarioLogueado(user);
		
		return userSecurity;
	}
	
}


