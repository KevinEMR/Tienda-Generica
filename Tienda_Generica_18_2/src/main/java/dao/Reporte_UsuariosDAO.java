package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.UsuarioVO;

public class Reporte_UsuariosDAO extends Conexion implements InterfaceReporte_UsuariosDAO {
	Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<UsuarioVO> list;
    
    @Override
	public List<UsuarioVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.usuarios;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	long cedula = rs.getLong(1);
				String direccion = rs.getString(2);
				String correo = rs.getString(3);
				String nombre = rs.getString(4);
				String telefono = rs.getString(5);
				UsuarioVO usua = new UsuarioVO(cedula, direccion, correo, nombre, telefono);
				list.add(usua);
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
