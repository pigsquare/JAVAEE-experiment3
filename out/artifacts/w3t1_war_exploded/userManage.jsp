<%@ page import="com.mysql.jdbc.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/24
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://cdb-3pvzva14.cd.tencentcdb.com:10091/SHOPDB"; //数据库名
        String username = "root";  //数据库用户名
        String password = "3*FFrd54P%ddVz";  //数据库用户密码
        Connection conn = (Connection) DriverManager.getConnection(url, username, password);

        if(conn != null){
            out.print("Connection Success.<br/>");
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM user;";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            out.println("id"+"  "+"name"+"  "+"password"+"<br>");
            while (rs.next()){
                out.println(rs.getString("id")+"   &nbsp  "+rs.getString("username")+"  &nbsp "+rs.getString("password")+"<br/>"); //将查询结果输出
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Connection failed");
    }
%>
<form id="form1" name="form1" method="post" action="userAdd.jsp">
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
                <input type="submit" name="Submit2" value="添加用户" />
                <input type="reset" name="Submit" value="重置" />
            </td>
        </tr>
    </table>
</form>

<form id="form2" action="userDel.jsp" method="post" name="form2">
    <table width="260" border="0">
        <tr>
            <td width="64">id：</td>
            <td width="180"><input type="text" name="userid" /></td>
        </tr>
        <tr>
            <td> </td>
            <td>
                <input type="submit" name="Submit2" value="删除用户" />
                <input type="reset" name="Submit" value="重置" />
            </td>
        </tr>
    </table>
</form>
<a href='javascript:history.go(-1)'>返回</a>
</body>
</html>
