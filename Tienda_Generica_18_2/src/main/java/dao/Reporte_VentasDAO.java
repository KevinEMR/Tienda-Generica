package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexionmysql.Conexion;
import modelo.VentasVO;


public class Reporte_VentasDAO extends Conexion implements InterfaceReporte_VentasDAO {
	Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    private static List<VentasVO> list;
    
    @Override
	public List<VentasVO> obtener_todos() {
        try {
            sm = cn.createStatement();
            rs = sm.executeQuery("SELECT * FROM bd_tienda_generica_g2.clientes;");
            list = new ArrayList<>();
            
            while (rs.next()) {
            	long codigo_venta = rs.getLong(1);
            	long cedula_cliente = rs.getLong(2);
            	long cedula_usuario = rs.getLong(3);
            	double ivaventa = rs.getDouble(4);
            	double total_venta = rs.getDouble(5);
            	double Valor_venta = rs.getDouble(6);
				VentasVO clien = new VentasVO(codigo_venta, cedula_cliente, cedula_usuario, ivaventa, total_venta, Valor_venta );
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
