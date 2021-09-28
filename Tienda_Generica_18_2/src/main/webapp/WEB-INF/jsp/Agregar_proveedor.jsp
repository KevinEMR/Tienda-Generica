<%@page import="controlador.ProveedoresBO"%>
<%@page import="modelo.ProveedoresVO"%>
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
<title>Agregar Proveedor</title>
<style type="text/css">
#siono{
display:none;
}
</style>
</head>
<body background="Imagenes\fondo.png">
<form id = "U_editar" action = "/Agregar_proveedor" method = "post" >
		<div>
            <div class="mb-3">
            <label for="Proveedor" class="form-label">Nit</label>
            <input type="text" class="form-control" name="nit" >
            </div>
            <div class="mb-3">
            <label for="Proveedor" class="form-label">Ciudad</label>
            <input type="text" class="form-control" name="ciudad" >
            </div>
            <div class="mb-3">
            <label for="Proveedor" class="form-label">Direccion</label>
            <input type="text" class="form-control" name="direccion">
            </div>
            <div class="mb-3">
            <label for="Proveedor" class="form-label">Nombre</label>
            <input type="password" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
            <label for="Proveedor" class="form-label">Telefono</label>
            <input type="text" class="form-control" name="telefono" >
            </div>
            <div class="mb-3" id = "siono">
            <label for="Proveedor" class="form-label">Comprobar</label>
            <input type="text" class="form-control" name="comprobar" value="si" >
            </div>
            <div class="mb-3 form-check">
                <button type="submit" class="btn btn-primary">Aceptar</button>
                <input type="button" onclick="location.href='/Proveedores';" class="btn btn-primary" name="Atrás" value="Atrás">
            </div>
        </div>
    </form>
    <%
    try{
    if(request.getParameter("comprobar")!=null){
    	System.out.println("entro 1");
    if(request.getParameter("nit")!=null && request.getParameter("ciudad")!=null && request.getParameter("direccion")!=null && request.getParameter("nombre")!=null && request.getParameter("telefono")!=null){
    	System.out.println("entro 2");
    	long nit = Long.parseLong((request.getParameter("nit")));
		String ciudad = request.getParameter("ciudad");
		String direccion = request.getParameter("direccion");
		String nombre = request.getParameter("nombre");
		String telefono = request.getParameter("telefono");
		ProveedoresVO Proveedor = new ProveedoresVO(nit, ciudad, direccion, nombre, telefono);
		boolean resultado = ProveedoresBO.isertarestudiante(Proveedor);
		if(!resultado){
			response.sendRedirect("/Agregar_proveedor_error");
		}
		else{
			response.sendRedirect("/Proveedores");
		}
    }
    else{
    	response.sendRedirect("/Agregar_proveedor_error");
    }
    	}
    }catch(Exception e){
    	response.sendRedirect("/Agregar_proveedor_error");
    }
    %>
</body>
</html>