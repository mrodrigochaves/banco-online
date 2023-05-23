<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página de Edição de Clientes</title>
</head>
<body>
	<%@ page
		import="com.mrodrigochaves.bean.Cliente, com.mrodrigochaves.dao.ClienteDao"%>

	<%
	//Obtém o parâmetro "id" da requisição
	String id = request.getParameter("id");
	
	//Chama o método getRegisterById da classe ClienteDao para obter o cliente com base no ID fornecido
	// Converte o ID de String para Integer usando Integer.parseInt()
	Cliente client = ClienteDao.getRegisterById(Integer.parseInt(id));
	%>

	<h1>Página de Edição do Usuário</h1>

	<form action="editexecute.jsp" method="post">
		<input type="hidden" name="id" value="<%=client.getId()%>" />
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="name"
					value="<%=client.getName()%>" /></td>
			</tr>
			<tr>
				<td>Login:</td>
				<td><input type="email" name="login"
					value="<%=client.getLogin()%>" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"
					value="<%=client.getPassword()%>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Editar usuário"></input></td>
			</tr>
			<tr>
				<td><a href="clientview.jsp">Voltar</a></td>
			</tr>

		</table>
	</form>
</body>
</html>