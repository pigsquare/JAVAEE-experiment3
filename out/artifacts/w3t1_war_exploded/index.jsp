<%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/23
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <title>登录界面</title>
</head>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<body>
<form id="form1" name="form1" method="post" action="login.jsp">
  <table width="260" border="0">
    <tr>
      <td width="64">用户：</td>
      <td width="180"><input type="text" name="username" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td> <input type="password" name="userpass" /></td>
    </tr>
    <tr>
      <td> </td>
      <td>
        <input type="submit" name="Submit2" value="登录" />
        <input type="reset" name="Submit" value="重置" />
      </td>
    </tr>
  </table>
</form>
<a href="userManage.jsp">用户管理</a><br>
<a href="prodManage.jsp">商品管理</a>
</body>
</html>
