<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--전달파라미터를 변수에 저장하기 --%>
<% int n1 =Integer.parseInt(request.getParameter("num1")); %>
<% int n2 =Integer.parseInt(request.getParameter("num2")); %>
<% String oper = request.getParameter("oper"); %>


<% if("add".equals(oper)){ %>
	<%=n1 %>+<%=n2 %> = <%=n1+n2 %><br>

<% } else if("sub".equals(oper)){ %>
	<%=n1 %>-<%=n2 %> = <%=n1-n2 %><br>

<% } else if("mul".equals(oper)){ %>
	<%=n1 %>*<%=n2 %> = <%=n1*n2 %><br>

<% } else if("div".equals(oper)){ %>
	<%=n1 %>/<%=n2 %> = <%=(double)n1/n2 %><br>


<%} %>

</body>
</html>