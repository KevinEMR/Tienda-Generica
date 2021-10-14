<%@page import="controlador.VentasBO"%>
<%@page import="controlador.ClienteBO"%>
<%@page import="modelo.VentasVO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes_ventas</title>
<style type="text/css">
#Repor{
color:black;
}
#consultar_ventas{background-color:#212529;
padding:15px;
}
#agregar_venta{
background-color:#212529;
padding:10px;
border-bottom: 1px solid white
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<h1 style="margin-top: 2px; font-family: Playfair Display; !important"
		align="center">Listado de ventas</h1>
<form id="redirect"></form>
	<form action="/Reportes" id="redirect" method=post
		style="display: grid;">
		<button type="submit" class="btn btn-secondary"
			style="margin-inline: auto; width: 50em; margin-top: 2px; margin-bottom: 5px;">Volver</button>
	</form>
<table class="table table-hover">
  <thead class = "table-dark">
    <tr>
      <th scope="col">Cedula_cliente</th>
      <th scope="col">Nombre</th>
      <th scope="col">Valor_Total_Ventas</th>
    </tr>
  </thead>
  <tbody>
  <% 
	  VentasBO usuario = new VentasBO();
	  List<VentasVO> list = VentasBO.obtener_todos();
	  if(list != null){
  		for(int i = 0;i<list.size();i++){ 
  			ClienteBO usuarios = new ClienteBO();
  			ClienteVO cliente = ClienteBO.obteneruno("cedula_cliente", Long.toString(list.get(i).getCedula_cliente()));
  
  %>
    <tr>
      <th scope="row"><%= list.get(i).getCedula_cliente()%> </th>
      <td><%= cliente.getNombre()%></td>      
      <td><%= list.get(i).getTotal_venta()%></td>
    </tr>
    <%}}
%>
  </tbody>
</table>
</body>
</html>