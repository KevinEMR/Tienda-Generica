<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@page import="modelo.VentasVO"%>
<%@page import="controlador.VentasBO"%>
<%@page import="modelo.Detalle_VentasVO"%>
<%@page import="controlador.Detalle_VentasBO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Map m=request.getParameterMap();
Set s = m.entrySet();
Iterator it = s.iterator();
long index = m.size();
for(int i = 0; i<=index;i++){
	VentasVO ventas = new VentasVO();
	Detalle_VentasVO detalleventas= new Detalle_VentasVO();
    while(it.hasNext()){

        Map.Entry<String,String[]> entry = (Map.Entry<String,String[]>)it.next();

        String key             = entry.getKey();
        String[] value         = entry.getValue();

        System.out.println("Key is "+key);
        if(key.contains("busqueda_producto")){
        	detalleventas.setCodigo_producto(Long.parseLong(value[0].toString()));
        }
        else if(key.contains("producto")){
        	System.out.println("nombre no se necesita");
        }
        else if(key.contains("cantidad")){
        	detalleventas.setCantidad_producto(Integer.parseInt(value[0].toString()));
        }
        else if(key.contains("total")){
        	System.out.println("total producto no se necesita");
        }
        else if(key.contains("total_factura")){
        	detalleventas.setValor_total(Double.parseDouble(value[0].toString()));
        	ventas.setTotal_venta(Double.parseDouble(value[0].toString()));
        }
        else if(key.contains("iva")){
        	detalleventas.setValoriva(Double.parseDouble(value[0].toString()));
        	ventas.setIvaventa(Double.parseDouble(value[0].toString()));
        }
        else if(key.contains("no_factura")){
        	detalleventas.setCodigo_venta(Long.parseLong(value[0].toString()));
        	ventas.setCodigo_venta(Long.parseLong(value[0].toString()));
        }
        else if(key.contains("cliente_venta")){
        	ventas.setCedula_cliente(Long.parseLong(value[0].toString()));
        }
        else if(key.contains("factura")){
        	detalleventas.setValor_venta(Double.parseDouble(value[0].toString()));
        	ventas.setValor_venta(Double.parseDouble(value[0].toString()));
        }

            /*if(value.length>1){    
                for (int j = 0; i < value.length; j++) {
                	System.out.println(value[j].toString());
                }
            }else
            	System.out.println("Value is "+value[0].toString());

            System.out.println("-------------------");*/
    }  
}
%>
</body>
</html>