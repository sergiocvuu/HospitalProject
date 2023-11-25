<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        h3 {
            color: #007bff;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 2px solid #ddd;
        }

        .col-md-6 {
            max-width: 400px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        .text-danger {
            color: red;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>

    <%@include file="../template/menu.jsp"%>

    <div class="container">
        <h3>Register</h3>
        <hr>

        <%@include file="../template/message-box.jsp"%>

        <div class="col-md-6">
            <form action="register" method="post">
                <input class="form-control" type="number" name="id" value="${ user.id }" hidden="true">
                <div class="form-group">
                    <label for="username">Username <b class="text-danger">*</b></label>
                    <input class="form-control" type="text" name="username" value="${ user.username }" required>
                </div>
                <div class="form-group">
                    <label for="password">Password <b class="text-danger">*</b></label>
                    <input class="form-control" type="password" name="password" value="${ user.password }" required>
                </div>
                <div class="form-group">
                    <label for="nombres">Nombres <b class="text-danger">*</b></label>
                    <input class="form-control" type="text" name="nombres" value="${ user.nombres }" required>
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos <b class="text-danger">*</b></label>
                    <input class="form-control" type="text" name="apellidos" value="${ user.apellidos }" required>
                </div>
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" name="action" value="Registrar">
                </div>
            </form>
        </div>
    </div>

</body>
</html>

