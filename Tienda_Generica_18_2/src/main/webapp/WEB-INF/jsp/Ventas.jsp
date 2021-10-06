<%@page import="controlador.ClienteBO"%>
<%@page import="controlador.ProductosBO"%>
<%@page import="modelo.ClienteVO"%>
<%@page import="modelo.ProductosVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson" %>
<%@page import="java.lang.reflect.Type" %>
<%@page import="java.util.LinkedList" %>
<%@page import="com.google.gson.reflect.TypeToken" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas</title>
<style type="text/css">
#Vent{
color:black;
}
#consultar_cliente{
background-color:#212529;
padding:15px;
}
#contenedor{
    margin-top:3em;
}
#contenedor br{
    display: none;
}

#buscar_codigo{
margin-top:15px;
  margin-left: 40rem;
}

#formoculto{
display:none;
}
</style>
</head>
<body>
<jsp:include page = "Menu.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src=""></script>
<form id = "consultar_cliente">
<table>
<tr id = "fila1">
<td> <label for="cedula_cliente" style=color:#fff;>Cedula Cliente:</label></td>
<td><input type="text" class="form-control" name="busqueda" id="cedula_cliente"></td>
<td><button type="button" class="btn btn-outline-light" id="buscar_cliente" onclick="buscarcliente()">Buscar Cliente</button></td>
</tr>
</table>
</form>
<div id="formoculto">
<form id = "consultar_producto" action="/Ventas">
<table class="table table-hover">
<tbody>
<tr id = "fila3">
<td><label for="codigo_producto" class="">Código:</label></td>
<td><input type="text" class="form-control" name="busqueda_producto4" id="codigo_producto4"></td>
<td><button type="button" class="btn btn-outline-dark" id="codigo" onclick="productonombre(4)">Consultar</button></td>
<td> <label for="codigo_producto">Nombre:</label></td>
<td><input type="text" class="form-control" name="producto4" id="nombre_producto4" disabled></td>
<td> <label for="codigo_producto">Cantidad:</label></td>
<td><input type="text" class="form-control" name="cantidad4" id="cantidad_producto4" onchange="matematicas(this.value,4)"></td>
<td> <label for="codigo_producto">Vlr.Total:</label></td>
<td><input type="text" class="form-control" name="total4" id="total_producto4" disabled></td>
</tr>
<tr id="fila4">
<td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td>
</tr>
</tbody>
</table>
<table style="margin:auto;">
<tr>
<td> <label for="codigo_producto">Total Venta:</label></td>
<td><input type="text" class="form-control" name="factura" disabled></td>
</tr>
<tr>
<td> <label for="codigo_producto">Total IVA:</label></td>
<td><input type="text" class="form-control" name="iva" disabled></td>
</tr>
<tr>
<td> <label for="codigo_producto">Total con IVA:</label></td>
<td><input type="text" class="form-control" name="total_factura" disabled></td>
</tr>
</table>
<button type="submit" class="btn btn-outline-dark" id="buscar_codigo">Confirmar</button>
</form>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	var filascant = 4;
	if(!(document.getElementById("cedula_cliente").value=="")){	
	buscarcliente();
	}
	
    $(document).on('click', '#añadir_producto', function(){
    	var fila = $('#fila4');
    	filascant = filascant+1;
    	fila.after('<tr id="fila'+filascant+'" ><td><label for="codigo_producto" class="">Código:</label></td><br><td><input type="text" class="form-control" name="busqueda_producto'+filascant+'" id="codigo_producto'+filascant+'"></td><br><td><button type="button" class="btn btn-outline-dark" id="codigo" onclick="productonombre('+filascant+')">Consultar</button></td><br><td> <label for="codigo_producto">Nombre:</label></td><br><td><input type="text" class="form-control" name="producto'+filascant+'" id="nombre_producto'+filascant+'" disabled></td><br><td> <label for="codigo_producto">Cantidad:</label></td><br><td><input type="text" class="form-control" name="cantidad'+filascant+'" id="cantidad_producto'+filascant+'" onchange="matematicas(this.value,'+filascant+')"></td><br><td> <label for="codigo_producto">Vlr.Total:</label></td><br><td><input type="text" class="form-control" name="total'+filascant+'" id="total_producto'+filascant+'" disabled></td></tr><tr id="fila4"><td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td><td><button type="button" class="btn btn-outline-dark" id="eliminar_producto">-</button><td></tr>');
    	fila.remove();
    });
    
    $(document).on('click', '#eliminar_producto', function(){
    	   if(filascant>5){
    	var fila = $('#fila'+filascant);
    	fila.remove();
    	filascant = filascant-1;
    }
    	   else if(filascant==5){
    		var fila = $('#fila'+filascant);
   	    	var fila2 = $('#fila4');
   	    	fila2.after('<tr id="fila4"><td><button type="button" class="btn btn-outline-dark" id="añadir_producto">+</button><td></tr>');
   	    	fila2.remove();
   	    	fila.remove();
   	    	filascant = filascant-1;
    		  
    	   }});
    
    $(document).on('click', '#cambiar_cliente', function(){
    	var fila = $('#fila2');
    	fila.after('<tr id = "fila1"><td> <label for="cedula_cliente" style=color:#fff;>Cedula Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" id="cedula_cliente"></td><td><button type="button" class="btn btn-outline-light" id="buscar_cliente" onclick="buscarcliente()">Buscar Cliente</button></td></tr>');
    	fila.remove();
    });
    
    $(document).on('click', '#borrar', function(){
    	window.location.href = "/Ventas";
    });

});
</script>
<script type="text/javascript">
<%ProductosBO producto = new ProductosBO();
List<ProductosVO> list = ProductosBO.obtener_todos();

