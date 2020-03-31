<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-around m-2">
			<div>Barbaro Store</div>
			<div><a class="btn btn-primary" href="<%= pageContext.getServletContext().getContextPath()%>">Regresar</a></div>
		</div>
			
				<h4 class="m-2">Tu carrito</h4>
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Descripción</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>Subtotal</th>
							<th>Acciones</th>
						</tr>
					</thead>
					
					<c:forEach var="product" items="${sessionScope.cart.getElementos().keySet()}">
						<tr>
							<td>${product.getId()}</td>
							<td>${product.getNombre()}</td>
							<td>${product.getDescripcion()}</td>
							<td>${product.getPrecio()}</td>
							<td>${sessionScope.cart.getElementos().get(product)}</td>
							<td>${product.getPrecio()*sessionScope.cart.getElementos().get(product)}</td>
							<td><a class="btn btn-secondary" href="">Eliminar</a></td>
						</tr>
					</c:forEach>
					
				</table>
	</div>
</body>
</html>