<%@page import="controlador.UsuarioBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes_usuarios</title>
<style type="text/css">
#Usua{
color:black;
}
#consultar_usuario{background-color:#212529;
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
<h1 style="margin-top: 2px; font-family: Playfair Display; !important"
		align="center">Listado de usuarios</h1>
<form id="redirect"></form>
	<form action="/Reportes" id="redirect" method=post
		style="display: grid;">
		<button type="submit" class="btn btn-secondary"
			style="margin-inline: auto; width: 50em; margin-top: 2px; margin-bottom: 5px;">Volver</button>
	</form>
<table>
<tr>
<th>
</th>
<th>
</th>
</tr>
</table>
<table class="table table-hover">
  <thead class = "table-dark">
    <tr>
      <th scope="col">Cedula</th>
      <th scope="col">Dirección</th>
      <th scope="col">Email</th>
      <th scope="col">Usuario</th>
      <th scope="col">Contraseña</th>
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
    </tr>
    <%}}}
%>
  </tbody>
</table>
</body>
</html>