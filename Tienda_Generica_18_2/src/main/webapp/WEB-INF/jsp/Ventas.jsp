<%@page import="controlador.ClienteBO"%>
<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="modelo.ProductosVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson" %>
<%@page import="java.lang.reflect.Type" %>
<%@page import="java.util.LinkedList" %>
<%@page import="com.google.gson.reflect.TypeToken" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas</title>
<style type="text/css">
#Vent{
color:black;
}
#consultar_cliente{
background-color:#212529;
padding:15px;
}
#contenedor{
    margin-top:3em;
}
#contenedor br{
    display: none;
}

#buscar_codigo{
margin-top:15px;
  margin-left: 40rem;
}

#formoculto{
display:none;
}
</style>
</head>
<body>

<jsp:include page = "Menu.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<form id = "consultar_cliente" action="/Ventas" method=post>
<table>
<tr id = "fila1">
<td> <label for="cedula_cliente" style=color:#fff;>Cedula Cliente:</label></td>
<td><input type="text" class="form-control" name="busqueda" ></td>
<td><button type="submit" class="btn btn-outline-light" id="buscar_cliente">Buscar Cliente</button></td>
</tr>
</table>
</form>
<div id="formoculto">
<form id = "consultar_producto" action="/Ventas">
<table class="table table-hover">
<tbody>
<tr id = "fila3">
<td><label for="codigo_producto" class="">Código:</label></td>
<td><input type="text" class="form-control" name="busqueda_producto" id="codigo_producto"></td>
<td><button type="button" class="btn btn-outline-dark" id="codigo" >Consultar</button></td>
<td> <label for="codigo_producto">Nombre:</label></td>
<td><input type="text" class="form-control" name="nombre_producto" disabled></td>
<td> <label for="codigo_producto">Cantidad:</label></td>
<td><input type="text" class="form-control" name="cantidad"></td>
<td> <label for="codigo_producto">Vlr.Total:</label></td>
<td><input type="text" class="form-control" name="total" disabled></td>
</tr>
<tr id="fila4">
<td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td>
</tr>
</tbody>
</table>
<table style="margin:auto;">
<tr>
<td> <label for="codigo_producto">Total Venta:</label></td>
<td><input type="text" class="form-control" name="factura" disabled></td>
</tr>
<tr>
<td> <label for="codigo_producto">Total IVA:</label></td>
<td><input type="text" class="form-control" name="iva" disabled></td>
</tr>
<tr>
<td> <label for="codigo_producto">Total con IVA:</label></td>
<td><input type="text" class="form-control" name="total_factura" disabled></td>
</tr>
</table>
<button type="submit" class="btn btn-outline-dark" id="buscar_codigo">Confirmar</button>
</form>
</div>
<% if(request.getParameter("name")!=null){
	String name = request.getParameter("name");
	System.out.println("name");
%>
<script type="text/javascript">
$(document).ready(function() {
	
	var oculto = "<%=name%>";
	var filascant = 4;
	
    	var fila = $('#fila1');
        fila.after('<tr id="fila2"><td><label for="cedula_cliente" style=color:#fff;>Nombre Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" value="'+oculto+'" disabled></td><td><label for="cedula_cliente" style=color:#fff;>&nbsp&nbsp&nbspNo.Factura:</label></td><td><input type="text"  class="form-control" name="nombre" value="Mickey" disabled></td><td><button type="button" class="btn btn-outline-light" id="cambiar_cliente">Escoger otro Cliente</button></td><td><button type="button" class="btn btn-outline-light" id="borrar">Borrar todo</button></td></tr>');
        fila.remove();
        document.getElementById("formoculto").style.display = "block";
        <%ProductosBO producto = new ProductosBO();
        List<ProductosVO> list = ProductosBO.obtener_todos();
        
        Type listType = new TypeToken<List<ProductosVO>>() {}.getType();
        Gson gson = new Gson();
        String json = gson.toJson(list, listType);
        System.out.println(json);
        %>
        var lista_productos = <%=json%>;
       
        
    $(document).on('click', '#añadir_producto', function(){
    	var fila = $('#fila4');
    	filascant = filascant+1;
    	fila.after('<tr id="fila'+filascant+'" ><td><label for="codigo_producto" class="">Código:</label></td><br><td><input type="text" class="form-control" name="busqueda_producto"></td><br><td><button type="button" class="btn btn-outline-dark" id="codigo">Consultar</button></td><br><td> <label for="codigo_producto">Nombre:</label></td><br><td><input type="text" class="form-control" name="nombre_producto" disabled></td><br><td> <label for="codigo_producto">Cantidad:</label></td><br><td><input type="text" class="form-control" name="cantidad"></td><br><td> <label for="codigo_producto">Vlr.Total:</label></td><br><td><input type="text" class="form-control" name="total" disabled></td></tr><tr id="fila4"><td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td><td><button type="button" class="btn btn-outline-dark" id="eliminar_producto">-</button><td></tr>');
    	fila.remove();
    });
    
    $(document).on('click', '#eliminar_producto', function(){
    	   if(filascant>5){
    	var fila = $('#fila'+filascant);
    	fila.remove();
    	filascant = filascant-1;
    }
    	   else if(filascant==5){
    		var fila = $('#fila'+filascant);
   	    	var fila2 = $('#fila4');
   	    	fila2.after('<tr id="fila4"><td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td></tr>');
   	    	fila2.remove();
   	    	fila.remove();
   	    	filascant = filascant-1;
    		  
    	   }});
    
    $(document).on('click', '#cambiar_cliente', function(){
    	var fila = $('#fila2');
    	fila.after('<tr id = "fila1"><td> <label for="cedula_cliente" style=color:#fff;>Cedula Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" ></td><td><button type="submit" class="btn btn-outline-light" id="buscar_cliente">Buscar Cliente</button></td></tr>');
    	fila.remove();
    });
    
    $(document).on('click', '#borrar', function(){
    	window.location.href = "/Ventas";
    });
    
    $(document).on('click', '#codigo', function(){
    	alert(document.getElementById("codigo_producto").value);
    });
    

});

<%System.out.println(request.getParameter("name"));} %>
</script>
</body>
</html>