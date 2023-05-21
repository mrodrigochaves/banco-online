<%@ page import="com.mrodrigochaves.dao.ClienteDao"%>
<jsp:useBean id="c" class="com.mrodrigochaves.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
int i = ClienteDao.updateCliente(c);
response.sendRedirect("clientview.jsp");
%>