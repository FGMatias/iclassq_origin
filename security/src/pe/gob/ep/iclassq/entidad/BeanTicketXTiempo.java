package pe.gob.ep.iclassq.entidad;

public class BeanTicketXTiempo {
	private Integer id;
	private Integer idSubgrupo;
	private String horaEmision;
	private String fechaHoraProgAlg2Tiempo;
	private Integer estado;
	private String fechaAtencion;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdSubgrupo() {
		return idSubgrupo;
	}
	public void setIdSubgrupo(Integer idSubgrupo) {
		this.idSubgrupo = idSubgrupo;
	}
	public String getHoraEmision() {
		return horaEmision;
	}
	public void setHoraEmision(String horaEmision) {
		this.horaEmision = horaEmision;
	}
	public String getFechaHoraProgAlg2Tiempo() {
		return fechaHoraProgAlg2Tiempo;
	}
	public void setFechaHoraProgAlg2Tiempo(String fechaHoraProgAlg2Tiempo) {
		this.fechaHoraProgAlg2Tiempo = fechaHoraProgAlg2Tiempo;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	public String getFechaAtencion() {
		return fechaAtencion;
	}
	public void setFechaAtencion(String fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}
	
	

}