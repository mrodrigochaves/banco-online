<%@page import="com.mrodrigochaves.dao.ClienteDao"%>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />


<%
    // Chama o m�todo deleteClient
    ClienteDao.deleteClient(c);
    
    // Redireciona ap�s a exclus�o do cliente
    response.sendRedirect("clientview.jsp");
%>
