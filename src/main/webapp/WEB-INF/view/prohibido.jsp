<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="text-danger">Acceso denegado</h1>
	<p>
	Usuario:
	<sec:authentication property="principal.username" />
	</p>
	<p>
	Roles:
	<sec:authentication property="principal.authorities" />
	</p>
	<a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">Volver al inicio</a>
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<button type="submit" class="btn btn-warning">Salir</button>
	</form:form>
</body>
</html>
