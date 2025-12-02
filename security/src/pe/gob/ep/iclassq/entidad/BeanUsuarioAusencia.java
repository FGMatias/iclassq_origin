package pe.gob.ep.iclassq.entidad;

public class BeanUsuarioAusencia {
	private Integer id;
	private Integer idUsuario;
	private Integer idMotivoAusencia;
	private String horaInicio;
	private String horaFin;
	private String fecha;
	private Integer estado;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Integer getIdMotivoAusencia() {
		return idMotivoAusencia;
	}
	public void setIdMotivoAusencia(Integer idMotivoAusencia) {
		this.idMotivoAusencia = idMotivoAusencia;
	}
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	public String getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
}
