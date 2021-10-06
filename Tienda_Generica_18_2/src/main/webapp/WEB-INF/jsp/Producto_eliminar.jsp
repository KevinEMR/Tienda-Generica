<%@page import="controlador.ProductosBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Producto</title>
</head>
<body>
<% 
boolean resultado = ProductosBO.eliminar(Long.parseLong(request.getParameter("codigo")));
if (resultado){
	response.sendRedirect("/Productos");
}
else{
	%>
	<script type="text/javascript">
	alert('Error al eliminar producto')
	</script>
	<%
	if(!resultado){
		response.sendRedirect("/Productos");
	}
}
%>
</body>
</html>