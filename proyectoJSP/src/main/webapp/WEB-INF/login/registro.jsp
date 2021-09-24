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
<jsp:include page = "/WEB-INF/Usuarios/Usuarios.jsp"></jsp:include>
<jsp:include page = "/WEB-INF/login/Loginmal.jsp"></jsp:include>
<%String Usuario = request.getParameter("usuario");%>
<%String Password = request.getParameter("password");%>
<% UsuarioBO usuario = new UsuarioBO();%>
<%boolean result = UsuarioBO.usuario_existe(Usuario, Password);%>
<%if(result){
	response.sendRedirect("Usuarios.jsp");
} else{
	response.sendRedirect("Loginmal.jsp");
}%>
</body>
</html>