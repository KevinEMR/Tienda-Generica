<%@page import="controlador.ClienteBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Usuario</title>
</head>
<body>
<% 
boolean resultado = ClienteBO.eliminar(Long.parseLong(request.getParameter("cedula")));
if (resultado){
	response.sendRedirect("/Clientes");
}
else{
	response.sendRedirect("/Eliminar_cliente_error");
}
%>
</body>
</html>