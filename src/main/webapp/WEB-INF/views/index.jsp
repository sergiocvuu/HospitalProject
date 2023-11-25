<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<%@include file="template/menu.jsp"%>

	<%
	String adminDefault = (String) request.getAttribute("adminDefault");
	%>

	<div>
		<%
		if (adminDefault != null) {
		%>
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>��xito!</strong>
			<%=adminDefault%>
		</div>
		<%
		}
		%>
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
  </script>