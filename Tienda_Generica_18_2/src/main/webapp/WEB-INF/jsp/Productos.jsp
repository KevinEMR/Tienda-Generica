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
<title>Productos</title>
</head>
<body background="Imagenes\fondo.png">
	<form action="/" method = post>
		<div id="Productos">
			<div class="mb-3">
				<label for="Nombre del archivo" class="form-label">Nombre de archivo</label> <input
					type="text" class="form-control" name="Nombre de archivo">
			</div>
			
			<div class="mb-3">
				<button type="file" class="btn btn-primary">Examinar</button>
			</div>
			<div class="mb-3 form-check">
				<button type="submit" class="btn btn-primary">Cargar</button>
			</div>
		</div>
	</form>
</body>
</html>