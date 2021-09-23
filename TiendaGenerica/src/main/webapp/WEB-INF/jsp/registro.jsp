<%@page import="controlador.UsuarioBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
</head>
<body>
<%String Usuario = request.getParameter("usuario");%>
<%String Password = request.getParameter("password");%>
<% UsuarioBO usuario = new UsuarioBO();%>
<%boolean result = UsuarioBO.usuario_existe(Usuario, Password);%>
<%if(result){
	response.sendRedirect("/Usuarios");
} else{
	response.sendRedirect("/Loginmal");
}%>
</body>
</html>