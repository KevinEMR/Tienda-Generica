package controlador;

import java.sql.SQLException;
import java.util.List;

import com.opencsv.CSVReader;

import dao.InterfaceProductosDAO;
import dao.ProductosDAO;
import modelo.ProductosVO;




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
	
	public boolean actualizar(ProductosVO producto) {
		result = edao.actualizar(producto);
		return result;
	}

	
	public boolean isertarestudiante(ProductosVO productos) {
		result = edao.isertarestudiante(productos);
		return result;
	}

	
	public ProductosVO obteneruno(String parametro, String termino) {
		return edao.obteneruno(parametro, termino);
	}

	
	public boolean eliminar(long nit) {
		result = edao.eliminar(nit);
		return result;
	}

	
	public List<ProductosVO> obtenerporparametro(String parametro, String termino) {
		return edao.obtenerporparametro(parametro, termino);
	}
	
	public static List<ProductosVO> obtener_todos() {
		return edao.obtener_todos();
	}
}
