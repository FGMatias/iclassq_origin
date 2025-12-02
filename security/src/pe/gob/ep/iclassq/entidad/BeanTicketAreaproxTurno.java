package pe.gob.ep.iclassq.entidad;

import java.sql.Date;

public class BeanTicketAreaproxTurno {
	private Integer id;
	private String Descripcion;
	private Date fecha_hora_prog_alg_2;
	private Integer	idArea;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.Descripcion = descripcion;
	}
	public Integer getIdArea() {
		return idArea;
	}
	public void setIdArea(Integer idarea) {
		this.idArea = idarea;
	}
	public Date getFecha_hora_prog_alg_2() {
		return fecha_hora_prog_alg_2;
	}
	public void setFecha_hora_prog_alg_2(Date fecha_hora_prog_alg_2) {
		this.fecha_hora_prog_alg_2 = fecha_hora_prog_alg_2;
	}
}