package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.ClienteVO;


public class ProveedoresDAO extends Conexion implements InterfaceClienteDAO {
    Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<ClienteVO> list;
	
	@Override
	public List<ClienteVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.clientes;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	Long cedula = rs.getLong(1);
				String direccion = rs.getString(2);
				String correo = rs.getString(3);
				String nombre = rs.getString(4);
				String telefono = rs.getString(5);
				ClienteVO clien = new ClienteVO(cedula, direccion, correo, nombre, telefono);
				list.add(clien);
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
	public boolean actualizar(ClienteVO cliente) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate("UPDATE bd_tienda_generica.clientes SET cliente = '" + cliente.getDireccion() + "',email_cliente = '"
                    + cliente.getCorreo() + "',nombre_cliente = '" + cliente.getNombre() + "',telefono_cliente = '"
                    + cliente.getTelefono() + "' WHERE Cedula_cliente = '" + cliente.getCedula() + "';");
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
	public boolean isertarestudiante(ClienteVO cliente) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate(
                    "INSERT INTO bd_tienda_generica.clientes (Cedula_cliente,direccion_cliente,email_cliente,nombre_cliente,telefono_cliente)\r\n VALUES ('"
                    + cliente.getCedula() + "','" + cliente.getDireccion() + "','"
                    + cliente.getCorreo() + "','" + cliente.getNombre() + "','"
                    + cliente.getTelefono() + "');");
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
	public ClienteVO obteneruno(String parametro, String termino) {
		 try {
	            sm = cn.createStatement();
	            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.clientes WHERE " + parametro + " = '" + termino + "';");

	            while (rs.next()) {
	                Long cedula = rs.getLong(1);
	                String direccion = rs.getString(2);
	                String correo = rs.getString(3);
	                String nombre = rs.getString(4);
	                String telefono = rs.getString(5);
	                ClienteVO clien = new ClienteVO(cedula, direccion, correo, nombre,telefono);
	                return clien;
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
	public boolean eliminar(long cedula) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate("DELETE FROM bd_tienda_generica.clientes\r\nWHERE Cedula_cliente = '" + cedula + "';");
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
	public List<ClienteVO> obtenerporparametro(String parametro, String termino) {
		List<ClienteVO> clientes;
        clientes = new ArrayList<>();
        boolean nodatos = true;
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.clientes WHERE " + parametro + " = '" + termino + "';");

            while (rs.next()) {
                long cedula = rs.getLong(1);
                String direccion = rs.getString(2);
                String correo = rs.getString(3);
                String nombre = rs.getString(4);
                String telefono = rs.getString(5);
                ClienteVO clien = new ClienteVO(cedula, direccion, correo, nombre, telefono);
                clientes.add(clien);
                nodatos = false;
            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        } finally {
            try {
                sm.close();
                if (nodatos) {
                    clientes = null;
                }
            } catch (SQLException e) {
                System.out.println("ERROR: " + e);
            }
        }
        return clientes;
	}

}
