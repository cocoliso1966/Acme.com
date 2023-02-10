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
  	<h1>Administradores</h1>
	<h3>Esta página será sólo para administradores</h3>
	<p>Usuario: <sec:authentication property="principal.username"/></p>
	<p>Roles: <sec:authentication property="principal.authorities"/></p>
	<form:form
		action="${pageContext.request.contextPath}/logout" method="POST">
		<button type="submit" class="btn btn_warning">Salir</button>
	</form:form>
</body>
</html>
