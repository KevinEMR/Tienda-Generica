package dao;

import java.util.List;

import modelo.ProveedoresVO;

public interface InterfaceProveedoresDAO {
	
	public List<ProveedoresVO> obtener_todos();

	public boolean actualizar(ProveedoresVO proveedor);
	public boolean isertarestudiante(ProveedoresVO proveedor);
	public ProveedoresVO obteneruno(String parametro, String termino);
	public boolean eliminar(long nit);
	public List<ProveedoresVO> obtenerporparametro(String parametro, String termino);
}
