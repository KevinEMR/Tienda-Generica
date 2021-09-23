<%@page import="controlador.UsuarioBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios</title>
<style type="text/css">
#Usua{
color:black;
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<form action="Usuario_agregar.jsp">
<button type="submit" class="btn btn-primary">Agregar Usuario</button>
<div id = "mensaje">
        	Error al eliminar usuario
        	</div>
</form>
<table class="table table-hover">
  <thead class = "table-dark">
    <tr>
      <th scope="col">Cedula</th>
      <th scope="col">Correo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Contraseña</th>
      <th scope="col">Usuario</th>
      <th scope="col" colspan = "2">Acciones</th>
    </tr>
  </thead>
  <tbody>
  <% UsuarioBO usuario = new UsuarioBO();%>
  <% List<UsuarioVO> list = UsuarioBO.obtener_todos();%>
  <% 
  
  		for(int i = 0;i<list.size();i++){ 
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getCedula()%></th>
      <td><%= list.get(i).getCorreo()%></td>
      <td><%= list.get(i).getNombre()%></td>
      <td><%= list.get(i).getContraseña()%></td>
      <td><%= list.get(i).getUsuario()%></td>
      <td><a href = "Usuario_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
      <td><a href = "Usuario_elimiar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
    </tr>
    <%} %>
  </tbody>
</table>
</body>
</html>