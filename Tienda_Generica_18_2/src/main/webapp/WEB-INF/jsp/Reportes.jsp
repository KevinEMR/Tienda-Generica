<%@page import="controlador.ClienteBO"%>
<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="modelo.ProductosVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>
<style type="text/css">
#Repor{
color:black;
}
#listado_usuarios{
margin-top: 150px;
margin-left: 600px;
background-color:#212529;
padding:15px;
}
#listado_clientes{
margin-left: 600px;
background-color:#212529;
padding:15px;
}
#listado_ventas{
margin-left: 600px;
background-color:#212529;
padding:15px;
}
.campos{
	margin-top: 30px;
	margin-left: 200px;
}
.tventa{
	margin-top: 30px;
	margin-left: 700px;
}
</style>
</head>
<body>

<jsp:include page = "Menu.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src=""></script>
<form id = "Listado_usuarios">
<table>
<tr id = "fila1">
<td><button type="submit" class="btn btn-outline-light" id="listado_usuarios">Listado de Usuarios</button></td>
</tr>
</table>
</form>
<div id="formoculto">
<form id = "Listado_usuarios" action="/Reportes" method="post" >
<table class="table table-hover">
<tbody>
<tr id = "fila1">
<td><label >Cédula</label></td>
<td> <label>Nombre</label></td>
<td> <label>Correo electronico</label></td>
<td> <label>Usuario</label></td>
<td> <label>Password</label></td>
</tr>
</table>
</form>
</div>
<form id = "Listado_clientes">
<table>
<tr id = "fila2">
<td><button type="submit" class="btn btn-outline-light" id="listado_clientes">Listado de Clientes</button></td>
</tr>
</table>
</form>
<div id="formoculto">
<form id = "Listado_clientes" action="/Reportes">
<table class="table table-hover">
<tbody>
<tr id = "fila2">
<td><label >Cédula</label></td>
<td> <label>Nombre</label></td>
<td> <label>Correo electronico</label></td>
<td> <label>Dirección</label></td>
<td> <label>Telefono</label></td>
</tr>
</table>
</form>
</div>
<form id = "Listado_ventas">
<table>
<tr id = "fila3">
<td><button type="submit" class="btn btn-outline-light" id="listado_ventas">Listado de Ventas</button></td>
</tr>
</table>
</form>
<div id="formoculto">
<form id = "Listado_ventas" action="/Reportes">
<table class="table table-hover">
<tbody>
<tr id = "fila3">
<td><label class="campos">Cédula</label></td>
<td> <label class="campos">Nombre</label></td>
<td> <label class="campos">Valor Total Ventas</label></td>
</tr>
</table>
</form>
</div>
<table style="margin:auto;">
<tr>
<td> <label class="tventa">Total Ventas $</label></td>
<td><input type="text" class="form-control" name="factura" disabled></td>
</tr>
<tr>
</table>
</body>