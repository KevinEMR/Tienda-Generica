package controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}