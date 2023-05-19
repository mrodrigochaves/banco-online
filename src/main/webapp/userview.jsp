<!DOCTYPE html>
<html xml:lang="en">
    <head>
        <title> Pagina JSP Ola Mundo</title>
    </head>
    <body>
        <%@ page import="com.mrodrigochaves.dao.ClienteDao, com.mrodrigochaves.bean.*"  %>
        <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
        <h1>
            <%
                out.println("Ola Mundo");
            %>
            <br>
            <%=new Date()%>
        </h1>
    </body>
</html>