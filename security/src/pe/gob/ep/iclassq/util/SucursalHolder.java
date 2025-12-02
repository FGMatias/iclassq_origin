package pe.gob.ep.iclassq.util;

public class SucursalHolder {
	private static final ThreadLocal<Integer> sucursalHolder = new ThreadLocal<>();

	public static void setSucursal(Integer idSucursal) {
		sucursalHolder.set(idSucursal);
	}
	
	public static Integer getSucursal() {
		return sucursalHolder.get();
	}
	
	public static void clear() {
		sucursalHolder.remove();
	}
}

