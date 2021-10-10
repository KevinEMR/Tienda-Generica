<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@page import="modelo.VentasVO"%>
<%@page import="controlador.VentasBO"%>
<%@page import="modelo.Detalle_VentasVO"%>
<%@page import="controlador.Detalle_VentasBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Guardar Venta</title>
</head>
<body>
<%

Map m=request.getParameterMap();
Set s = m.entrySet();
Iterator it = s.iterator();
int indexx = m.size();
long index = (indexx-5)/4;
List<VentasVO> listaVentas = new ArrayList<>();
List<Detalle_VentasVO> listaDetalleVentas = new ArrayList<>();
List<String> valores = new ArrayList<>();

int i= 1;

VentasBO vent = new VentasBO();
Detalle_VentasBO detvent = new Detalle_VentasBO();

VentasVO ventas = new VentasVO();
listaVentas.add(ventas);

HttpSession sesion= request.getSession(false);
long miproducto= (Long) sesion.getAttribute("usuario");
listaVentas.get(0).setCedula_usuario(miproducto);

List<Detalle_VentasVO> listaDetalle = Detalle_VentasBO.obtener_todos();
int k = listaDetalle.size();
long codigo_detalle_venta = (listaDetalle.get(k-1).getCodigo_detalle_venta())+1;

for(int j = 1;j<=index;j++){
	Detalle_VentasVO detalleventas = new Detalle_VentasVO();
	listaDetalleVentas.add(detalleventas);
}

    while(it.hasNext()){

        Map.Entry<String,String[]> entry = (Map.Entry<String,String[]>)it.next();

        String key             = entry.getKey();
        String[] value         = entry.getValue();
        
        valores.add(value[0].toString());
            /*if(value.length>1){    
                for (int j = 0; i < value.length; j++) {
                	System.out.println(value[j].toString());
                }
            }else
            	System.out.println("Value is "+value[0].toString());

            System.out.println("-------------------");*/
    }
    
    listaVentas.get(0).setCodigo_venta(Long.parseLong(valores.get(indexx-1)));
	listaVentas.get(0).setCedula_cliente(Long.parseLong(valores.get(indexx-2)));
	listaVentas.get(0).setIvaventa(Double.parseDouble(valores.get(indexx-4)));
	listaVentas.get(0).setTotal_venta(Double.parseDouble(valores.get(indexx-3)));
	listaVentas.get(0).setValor_venta(Double.parseDouble(valores.get(indexx-5)));
	
	System.out.println(VentasBO.isertarestudiante(listaVentas.get(0)));
    
	int j = 0;
	
    for(int p=0;p<=index-1;p++){
    	
    	listaDetalleVentas.get(p).setCodigo_detalle_venta(codigo_detalle_venta+p);
    	listaDetalleVentas.get(p).setCantidad_producto(Integer.parseInt(valores.get(2+j)));
    	listaDetalleVentas.get(p).setCodigo_producto(Long.parseLong(valores.get(0+j)));
    	listaDetalleVentas.get(p).setCodigo_venta(Long.parseLong(valores.get(indexx-1)));
    	listaDetalleVentas.get(p).setValor_total(Double.parseDouble(valores.get(indexx-3)));
    	listaDetalleVentas.get(p).setValor_venta(Double.parseDouble(valores.get(indexx-5)));
    	listaDetalleVentas.get(p).setValoriva(Double.parseDouble(valores.get(indexx-4)));
    	
    	System.out.println(Detalle_VentasBO.isertarestudiante(listaDetalleVentas.get(p)));
    	j = j+4;
    }
    
    response.sendRedirect("/Ventas");
%>
</body>
</html>