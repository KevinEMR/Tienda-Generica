package conexionmysql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private static final String CONTROLADOR = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://bd-tienda-generica.c47knbsonjdi.us-east-2.rds.amazonaws.com:3306/bd_tienda_generica_g2";
	private static final String USUARIO = "adming2";
	private static final String CLAVE = "Pt3^jWaN^8qi(y0.8";
	private Connection conexion = null;
	/**/
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
