package Grupo182.TiendaGenerica;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Inicio {
	@GetMapping("/")
	public String Login() {
		return "Login";
	}

}
