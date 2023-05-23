
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>Exibição de Clientes</title>
</head>
<body>
	<%@ page
		import="com.mrodrigochaves.dao.ClienteDao, com.mrodrigochaves.bean.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Gestão de Clientes</h1>

	<%
	// Chama o método getAllClientes para obter a lista de todos os clientes
	List<Cliente> list = ClienteDao.getAllClientes();

	// Define o atributo "list" no objeto request, tornando a lista de clientes disponível 
	request.setAttribute("list", list);
	%>


	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Login</th>
			<th>Editar</th>
			<th>Remover</th>
		</tr>
		<c:forEach items="${list}" var="client">
			<tr>
				<td>${client.getId()}</td>
				<td>${client.getName()}</td>
				<td>${client.getLogin()}</td>
				<td><a href="editclient.jsp?id=${client.getId()}">Editar</a></td>
				<td><a href="deleteclient.jsp?id=${client.getId()}">Remover</a></td>
			</tr>
		</c:forEach>
	</table>

	<a href="createclient.jsp" target="_blank">Cadastrar Clientes</a>
</body>
</html>