<%@page import="controlador.UsuarioBO"%>
<%@page import="modelo.UsuarioVO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="bootstrap-5.1.0-dist\css\bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-grid.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-grid.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-reboot.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-utilities.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap-5.1.0-dist\css\bootstrap-utilities.rtl.css" rel="stylesheet" type="text/css"/>
<title>Editar Usuario</title>
<style type="text/css">
#esconder{
visibility:hidden;
}
</style>
</head>
<body background="Imagenes\fondo.png">
<% 
UsuarioVO usuario = UsuarioBO.obteneruno("cedula_usuario", request.getParameter("cedula"));
%>
<form id = "U_editar" action = "/Editar_usuario_error?cedula=<%= request.getParameter("cedula")%>">
<div id = "mensaje">
        	Error al editar usuario
        	</div>
		<div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Correo</label>
            <input type="text" class="form-control" name="correo" value = "<%= usuario.getCorreo() %>" >
            </div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Nombre</label>
            <input type="text" class="form-control" name="nombre" value = "<%= usuario.getNombre() %>">
            </div>
            <div class="mb-3">
            <label for="Password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" name="contrasena" value = "<%= usuario.getContraseña() %>">
            </div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Usuario</label>
            <input type="text" class="form-control" name="usuario" value = "<%= usuario.getUsuario() %>">
            </div>
            <div class="mb-3" id = "esconder">
            <label for="Usuario" class="form-label">Cedula</label>
            <input type="hidden" class="form-control" name="cedula" value= "<%= request.getParameter("cedula") %>">
            </div>
            <div class="mb-3 form-check">
                <button type="submit" class="btn btn-primary">Aceptar</button>
                <input type="button" onclick="location.href='/Usuarios';" class="btn btn-primary" name="Atrás" value="Atrás">
            </div>
        </div>
    </form>
  	<%
	boolean resultado;
	try {
		if (request.getParameter("correo") != null && request.getParameter("nombre") != null
		&& request.getParameter("contrasena") != null && request.getParameter("usuario") != null) {
			System.out.println(request.getParameter("correo"));
			if (request.getParameter("correo").equals("") || request.getParameter("nombre").equals("") || request.getParameter("contrasena").equals("") || request.getParameter("usuario").equals("")) {
				resultado = false;
					} else {
				String correo = request.getParameter("correo");
				String nombre = request.getParameter("nombre");
				String contraseña = request.getParameter("contrasena");
				String Usuario = request.getParameter("usuario");
				long cedula = Long.parseLong((request.getParameter("cedula")));
				UsuarioVO suario = new UsuarioVO(cedula, correo, nombre, contraseña, Usuario);
				resultado = UsuarioBO.actualizar(suario);
					}
					if (!resultado) {
				response.sendRedirect("/Editar_usuario_error?cedula="+ request.getParameter("cedula"));
					} else {
				response.sendRedirect("/Usuarios");
					}
				}
			} catch (Exception e) {
				response.sendRedirect("/Editar_usuario_error?cedula="+ request.getParameter("cedula"));
			}
			%>
		</body>
		</html>