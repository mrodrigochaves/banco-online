<%@page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>


<%
	int i = ClienteDao.saveClient(c);

	if(i > 0){
		response.sendRedirect("addclient-success.jsp");
	}else{
		response.sendRedirect("addclient-error.jsp");
	}
%>