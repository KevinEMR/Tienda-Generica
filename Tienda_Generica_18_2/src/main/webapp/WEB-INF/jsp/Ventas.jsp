<%@page import="controlador.ClienteBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="java.util.List"%>
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
<% if(request.getParameter("name")!=null){
	String name = request.getParameter("name");
	System.out.println("name");
%>
<script type="text/javascript">
$(document).ready(function() {
	
	var oculto = "<%=name%>";
	
    	var fila = $('#fila1');
        fila.after('<tr id="fila2"><td><label for="cedula_cliente" style=color:#fff;>Nombre Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" value="'+oculto+'"></td><td><label for="cedula_cliente" style=color:#fff;>&nbsp&nbsp&nbspNo.Factura:</label></td><td><input type="text"  class="form-control" name="nombre" value="Mickey"></td><td><button type="button" class="btn btn-outline-light" id="cambiar_cliente">Escoger otro Cliente</button></td><td><button type="button" class="btn btn-outline-light" id="borrar">Borrar todo</button></td></tr>');
        fila.remove();

    $(document).on('click', '#cambiar_cliente', function(){
    	var fila = $('#fila2');
    	fila.after('<tr id = "fila1"><td> <label for="cedula_cliente" style=color:#fff;>Cedula Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" ></td><td><button type="submit" class="btn btn-outline-light" id="buscar_cliente">Buscar Cliente</button></td></tr>');
    	fila.remove();
    });
    
    $(document).on('click', '#borrar', function(){
    	window.location.href = "/Ventas";
    });

});

</script>
<%System.out.println(request.getParameter("name"));} %>
</body>
</html>