package pe.gob.ep.iclassq.excepcion;

public class GenericExcepcion extends Exception {
	private static final long serialVersionUID = 1L;

	public GenericExcepcion() {
	}

	public GenericExcepcion(String message) {
		super(message);
	}

	public GenericExcepcion(Throwable cause) {
		super(cause);
	}

	public GenericExcepcion(String message, Throwable cause) {
		super(message, cause);
	}

}
