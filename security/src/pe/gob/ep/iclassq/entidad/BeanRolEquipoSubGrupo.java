package pe.gob.ep.iclassq.entidad;

import java.math.BigDecimal;

public class BeanRolEquipoSubGrupo {

	private Integer idRolEquipoSubGrupo;
	private Integer idRolEquipo;
	private Integer idSubGrupo;
	private Integer idGrupo;
	private String nombreSubGrupo;
	private String nombreGrupo;
	private BigDecimal proporcion;
	private String prefijo;
	
	public Integer getidRolEquipoSubGrupo() {
		return idRolEquipoSubGrupo;
	}
	public void setidRolEquipoSubGrupo(Integer idRolEquipoSubGrupo) {
		this.idRolEquipoSubGrupo = idRolEquipoSubGrupo;
	}
	public Integer getidRol() {
		return idRolEquipo;
	}
	public void setidRol(Integer idRolEquipo) {
		this.idRolEquipo = idRolEquipo;
	}
	public Integer getidSubGrupo() {
		return idSubGrupo;
	}
	public void setidSubGrupo(Integer idSubGrupo) {
		this.idSubGrupo = idSubGrupo;
	}
	public Integer getidGrupo() {
		return idGrupo;
	}
	public void setidGrupo(Integer idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getnombreSubGrupo() {
		return nombreSubGrupo;
	}
	public void setnombreSubGrupo(String nombreSubGrupo) {
		this.nombreSubGrupo = nombreSubGrupo;
	}
	public String getnombreGrupo() {
		return nombreGrupo;
	}
	public void setnombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public BigDecimal getProporcion() {
        return proporcion;
    }
	public void setProporcion(BigDecimal proporcion) {
        this.proporcion = proporcion;
    }
	public String getPrefijo() {
		return prefijo;
	}
	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}
}
