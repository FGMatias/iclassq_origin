package pe.gob.ep.iclassq.entidad;

public class BeanTicketXArea {
	private Integer id;
	private String area;
	private String nombreVentanilla;
	private String nombreUsuario;
	private String codigo;
	private String fechaAtencion;
	private String horaInicioAtencion;
	private String horaFinAtencion;
	private String tipoIdentificacion;
	private String numeroIdentificacion;
	private String descripcion;	
	private String nombreGrupo;
	private String nombreSubGrupo;
	private String nombreAlgoritmo;
	private String horaTicket;
	private String tiempoAtencion;
	private String tiempoEspera;
	private String estadoDescripcion;
	private String tipoAnulacion;
	private String descripcionAnulacion;
	private String evaluacion;
//	private String audio;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getNombreVentanilla() {
		return nombreVentanilla;
	}
	public void setNombreVentanilla(String nombreVentanilla) {
		this.nombreVentanilla = nombreVentanilla;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getFechaAtencion() {
		return fechaAtencion;
	}
	public void setFechaAtencion(String fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}
	public String getHoraInicioAtencion() {
		return horaInicioAtencion;
	}
	public void setHoraInicioAtencion(String horaInicioAtencion) {
		this.horaInicioAtencion = horaInicioAtencion;
	}
	public String getHoraFinAtencion() {
		return horaFinAtencion;
	}
	public void setHoraFinAtencion(String horaFinAtencion) {
		this.horaFinAtencion = horaFinAtencion;
	}
	public String getNumeroIdentificacion() {
		return numeroIdentificacion;
	}
	public void setNumeroIdentificacion(String numeroIdentificacion) {
		this.numeroIdentificacion = numeroIdentificacion;
	}
	public String getTipoIdentificacion() {
		return tipoIdentificacion;
	}
	public void setTipoIdentificacion(String tipoIdentificacion) {
		this.tipoIdentificacion = tipoIdentificacion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public String getNombreSubGrupo() {
		return nombreSubGrupo;
	}
	public void setNombreSubGrupo(String nombreSubGrupo) {
		this.nombreSubGrupo = nombreSubGrupo;
	}
	public String getNombreAlgoritmo() {
		return nombreAlgoritmo;
	}
	public void setNombreAlgoritmo(String nombreAlgoritmo) {
		this.nombreAlgoritmo = nombreAlgoritmo;
	}
	public void SetHoraTicket(String horaTicket) {
		this.horaTicket = horaTicket;
	}
	public String getHoraTicket() {
		return horaTicket;
	}	
	public void SetTiempoAtencion(String tiempoAtencion) {
		this.tiempoAtencion = tiempoAtencion;
	}
	public String getTiempoAtencion() {
		return tiempoAtencion;
	}	
	public void SetTiempoEspera(String tiempoEspera) {
		this.tiempoEspera = tiempoEspera;
	}
	
	public String getEvaluacion() {
		return evaluacion;
	}
	public void SetEvaluacion(String evaluacion) {
		this.evaluacion = evaluacion;
	}
	
	public String getTiempoEspera() {
		return tiempoEspera;
	}
	public void SetEstadoDescripcion(String estadoDescripcion) {
		this.estadoDescripcion = estadoDescripcion;
	}
	public String getEstadoDescripcion() {
		return estadoDescripcion;
	}
	public void SetNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}	
	public void SetTipoAnulacion(String tipoAnulacion) {
		if (descripcionAnulacion == null) 
			this.tipoAnulacion = " - ";
		else this.tipoAnulacion = tipoAnulacion;
	}
	public String getTipoAnulacion() {
		return tipoAnulacion;
	}
	public void SetDescripcionAnulacion(String descripcionAnulacion) {
		if (descripcionAnulacion == null) 
			this.descripcionAnulacion=" - ";
		 else 	this.descripcionAnulacion = descripcionAnulacion;
	}
	public String getDescripcionAnulacion() {
		return descripcionAnulacion;
	}
//	public String getAudio() {
//		return audio;
//	}
//	public void setAudio(String audio) {
//		this.audio = audio;
//	}
	
}
