

<%@ page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />
<%    
    // Chama o m�todo updateCliente para atualizar o cliente no banco
    int i = ClienteDao.updateCliente(c);
    
    // Redireciona ap�s a conclus�o da opera��o
    response.sendRedirect("clientview.jsp");
%>
