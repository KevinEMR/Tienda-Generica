<%@page import="controlador.ClienteBO"%>
<%@page import="modelo.ClienteVO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="bootstrap-5.1.0-dist\css\bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap.rtl.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-grid.css"
	rel="stylesheet" type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-grid.rtl.css"
	rel="stylesheet" type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-reboot.css"
	rel="stylesheet" type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-reboot.rtl.css"
	rel="stylesheet" type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-utilities.css"
	rel="stylesheet" type="text/css" />
<link href="bootstrap-5.1.0-dist\css\bootstrap-utilities.rtl.css"
	rel="stylesheet" type="text/css" />
<title>Editar Usuario</title>
<style type="text/css">
#esconder {
	visibility: hidden;
}
</style>
</head>
<body background="Imagenes\fondo.png">
	<%
	ClienteVO usuario = ClienteBO.obteneruno("cedula_cliente", request.getParameter("cedula"));
	%>
	<form id="U_editar"
		action="/Editar_cliente?cedula=<%=request.getParameter("cedula")%>">
		<div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Correo</label> <input
					type="text" class="form-control" name="correo"
					value="<%=usuario.getCorreo()%>">
			</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Nombre</label> <input
					type="text" class="form-control" name="nombre"
					value="<%=usuario.getNombre()%>">
			</div>
			<div class="mb-3">
				<label for="Password" class="form-label">Teléfono</label> <input
					type="text" class="form-control" name="telefono"
					value="<%=usuario.getTelefono()%>">
			</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Dirección</label> <input
					type="text" class="form-control" name="direccion"
					value="<%=usuario.getDireccion()%>">
			</div>
			<div class="mb-3" id="esconder">
				<label for="Usuario" class="form-label">Cedula</label> <input
					type="text" class="form-control" name="cedula"
					value="<%=request.getParameter("cedula")%>">
			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Aceptar</button>
				<input type="button" onclick="location.href='/Clientes';"
					class="btn btn-primary" name="Atrás" value="Atrás">
			</div>
		</div>
	</form>
	<%
	boolean resultado;
	try {
		if (request.getParameter("correo") != null && request.getParameter("nombre") != null
		&& request.getParameter("telefono") != null && request.getParameter("direccion") != null) {
			System.out.println(request.getParameter("correo"));
			if (request.getParameter("correo").equals("") || request.getParameter("nombre").equals("") || request.getParameter("telefono").equals("") || request.getParameter("direccion").equals("")) {
				resultado = false;
					} else {
		String correo = request.getParameter("correo");
		String nombre = request.getParameter("nombre");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");
		long cedula = Long.parseLong((request.getParameter("cedula")));
		ClienteVO suario = new ClienteVO(cedula, direccion, correo, nombre, telefono);
		resultado = ClienteBO.actualizar(suario);
			}
			if (!resultado) {
		response.sendRedirect("/Editar_cliente_error?cedula="+ request.getParameter("cedula"));
			} else {
		response.sendRedirect("/Clientes");
			}
		}
	} catch (Exception e) {
		response.sendRedirect("/Editar_cliente_error?cedula="+ request.getParameter("cedula"));
	}
	%>
</body>
</html>