<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela de Postagem</title>
</head>
<body>
<h1>Postagem</h1>
<a href="LogoutServlet">Logout</a>
<a href="ProfileServlet">Perfil</a>
<a href="PostagemServlet">Postagem</a>
<br>
<br>
<form action="PostagemServlet" method="post">  
Título:<input type="text" name="titulo"><br><br>  
<textarea rows="10" cols="10"></textarea>  
<input type="submit" value="Enviar">  
</form>  
</body>
</html>