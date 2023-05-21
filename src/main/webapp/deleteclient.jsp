<%@page import="com.mrodrigochaves.dao.ClienteDao" %>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>


<%
	ClienteDao.deleteClient(c);
	response.sendRedirect("clientview.jsp");
%>