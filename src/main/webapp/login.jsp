<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entrar no Sistema</title>
</head>
<body>
		<h1>Insira as informa��es de login</h1>
		
        <form method ="get" action="home.jsp">
            Login : <input type="text" name="login"><br/><br/>
            Password : <input type="password" name ="password"><br/>
                <input type ="submit" value="Logar">    
        </form>    
        
        <%@ page import="com.mrodrigochaves.dao.ClienteDao" %>
        <%@ page import="com.mrodrigochaves.bean.Cliente" %>
        <%
    		// Obt�m os par�metros "login" e "password" da requisi��o
    		String login = request.getParameter("login");
    		String password = request.getParameter("password");
    
    		// Chama o m�todo getValidateLogin para autenticar o login
    		Cliente client = ClienteDao.getValidateLogin(login, password);
		%>
        
</body>
</html>