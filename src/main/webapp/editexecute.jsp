

<%@ page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />
<%    
    // Chama o método updateCliente da classe ClienteDao para atualizar o cliente no banco de dados
    int i = ClienteDao.updateCliente(c);
    
    // Redireciona para a página "clientview.jsp" após a conclusão da operação
    response.sendRedirect("clientview.jsp");
%>
