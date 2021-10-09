package modelo;

public class Detalle_VentasVO {
	private int Cantidad_producto;
	private long Codigo_detalle_venta, Codigo_producto, Codigo_venta;
	private double Valoriva, Valor_total, Valor_venta;
	
	public Detalle_VentasVO(){
	}
	
	public Detalle_VentasVO(long codigo_detalle_venta , int cantidad_producto, long codigo_producto, long codigo_venta, double valor_total, double valor_venta, double valoriva) {
		this.Codigo_detalle_venta = codigo_detalle_venta;
		this.Cantidad_producto = cantidad_producto;
		this.Codigo_producto = codigo_producto;
		this.Codigo_venta = codigo_venta;
		this.Valor_total = valor_total;
		this.Valor_venta = valor_venta;
		this.Valoriva = valoriva;
	}

	public int getCantidad_producto() {
		return Cantidad_producto;
	}

	public void setCantidad_producto(int cantidad_producto) {
		Cantidad_producto = cantidad_producto;
	}

	public long getCodigo_detalle_venta() {
		return Codigo_detalle_venta;
	}

	public void setCodigo_detalle_venta(long codigo_detalle_venta) {
		Codigo_detalle_venta = codigo_detalle_venta;
	}

	public long getCodigo_producto() {
		return Codigo_producto;
	}

	public void setCodigo_producto(long codigo_producto) {
		Codigo_producto = codigo_producto;
	}

	public long getCodigo_venta() {
		return Codigo_venta;
	}

	public void setCodigo_venta(long codigo_venta) {
		Codigo_venta = codigo_venta;
	}

	public double getValoriva() {
		return Valoriva;
	}

	public void setValoriva(double valoriva) {
		Valoriva = valoriva;
	}

	public double getValor_total() {
		return Valor_total;
	}

	public void setValor_total(double valor_total) {
		Valor_total = valor_total;
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
