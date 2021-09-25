<%@page import="controlador.ClienteBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clientes</title>
<style type="text/css">
#Clien{
color:black;
}
#consultar_cliente{
background-color:#212529;
padding:15px;
}
#agregar_cliente{
background-color:#212529;
padding:10px;
border-bottom: 1px solid white
}
</style>
</head>
<body>
<jsp:include page = "/WEB-INF/login/Menu.jsp"></jsp:include>
<form action="Cliente_agregar.jsp" id ="agregar_cliente">
<button type="submit" class="btn btn-outline-light">Agregar Cliente</button>
</form>
<form id = "consultar_cliente" action="Clientes.jsp">
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
	  ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtener_todos();
	  if(list != null){
  		for(int i = 0;i<list.size();i++){ 
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getCedula()%></th>
      <td><%= list.get(i).getCorreo()%></td>
      <td><%= list.get(i).getNombre()%></td>
      <td><%= list.get(i).getTelefono()%></td>
      <td><%= list.get(i).getDireccion()%></td>
      <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
      <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
    </tr>
    <%}}}
  else if(request.getParameter("list").equals("1")){
	  ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtenerporparametro("cedula_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCedula()%></th>
    <td><%= list.get(i).getCorreo()%></td>
    <td><%= list.get(i).getNombre()%></td>
   <td><%= list.get(i).getTelefono()%></td>
   <td><%= list.get(i).getDireccion()%></td>
    <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
    <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
  </tr>
  <%}}}
else if(request.getParameter("list").equals("2")){
	ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtenerporparametro("email_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
 <tr>
   <th scope="row"><%= list.get(i).getCedula()%></th>
   <td><%= list.get(i).getCorreo()%></td>
   <td><%= list.get(i).getNombre()%></td>
   <td><%= list.get(i).getTelefono()%></td>
   <td><%= list.get(i).getDireccion()%></td>
   <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
   <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
 </tr>
 <%}}}
else if(request.getParameter("list").equals("3")){
	ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtenerporparametro("nombre_usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><%= list.get(i).getDireccion()%></td>
  <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("4")){
	ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtenerporparametro("password", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><%= list.get(i).getDireccion()%></td>
  <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("5")){
	ClienteBO cliente = new ClienteBO();
	  List<ClienteVO> list = ClienteBO.obtenerporparametro("usuario", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getCedula()%></th>
  <td><%= list.get(i).getCorreo()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><%= list.get(i).getDireccion()%></td>
  <td><a href = "Cliente_editar.jsp?cedula=<%= list.get(i).getCedula() %>">Editar</a></td>
  <td><a href = "Cliente_eliminar.jsp?cedula=<%= list.get(i).getCedula() %>">Eliminar</a></td>
</tr>
<%}}}
%>
  </tbody>
</table>
</body>
</html>