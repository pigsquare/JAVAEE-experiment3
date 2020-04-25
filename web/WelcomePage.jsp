<%@ page import="com.mysql.jdbc.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/24
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
当前用户ID:
<%
    out.print(session.getAttribute("userId"));
%>
<br>
<a href="logout.jsp">注销</a>
<br>
<a href="userHistory.jsp">历史记录</a>
<br><br>
商品列表
<br/>
<form name="form1" method="post" action="processBuy.jsp">
    <table width="360" border="0">
        <tr>
            <td width="80">Id</td>
            <td width="100">Code</td>
            <td width="160">Name</td>
            <td width="50">Buy</td>
        </tr>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://cdb-3pvzva14.cd.tencentcdb.com:10091/SHOPDB"; //数据库名
                String username = "root";  //数据库用户名
                String password = "3*FFrd54P%ddVz";  //数据库用户密码
                Connection conn = (Connection) DriverManager.getConnection(url, username, password);

                if(conn != null){
                    // out.print("Connection Success.<br/>");
                    Statement stmt = null;
                    ResultSet rs = null;
                    String sql = "SELECT * FROM product;";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    // out.println("id"+"  "+"productCode"+"  "+"productName"+"<br>");
                    while (rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("productCode")%></td>
            <td><%=rs.getString("productName")%></td>
            <td><input type="checkbox" name="item" value=<%=rs.getInt("id")%>></td>
        </tr>
        <%
                        //out.println(rs.getString("id")+"   &nbsp  "+rs.getString("productCode")+"  &nbsp "+rs.getString("productName")+"<br/>"); //将查询结果输出
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Connection failed");
            }
        %>
        <tr>
            <td></td><td></td><td></td>
            <td><input type="submit" value="购买"/></td>
        </tr>
    </table>

</form>
</body>
</html>
