package controlador;

import java.sql.SQLException;
import java.util.List;




public class ProveedoresBO {
	private static InterfaceProveedoresDAO edao;
	private static boolean result;
	private static int resultado;
	private static List<ClienteVO> list;
	public ProveedoresBO() throws SQLException {
		edao = new ClienteDAO();
	}

	public static int sumar(int n1, int n2) {
		resultado = n1 + n2;
		return resultado;
	}

	public static List<ClienteVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
	}
	public static boolean actualizar(ClienteVO cliente) {
		result = edao.actualizar(cliente);
		return result;
	}
	public static boolean isertarestudiante(ClienteVO cliente) {
		result = edao.isertarestudiante(cliente);
		return result;
	}
	public static ClienteVO obteneruno(String parametro, String termino) {
		ClienteVO cliente = edao.obteneruno(parametro, termino);
		return cliente;
	}
	public static boolean eliminar(long cedula) {
		result = edao.eliminar(cedula);
		return result;
		
	}
	public static List<ClienteVO> obtenerporparametro(String parametro, String termino){
		List<ClienteVO> clientes = edao.obtenerporparametro(parametro, termino);
		return clientes;
	}
}
