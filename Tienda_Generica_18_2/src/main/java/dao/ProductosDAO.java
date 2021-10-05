package dao;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opencsv.*;

import conexionmysql.Conexion;
import modelo.ProductosVO;

public class ProductosDAO extends Conexion implements InterfaceProductosDAO {
	Connection cn = conectar();
	Statement sm = null;
	ResultSet rs = null;
	private static List<ProductosVO> list;

	@Override
	public boolean leerycargar(CSVReader archivo) {
		boolean resultado = true;
		List<ProductosVO> productos;
		productos = new ArrayList<>();
		try {
			String[] fila = null;
			int i = 0;
			while ((fila = archivo.readNext()) != null) {
				ProductosVO produc = new ProductosVO(Long.parseLong(fila[0]), Double.parseDouble(fila[4]),
						Long.parseLong(fila[2]), fila[1], Double.parseDouble(fila[3]), Double.parseDouble(fila[5]));
				productos.add(produc);
				System.out.println(productos.get(i).getCodigo());
				i++;
			}
			for (i = 0; i < productos.size(); i++) {
				try {
					sm = cn.createStatement();
					sm.executeUpdate(
							"INSERT INTO bd_tienda_generica_g2.productos (codigo_producto, ivacompra, nitproveedor, nombre_producto, precio_compra, precio_venta)\r\n VALUES ('"
									+ productos.get(i).getCodigo() + "','" + productos.get(i).getIva() + "','"
									+ productos.get(i).getNit_proveedor() + "','" + productos.get(i).getNombre() + "','"
									+ productos.get(i).getPrecio_compra() + "','" + productos.get(i).getPrecio_venta()
									+ "');");
					System.out.println("for: " + productos.get(i).getCodigo());
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
			}

		} catch (IOException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultado;
	}

	@Override
	public boolean actualizar(ProductosVO producto) {
		boolean resultado = true;
		try {
			sm = cn.createStatement();
			sm.executeUpdate("UPDATE bd_tienda_generica_g2.proveedores SET ivacompra = '" + producto.getIva()
					+ "',nitproveedor = '" + producto.getNit_proveedor() + "',nombre_producto = '"
					+ producto.getNombre() + "',precio_compra = '" + producto.getPrecio_compra() + "',precio_venta = '"
					+ producto.getPrecio_venta() + "' WHERE codigo_producto = '" + producto.getCodigo() + "';");
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
	public boolean isertarestudiante(ProductosVO proveedor) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ProductosVO obteneruno(String parametro, String termino) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean eliminar(long nit) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ProductosVO> obtenerporparametro(String parametro, String termino) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductosVO> obtener_todos() {
		try {
			sm = cn.createStatement();
			rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.productos;");
			list = new ArrayList<>();

			while (rs.next()) {
				long codigo = rs.getLong(1);
				double iva = rs.getDouble(2);
				long nit_proveedor = rs.getLong(3);
				String nombre = rs.getString(4);
				double precio_compra = rs.getDouble(5);
				double precio_venta = rs.getDouble(6);
				ProductosVO prod = new ProductosVO(codigo, iva, nit_proveedor, nombre, precio_compra, precio_venta);
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
