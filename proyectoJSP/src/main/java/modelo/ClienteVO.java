package modelo;

public class ClienteVO {
	private String Direccion,Telefono,Nombre,Correo;
	private long Cedula;
	
	public ClienteVO(){
	}
	
	public ClienteVO(Long cedula , String correo, String nombre, String direccion, String telefono) {
		this.Cedula = cedula;
		this.Nombre = nombre;
		this.Correo = correo;
		this.Direccion = direccion;
		this.Telefono = telefono;
	}

	public String getDireccion() {
		return Direccion;
	}


	public void setDireccion(String direccion) {
		Direccion = direccion;
	}


	public String getTelefono() {
		return Telefono;
	}


	public void setTelefono(String telefono) {
		Telefono = telefono;
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
