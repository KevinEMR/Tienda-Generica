package Grupo182.TiendaGenerica;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import controlador.UsuarioBO;

@Controller
public class Inicio {
	@GetMapping("/")
	public String Login() {
		return "Login";
	}
	
	@PostMapping("/")
	public String registro(String Usuario, String Password) throws SQLException {
		UsuarioBO usuario = new UsuarioBO();
		boolean result = UsuarioBO.usuario_existe(Usuario, Password);
		if(result){
			return "Usuarios";
		} else{
			return "Loginmal";
	}
	}
}
