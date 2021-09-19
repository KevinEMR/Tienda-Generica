package conexionmysql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bd_tienda_generica";
	private static final String USUARIO = "root";
	private static final String CLAVE = "root.";
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
