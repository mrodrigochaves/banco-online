<%@page import="com.mrodrigochaves.dao.ClienteDao"%>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c" />


<%
// Chama o m�todo saveClient para salvar o cliente
int i = ClienteDao.saveClient(c);

// Verifica se o resultado da opera��o de salvamento foi bem-sucedido
if (i > 0) {
	// Redireciona para a p�gina "addclient-success.jsp" em caso de sucesso
	response.sendRedirect("addclient-success.jsp");
} else {
	// Redireciona para a p�gina "addclient-error.jsp" em caso de erro
	response.sendRedirect("addclient-error.jsp");
}
%>
