package dao;

import java.util.List;

import modelo.VentasVO;

public interface InterfaceVentasDAO {
	public boolean isertarestudiante(VentasVO proveedor);
	public boolean eliminar(long codigo_venta);
	public List<VentasVO> obtener_todos();
}
