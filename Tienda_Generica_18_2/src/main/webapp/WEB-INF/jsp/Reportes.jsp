<%@page import="controlador.ClienteBO"%>
<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="modelo.ProductosVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>

<jsp:include page = "Menu.jsp"></jsp:include>

<body>
	<div class="container py-3">
		<header>
			<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
				<h1 style="margin-top:2px; font-family: Playfair Display; !important" align="center">Tipos de Reporte</h1>
				<p class="fs-5 text-muted">
				"En esta sección usted podrá seleccionar el reporte que desea ver. Recuerde que de necesitar realizar modificaciones a los datos, deberá dirigirse a la pestaña del menú respectiva. Ésta sección es solo de visualización y funge a manera de resumen de los datos relevantes de su negocio."
				</p>
			</div>
		</header>
		<main>
			<div class="d-flex bd-highlight" style="align-items: flex-end;">
				<div class="p-2 flex-fill bd-highlight">
        			<div class="card mb-4 rounded-3 shadow-sm">
         				<div class="card-header py-3">
            				<h4 class="my-0 fw-normal">Reporte Usuarios</h4>
          				</div>
          				<div class="card-body">
            				<h1 class="card-title pricing-card-title">Lista<small class="text-muted fw-light">/usuarios</small></h1>
            				<ul class="list-unstyled mt-3 mb-4">
             					<li>Documento de Identificación</li>
             					<li>Nombre</li>
              					<li>Correo Electrónico</li>
             					<li>Usuario Sistema</li>
             					<li>Contraseña acceso</li>
            				</ul>
           					<button type="submit" class="w-100 btn btn-lg btn-outline-primary">Ver
           					</button>
         			 	</div>
       			 	</div>
      			</div>
      			<div  class="p-2 flex-fill bd-highlight">
        			<div class="card mb-4 rounded-3 shadow-sm">
          				<div class="card-header py-3">
           					<h4 class="my-0 fw-normal">Reporte Clientes</h4>
          				</div>
          				<div class="card-body">
            				<h1 class="card-title pricing-card-title">Lista<small class="text-muted fw-light">/clientes</small></h1>
           					<ul class="list-unstyled mt-3 mb-4">
				              	<li>Cédula</li>
				              	<li>Nombre Completo</li>
				              	<li>Correo Electrónico</li>
				              	<li>Dirección Residencia</li>
				              	<li>Teléfono (Fijo/Movil)</li>
            				</ul>
            				<form action="/Reportes_clientes">
            					<button type="submit" class="w-100 btn btn-lg btn-outline-primary">Ver
            					</button></form>		
          				</div>
        			</div>
      			</div>
      			<div  class="p-2 flex-fill bd-highlight">
        			<div class="card mb-4 rounded-3 shadow-sm">
         				<div class="card-header py-3">
            				<h4 class="my-0 fw-normal">Reporte Ventas</h4>
          				</div>
          				<div class="card-body">
            				<h1 class="card-title pricing-card-title">Lista<small class="text-muted fw-light">/ventas</small></h1>
				            <ul class="list-unstyled mt-3 mb-4">
				              	<li>Cédula Cliente</li>
				              	<li>Nombre Completo Cliente</li>
				              	<li>Valor Total Venta por Cliente</li>
				              	<li>Total Ventas Global</li>
				            </ul>
            				<button type="submit" class="w-100 btn btn-lg btn-outline-primary">Ver</button>
          				</div>
        			</div>
      			</div>
			</div>
		</main>
	</div>
</body>
</html>