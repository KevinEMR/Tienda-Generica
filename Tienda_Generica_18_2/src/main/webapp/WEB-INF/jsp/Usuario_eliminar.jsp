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
	response.sendRedirect("/Usuarios");
}
else{
	response.sendRedirect("/Eliminar_usuario_error"+request.getParameter("usuario_cedula"));
}
%>
</body>
</html>