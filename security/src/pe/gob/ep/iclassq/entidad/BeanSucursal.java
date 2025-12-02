package pe.gob.ep.iclassq.entidad;

public class BeanSucursal {
	private Integer id;
	private String nombre;
	private String url;
	private String ruc;
	private String direccion;
	private String telefono;
	private String descripcionAlgoritmo;
	private Integer idUsuario;
	
//	private String zona;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDescripcionAlgoritmo() {
		return descripcionAlgoritmo;
	}
	public void setDescripcionAlgoritmo(String descripcionAlgoritmo) {
		this.descripcionAlgoritmo = descripcionAlgoritmo;
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
}
