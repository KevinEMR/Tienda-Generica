package dao;

import java.util.List;

import com.opencsv.CSVReader;

import modelo.ProductosVO;

public interface InterfaceProductosDAO {
	
	public boolean leerycargar(CSVReader archivo);
	public boolean actualizar(ProductosVO producto);
	public boolean isertarestudiante(ProductosVO proveedor);
	public ProductosVO obteneruno(String parametro, String termino);
	public boolean eliminar(long nit);
	public List<ProductosVO> obtenerporparametro(String parametro, String termino);
	public List<ProductosVO> obtener_todos();
}
