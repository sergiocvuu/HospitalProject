<%@page import="java.util.List"%>
<%@page import="com.project.hospital.model.Especialidad"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="ISO-8859-1">
		<title>Cita: Registrar</title>
	
		<!-- Add your CSS styles here -->
		<style>
			body {
				font-family: 'Arial', sans-serif;
				background-color: #f8f9fa;
				margin: 0;
				padding: 0;
			}
	
			.container {
				max-width: 800px;
				margin: 20px auto;
				background-color: #fff;
				padding: 20px;
				border-radius: 5px;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			}
	
			h1 {
				color: #007bff;
			}
	
			label {
				font-weight: bold;
			}
	
			.form-group {
				margin-bottom: 20px;
			}
	
			.form-control {
				width: 100%;
				padding: 10px;
				box-sizing: border-box;
				border: 1px solid #ced4da;
				border-radius: 4px;
			}
	
			textarea {
				resize: vertical;
			}
	
			select {
				width: 100%;
				padding: 10px;
				box-sizing: border-box;
				border: 1px solid #ced4da;
				border-radius: 4px;
			}
	
			.btn {
				padding: 10px 20px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 16px;
				margin: 4px 2px;
				cursor: pointer;
				border-radius: 4px;
			}
	
			.btn-primary {
				background-color: #007bff;
				color: #fff;
				border: none;
			}
	
			.btn-danger {
				background-color: #dc3545;
				color: #fff;
				border: none;
			}
		</style>
	</head>
	
	<body>
	
		<%@include file="../template/menu.jsp"%>
		<%
		if (!Utils.isLogged(sesion)) {
			response.sendRedirect("/");
		}
		List<Especialidad> especialidades = (List<Especialidad>)request.getAttribute("especialidades");
		%>
	
		<div class="container">
			<h1>Cita: Registrar</h1>
			<hr>
	
			<%@include file="../template/message-box.jsp"%>
	
			<div class="col-md-12">
	
				<form action="add-cita" method="post">
					<input class="form-control" type="number" name="id" hidden="true">
					<div class="form-group">
						<label for="fecha">Fecha <b class="text-danger">*</b></label> <input
							class="form-control" type="date" name="fecha" required>
					</div>
					<div class="form-group">
						<label for="hora">Hora <b class="text-danger">*</b></label>
						<input class="form-control" type="time" name="hora" required>
					</div>
					<div class="form-group">
						<label for="descripcion">Descripción <b class="text-danger">*</b></label>
						<textarea class="form-control" name="descripcion" rows="5" required></textarea>
					</div>
					<div class="form-group">
						<label for="especialidad.id">Especialidad <b class="text-danger">*</b></label>
						<select class="form-control" name="especialidad.id" required>
							<% for(Especialidad item: especialidades) {%>
							<option value="<%= item.getId() %>"><%= item %></option>
							<% } %>
						</select>
					</div>
	
					<div class="form-group">
						<input class="btn btn-primary" type="submit" name="action"
							value="Registrar">
						<a class="btn btn-danger" href="mis-citas">Cancelar</a>
					</div>
				</form>
			</div>
	
		</div>
	
	</body>
	
	</html>
	