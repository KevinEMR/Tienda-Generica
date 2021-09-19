package modelo;

public class UsuarioVO {
	private String Usuario,Contraseña,Nombre,Correo;
	private long Cedula;
	
	public UsuarioVO(){
	}
	
	public UsuarioVO(Long cedula , String correo, String nombre, String contraseña, String usuario) {
		this.Cedula = cedula;
		this.Nombre = nombre;
		this.Correo = correo;
		this.Usuario = usuario;
		this.Contraseña = contraseña;
	}

	public String getUsuario() {
		return Usuario;
	}


	public void setUsuario(String usuario) {
		Usuario = usuario;
	}


	public String getContraseña() {
		return Contraseña;
	}


	public void setContraseña(String contraseña) {
		Contraseña = contraseña;
	}
	

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getCorreo() {
		return Correo;
	}

	public void setCorreo(String correo) {
		Correo = correo;
	}

	public long getCedula() {
		return Cedula;
	}

	public void setCedula(long cedula) {
		Cedula = cedula;
	}

	@Override
	public String toString() {
          return "s";
	}
}
