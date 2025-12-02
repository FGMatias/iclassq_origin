package pe.gob.ep.iclassq.entidad;

public class BeanTablaGeneral {
	
	private String tabla;
	private String codigo;
	private int codigoint;
	private String descripcion;
	private String descripcion_larga;
	private int estado;	
	
	public String getTabla() {
		return tabla;
	}
	public void setTabla(String id) {
		this.tabla = tabla;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public int setCodigoint() {
		return codigoint;
	}
	public void setCodigoint(int codigoint) {
		this.codigoint = codigoint;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDescripcion_larga() {
		return descripcion_larga;
	}
	public void setDescripcion_larga(String descripcion_larga) {
		this.descripcion_larga = descripcion_larga;
	}		
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
		
	}
}