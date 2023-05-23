<%@page import="com.mrodrigochaves.dao.ClienteDao"%>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />


<%
    // Chama o método deleteClient
    ClienteDao.deleteClient(c);
    
    // Redireciona após a exclusão do cliente
    response.sendRedirect("clientview.jsp");
%>
