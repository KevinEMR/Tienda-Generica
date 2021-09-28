package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.ProveedoresVO;

public class ProveedoresDAO extends Conexion implements InterfaceProveedoresDAO {
    Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<ProveedoresVO> list;
	
	@Override
	public List<ProveedoresVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.proveedores;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	Long nit = rs.getLong(1);
				String ciudad = rs.getString(2);
				String direccion = rs.getString(3);
				String nombre = rs.getString(4);
				String telefono = rs.getString(5);
				ProveedoresVO prov = new ProveedoresVO(nit, ciudad, direccion, nombre, telefono);
				list.add(prov);
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

	@Override

	public boolean actualizar(ProveedoresVO proveedor) {

		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate("UPDATE bd_tienda_generica.proveedores SET direccion_proveedor = '" + proveedor.getDireccion() + "',ciudad_proveedor = '"
                    + proveedor.getCiudad() + "',nombre_proveedor = '" + proveedor.getNombre() + "',telefono_proveedor = '"
                    + proveedor.getTelefono() + "' WHERE nitproveedor = '" + proveedor.getNit() + "';");
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
	public boolean isertarestudiante(ProveedoresVO proveedor) {

		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate(
                    "INSERT INTO bd_tienda_generica.proveedores (nitproveedor, ciudad_proveedor, direccion_proveedor, nombre_proveedor,telefono_proveedor)\r\n VALUES ('"
                    + proveedor.getNit() + "','" + proveedor.getCiudad() + "','"
                    + proveedor.getDireccion() + "','" + proveedor.getNombre() + "','"
                    + proveedor.getTelefono() + "');");
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
	public ProveedoresVO obteneruno(String parametro, String termino) {
		 try {
	            sm = cn.createStatement();
	            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.proveedores WHERE " + parametro + " = '" + termino + "';");

	            while (rs.next()) {
	                Long nit = rs.getLong(1);
	                String ciudad = rs.getString(2);
	                String direccion = rs.getString(3);
	                String nombre = rs.getString(4);
	                String telefono = rs.getString(5);
	                ProveedoresVO prov = new ProveedoresVO(nit, ciudad, direccion, nombre,telefono);	              
	                return prov;
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
	        return null;
	}

	@Override
	public boolean eliminar(long nit) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate("DELETE FROM bd_tienda_generica.proveedores\r\nWHERE nitproveedor = '" + nit + "';");
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
	public List<ProveedoresVO> obtenerporparametro(String parametro, String termino) {
		List<ProveedoresVO> proveedores;
        proveedores = new ArrayList<>();
        boolean nodatos = true;
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.proveedores WHERE " + parametro + " = '" + termino + "';");

            while (rs.next()) {
                long nit = rs.getLong(1);
                String ciudad = rs.getString(2);
                String direccion = rs.getString(3);
                String nombre = rs.getString(4);
                String telefono = rs.getString(5);
                ProveedoresVO prov = new ProveedoresVO(nit, ciudad, direccion, nombre, telefono);
                proveedores.add(prov);
                nodatos = false;
            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        } finally {
            try {
                sm.close();
                if (nodatos) {
                    proveedores = null;
                }
            } catch (SQLException e) {
                System.out.println("ERROR: " + e);
            }
        }
        return proveedores;
	}


}
