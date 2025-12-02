package pe.gob.ep.iclassq.seguridad.bean;

import org.springframework.security.core.GrantedAuthority;

public class PerfilSecurity implements GrantedAuthority{

	private static final long serialVersionUID = 1L;
	private String nombrePerfil;
	
	public PerfilSecurity(){
	}
	
	public String getNombrePerfil() {
		return nombrePerfil;
	}

	public void setNombrePerfil(String nombrePerfil) {
		this.nombrePerfil = nombrePerfil;
	}

	@Override
	public String getAuthority() {
		return this.nombrePerfil;
	}

}
