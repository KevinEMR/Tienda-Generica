package controlador;

import java.sql.SQLException;
import java.util.List;

import dao.InterfaceReporte_VentasDAO;
import dao.Reporte_VentasDAO;
import modelo.VentasVO;

public class Reporte_VentasBO {
	private static InterfaceReporte_VentasDAO edao;
	private static List<VentasVO> list;
	public Reporte_VentasBO() throws SQLException {
		edao = new Reporte_VentasDAO();
	}	
	
	public static List<VentasVO> obtener_todos() {
		list = edao.obtener_todos();
		return list;
			}
}
