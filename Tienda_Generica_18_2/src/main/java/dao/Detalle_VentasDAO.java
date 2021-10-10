package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.Detalle_VentasVO;

public class Detalle_VentasDAO extends Conexion implements InterfaceDetalle_VentasDAO {
	Connection cn = conectar();
	Statement sm = null;
	ResultSet rs = null;
	private static List<Detalle_VentasVO> list;

	@Override
	public boolean isertarestudiante(Detalle_VentasVO producto) {
		boolean resultado = true;
		try {
			sm = cn.createStatement();
			sm.executeUpdate(
					"INSERT INTO bd_tienda_generica_g2.detalle_ventas (codigo_detalle_venta, cantidad_producto, codigo_producto, codigo_venta, valor_total, valor_venta, valoriva)\r\n VALUES ('"
							+ producto.getCodigo_detalle_venta() + "','" + producto.getCantidad_producto() + "','"
							+ producto.getCodigo_producto() + "','" + producto.getCodigo_venta() + "','"
							+ producto.getValor_total() + "','" + producto.getValor_venta() + "','"
							+ producto.getValoriva() + "');");
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
			resultado = false;
		} finally {
			try {
				sm.close();
			} catch (SQLException e) {
				System.out.println("ERROR: " + e);
			}
		}
		return resultado;
	}

	@Override
	public boolean eliminar(long codigo_detalle_venta) {
		boolean resultado = true;
		try {
			sm = cn.createStatement();
			sm.executeUpdate("DELETE FROM bd_tienda_generica_g2.detalle_ventas\r\nWHERE codigo_producto = '"
					+ codigo_detalle_venta + "';");
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
			resultado = false;
		} finally {
			try {
				sm.close();
			} catch (SQLException e) {
				System.out.println("ERROR: " + e);
			}
		}
		return resultado;
	}

	@Override
	public List<Detalle_VentasVO> obtener_todos() {
		try {
			sm = cn.createStatement();
			rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.detalle_ventas;");
			list = new ArrayList<>();

			while (rs.next()) {
				long codigo_detalle_venta = rs.getLong(1);
				int cantidad_producto = rs.getInt(2);
				long codigo_producto = rs.getLong(3);
				long codigo_venta = rs.getLong(4);
				double valor_total = rs.getDouble(5);
				double valor_venta = rs.getDouble(6);
				double valoriva = rs.getDouble(7);
				Detalle_VentasVO prod = new Detalle_VentasVO(codigo_detalle_venta, cantidad_producto, codigo_producto,
						codigo_venta, valor_total, valor_venta, valoriva);
				list.add(prod);
			}

		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		} finally {
			try {
				sm.close();
			} catch (SQLException e) {
				System.out.println("ERROR: " + e);
			}
		}
		return list;
	}
}
