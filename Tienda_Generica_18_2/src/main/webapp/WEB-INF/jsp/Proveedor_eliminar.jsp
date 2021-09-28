<%@page import="controlador.ProveedoresBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Proveedor</title>
</head>
<body>
<% 
boolean resultado = ProveedoresBO.eliminar(Long.parseLong(request.getParameter("nit")));
if (resultado){
	response.sendRedirect("/Proveedores");
}
else{
	response.sendRedirect("/Eliminar_proveedor_error");
}
%>
</body>
</html>