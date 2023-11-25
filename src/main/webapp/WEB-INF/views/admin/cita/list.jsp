<%@page import="com.project.hospital.model.Cita"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.hospital.utils.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Citas</title>
	
		<style>
			body {
				font-family: Arial, sans-serif;
				background-color: #f4f4f4;
				color: #333;
				margin: 0;
				padding: 0;
			}
	
			.container {
				max-width: 800px;
				margin: 20px auto;
				background-color: #fff;
				padding: 20px;
				border-radius: 8px;
				box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
			}
	
			h1 {
				color: #007bff;
			}
	
			form {
				margin-bottom: 20px;
			}
	
			label {
				font-weight: bold;
				display: block;
				margin-bottom: 8px;
			}
	
			input[type="date"] {
				width: 100%;
				padding: 8px;
				margin-bottom: 10px;
				box-sizing: border-box;
			}
	
			.btn {
				display: inline-block;
				padding: 10px 20px;
				font-size: 16px;
				cursor: pointer;
				text-align: center;
				text-decoration: none;
				outline: none;
				background-color: #007bff;
				color: #fff;
				border: none;
				border-radius: 4px;
				transition: background-color 0.3s;
			}
	
			.btn-primary {
				background-color: #007bff;
			}
	
			.btn-warning {
				background-color: #ffc107;
			}
	
			.btn:hover {
				background-color: #0056b3;
			}
	
			table {
				width: 100%;
				border-collapse: collapse;
				margin-top: 20px;
			}
	
			th, td {
				border: 1px solid #ddd;
				padding: 12px;
				text-align: left;
			}
	
			th {
				background-color: #007bff;
				color: #fff;
			}
	
			tr:nth-child(even) {
				background-color: #f9f9f9;
			}
	
			/* Additional style for citation rows */
			tbody tr:hover {
				background-color: #e0e0e0;
			}
		</style>
	</head>
	<body>
	
		<%@include file="../../template/menu.jsp"%>
	
		<%
		List<Cita> data = (List<Cita>) request.getAttribute("citas");
	
		if (!Utils.isAdmin(user)) {
			response.sendRedirect("/");
		}
		%>
	
		<div class="container">
			<h1>Citas</h1>
			<hr>
	
			<form action="citas" method="post">
				<div class="row">
					<div class="col-4">
						<label>Fecha Inicio</label> <input class="form-control" type="date"
							name="fecha_inicio" value="${fecha_inicio}">
					</div>
					<div class="col-4">
						<label>Fecha Fin</label> <input class="form-control" type="date"
							name="fecha_fin" value="${fecha_fin}">
					</div>
					<div>
						<label>&nbsp</label><br> <input class="btn btn-primary"
							type="submit" value="Buscar"> <a class="btn btn-warning"
							href="citas/pdf?fecha_inicio=${fecha_inicio}&fecha_fin=${fecha_fin}">Exportar
							PDF</a>
					</div>
				</div>
			</form>
	
			<hr>
	
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Fecha</th>
							<th>Hora</th>
							<th>Usuario</th>
							<th>Especialidad</th>
							<th>Descripcion</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (data != null) {
							for (Cita item : data) {
						%>
						<tr>
							<td><%=item.getFecha()%></td>
							<td><%=item.getHora()%></td>
							<td><%=item.getUsuario()%></td>
							<td><%=item.getEspecialidad()%></td>
							<td><%=item.getDescripcion()%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</body>
	</html>