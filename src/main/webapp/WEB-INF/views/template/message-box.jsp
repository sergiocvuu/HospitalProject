
<%
String error = (String) request.getAttribute("error");
String success = (String) request.getAttribute("success");
%>

<%
if (success != null) {
%>
<div class="alert alert-success alert-dismissable">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>¡Éxito!</strong>
	<%=success%>
</div>
<%
}
%>

<%
if (error != null) {
%>
<div class="alert alert-danger alert-dismissable">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>¡Error!</strong>
	<%=error%>
</div>
<%
}
%>