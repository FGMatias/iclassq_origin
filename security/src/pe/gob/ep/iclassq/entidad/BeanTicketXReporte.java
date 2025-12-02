package pe.gob.ep.iclassq.entidad;

public class BeanTicketXReporte {
	private Integer id;
	private String codigo;
	private String nombreGrupo;
	private String horaEmision;
	private String tiempoEspera;
	
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
	public String getHoraEmision() {
		return horaEmision;
	}
	public void setHoraEmision(String horaEmision) {
		this.horaEmision = horaEmision;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public String getTiempoEspera() {
		return tiempoEspera;
	}
	public void setTiempoEspera(String tiempoEspera) {
		this.tiempoEspera = tiempoEspera;
	}

	
}
