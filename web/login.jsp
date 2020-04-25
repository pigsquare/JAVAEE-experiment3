<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/24
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checking</title>
</head>
<body>
<%
    boolean isLegal = false;
    String user = request.getParameter("username");
    String pswd = request.getParameter("userpass");
    int userid;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://cdb-3pvzva14.cd.tencentcdb.com:10091/SHOPDB"; //数据库名
        String username = "root";  //数据库用户名
        String password = "3*FFrd54P%ddVz";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);

        if(conn != null && user != null){
            out.print("Connection Success.<br/>");
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "SELECT password,id FROM user WHERE username = '"+ user +"';";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                isLegal = rs.getString("password").equals(pswd);
                userid = rs.getInt("id");
                session.setAttribute("userId",userid);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Connection failed");
    }
    if(isLegal){
%>
<jsp:forward page="WelcomePage.jsp">
    <jsp:param name="valid" value="true"/>
</jsp:forward>
<%
}
else{
    out.println("username or password error!<br/>");
%>
<a href='javascript:history.go(-1)'>返回</a>
<%
    }
%>
</body>
</html>
