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
<style type="text/css">
#Produc {
	color: black;
}
</style>

<title>Productos</title>
</head>
<body background="Imagenes\fondo.png">
	<jsp:include page="Menu.jsp"></jsp:include>
	<form  method=post action="uploadServlet" enctype="multipart/form-data" >
		<div id="login">
			<div class="mb-3">
				<label for="archivo" class="form-label">Cargar Archivo</label>
			</div>

			<div class="mb-3 form-check">
				<input type="file" name="cargar_csv" class="btn btn-primary" accept=".csv">

			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Cargar</button>
			</div>
		</div>
	</form>
</body>
</html>