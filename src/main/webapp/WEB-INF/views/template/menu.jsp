<%@page import="com.project.hospital.utils.Utils"%>
<%@page import="com.project.hospital.model.Usuario"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<style>
body {
	font-family: 'Montserrat', sans-serif;
}
</style>

</head>
<body>

	<%
	HttpSession sesion = request.getSession();
	Usuario user = null;
	if (Utils.isLogged(session)) {
		user = (Usuario) session.getAttribute("user");
	}
	%>

	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: #2E2E2E;">
		<a class="navbar-brand text-white" href="/"><h3>Hospital
				Project</h3></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<%
		if (user != null) {
			if (user.getRol().equals("Usuario")) {
		%>

		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="add-cita"> Crear Cita </a></li>
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="mis-citas"> Mis Citas </a></li>
			</ul>
		</div>
		<%
		} else if (user.getRol().equals("Admin")) {
		%>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="especialidades"> Especialidades</a></li>
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="usuarios"> Usuarios </a></li>
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="citas"> Citas </a></li>
			</ul>
		</div>
		<%
		}
		%>
		<div class="navbar-brand text-white">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="logout" aria-haspopup="true" aria-expanded="false">
						Logout </a></li>
			</ul>
		</div>
		<%
		} else {
		%>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

			</ul>
		</div>
		<div class="navbar-brand text-white">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="login" aria-haspopup="true" aria-expanded="false"> Login
				</a></li>
				<li class="nav-item dropdown"><a class="nav-link text-white"
					href="register" aria-haspopup="true" aria-expanded="false">
						Register </a></li>
			</ul>
		</div>
		<%
		}
		%>
	</nav>
	<div class="mt-3"></div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

</body>
</html>