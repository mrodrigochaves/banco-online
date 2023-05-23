

<%@ page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />
<%    
    // Chama o método updateCliente para atualizar o cliente no banco
    int i = ClienteDao.updateCliente(c);
    
    // Redireciona após a conclusão da operação
    response.sendRedirect("clientview.jsp");
%>
