package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceUsarioDAO;
import dao.UsuarioDAO;
import modelo.UsuarioVO;

public class UsuarioBO {
	private static InterfaceUsarioDAO edao;
	private static boolean result;
	private static List<UsuarioVO> list;
	public UsuarioBO() throws SQLException {
		edao = new UsuarioDAO();
	}

	public static boolean usuario_existe(String Usuario, String Password) {
		result = edao.usuario_existe(Usuario, Password);
		return result;
	}

	public static List<UsuarioVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
	}
	public static boolean actualizar(UsuarioVO usuario) {
		result = edao.actualizar(usuario);
		return result;
	}
	public static boolean isertarestudiante(UsuarioVO usuario) {
		result = edao.isertarestudiante(usuario);
		return result;
	}
	public static UsuarioVO obteneruno(String parametro, String termino) {
		UsuarioVO usuario = edao.obteneruno(parametro, termino);
		return usuario;
	}
	public static boolean eliminar(long cedula) {
		result = edao.eliminar(cedula);
		return result;
		
	}
	public static List<UsuarioVO> obtenerporparametro(String parametro, String termino){
		List<UsuarioVO> usuarios = edao.obtenerporparametro(parametro, termino);
		return usuarios;
	}
}
