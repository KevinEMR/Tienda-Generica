package conexionmysql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://camiloc2.czo3ixoe3xoe.us-east-1.rds.amazonaws.com:3306/grupo18_equipo2";
	private static final String USUARIO = "admin";
	private static final String CLAVE = "Admin123$";
	private Connection conexion = null;
	
	static {
		try {
			Class.forName(CONTROLADOR);
		} catch (ClassNotFoundException e) {
			System.out.println("ERROR AL CARGAR EL CONTROLADOR: "+e);   
		}
	}
	
	public Connection conectar() {
		try {
			conexion = DriverManager.getConnection(URL,USUARIO,CLAVE);
		} catch (SQLException e) {
			System.out.println("ERROR EN LA CONEXIÓN: "+e);
		}
		return conexion;
	}
	
	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException e) {
			System.out.println("ERROR EN LA DESCONEXIÓN: "+e);
		}
	}
}
