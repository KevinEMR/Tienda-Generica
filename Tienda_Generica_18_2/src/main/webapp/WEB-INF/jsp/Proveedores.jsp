<%@page import="controlador.UsuarioBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proveedores</title>
<style type="text/css">
#Provee{
color:black;
}
#consultar_usuario{
background-color:#212529;
padding:15px;
}
#agregar_usuario{
background-color:#212529;
padding:10px;
border-bottom: 1px solid white
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<form action="/Agregar_usuario" id ="agregar_usuario" method = post>
<button type="submit" class="btn btn-outline-light">Agregar Usuario</button>
</form>
<form id = "consultar_usuario" action="/Usuarios">
<table>
<tr>
<th><select class="form-select" name = "list" aria-label="Default select example">
  <option value = "0" >Todo</option>
  <option value="1">Cedula</option>
  <option value="2">Correo</option>
  <option value="3">Nombre</option>
  <option value="4">Contraseña</option>
  <option value="5">Usuario</option>
</select>
</th>
<th>
<div>
<input type="text" class="form-control" name="busqueda" >
</div>
</th>
<th><button type="submit" class="btn btn-outline-light">Consultar</button></th>
</tr>
</table>
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
  <% 
  if(request.getParameter("list")==null || request.getParameter("list").equals("0")){
	  UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtener_todos();
	  if(list != null){
  		for(int i = 0;i<list.size();i++){ 
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getCedula()%></th>
      <td><%= list.get(i).getCorreo()%></td>
      <td><%= list.get(i).getNombre()%></td>
      <td><%= list.get(i).getContraseña()%></td>
      <td><%= list.get(i).getUsuario()%></td>
      <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
      <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
    </tr>
    <%}}}
  else if(request.getParameter("list").equals("1")){
	  UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtenerporparametro("cedula_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCedula()%></th>
    <td><%= list.get(i).getCorreo()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getContraseña()%></td>
    <td><%= list.get(i).getUsuario()%></td>
    <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
    <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
  </tr>
  <%}}}
else if(request.getParameter("list").equals("2")){
	 UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtenerporparametro("email_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
 <tr>
   <th scope="row"><%= list.get(i).getCedula()%></th>
   <td><%= list.get(i).getCorreo()%></td>
   <td><%= list.get(i).getNombre()%></td>
   <td><%= list.get(i).getContraseña()%></td>
   <td><%= list.get(i).getUsuario()%></td>
   <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
   <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
 </tr>
 <%}}}
else if(request.getParameter("list").equals("3")){
	 UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtenerporparametro("nombre_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getContraseña()%></td>
  <td><%= list.get(i).getUsuario()%></td>
  <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("4")){
	 UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtenerporparametro("password", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getContraseña()%></td>
  <td><%= list.get(i).getUsuario()%></td>
  <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("5")){
	 UsuarioBO usuario = new UsuarioBO();
	  List<UsuarioVO> list = UsuarioBO.obtenerporparametro("usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getContraseña()%></td>
  <td><%= list.get(i).getUsuario()%></td>
  <td><a href = "/Editar_usuario?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "/Eliminar_usuario?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
%>
  </tbody>
</table>
</body>
</html>