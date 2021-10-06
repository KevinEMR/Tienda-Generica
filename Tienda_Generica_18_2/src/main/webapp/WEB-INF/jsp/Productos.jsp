<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ProductosVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productos</title>
<style type="text/css">
#Produc{
color:black;
}
#consultar_producto{
background-color:#212529;
padding:15px;
}
#agregar_producto{
background-color:#212529;
padding:10px;
border-bottom: 1px solid white
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<form action="/Agregar_producto" id ="agregar_producto" method = post>
<button type="submit" class="btn btn-outline-light">Agregar Producto</button>
</form>
<form id = "consultar_producto" action="/Productos">
<table>
<tr>
<th><select class="form-select" name = "list" aria-label="Default select example">
  <option value = "0" >Todo</option>
  <option value="1">Código</option>
  <option value="2">IVA</option>
  <option value="3">NIT de Proveedor</option>
  <option value="4">Nombre</option>
  <option value="5">Precio de Compra</option>
  <option value="6">Precio de Venta</option>
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
      <th scope="col">Código</th>
      <th scope="col">IVA</th>
      <th scope="col">NIT de Proveedor</th>
      <th scope="col">Nombre</th>
      <th scope="col">Precio de Compra</th>
      <th scope="col">Precio de Venta</th>
      <th scope="col" colspan = "2">Acciones</th>
    </tr>
  </thead>
  <tbody>
  <% 
  if(request.getParameter("list")==null || request.getParameter("list").equals("0")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtener_todos();
	  if(list != null){
  		for(int i = 0;i<list.size();i++){ 
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getCodigo()%></th>
      <td><%= list.get(i).getIva()%></td>
      <td><%= list.get(i).getNit_proveedor()%></td>
      <td><%= list.get(i).getNombre()%></td>
      <td><%= list.get(i).getPrecio_compra()%></td>
      <td><%= list.get(i).getPrecio_venta()%></td>
      <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
      <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
    </tr>
    <%}}}
  else if(request.getParameter("list").equals("1")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("codigo_producto", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
  else if(request.getParameter("list").equals("2")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("ivacompra", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
  else if(request.getParameter("list").equals("3")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("nitproveedor", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
  else if(request.getParameter("list").equals("4")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("nombre_producto", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
  else if(request.getParameter("list").equals("5")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("precio_compra", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
  else if(request.getParameter("list").equals("6")){
	  ProductosBO usuario = new ProductosBO();
	  List<ProductosVO> list = ProductosBO.obtenerporparametro("precio_venta", request.getParameter("busqueda"));
	  if(list != null){
		for(int i = 0;i<list.size();i++){ 
			  
%>
  <tr>
    <th scope="row"><%= list.get(i).getCodigo()%></th>
    <td><%= list.get(i).getIva()%></td>
    <td><%= list.get(i).getNit_proveedor()%></td>
    <td><%= list.get(i).getNombre()%></td>
    <td><%= list.get(i).getPrecio_compra()%></td>
    <td><%= list.get(i).getPrecio_venta()%></td>
    <td><a href = "/Editar_producto?codigo=<%= list.get(i).getCodigo() %>">Editar</a></td>
    <td><a href = "/Eliminar_producto?codigo=<%= list.get(i).getCodigo() %>">Eliminar</a></td>
  </tr>
  <%}}}
%>
  </tbody>
</table>
</body>
</html>