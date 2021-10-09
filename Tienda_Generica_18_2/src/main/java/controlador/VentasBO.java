package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceVentasDAO;
import dao.VentasDAO;
import modelo.VentasVO;



public class VentasBO {
	private static InterfaceVentasDAO edao;
	private static boolean result;
	public VentasBO() throws SQLException {
		edao = new VentasDAO();
	}

	public static boolean isertarestudiante(VentasVO productos) {
		result = edao.isertarestudiante(productos);
		return result;
	}
	
	public static boolean eliminar(long codigo_venta) {
		result = edao.eliminar(codigo_venta);
		return result;
	}

	
	public static List<VentasVO> obtener_todos() {
		return edao.obtener_todos();
	}
}
