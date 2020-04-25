<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/24
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>用户添加</title>
</head>
<body>
<%
    String user = request.getParameter("username");
    String pswd = request.getParameter("userpass");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://cdb-3pvzva14.cd.tencentcdb.com:10091/SHOPDB"; //数据库名
        String username = "root";  //数据库用户名
        String password = "3*FFrd54P%ddVz";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);

        if(conn != null && user != null){
            out.print("Connection Success.<br/>");
            Statement stmt = null;
            String sql = "INSERT INTO user (username, password) VALUES ('"+ user + "','" +pswd +"');";
            stmt = conn.createStatement();
            stmt.execute(sql);
            out.print("Add Success.<br/>");
        }
    } catch (Exception e) {
        out.println("Connection failed");
        e.printStackTrace();
    }

%>
<a href='javascript:history.go(-1)'>back</a>
</body>
</html>
