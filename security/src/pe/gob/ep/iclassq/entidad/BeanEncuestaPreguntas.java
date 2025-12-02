package pe.gob.ep.iclassq.entidad;

public class BeanEncuestaPreguntas {
	private Integer id;
	private Integer idEncuesta;
	private Integer idSucursal;
	private String descripcion;
	private Integer estado;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdEncuesta() {
		return idEncuesta;
	}
	public void setIdEncuesta(Integer idEncuesta) {
		this.idEncuesta = idEncuesta;
	}
	public Integer getIdSucursal() {
		return idSucursal;
	}
	public void setIdSucursal(Integer idSucursal) {
		this.idSucursal = idSucursal;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	
}
