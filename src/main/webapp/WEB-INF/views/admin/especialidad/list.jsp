<%@page import="com.project.hospital.model.Especialidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.hospital.utils.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Especialidades</title>

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

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 2px solid #ddd;
        }

        .text-right {
            text-align: right;
        }

        .mb-2 {
            margin-bottom: 20px;
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

        .btn-success {
            background-color: #28a745;
            color: #fff;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #333;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .dropdown-menu {
            border: 1px solid #ddd;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .dropdown-item {
            display: block;
            width: 100%;
            padding: 10px 20px;
            clear: both;
            font-weight: 400;
            color: #333;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .dropdown-item:hover {
            background-color: #f8f9fa;
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
    </style>
</head>
<body>

    <%@include file="../../template/menu.jsp"%>

    <%
    List<Especialidad> data = (List<Especialidad>) request.getAttribute("especialidades");

    if (!Utils.isAdmin(user)) {
        response.sendRedirect("/");
    }
    %>

    <div class="container">
        <h1>Especialidades</h1>
        <hr>

        <%@include file="../../template/message-box.jsp"%>

        <div class="text-right mb-2">
            <a class="btn btn-success" href="add-especialidad">Registrar Nuevo</a>
            <a class="btn btn-warning" href="especialidades/pdf">Exportar PDF</a>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (data != null) {
                        for (Especialidad item : data) {
                    %>
                    <tr>
                        <td><%=item.getNombre()%></td>
                        <td><%=item.getPrecio()%></td>
                        <td class="text-right">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button"
                                    id="dropdownMenuButton" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">Opciones</button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item"
                                        href="edit-especialidad?id=<%=item.getId()%>">Editar</a>
                                    <form action="delete-especialidad">
                                        <input type="number" name="id" value="<%=item.getId()%>"
                                            required hidden="true"> <input class="dropdown-item"
                                            type="submit" value="Eliminar">
                                    </form>
                                </div>
                            </div>
                        </td>
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
