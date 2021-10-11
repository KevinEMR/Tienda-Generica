package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceReporte_ClientesDAO;
import dao.Reporte_ClientesDAO;
import modelo.ClienteVO;

public class Reporte_ClientesBO {
	private static InterfaceReporte_ClientesDAO edao;
	private static List<ClienteVO> list;
	public Reporte_ClientesBO() throws SQLException {
		edao = new Reporte_ClientesDAO();
	}	
	
	public static List<ClienteVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
			}
}

