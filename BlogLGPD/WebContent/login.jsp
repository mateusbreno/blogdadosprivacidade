<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela de Login</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
</head>
<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">

				<div class="col-md-6" id="">
					<a class="navbar-brand">Logar na Área
						Reservada</a>
				</div>
				<div class="col-md-6 menu" id="">
					<a href="LogoutServlet">Logout</a> 
				</div>
			</div>
		</nav>
	</div>
	<br>
	<br>
	<section class="divLogout">
		<div class=" container logout">
			<div class="form">
				<form action="LoginServlet" method="post">
					<label>Login:</label> <input type="text" name="name"><br>
					<br> <label>Senha:</label> <input type="password"
						name="password"><br>
					<br>
					<br> <input type="submit" value="Entrar">
				</form>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Desenvolvido por Alunos da
				USJT - Santana &copy; 2020</p>
		</div>
		<!-- /.container -->
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>