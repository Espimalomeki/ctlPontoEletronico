<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Login - Portal Espimalomeki</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<style>
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	}
	
	@media ( min-width : 768px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}
</style>
<!-- Custom styles for this template -->
<jsp:include page="style/signin.jsp"/>
</head>
<body class="text-center">
	<form class="form-signin" action="index.html">
		<img class="mb-4" src="resources/espimalomeki.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Portal Espimalomeki</h1>
		<label for="inputMatricula" class="sr-only">Número de
			Matrícula</label> <input type="text" id="inputMatricula" class="form-control"
			placeholder="Número de Matrícula" required autofocus> <label
			for="inputSenha" class="sr-only">Senha</label> <input type="password"
			id="inputSenha" class="form-control" placeholder="Senha" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Fazer
			Login</button>
		<p class="mt-5 mb-3 text-muted">Espimalomeki&copy; 2020</p>
	</form>
</body>
</html>
