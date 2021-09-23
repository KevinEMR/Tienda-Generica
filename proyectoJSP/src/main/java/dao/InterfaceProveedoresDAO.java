package dao;

import java.util.List;

import modelo.ProveedoresVO;

public interface InterfaceProveedoresDAO {
	
	public List<ProveedoresVO> obtener_todos();
	public boolean actualizar(ProveedoresVO usuario);
	public boolean isertarestudiante(ProveedoresVO usuario);
	public ProveedoresVO obteneruno(String parametro, String termino);
	public boolean eliminar(long cedula);
	public List<ProveedoresVO> obtenerporparametro(String parametro, String termino);
}
