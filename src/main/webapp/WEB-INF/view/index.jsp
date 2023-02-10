<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
></script>
<!-- Popper JS -->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
  <body>
	<h1>¡Hemos llegado hasta aqui!</h1>
	<br>
	<h2>Stop, hacemos una pausa para un coffe.</h2>
	<br>
	<p>Usuario: <sec:authentication property="principal.username"/></p>
	<p>Roles: <sec:authentication property="principal.authorities"/></p>
	<br>
	<sec:authorize access="hasRole('EDITOR')">
	<a href="${pageContext.request.contextPath}/editor/" class="btn btn-outline-primary">Área Editores</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN')">
	<a href="${pageContext.request.contextPath}/admin/" class="btn btn-outline-primary">Área Administración</a>
	</sec:authorize>
	<br>
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<button type="submit" class="btn btn-warning">Salir</button>
	</form:form>
  </body>
</html>
