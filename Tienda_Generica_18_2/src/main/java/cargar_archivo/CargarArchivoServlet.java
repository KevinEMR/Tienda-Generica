package cargar_archivo;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet") 
@MultipartConfig(maxFileSize = 16177215) //Limitamos el tamaño del archivo a 16MG 

public class CargarArchivoServlet  extends HttpServlet {
	
	/*Vamos a hacer la conexión a la base de datos si bien
	despues podemos importar la clase conexion*/
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bd_tienda_generica";
	private static final String USUARIO = "root";
	private static final String CLAVE = "root";
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		
		//Las variables en cuestion:
		String codigo_producto = request.getParameter("codigo_producto");
        String ivacompra = request.getParameter("ivacompra");
        String nitproveedor = request.getParameter("nitproveedor");
        String nombre_producto = request.getParameter("nombre_producto");
        String precio_compra = request.getParameter("precio_compra");
        String precio_venta = request.getParameter("precio_venta");
		
		//Input stream del cargue de archivo:
		InputStream inputStream=null;
		
		//Obtener el archivo cargado en esta multipart request:
		Part filePart = request.getPart("cargar_csv");
		if (filePart != null) {
			//Imprimir alguna información para debugging
			System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            //Obtener input stream del archivo cargado:
            inputStream = filePart.getInputStream();	
		}
		
		Connection conn=null; //Conexión a la base de datos
		String message = null; //El mensaje que retornara a la persona que sube el archivo
		
		try {
			//Conectamos a la base de datos
			conn = DriverManager.getConnection(URL, USUARIO, CLAVE);
			
			//Construir el SQL statement
			 String sql = "INSERT INTO productos (codigo_producto, ivacompra, nitproveedor, nombre_producto, precio_compra, precio_venta) values (?, ?, ?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, codigo_producto);
	            statement.setString(2, ivacompra);
	            statement.setString(3, nitproveedor);
	            statement.setString(4, nombre_producto);
	            statement.setString(5, precio_compra);
	            statement.setString(6, precio_venta);
	            
	         if(inputStream != null) {
	        	 //Recupera el flujo de entrada del archivo de carga para cada columna
	        	 statement.setString(1, sql);
	        }
	         //Envia el statement a la base de datos del servidor:
	         int row=statement.executeUpdate();
	         if(row > 0) {
	        	 message = "El archivo fue cargado y guardado dentro de la base de datos";
	         }      
		} catch(SQLException e) {
			message = "Error "+e.getMessage();
			e.printStackTrace();
		} finally {
			if (conn != null) {
				//Cerrar la conexión a la base de datos:
				try {
					conn.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			//Sets the message in request scope
			request.setAttribute("Message", message);
			//Forwards to the message page:
			getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		}
		
	}
	

}
