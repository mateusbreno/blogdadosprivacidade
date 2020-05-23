<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">

<title>Blog Proteção de Dados</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">

</head>

<body>
	<%--<%
		int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
		int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
	%>--%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Proteção de Dados</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Página
							Inicial <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="">

			<!-- Blog Entries Column -->
			<div class="col-md-12 protecao">

				<h1 class="my-4">Privacidade de Dados</h1>

				<form action="Index" method="post">
					<c:forEach var="post" items="${postsLiberados}">
						<!-- Blog Post -->
						<div class="card mb-4">
							<!--<img class="card-img-top"
								src="img/A-Lei-Geral-de-Proteção-de-Dados-Pessoais.png"
								height="450" alt="Card image cap">-->
							<div class="card-body">
								<h2 class="card-title">${post.titulo}</h2>
								<p class="card-text">${post.texto}</p>
								<a
									href="testePostagem.jsp?referencia=${post.id}&titulo=${post.titulo}&mensagem=${request.mensagem}&autor=${post.autor}"
									class="btn btn-primary">Responder &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								Postado em ${post.data} por <a href="#">${post.autor}</a><br>Tem
								filho: ${post.postagens.size()}
							</div>
						</div>
						<c:forEach var="post2" items="${post.postagens}">
							<!-- Blog Post -->
							<div class="filho2 card mb-4">
								<!--<img class="card-img-top"
								src="img/A-Lei-Geral-de-Proteção-de-Dados-Pessoais.png"
								height="450" alt="Card image cap">-->
								<div class="card-body" >
									<h2 class="card-title">${post2.titulo}</h2>
									<p class="card-text">${post2.texto}</p>
									<a
										href="testePostagem.jsp?referencia=${post2.id}&titulo=${post2.titulo}&mensagem=${request.mensagem}&autor=${post2.autor}"
										class="btn btn-primary">Responder &rarr;</a>
								</div>
								<div class="card-footer text-muted">
									Postado em ${post2.data} por <a href="#">${post2.autor}</a><br>Tem
									filho: ${post2.postagens.size()}
								</div>
							</div>
							<c:forEach var="post3" items="${post2.postagens}">
								<!-- Blog Post -->
								<div class="filho3 card mb-4">
									<!--<img class="card-img-top"
								src="img/A-Lei-Geral-de-Proteção-de-Dados-Pessoais.png"
								height="450" alt="Card image cap">-->
									<div class="card-body">
										<h2 class="card-title">${post3.titulo}</h2>
										<p class="card-text">${post3.texto}</p>
										<a
											href="testePostagem.jsp?referencia=${post3.id}&titulo=${post3.titulo}&mensagem=${request.mensagem}&autor=${post3.autor}"
											class="btn btn-primary">Responder &rarr;</a>
									</div>
									<div class="card-footer text-muted">
										Postado em ${post3.data} por <a href="#">${post3.autor}</a><br>Tem
										filho: ${post3.postagens.size()}
									</div>
								</div>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</form>

				<%--<div id='tab1' class="tab_content"
					style="display: block; width: 100%">					
					<display:table name="sessionScope.postsLiberados" pagesize="5"
						export="true" sort="list" uid="one">
						<display:column property="AUTOR_POSTAGEM" title="Autor"
							sortable="true" headerClass="sortable" />
						<display:column property="TITULO_POSTAGEM" title="Titulo"
							sortable="true" headerClass="sortable" />
						<display:column property="MENSAGEM_POSTAGEM" title="Postagem"
							sortable="true" headerClass="sortable" />
						<display:column property="DATA_POSTAGEM" title="Data"
							sortable="true" headerClass="sortable" />
					</display:table>
				</div>--%>

				<%--<%
				if(quantidadePagina > 0){
					for(int i = 1; i <= quantidadePagina; i++){
						if(i == numeroPagina){
							out.println("<br>" + i + "</br>");
						} else {
							out.println("<a href=Index?numeroPagina=" + i + "> " + i + "</a>");
						}
					}
				} else {
					out.println("<a href=Index?numeroPagina=1>" + 1 + "</a>");
				}
				%>
				<br>
				<br>
				<%
				if(numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0){
					out.println("<a href=Index?numeroPagina=" + (numeroPagina - 1) + ">Anterior</a>");
				}
				
				out.println("<br>" + numeroPagina + "</br>");
				
				if(quantidadePagina > numeroPagina){
					out.println("<a href=Index?numeroPagina=" + (numeroPagina + 1) + ">Próxima</a>");
				}
				%>--%>

				<!-- Pagination -->
				<!-- Mudar limite aqui na JSP e no DAO -->
				<%
					int limite = 10;
					String pagina = request.getParameter("pagina");
					if (pagina == null) {
						pagina = "1";
					}

					int offset = (Integer.parseInt(pagina) * limite) - limite;

					int totalPosts = (int) request.getAttribute("totalPosts");
					int totalPagina = totalPosts / limite;
					if (totalPosts % limite != 0) {
						totalPagina++;
					}

					int paginaAnterior;
					if (Integer.parseInt(pagina) > 1) {
						paginaAnterior = Integer.parseInt(pagina) - 1;
						offset = ((paginaAnterior) * limite) - limite;
						out.println("<a class='page-link' href='Index?offset=" + offset + "&pagina=" + paginaAnterior
								+ "' >&larr;Anterior</a>");
					}

					for (int i = 1; i <= totalPagina; i++) {
						if (i == Integer.parseInt(pagina)) {

						} else {
							offset = ((i) * limite) - limite;
							out.println("<a href=Index?offset=" + offset + "&pagina=" + i + ">" + i + "</a>");
						}
					}

					int proximaPagina;
					if ((totalPosts - (Integer.parseInt(pagina) * limite)) > 0) {
						proximaPagina = Integer.parseInt(pagina) + 1;
						offset = ((proximaPagina) * limite) - limite;
						out.println("<a class='page-link' href='Index?offset=" + offset + "&pagina=" + proximaPagina
								+ "' >&larr;Próxima</a>");
					}
				%>

			</div>

		</div>

	</div>
	<!-- /.row -->


	<!-- /.container -->

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