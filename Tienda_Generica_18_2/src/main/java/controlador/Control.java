package controlador;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Control {
	
	@RequestMapping("/")
	public static String login() {
		return "Login";
	}
	
	@RequestMapping("/Login_error")
	public static String login_error() {
		return "Login_error";
	}
	
	@RequestMapping("/Usuarios")
	public static String usuarios() {
		System.out.println("Entro al metodo");
		return "Usuarios";
	}
	
	@RequestMapping("/Agregar_usuario")
	public static String agregar_usuario() {
		System.out.println("Entro al metodo");
		return "Usuario_agregar";
	}
	
	@RequestMapping("/Agregar_usuario_error")
	public static String agregar_usuario_error() {
		System.out.println("Entro al metodo");
		return "Usuario_agregar_error";
	}
	
	@RequestMapping("/Editar_usuario")
	public static String editar_usuario() {
		System.out.println("Entro al metodo");
		return "Usuario_editar";
	}
	
	@RequestMapping("/Editar_usuario_error")
	public static String editar_usuario_error() {
		System.out.println("Entro al metodo editar error");
		return "Usuario_editar_error";
	}
	
	@RequestMapping("/Eliminar_usuario")
	public static String eliminarr_usuario() {
		System.out.println("Entro al metodo");
		return "Usuario_eliminar";
	}
	
	@RequestMapping("/Eliminar_usuario_error")
	public static String eliminarr_usuario_error() {
		System.out.println("Entro al metodo");
		return "Usuario_eliminar_error";
	}
	
	@RequestMapping("/Clientes")
	public static String clientes() {
		System.out.println("Entro al metodo");
		return "Clientes";
	}
	
	@RequestMapping("/Agregar_cliente")
	public static String agregar_cliente() {
		System.out.println("Entro al metodo");
		return "Cliente_agregar";
	}
	
	@RequestMapping("/Agregar_cliente_error")
	public static String agregar_cliente_error() {
		System.out.println("Entro al metodo");
		return "Cliente_agregar_error";
	}
	
	@RequestMapping("/Editar_cliente")
	public static String editar_cliente() {
		System.out.println("Entro al metodo");
		return "Cliente_editar";
	}
	
	@RequestMapping("/Editar_cliente_error")
	public static String editar_cliente_error() {
		System.out.println("Entro al metodo editar error");
		return "Cliente_editar_error";
	}
	
	@RequestMapping("/Eliminar_cliente")
	public static String eliminar_cliente() {
		System.out.println("Entro al metodo");
		return "Cliente_eliminar";
	}
	
	@RequestMapping("/Eliminar_cliente_error")
	public static String eliminar_cliente_error() {
		System.out.println("Entro al metodo");
		return "Cliente_eliminar_error";
	}
	
	@RequestMapping("/Proveedores")
	public static String proveedores() {
		System.out.println("Entro al metodo");
		return "Proveedores";
	}

	@RequestMapping("/Agregar_proveedor")
	public static String agregar_proveedor() {
		System.out.println("Entro al metodo");
		return "Proveedor_agregar";
	}
	
	@RequestMapping("/Agregar_proveedor_error")
	public static String agregar_proveedor_error() {
		System.out.println("Entro al metodo");
		return "Proveedor_agregar_error";
	}
	
	@RequestMapping("/Editar_proveedor")
	public static String editar_proveedor() {
		System.out.println("Entro al metodo");
		return "Proveedor_editar";
	}
	
	@RequestMapping("/Editar_proveedor_error")
	public static String editar_proveedor_error() {
		System.out.println("Entro al metodo editar error");
		return "Proveedor_editar_error";
	}
	
	@RequestMapping("/Eliminar_proveedor")
	public static String eliminar_proveedor() {
		System.out.println("Entro al metodo");
		return "Proveedor_eliminar";
	}
	
	@RequestMapping("/Eliminar_proveedor_error")
	public static String eliminar_proveedor_error() {
		System.out.println("Entro al metodo");
		return "Proveedor_eliminar_error";
	}
	
	@RequestMapping("/Productos")
	public static String productos() {
		return "Productos";
	}
	
	@PostMapping("/Productos")
	public String UploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes attributes) throws IOException, SQLException {
		if(file == null || file.isEmpty()) {
			return "redirect:/Productos_error";
		}
		
		StringBuilder builder = new StringBuilder();
		builder.append(System.getProperty("user.home"));
		builder.append(File.separator);
		builder.append("productos");
		builder.append(file.getOriginalFilename());
		
		byte[] fileBytes = file.getBytes();
		Path path = Paths.get(builder.toString());
		Files.write(path, fileBytes);
		
		System.out.println(builder.toString());
		String encode = URLEncoder.encode(builder.toString(), StandardCharsets.UTF_8);
		return "redirect:/Productos_cargados?archivo="+encode;
	}
	
	@RequestMapping("/Productos_error")
	public static String productos_error() {
		return "Productos_error";
	}
	
	@RequestMapping("/Productos_error_datos")
	public static String productos_error_datos() {
		return "Productos_error_datos";
	}
	
	@RequestMapping("/Productos_cargados")
	public static String productos_cargados() {
		return "Productos_cargados";
	}
}

