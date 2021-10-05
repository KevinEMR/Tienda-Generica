package modelo;

public class ProveedoresVO {
	private String Direccion,Telefono,Nombre,Ciudad;
	private long Nit;
	
	public ProveedoresVO(){
	}
	
	public ProveedoresVO(long nit , String ciudad, String nombre, String direccion, String telefono) {
		this.Nit = nit;
		this.Nombre = nombre;
		this.Ciudad = ciudad;
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

	public String getCiudad() {
		return Ciudad;
	}

	public void setCiudad(String ciudad) {
		Ciudad = ciudad;
	}

	public long getNit() {
		return Nit;
	}

	public void setNit(long nit) {
		Nit = nit;
	}

	@Override
	public String toString() {
          return "s";
	}
}
