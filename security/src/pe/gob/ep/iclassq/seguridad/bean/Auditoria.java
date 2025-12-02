package pe.gob.ep.iclassq.seguridad.bean;

import java.util.Date;

public class Auditoria {

	private Date fecregistra;
	private Date fecmodifica;
	private String desusuregistra;
	private String desusumodifica;
	private String desipregistra;
	private String desipmodifica;

	public Date getFecregistra() {
		return fecregistra;
	}

	public void setFecregistra(Date fecregistra) {
		this.fecregistra = fecregistra;
	}

	public Date getFecmodifica() {
		return fecmodifica;
	}

	public void setFecmodifica(Date fecmodifica) {
		this.fecmodifica = fecmodifica;
	}

	public String getDesusuregistra() {
		return desusuregistra;
	}

	public void setDesusuregistra(String desusuregistra) {
		this.desusuregistra = desusuregistra;
	}

	public String getDesusumodifica() {
		return desusumodifica;
	}

	public void setDesusumodifica(String desusumodifica) {
		this.desusumodifica = desusumodifica;
	}

	public String getDesipregistra() {
		return desipregistra;
	}

	public void setDesipregistra(String desipregistra) {
		this.desipregistra = desipregistra;
	}

	public String getDesipmodifica() {
		return desipmodifica;
	}

	public void setDesipmodifica(String desipmodifica) {
		this.desipmodifica = desipmodifica;
	}

}
