package modelo;

public class VentasVO {
	private long Codigo_venta, Cedula_cliente, Cedula_usuario;
	private double Ivaventa, Total_venta, Valor_venta;
	
	public VentasVO(){
	}
	
	public VentasVO(long codigo_venta , long cedula_cliente, long cedula_usuario, double ivaventa, double total_venta, double valor_venta) {
		this.Codigo_venta = codigo_venta;
		this.Cedula_cliente = cedula_cliente;
		this.Cedula_usuario = cedula_usuario;
		this.Ivaventa = ivaventa;
		this.Total_venta = total_venta;
		this.Valor_venta = valor_venta;
	}

	public long getCodigo_venta() {
		return Codigo_venta;
	}

	public void setCodigo_venta(long codigo_venta) {
		Codigo_venta = codigo_venta;
	}

	public long getCedula_cliente() {
		return Cedula_cliente;
	}

	public void setCedula_cliente(long cedula_cliente) {
		Cedula_cliente = cedula_cliente;
	}

	public long getCedula_usuario() {
		return Cedula_usuario;
	}

	public void setCedula_usuario(long cedula_usuario) {
		Cedula_usuario = cedula_usuario;
	}

	public double getIvaventa() {
		return Ivaventa;
	}

	public void setIvaventa(double ivaventa) {
		Ivaventa = ivaventa;
	}

	public double getTotal_venta() {
		return Total_venta;
	}

	public void setTotal_venta(double total_venta) {
		Total_venta = total_venta;
	}

	public double getValor_venta() {
		return Valor_venta;
	}

	public void setValor_venta(double valor_venta) {
		Valor_venta = valor_venta;
	}

	@Override
	public String toString() {
          return "s";
	}
}
