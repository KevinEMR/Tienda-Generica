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
	<form action="/Productos" method="post" enctype="multipart/form-data">
		<div id="login">
			<div id="mensaje">Archivo cargado</div>
			<div class="mb-3">
				<label for="archivo" class="form-label">Cargar Archivo</label> <input
					type="hidden" class="form-control" name="comprobar" value="${path}">
			</div>

			<div class="mb-3 form-check">
				<input type="file" class="btn btn-primary" name="file" accept=.csv>

			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Cargar</button>
			</div>
		</div>
	</form>
	<%
	System.out.println("Entro a leer archivo");
	FileReader archCSV = null;
	CSVReader csvReader = null;
	ProductosBO path = new ProductosBO();
	try {
		archCSV = new FileReader(request.getParameter("archivo"));
		CSVParser conPuntoYComa = new CSVParserBuilder().withSeparator(';').build();
		csvReader = new CSVReaderBuilder(archCSV).withCSVParser(conPuntoYComa).build();
		ProductosBO productos = new ProductosBO();
		boolean resultado = productos.leerycargar(csvReader);
		if(!resultado){
			response.sendRedirect("/Productos_error_datos");
		}
	} catch (IOException e) {
		System.out.println(e);
	} catch (Exception e) {
		System.out.println(e);
	} finally {
		try {
			archCSV.close();
			csvReader.close();
		} catch (IOException e) {
			System.out.println(e);
		}
	}
	%>
</body>
</html>