<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<style>
	
	
		.container {
			max-width: 400px;
			background-color: #fff;
			padding: 30px;
			border-radius: 8px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
		}
	
		h3 {
			color: #007bff;
			text-align: center;
		}
	
		form {
			margin-top: 20px;
		}
	
		label {
			font-weight: bold;
			display: block;
			margin-bottom: 5px;
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
	
		.btn {
			padding: 12px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 10px 0;
			cursor: pointer;
			border-radius: 4px;
			background-color: #007bff;
			color: #fff;
			border: none;
			transition: background-color 0.3s ease;
		}
	
		.btn:hover {
			background-color: #0056b3;
		}
	
		.login-box {
			border: 1px solid #ced4da;
			border-radius: 8px;
			padding: 20px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		}
	</style>
	</head>
	<body>
		<%@include file="../template/menu.jsp"%>
	
		<div class="container login-box">
			<h3>Login</h3>
			<hr>
	
			<%@include file="../template/message-box.jsp"%>
	
			<form action="login" method="post">
				<div class="form-group">
					<label for="username">Username <b class="text-danger">*</b></label>
					<input class="form-control" type="text" name="username" required>
				</div>
				<div class="form-group">
					<label for="password">Password <b class="text-danger">*</b></label>
					<input class="form-control" type="password" name="password" required>
				</div>
				<div class="form-group">
					<input class="btn btn-primary" type="submit" name="action" value="Login">
				</div>
			</form>
		</div>
	</body>
	</html>
	