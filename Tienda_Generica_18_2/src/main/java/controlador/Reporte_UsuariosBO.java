package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceReporte_UsuariosDAO;
import dao.Reporte_UsuariosDAO;
import modelo.UsuarioVO;

public class Reporte_UsuariosBO {
	private static InterfaceReporte_UsuariosDAO edao;
	private static List<UsuarioVO> list;
	public Reporte_UsuariosBO() throws SQLException {
		edao = new Reporte_UsuariosDAO();
	}	
	
	public static List<UsuarioVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
			}
}

