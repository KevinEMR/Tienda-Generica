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
<title>Agregar Usuario</title>
</head>
<body background="Imagenes\fondo.png">
<form id = "U_editar" action = "Usuario_agregar.jsp">
		<div>
		<div id = "mensaje">
        	Error al crear usuario
        	</div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Cedula</label>
            <input type="text" class="form-control" name="cedula" >
            </div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Correo</label>
            <input type="text" class="form-control" name="correo" >
            </div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Nombre</label>
            <input type="text" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
            <label for="Password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" name="contrasena">
            </div>
            <div class="mb-3">
            <label for="Usuario" class="form-label">Usuario</label>
            <input type="text" class="form-control" name="usuario" >
            </div>
    <div class="mb-3" id = "siono">
            <label for="Usuario" class="form-label">Comprobar</label>
            <input type="text" class="form-control" name="comprobar" value="si" >
            </div>
            <div class="mb-3 form-check">
                <button type="submit" class="btn btn-primary">Aceptar</button>
                <input type="button" onclick="history.back()" class="btn btn-primary" name="Atrás" value="Atrás">
            </div>
        </div>
    </form>
    <%
    try{
    if(request.getParameter("comprobar")!=null){
    	System.out.println("entro 1");
    if(request.getParameter("cedula")!=null && request.getParameter("correo")!=null && request.getParameter("nombre")!=null && request.getParameter("contrasena")!=null && request.getParameter("usuario")!=null){
    	System.out.println("entro 2");
    	long cedula = Long.parseLong((request.getParameter("cedula")));
		String correo = request.getParameter("correo");
		String nombre = request.getParameter("nombre");
		String contraseña = request.getParameter("contrasena");
		String usuario = request.getParameter("usuario");
		UsuarioVO Usuario = new UsuarioVO(cedula,correo,nombre,contraseña,usuario);
		boolean resultado = UsuarioBO.isertarestudiante(Usuario);
		if(!resultado){
			response.sendRedirect("Usuario_agregar_mal.jsp");
		}
		else{
			response.sendRedirect("Usuarios.jsp");
		}
    }
    else{
    	response.sendRedirect("Usuario_agregar_mal.jsp");
    }
    	}
    }catch(Exception e){
    	response.sendRedirect("Usuario_agregar_mal.jsp");
    }
    %>
</body>
</html>