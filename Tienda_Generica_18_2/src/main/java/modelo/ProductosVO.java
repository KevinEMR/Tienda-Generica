package modelo;

public class ProductosVO {
	private String Nombre;
	private long Codigo, Nit_proveedor;
	private double Iva, Precio_compra, Precio_venta;
	
	public ProductosVO(){
	}
	
	public ProductosVO(long codigo , double iva, long nit_proveedor, String nombre, double precio_compra, double precio_venta) {
		this.Nit_proveedor = nit_proveedor;
		this.Nombre = nombre;
		this.Codigo = codigo;
		this.Precio_compra = precio_compra;
		this.Precio_venta = precio_venta;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public long getCodigo() {
		return Codigo;
	}

	public void setCodigo(long codigo) {
		Codigo = codigo;
	}

	public long getNit_proveedor() {
		return Nit_proveedor;
	}

	public void setNit_proveedor(long nit_proveedor) {
		Nit_proveedor = nit_proveedor;
	}

	public double getIva() {
		return Iva;
	}

	public void setIva(double iva) {
		Iva = iva;
	}

	public double getPrecio_compra() {
		return Precio_compra;
	}

	public void setPrecio_compra(double precio_compra) {
		Precio_compra = precio_compra;
	}

	public double getPrecio_venta() {
		return Precio_venta;
	}

	public void setPrecio_venta(double precio_venta) {
		Precio_venta = precio_venta;
	}

	@Override
	public String toString() {
          return "s";
	}
}
