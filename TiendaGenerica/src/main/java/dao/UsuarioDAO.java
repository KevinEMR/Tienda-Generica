package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.UsuarioVO;

public class UsuarioDAO extends Conexion implements InterfaceUsarioDAO {
    Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<UsuarioVO> list;

	@Override
	public boolean usuario_existe(String Usuario, String Password) {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.usuarios WHERE usuario = '" + Usuario + "' AND password = '" + Password + "';");
            
            while (rs.next()) {
                return true;
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
        return false;
	}

	@Override
	public List<UsuarioVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.usuarios;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	Long cedula = rs.getLong(1);
				String correo = rs.getString(2);
				String nombre = rs.getString(3);
				String contraseña = rs.getString(4);
				String usuario = rs.getString(5);
				UsuarioVO estu = new UsuarioVO(cedula, correo, nombre, contraseña, usuario);
				list.add(estu);
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
	public boolean actualizar(UsuarioVO usuario) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate("UPDATE bd_tienda_generica.usuarios SET usuario = '" + usuario.getUsuario() + "',email_usuario = '"
                    + usuario.getCorreo() + "',nombre_usuario = '" + usuario.getNombre() + "',password = '"
                    + usuario.getContraseña() + "' WHERE cedula_usuario = '" + usuario.getCedula() + "';");
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
	public boolean isertarestudiante(UsuarioVO usuario) {
		boolean resultado = true;
        try {
            sm = cn.createStatement();
            sm.executeUpdate(
                    "INSERT INTO bd_tienda_generica.usuarios (cedula_usuario,email_usuario,nombre_usuario,password,usuario)\r\n VALUES ('"
                    + usuario.getCedula() + "','" + usuario.getCorreo() + "','"
                    + usuario.getNombre() + "','" + usuario.getContraseña() + "','"
                    + usuario.getUsuario() + "');");
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
	public UsuarioVO obteneruno(String parametro, String termino) {
		 try {
	            sm = cn.createStatement();
	            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.usuarios WHERE " + parametro + " = '" + termino + "';");

	            while (rs.next()) {
	                Long cedula = rs.getLong(1);
	                String correo = rs.getString(2);
	                String nombre = rs.getString(3);
	                String contraseña = rs.getString(4);
	                String usuario = rs.getString(5);
	                UsuarioVO estu = new UsuarioVO(cedula, correo, nombre, contraseña, usuario);
	                return estu;
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
            sm.executeUpdate("DELETE FROM bd_tienda_generica.usuarios\r\nWHERE cedula_usuario = '" + cedula + "';");
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
	public List<UsuarioVO> obtenerporparametro(String parametro, String termino) {
		List<UsuarioVO> usuarios;
        usuarios = new ArrayList<>();
        boolean nodatos = true;
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica.usuarios WHERE " + parametro + " = '" + termino + "';");

            while (rs.next()) {
                long cedula = rs.getLong(1);
                String correo = rs.getString(2);
                String nombre = rs.getString(3);
                String contraseña = rs.getString(4);
                String usuario = rs.getString(5);
                UsuarioVO usua = new UsuarioVO(cedula, correo, nombre, contraseña, usuario);
                usuarios.add(usua);
                nodatos = false;
            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        } finally {
            try {
                sm.close();
                if (nodatos) {
                    usuarios = null;
                }
            } catch (SQLException e) {
                System.out.println("ERROR: " + e);
            }
        }
        return usuarios;
	}

}
