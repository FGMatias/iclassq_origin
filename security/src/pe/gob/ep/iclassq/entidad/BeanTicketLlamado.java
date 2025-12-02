package pe.gob.ep.iclassq.entidad;

public class BeanTicketLlamado {

	private Integer id;
	private String codigo;
	private String nombreVentanilla;
	private String descripcionVentanilla;
	private String nombreIdentificacion;
	private int tipodocumento;	
	private String tipodocumento_d;	
	private String nombrePersona;
	private String nombreGrupo;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNombreVentanilla() {
		return nombreVentanilla;
	}
	public void setNombreVentanilla(String nombreVentanilla) {
		this.nombreVentanilla = nombreVentanilla;
	}
	public String getDescripcionVentanilla() {
		return descripcionVentanilla;
	}
	public void setDescripcionVentanilla(String descripcionVentanilla) {
		this.descripcionVentanilla = descripcionVentanilla;
	}
	public String getNombreIdentificacion() {
		return nombreIdentificacion;
	}
	public void setNombreIdentificacion(String nombreIdentificacion) {
		this.nombreIdentificacion = nombreIdentificacion;
	}		
	public int getTipoDocumento() {
		return tipodocumento;
	}
	public void setTipoDocumento(int tipodocumento) {
		this.tipodocumento = tipodocumento;
		
	}
	public String getTipoDocumento_d() {
		return tipodocumento_d;
	}
	public void setTipoDocumento_d(String tipodocumento_d) {
		this.tipodocumento_d = tipodocumento_d;
		
	}
	public String getNombrePersona() {
		return nombrePersona;
	}
	public void setNombrePersona(String nombrePersona) {
		this.nombrePersona = nombrePersona;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	
}