package pe.gob.ep.iclassq.entidad;

import java.util.Date;

public class BeanTicketSecuencial {
	private Integer id;
    private String codigo;
    private Date horaEmision;
    private Date horaInicioAtencion;
    private Date horaFinAtencion;
    private Integer idSubgrupo;
    private Date fechaHoraProgAlg2Tiempo;
    private Integer estado;
    private Integer ventanillaIdUsuario;
    
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
	public Date getHoraEmision() {
		return horaEmision;
	}
	public void setHoraEmision(Date horaEmision) {
		this.horaEmision = horaEmision;
	}
	public Date getHoraInicioAtencion() {
		return horaInicioAtencion;
	}
	public void setHoraInicioAtencion(Date horaInicioAtencion) {
		this.horaInicioAtencion = horaInicioAtencion;
	}
	public Date getHoraFinAtencion() {
		return horaFinAtencion;
	}
	public void setHoraFinAtencion(Date horaFinAtencion) {
		this.horaFinAtencion = horaFinAtencion;
	}
	public Integer getIdSubgrupo() {
		return idSubgrupo;
	}
	public void setIdSubgrupo(Integer idSubgrupo) {
		this.idSubgrupo = idSubgrupo;
	}
	public Date getFechaHoraProgAlg2Tiempo() {
		return fechaHoraProgAlg2Tiempo;
	}
	public void setFechaHoraProgAlg2Tiempo(Date fechaHoraProgAlg2Tiempo) {
		this.fechaHoraProgAlg2Tiempo = fechaHoraProgAlg2Tiempo;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	public Integer getVentanillaIdUsuario() {
		return ventanillaIdUsuario;
	}
	public void setVentanillaIdUsuario(Integer ventanillaIdUsuario) {
		this.ventanillaIdUsuario = ventanillaIdUsuario;
	}
    
    
}
