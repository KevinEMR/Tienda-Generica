<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="controlador.UsuarioBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@page import="controlador.Control"%>
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
<title>Login</title>
</head>
<body background="Imagenes\fondo.png">
	<form action="/Login_error" method=post>
		<div id="login">
			<div id="mensaje">Usuario o contraseña incorrecto</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Usuario</label> <input
					type="text" class="form-control" name="usuario">
			</div>
			<div class="mb-3">
				<label for="Password" class="form-label">Contraseña</label> <input
					type="password" class="form-control" name="password">
			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Aceptar</button>
			</div>
		</div>
	</form>
	<%
	if (request.getParameter("usuario") != null && request.getParameter("password") != null) {
		String Usuario = request.getParameter("usuario");
		String Password = request.getParameter("password");
		UsuarioBO usuario = new UsuarioBO();
		Control controlar = new Control();
		boolean result = UsuarioBO.usuario_existe(Usuario, Password);
		System.out.println("Entro al if");
		if (result) {
			UsuarioVO existente = UsuarioBO.obteneruno("usuario",Usuario);
			HttpSession sesio = request.getSession(true);
			session.setAttribute("usuario", existente.getCedula());
			response.sendRedirect("/Usuarios");
		} else {
			response.sendRedirect("/Login_error");
		}
	}
	%>
</body>
</html>