package dao;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opencsv.*;

import conexionmysql.Conexion;
import modelo.ProductosVO;

public class ProductosDAO extends Conexion implements InterfaceProductosDAO {
    Connection cn = conectar();
    Statement sm = null;
    ResultSet rs = null;
    
	@Override
	public boolean leerycargar(CSVReader archivo) {
		boolean resultado = true;
		List<ProductosVO> productos;
		productos = new ArrayList<>();
	    try {
	      String[] fila = null;
	      int i = 0;
	      while((fila = archivo.readNext()) != null) {
	    	  ProductosVO produc = new ProductosVO(Long.parseLong(fila[0]),Double.parseDouble(fila[4]),Long.parseLong(fila[2]),fila[1],Double.parseDouble(fila[3]),Double.parseDouble(fila[5]));
	    	  productos.add(produc);
	    	  System.out.println(productos.get(i).getCodigo());
	    	  i++;
	      }
	      for(i=0;i<productos.size();i++) {
	          try {
	              sm = cn.createStatement();
	              sm.executeUpdate(
	                      "INSERT INTO bd_tienda_generica.productos (codigo_producto, ivacompra, nitproveedor, nombre_producto, precio_compra, precio_venta)\r\n VALUES ('"
	                      + productos.get(i).getCodigo() + "','" + productos.get(i).getIva() + "','"
	                      + productos.get(i).getNit_proveedor() + "','" + productos.get(i).getNombre() + "','"
	                      + productos.get(i).getPrecio_compra() + "','"+productos.get(i).getPrecio_venta()+"');");
	              System.out.println("for: "+productos.get(i).getCodigo());
	          } catch (SQLException e) {
	              System.out.println("ERROR: " + e);
	              resultado = false;
	          } finally {
	              try {
	                  sm.close();
	              } catch (SQLException e) {
	                  System.out.println("ERROR: " + e);
	              }
	          }
	      }

	    }
	    catch(IOException e) {
	      System.out.println(e);
	    }
	    catch(Exception e) {
	      System.out.println(e);
	    }
		return resultado;
	}
}
