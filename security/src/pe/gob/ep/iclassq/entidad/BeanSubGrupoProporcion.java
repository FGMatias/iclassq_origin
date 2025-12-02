package pe.gob.ep.iclassq.entidad;

public class BeanSubGrupoProporcion {

	private Integer idSubGrupo;
	private Integer idAlgoritmo;
	private float proporcionTeorica;
	private Integer registrosActuales;
	private float porcentajeTeorica;
	private float porcentajePractico;
	private float diferencia;
	
	public Integer getIdSubGrupo() {
		return idSubGrupo;
	}
	public void setIdSubGrupo(Integer idSubGrupo) {
		this.idSubGrupo = idSubGrupo;
	}
	public Integer getIdAlgoritmo() {
		return idAlgoritmo;
	}
	public void setIdAlgoritmo(Integer idAlgoritmo) {
		this.idAlgoritmo = idAlgoritmo;
	}
	public float getProporcionTeorica() {
		return proporcionTeorica;
	}
	public void setProporcionTeorica(float proporcionTeorica) {
		this.proporcionTeorica = proporcionTeorica;
	}
	public Integer getRegistrosActuales() {
		return registrosActuales;
	}
	public void setRegistrosActuales(Integer registrosActuales) {
		this.registrosActuales = registrosActuales;
	}
	public float getPorcentajeTeorica() {
		return porcentajeTeorica;
	}
	public void setPorcentajeTeorica(float porcentajeTeorica) {
		this.porcentajeTeorica = porcentajeTeorica;
	}
	public float getPorcentajePractico() {
		return porcentajePractico;
	}
	public void setPorcentajePractico(float porcentajePractico) {
		this.porcentajePractico = porcentajePractico;
	}
	public float getDiferencia() {
		return diferencia;
	}
	public void setDiferencia(float diferencia) {
		this.diferencia = diferencia;
	}
}
