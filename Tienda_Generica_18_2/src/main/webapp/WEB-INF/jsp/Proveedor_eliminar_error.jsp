<%@page import="controlador.ProveedoresBO"%>
<%@page import="modelo.ProveedoresVO"%>
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
#consultar_proveedor{
background-color:#212529;
padding:15px;
}
#agregar_proveedor{
background-color:#212529;
padding:10px;
border-bottom: 1px solid white
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<form action="/Agregar_proveedor" id ="agregar_proveedor">
<button type="submit" class="btn btn-primary">Agregar Proveedor</button>
<div id = "mensaje">
        	Error al eliminar proveedor
        	</div>
</form>
<form id = "consultar_proveedor" action="/Proveedores">
<table>
<tr>
<th><select class="form-select" name = "list" aria-label="Default select example">
  <option value = "0" >Todo</option>
  <option value="1">Nit</option>
  <option value="2">Ciudad</option>
  <option value="3">Nombre</option>
  <option value="4">Direcci�n</option>
  <option value="5">Tel�fono</option>
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
      <th scope="col">Nit</th>
      <th scope="col">Direcci�n</th>
      <th scope="col">Ciudad</th>
      <th scope="col">Nombre</th>
      <th scope="col">Tel�fono</th>
      
      <th scope="col" colspan = "2">Acciones</th>
    </tr>
  </thead>
  <tbody>
 <% 
  if(request.getParameter("list")==null || request.getParameter("list").equals("0")){
	  ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtener_todos();
	  if(list != null){
  		for(int i = 0;i<list.size();i++){ 
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getNit()%></th>
      <td><%= list.get(i).getDireccion()%></td>
      <td><%= list.get(i).getCiudad()%></td>
      <td><%= list.get(i).getNombre()%></td>
      <td><%= list.get(i).getTelefono()%></td>   
      <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
      <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
    </tr>
    <%}}}
  else if(request.getParameter("list").equals("1")){
	  ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtenerporparametro("nitproveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getNit()%></th>
       <td><%= list.get(i).getDireccion()%></td>
    <td><%= list.get(i).getCiudad()%></td>
    <td><%= list.get(i).getNombre()%></td>
   <td><%= list.get(i).getTelefono()%></td>
    <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
    <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
  </tr>
  <%}}}
else if(request.getParameter("list").equals("2")){
	ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtenerporparametro("ciudad_proveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
 <tr>
   <th scope="row"><%= list.get(i).getNit()%></th>
      <td><%= list.get(i).getDireccion()%></td>
   <td><%= list.get(i).getCiudad()%></td>
   <td><%= list.get(i).getNombre()%></td>
   <td><%= list.get(i).getTelefono()%></td>
   <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
   <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
 </tr>
 <%}}}
else if(request.getParameter("list").equals("3")){
	ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtenerporparametro("nombre_proveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getNit()%></th>
    <td><%= list.get(i).getDireccion()%></td>
  <td><%= list.get(i).getCiudad()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
  <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("4")){
	ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtenerporparametro("direccion_proveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getNit()%></th>
    <td><%= list.get(i).getDireccion()%></td>
  <td><%= list.get(i).getCiudad()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
  <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
</tr>
<%}}}
else if(request.getParameter("list").equals("5")){
	ProveedoresBO proveedor = new ProveedoresBO();
	  List<ProveedoresVO> list = ProveedoresBO.obtenerporparametro("telefono_proveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
<tr>
  <th scope="row"><%= list.get(i).getNit()%></th>
   <td><%= list.get(i).getDireccion()%></td>
  <td><%= list.get(i).getCiudad()%></td>
  <td><%= list.get(i).getNombre()%></td>
  <td><%= list.get(i).getTelefono()%></td>
  <td><a href = "/Editar_proveedor?nit=<%= list.get(i).getNit() %>">Editar</a></td>
  <td><a href = "/Eliminar_proveedor?nit=<%= list.get(i).getNit() %>">Eliminar</a></td>
</tr>
<%}}}
%>
  </tbody>
</table>
</body>
</html>