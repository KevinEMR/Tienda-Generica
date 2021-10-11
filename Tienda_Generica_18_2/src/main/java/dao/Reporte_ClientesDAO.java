package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.ClienteVO;

public class Reporte_ClientesDAO extends Conexion implements InterfaceReporte_ClientesDAO {
	Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<ClienteVO> list;
    
    @Override
	public List<ClienteVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.clientes;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	long cedula = rs.getLong(1);
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
}
