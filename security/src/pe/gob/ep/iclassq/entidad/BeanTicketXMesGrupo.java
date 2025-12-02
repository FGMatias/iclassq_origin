package pe.gob.ep.iclassq.entidad;

public class BeanTicketXMesGrupo {
	private Integer id;
	private String periodo;	
	private String area;
	private String nombreGrupo;
	private String nombreSubGrupo;
	private Integer atendidosCantidad;
	private Integer derivadosCantidad;
	private Integer noatendidosCantidad;
	private Integer anuladosCantidad;
	private Integer tpromedioEspera;
	private Integer tpromedioAtencion;
	private Integer evaluacion1;
	private Integer evaluacion2;
	private Integer evaluacion3;
	private Integer evaluacion4;
	private Integer evaluacion5;

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
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public Integer getatendidosCantidad() {
		return atendidosCantidad;
	}
	public void setatendidosCantidad(Integer atendidosCantidad) {
		this.atendidosCantidad = atendidosCantidad;
	}
	public Integer getderivadosCantidad() {
		return derivadosCantidad;
	}
	public void setderivadosCantidad(Integer derivadosCantidad) {
		this.derivadosCantidad = derivadosCantidad;
	}
	public Integer getnoatendidosCantidad() {
		return noatendidosCantidad;
	}
	public void setnoatendidosCantidad(Integer noatendidosCantidad) {
		this.noatendidosCantidad = noatendidosCantidad;
	}
	public Integer getanuladosCantidad() {
		return anuladosCantidad;
	}
	public void setanuladosCantidad(Integer anuladosCantidad) {
		this.anuladosCantidad = anuladosCantidad;
	}
	
	public Integer gettpromedioEspera() {
		return tpromedioEspera;
	}
	public void settpromedioEspera(Integer tpromedioEspera) {
		this.tpromedioEspera = tpromedioEspera;
	}
	public Integer gettpromedioAtencion() {
		return tpromedioAtencion;
	}
	public void settpromedioAtencion(Integer tpromedioAtencion) {
		this.tpromedioAtencion = tpromedioAtencion;
	}
	public Integer getevaluacion1() {
		return evaluacion1;
	}
	public void setevaluacion1(Integer evaluacion1) {
		this.evaluacion1 = evaluacion1;
	}
	public Integer getevaluacion2() {
		return evaluacion2;
	}
	public void setevaluacion2(Integer evaluacion2) {
		this.evaluacion2 = evaluacion2;
	}
	public Integer getevaluacion3() {
		return evaluacion3;
	}
	public void setevaluacion3(Integer evaluacion3) {
		this.evaluacion3 = evaluacion3;
	}
	public Integer getevaluacion4() {
		return evaluacion4;
	}
	public void setevaluacion4(Integer evaluacion4) {
		this.evaluacion4 = evaluacion4;
	}
	public Integer getevaluacion5() {
		return evaluacion5;
	}
	public void setevaluacion5(Integer evaluacion5) {
		this.evaluacion5 = evaluacion5;
	}
}
