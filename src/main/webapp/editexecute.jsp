

<%@ page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />
<%    
    // Chama o m�todo updateCliente da classe ClienteDao para atualizar o cliente no banco de dados
    int i = ClienteDao.updateCliente(c);
    
    // Redireciona para a p�gina "clientview.jsp" ap�s a conclus�o da opera��o
    response.sendRedirect("clientview.jsp");
%>
