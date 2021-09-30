<%@page import="controlador.ProveedoresBO"%>
<%@page import="modelo.ProveedoresVO"%>
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
<title>Editar Proveedor</title>
<style type="text/css">
#esconder {
	visibility: hidden;
}
</style>
</head>
<body background="Imagenes\fondo.png">
	<%
	ProveedoresVO usuario = ProveedoresBO.obteneruno("nitproveedor", request.getParameter("nit"));
	%>
	<form id="U_editar"
		action="/Editar_proveedor?nit=<%=request.getParameter("nit")%>">
		<div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Ciudad</label> <input
					type="text" class="form-control" name="ciudad"
					value="<%=usuario.getCiudad()%>">
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
				<label for="Usuario" class="form-label">NIT</label> <input
					type="hidden" class="form-control" name="nit"
					value="<%=request.getParameter("nit")%>">
			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Aceptar</button>
				<input type="button" onclick="location.href='/Proveedores';"
					class="btn btn-primary" name="Atrás" value="Atrás">
			</div>
		</div>
	</form>
	<%
	boolean resultado;
	try {
		if (request.getParameter("ciudad") != null && request.getParameter("nombre") != null
		&& request.getParameter("telefono") != null && request.getParameter("direccion") != null) {
			System.out.println(request.getParameter("ciudad"));
			if (request.getParameter("ciudad").equals("") || request.getParameter("nombre").equals("") || request.getParameter("telefono").equals("") || request.getParameter("direccion").equals("")) {
				resultado = false;
					} else {
		String ciudad = request.getParameter("ciudad");
		String nombre = request.getParameter("nombre");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");
		long nit = Long.parseLong((request.getParameter("nit")));
		ProveedoresVO suario = new ProveedoresVO(nit, ciudad, nombre, direccion, telefono);
		resultado = ProveedoresBO.actualizar(suario);
			}
			if (!resultado) {
		response.sendRedirect("/Editar_proveedor_error?nit="+ request.getParameter("nit"));
			} else {
		response.sendRedirect("/Proveedores");
			}
		}
	} catch (Exception e) {
		response.sendRedirect("/Editar_proveedor_error?nit="+ request.getParameter("nit"));
	}
	%>
</body>
</html>