Type listType = new TypeToken<List<ProductosVO>>() {}.getType();
Gson gson = new Gson();
String json = gson.toJson(list, listType);

ClienteBO clientes = new ClienteBO();
List<ClienteVO> listcliente = ClienteBO.obtener_todos();

Type listTypeCliente = new TypeToken<List<ClienteVO>>() {}.getType();
Gson gsonCliente = new Gson();
String jsonCliente = gson.toJson(listcliente, listTypeCliente);
System.out.println(jsonCliente);
%>
function productonombre(num){
    var lista_productos = <%=json%>;
	let cod = document.getElementById("codigo_producto"+num).value;
	let name = document.getElementById('nombre_producto'+num).id;
	let comprobar = true;
	for(var i = 0;i<lista_productos.length;i++){
		if(lista_productos[i]['Codigo']==cod){
			document.getElementById(name).value = lista_productos[i]['Nombre'];
			matematicas(document.getElementById('cantidad_producto'+num).value,num);
			comprobar = false;
		}
	}
	if(comprobar){
		alert("No se encontro el producto")
	}
	
};

function buscarcliente(){
	var lista_productos = <%=jsonCliente%>;
	let ced = document.getElementById("cedula_cliente").value;
	let comprobar = true;
	for(var i = 0;i<lista_productos.length;i++){
		if(lista_productos[i]['Cedula']==ced){
			let name = lista_productos[i]['Nombre'];
			var fila = $('#fila1');
	        fila.after('<tr id="fila2"><td><label for="cedula_cliente" style=color:#fff;>Nombre Cliente:</label></td><td><input type="text" class="form-control" name="busqueda" value="'+name+'" disabled></td><td><label for="cedula_cliente" style=color:#fff;>&nbsp&nbsp&nbspNo.Factura:</label></td><td><input type="text"  class="form-control" name="nombre" value="Mickey" disabled></td><td><button type="button" class="btn btn-outline-light" id="cambiar_cliente">Escoger otro Cliente</button></td><td><button type="button" class="btn btn-outline-light" id="borrar">Borrar todo</button></td></tr>');
	        fila.remove();
	        document.getElementById("formoculto").style.display = "block";
			comprobar = false;
		}
	}
	if(comprobar){
		alert("No se encontro el cliente")
	}
}

function matematicas(val,num){
	var lista_productos = <%=json%>;
	let cod = document.getElementById("codigo_producto"+num).value;
	let name = document.getElementById('total_producto'+num).id;
	(lista_productos.length)
	for(var i = 0;i<lista_productos.length;i++){
		if(lista_productos[i]['Codigo']==cod){
			document.getElementById(name).value = val*lista_productos[i]['Precio_venta'];
		}
	}
}

</script>
</body>
</html>