<%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/25
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>
<%
    session.invalidate();
%>
已退出
<br><a href="index.jsp">返回首页</a>
</body>
</html>
