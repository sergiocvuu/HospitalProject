<%@page import="java.util.List"%>
<%@page import="com.project.hospital.model.Cita"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Mis Citas</title>

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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }

        .summary {
            margin-top: 20px;
            text-align: right;
            color: #888;
        }
    </style>
</head>

<body>
    <%@include file="../template/menu.jsp"%>
    <%
    if (!Utils.isLogged(sesion)) {
        response.sendRedirect("/");
    }

    List<Cita> data = (List<Cita>) request.getAttribute("citas");
    %>

    <div class="container">
        <h1>Mis Citas</h1>
        <hr>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Hora</th>
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
                        <td><%=item.getDescripcion()%></td>
                    </tr>
                    <%
                    }
                    }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Summary Section -->
        <div class="summary">
            <p>Total citas: <%= data != null ? data.size() : 0 %></p>
        </div>
    </div>
</body>

</html>



<script>
	window.watsonAssistantChatOptions = {
	  integrationID: "17fb5ce6-6641-44d2-acb2-770dc1429646", // The ID of this integration.
	  region: "us-south", // The region your integration is hosted in.
	  serviceInstanceID: "907d9960-6354-4ffb-9d0a-cf32856661e4", // The ID of your service instance.
	  onLoad: async (instance) => { await instance.render(); }
	};
	setTimeout(function(){
	  const t=document.createElement('script');
	  t.src="https://web-chat.global.assistant.watson.appdomain.cloud/versions/" + (window.watsonAssistantChatOptions.clientVersion || 'latest') + "/WatsonAssistantChatEntry.js";
	  document.head.appendChild(t);
	});

	