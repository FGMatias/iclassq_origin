package pe.gob.ep.iclassq.entidad;

public class BeanReporteEncuesta {
	private Integer id;
	private Integer idTicket;
	private String codigo;
	private String usuario;
	private String ventanilla;
	private String encuesta;
	private String pregunta;
	private String respuesta;
	private String hora;
	private String fecha;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdTicket() {
		return idTicket;
	}
	public void setIdTicket(Integer idTicket) {
		this.idTicket = idTicket;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getVentanilla() {
		return ventanilla;
	}
	public void setVentanilla(String ventanilla) {
		this.ventanilla = ventanilla;
	}
	public String getEncuesta() {
		return encuesta;
	}
	public void setEncuesta(String encuesta) {
		this.encuesta = encuesta;
	}
	public String getPregunta() {
		return pregunta;
	}
	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
}
