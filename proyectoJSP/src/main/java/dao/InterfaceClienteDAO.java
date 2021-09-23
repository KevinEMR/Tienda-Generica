package dao;

import java.util.List;

import modelo.ClienteVO;



public interface InterfaceClienteDAO {
	
	public List<ClienteVO> obtener_todos();
	public boolean actualizar(ClienteVO cliente);
	public boolean isertarestudiante(ClienteVO cliente);
	public ClienteVO obteneruno(String parametro, String termino);
	public boolean eliminar(long cedula);
	public List<ClienteVO> obtenerporparametro(String parametro, String termino);
}
