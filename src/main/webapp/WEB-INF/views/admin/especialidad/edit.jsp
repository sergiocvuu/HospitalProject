<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Especialidad : Editar</title>
	
		<!-- Add your CSS styles here -->
		<style>
			body {
				font-family: 'Arial', sans-serif;
				background-color: #f8f9fa;
				margin: 0;
				padding: 0;
			}
	
			.container {
				max-width: 600px;
				margin: 50px auto;
				background-color: #fff;
				padding: 20px;
				border-radius: 8px;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			}
	
			h1 {
				color: #007bff;
				text-align: center;
			}
	
			form {
				text-align: left;
			}
	
			label {
				font-weight: bold;
				display: block;
				margin-bottom: 8px;
				color: #333;
			}
	
			.form-group {
				margin-bottom: 20px;
			}
	
			.form-control {
				width: 100%;
				padding: 12px;
				box-sizing: border-box;
				border: 1px solid #ced4da;
				border-radius: 4px;
				margin-top: 6px;
				font-size: 16px;
				color: #555;
			}
	
			.btn {
				padding: 12px 20px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 16px;
				cursor: pointer;
				border-radius: 4px;
				background-color: #007bff;
				color: #fff;
				border: none;
				transition: background-color 0.3s;
				margin-right: 10px;
			}
	
			.btn-danger {
				background-color: #dc3545;
			}
	
			.btn:hover {
				background-color: #0056b3;
			}
		</style>
	</head>
	
	<body>
	
		<%@include file="../../template/menu.jsp"%>
	
		<div class="container">
			<h1>Especialidad : Editar</h1>
			<hr>
	
			<%@include file="../../template/message-box.jsp"%>
	
			<div class="col-md-12">
				<form action="edit-especialidad" method="post">
					<input class="form-control" type="number" name="id" value="${ especialidad.id }" hidden="true">
					<div class="form-group">
						<label for="nombre">Nombre <b class="text-danger">*</b></label>
						<input class="form-control" type="text" name="nombre" value="${ especialidad.nombre }" required>
					</div>
					<div class="form-group">
						<label for="precio">Precio <b class="text-danger">*</b></label>
						<input class="form-control" type="number" name="precio" min="0" step="0.01" value="${ especialidad.precio }" required>
					</div>
	
					<div class="form-group">
						<input class="btn btn-primary" type="submit" name="action" value="Actualizar">
						<a class="btn btn-danger" href="especialidades">Cancelar</a>
					</div>
				</form>
			</div>
		</div>
	
	</body>
	
	</html>
	