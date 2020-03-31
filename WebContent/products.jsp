<%@page import="com.barbaro.store.models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.barbaro.store.models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-around m-2">
			<div>Barbaro Store</div>
			
			<% 
				Cart cart = (Cart) session.getAttribute("cart");
			%>
			
			<div><a class="btn btn-primary" href="cart">Carrito: <%=cart.contarProducto()%></a></div>
			
		</div>
		
		<h4 class="m-2">Lista de productos</h4>
		<table class="table">
		<thead class="thead-light">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Descripción</th>
				<th>Precio</th>
				<th>Acción</th>
			</tr>
		</thead>
			
			<%
				List<Product> products = (List<Product>) request.getAttribute("products");
				for(int i = 0; i < products.size(); i++){
					Product product = products.get(i);
					out.println("<tr>");
						out.println("<td>" + product.getId() + "</td>");
						out.println("<td>" + product.getNombre() + "</td>");
						out.println("<td>" + product.getDescripcion() + "</td>");
						out.println("<td>" + product.getPrecio() + "</td>");
						out.println("<td>");
						out.println("<form action=\"cart\" method=\"post\"><input type=\"hidden\" name=\"txtId\" value=\"" + product.getId() + "\"><input type=\"submit\" value=\"Agregar\" class=\"btn btn-secondary\"></form>");
						out.println("</td>");
					out.println("</tr>");
					
				}
			%>
		</table>
	</div>
</body>
</html>