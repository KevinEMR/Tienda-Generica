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
<title>Editar Producto</title>
</head>
<body background="Imagenes\fondo.png">
	<%
	ProductosVO usuario = ProductosBO.obteneruno("codigo_producto", request.getParameter("codigo"));
	%>
	<form id="U_editar"
		action="/Editar_producto?codigo=<%=request.getParameter("codigo")%>">
		<div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">IVA</label> <input
					type="text" class="form-control" name="iva"
					value="<%=usuario.getIva()%>">
			</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">NIT de Proveedor</label> <input
					type="text" class="form-control" name="nit"
					value="<%=usuario.getNit_proveedor()%>">
			</div>
			<div class="mb-3">
				<label for="Password" class="form-label">Nombre</label> <input
					type="text" class="form-control" name="nombre"
					value="<%=usuario.getNombre()%>">
			</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Precio de Compra</label> <input
					type="text" class="form-control" name="compra"
					value="<%=usuario.getPrecio_compra()%>">
			</div>
			<div class="mb-3">
				<label for="Usuario" class="form-label">Precio de Venta</label> <input
					type="text" class="form-control" name="venta"
					value="<%=usuario.getPrecio_venta()%>">
			</div>
			<div class="mb-3" id="esconder">
				<input type="hidden" class="form-control" name="codigo"
					value="<%=request.getParameter("codigo")%>">
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
	boolean resultado;
	try {
		if (request.getParameter("iva") != null && request.getParameter("nit") != null
		&& request.getParameter("nombre") != null && request.getParameter("compra") != null
		&& request.getParameter("venta") != null) {
			System.out.println(request.getParameter("iva"));
			if (request.getParameter("iva").isEmpty() || request.getParameter("nombre").isEmpty()
			|| request.getParameter("nit").isEmpty() || request.getParameter("compra").isEmpty()
			|| request.getParameter("venta").isEmpty()) {
				System.out.println("false");
		resultado = false;
			} else {				
		double iva = Double.parseDouble(request.getParameter("iva"));
		long nit = Long.parseLong(request.getParameter("nit"));
		System.out.println("true");
		String nombre = request.getParameter("nombre");
		double compra = Double.parseDouble(request.getParameter("compra"));
		double venta = Double.parseDouble(request.getParameter("venta"));
		long codigo = Long.parseLong(request.getParameter("codigo"));
		ProductosVO suario = new ProductosVO(codigo, iva, nit, nombre, compra, venta);
		resultado = ProductosBO.actualizar(suario);
			}
			if (!resultado) {
				System.out.println("false");
				%>
				alert('Error al editar producto')
				<%
			} else {
		response.sendRedirect("/Productos");
			}
		}
	} catch (Exception e) {	
		System.out.println("false catch");
		%>
		alert('Error al editar producto')
		<%
	}
	%>
	</script>
</body>
</html>