package dao;

import java.util.List;

import modelo.Detalle_VentasVO;

public interface InterfaceDetalle_VentasDAO {
	public boolean isertarestudiante(Detalle_VentasVO proveedor);
	public boolean eliminar(long codigo_detalle_venta);
	public List<Detalle_VentasVO> obtener_todos();
}
