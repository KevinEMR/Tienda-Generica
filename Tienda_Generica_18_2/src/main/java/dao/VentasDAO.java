package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.VentasVO;

public class VentasDAO extends Conexion implements InterfaceVentasDAO {
	Connection cn = conectar();
	Statement sm = null;
	ResultSet rs = null;
	private static List<VentasVO> list;

	
	@Override
	public boolean isertarestudiante(VentasVO producto) {
		boolean resultado = true;
		try {
			sm = cn.createStatement();
			sm.executeUpdate(
					"INSERT INTO bd_tienda_generica_g2.ventas (codigo_venta, cedula_cliente, cedula_usuario, ivaventa, total_venta, valor_venta)\r\n VALUES ('"
							+ producto.getCodigo_venta() + "','" + producto.getCedula_cliente() + "','" + producto.getCedula_usuario()
							+ "','" + producto.getIvaventa() + "','" + producto.getTotal_venta() + "','"
							+ producto.getValor_venta() + "');");
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
	public boolean eliminar(long codigo_venta) {
		boolean resultado = true;
		try {
			sm = cn.createStatement();
			sm.executeUpdate(
					"DELETE FROM bd_tienda_generica_g2.ventas\r\nWHERE codigo_producto = '" + codigo_venta + "';");
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
	public List<VentasVO> obtener_todos() {
		try {
			sm = cn.createStatement();
			rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.ventas;");
			list = new ArrayList<>();

			while (rs.next()) {
				long codigo_venta = rs.getLong(1);
				long cedula_cliente = rs.getLong(2);
				long cedula_usuario = rs.getLong(3);
				double ivaventa = rs.getDouble(4);
				double total_venta = rs.getDouble(5);
				double valor_total = rs.getDouble(6);
				VentasVO prod = new VentasVO(codigo_venta, cedula_cliente, cedula_usuario, ivaventa, total_venta, valor_total);
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
