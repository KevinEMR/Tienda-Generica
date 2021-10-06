<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.opencsv.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>
<%@page import="controlador.ProductosBO"%>

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
<style type="text/css">
#Produc {
	color: black;
}
</style>

<title>Productos</title>
</head>
<body background="Imagenes\fondo.png">
	<jsp:include page="Menu.jsp"></jsp:include>
	<form action="/Productos_subir" method="post" enctype="multipart/form-data">
		<div id="login">
			<div id="mensaje">
				Por favor cargar un archivo
				</div>
				<div class="mb-3">
					<label for="archivo" class="form-label">Cargar Archivo</label> <input
						type="hidden" class="form-control" name="comprobar" value="si">

				<div class="mb-3 form-check">
					<input type="file" class="btn btn-primary" name="file" accept=.csv>

				</div>
				<div class="mb-3 form-check">
					<button type="submit" class="btn btn-primary">Cargar</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>