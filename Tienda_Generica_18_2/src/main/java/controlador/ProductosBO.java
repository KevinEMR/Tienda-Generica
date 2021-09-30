package controlador;

import java.sql.SQLException;
import com.opencsv.CSVReader;

import dao.InterfaceProductosDAO;
import dao.ProductosDAO;




public class ProductosBO {
	private static InterfaceProductosDAO edao;
	private static boolean result;
	public ProductosBO() throws SQLException {
		edao = new ProductosDAO();
	}

	public boolean leerycargar(CSVReader archivo) {
		result = edao.leerycargar(archivo);
		return result;
	}
}
