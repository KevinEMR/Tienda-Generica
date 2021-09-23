package dao;

import java.util.List;

import modelo.UsuarioVO;

public interface InterfaceClienteDAO {
	
	public List<UsuarioVO> obtener_todos();
	public boolean actualizar(UsuarioVO usuario);
	public boolean isertarestudiante(UsuarioVO usuario);
	public UsuarioVO obteneruno(String parametro, String termino);
	public boolean eliminar(long cedula);
	public List<UsuarioVO> obtenerporparametro(String parametro, String termino);
}
