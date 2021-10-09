package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.Detalle_VentasDAO;
import dao.InterfaceDetalle_VentasDAO;
import modelo.Detalle_VentasVO;



public class Detalle_VentasBO {
	private static InterfaceDetalle_VentasDAO edao;
	private static boolean result;
	public Detalle_VentasBO() throws SQLException {
		edao = new Detalle_VentasDAO();
	}

	public static boolean isertarestudiante(Detalle_VentasVO productos) {
		result = edao.isertarestudiante(productos);
		return result;
	}
	
	public static boolean eliminar(long codigo_detalle_venta) {
		result = edao.eliminar(codigo_detalle_venta);
		return result;
	}

	
	public static List<Detalle_VentasVO> obtener_todos() {
		return edao.obtener_todos();
	}
}
