<%@page import="controlador.UsuarioBO"%>
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
boolean resultado = UsuarioBO.eliminar(Long.parseLong(request.getParameter("cedula")));
if (resultado){
	response.sendRedirect("Usuarios.jsp");
}
else{
	response.sendRedirect("Usuarios_mal.jsp");
}
%>
</body>
</html>