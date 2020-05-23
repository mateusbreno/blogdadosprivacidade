<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="br.usjt.devweb.bloglgpd.model.Postagem"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Postagem</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
<script type="text/javascript">
	function openPage(pageURL) {
		window.location = pageURL;
	}
</script>
</head>
<body>
	<%
		Postagem postagem = (Postagem) request.getAttribute("postagem");
	%>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<div class="col-md-6" id="">
				<a class="navbar-brand"><h1>Postagem</h1></a>
				</div>
			</div>	
		</nav>
	</div>
	<br>
	<br>
	<section class="divLogout">
		<div class=" container logout">
			<div class="form">
	<div class="row">
		<div class="col-md-12">
			<p>
				<strong>Autor</strong>
			</p>
			<p>
				<%=postagem.getAutor()%>
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<p>
				<strong>Título</strong>
			</p>
			<p>
				<%=postagem.getTitulo()%>
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<p>
				<strong>Texto</strong>
			</p>
			<p>
				<%=postagem.getTexto()%>
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<p>
				<strong>Data</strong>
			</p>
			<p>
				<%
					Date data = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
					out.print(sdf.format(data));
				%>
			</p>
		</div>
	</div>
	</div>
		</div>
	</section>	
	<div id="actions" class="row">
			<div class="col-md-12">
				<input type="button" value="Voltar"
					onclick="openPage('testePostagem.jsp')">
			</div>
		</div>
		
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