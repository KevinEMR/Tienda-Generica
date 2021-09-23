package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceProveedoresDAO;
import dao.ProveedoresDAO;
import modelo.ProveedoresVO;




public class ProveedoresBO {
	private static InterfaceProveedoresDAO edao;
	private static boolean result;
	private static int resultado;
	private static List<ProveedoresVO> list;
	public ProveedoresBO() throws SQLException {
		edao = new ProveedoresDAO();
	}

	public static int sumar(int n1, int n2) {
		resultado = n1 + n2;
		return resultado;
	}

	public static List<ProveedoresVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
	}
	public static boolean actualizar(ProveedoresVO cliente) {
		result = edao.actualizar(cliente);
		return result;
	}
	public static boolean isertarestudiante(ProveedoresVO cliente) {
		result = edao.isertarestudiante(cliente);
		return result;
	}
	public static ProveedoresVO obteneruno(String parametro, String termino) {
		ProveedoresVO cliente = edao.obteneruno(parametro, termino);
		return cliente;
	}
	public static boolean eliminar(long cedula) {
		result = edao.eliminar(cedula);
		return result;
		
	}
	public static List<ProveedoresVO> obtenerporparametro(String parametro, String termino){
		List<ProveedoresVO> clientes = edao.obtenerporparametro(parametro, termino);
		return clientes;
	}
}
