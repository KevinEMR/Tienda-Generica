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
<title>Menu navegación</title>
<style type="text/css">
ul li ul li{
display:none;
}

ul li:hover ul li{
display:block;
}

ul li ul li a{
background: #fff;
border-bottom:1px solid black;
}

ul li a:hover{
background-color: darkgrey;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" id = "Usua" href="/Usuarios">Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id = "Clien" href="/Clientes">Clientes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id = "Provee"  href="/Proveedores">Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link dropdown-toggle"  id = "Produc"  href="/Productos">Productos</a>
          <ul style="position:absolute">
          <li><a href="/Productos_subir" class="nav-link" style="width:200%">Subir</a></li>
          <li><a href="/Productos" class="nav-link" style="width:200%">Tabla</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" id = "Vent"  href="/Ventas">Ventas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link dropdown-toggle" id = "Repor" href="/Reportes">Reportes</a>
          <ul style="position:absolute">
          <li><a href="#" class="nav-link" style="width:200%">Usuarios</a></li>
          <li><a href="/Reportes_clientes" class="nav-link" style="width:200%">Clientes</a></li>
          <li><a href="#" class="nav-link" style="width:200%">Ventas</a></li>
          </ul>
        </li>
      </ul>
    </div>
</nav>
</body>
</html>