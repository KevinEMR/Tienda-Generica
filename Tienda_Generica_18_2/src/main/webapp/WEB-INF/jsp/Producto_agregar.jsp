<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ProductosVO"%>
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
<title>Agregar Producto</title>
<style type="text/css">
</style>
</head>
<body background="Imagenes\fondo.png">
	<form id="U_editar" action="/Agregar_producto" method="post">
		<div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">Código</label> <input
					type="text" class="form-control" name="codigo">
			</div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">IVA</label> <input
					type="text" class="form-control" name="iva">
			</div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">NIT de Proveedor</label> <input
					type="text" class="form-control" name="nit">
			</div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">Nombre</label> <input
					type="text" class="form-control" name="nombre">
			</div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">Precio de Compra</label> <input
					type="text" class="form-control" name="compra">
			</div>
			<div class="mb-3">
				<label for="Proveedor" class="form-label">Precio de Venta</label> <input
					type="text" class="form-control" name="venta">
			</div>
			<div class="mb-3" id="siono">
			<input type="hidden" class="form-control" name="comprobar" value="si">
			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Aceptar</button>
				<input type="button" onclick="location.href='/Productos';"
					class="btn btn-primary" name="Atrás" value="Atrás">
			</div>
		</div>
	</form>
	<script type="text/javascript">
	<%
	try {
		if (request.getParameter("comprobar") != null) {
			System.out.println("entro 1");
			if (request.getParameter("codigo") != null && request.getParameter("iva") != null
			&& request.getParameter("nit") != null && request.getParameter("nombre") != null
			&& request.getParameter("compra") != null && request.getParameter("venta") != null) {
		System.out.println("entro 2");
		long codigo = Long.parseLong(request.getParameter("codigo"));
		double iva = Double.parseDouble(request.getParameter("iva"));
		long nit_proveedor = Long.parseLong(request.getParameter("nit"));
		String nombre = request.getParameter("nombre");
		double precio_compra = Double.parseDouble(request.getParameter("compra"));
		double precio_venta = Double.parseDouble(request.getParameter("venta"));
		ProductosVO Producto = new ProductosVO(codigo, iva, nit_proveedor, nombre, precio_compra, precio_venta);
		boolean resultado = ProductosBO.isertarestudiante(Producto);
		if (!resultado) {
			%>
			alert('Error al crear producto')
			<%
		} else {
			response.sendRedirect("/Productos");
		}
			} else {
				%>
				alert('Error al crear producto')
				<%
			}
		}
	} catch (Exception e) {
		%>
		alert('Error al crear producto')
		<%
	}
	%>
	</script>
</body>
</html>