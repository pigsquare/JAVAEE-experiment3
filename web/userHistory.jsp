<%--
  Created by IntelliJ IDEA.
  User: zhufz
  Date: 2020/4/25
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Date" %>
<html>
<head>
    <title>购买页面</title>
</head>
<body>
<%
    String userId = session.getAttribute("userId").toString();
    Date d = new Date(System.currentTimeMillis());
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://cdb-3pvzva14.cd.tencentcdb.com:10091/SHOPDB"; //数据库名
        String username = "root";  //数据库用户名
        String password = "3*FFrd54P%ddVz";  //数据库用户密码
        Connection conn = (Connection) DriverManager.getConnection(url, username, password);

        if(conn != null && userId!=null){
            //out.print("Connection Success.<br/>");
            out.println("<br>7日之内购买历史记录<br>" +
                    "<table width=\"360\" border=\"0\"><tr><td width=\"80\">用户id</td>" +
                    "<td width=\"80\">商品id</td>" +
                    "<td width=\"115\">购买日期</td>" +
                    "<td width=\"80\">购买数量</td></tr>");
            String sql = "SELECT * FROM shop_records WHERE userId=" + userId + " AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(shopDate);";
            Statement stmt;
            ResultSet rs;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            //out.println("id"+"  "+"productCode"+"  "+"productName"+"<br>");
            while (rs.next()){
                //out.println(rs.getString("id")+"   &nbsp  "+rs.getString("productCode")+"  &nbsp "+rs.getString("productName")+"<br/>"); //将查询结果输出
                out.print("<tr>" +
                        "<td>" + rs.getString("userId") + "</td>" +
                        "<td>" + rs.getString("productId") + "</td>" +
                        "<td>" + rs.getDate("shopDate").toString() + "</td>" +
                        "<td>" + rs.getString("number") + "</td>" +
                        "</tr>");
            }
            out.print("</table><br>用户购买统计<br><table width=\"360\" border=\"0\">" +
                    "<tr><td width=\"60\">商品id</td>" +
                    "<td width=\"100\">商品代码</td>" +
                    "<td width=\"100\">商品名称</td>" +
                    "<td width=\"80\">购买次数</td></tr>");
            sql = "SELECT * FROM product";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                out.print("<tr>" +
                        "<td>" + rs.getString("id") + "</td>" +
                        "<td>" + rs.getString("productCode") + "</td>" +
                        "<td>" + rs.getString("productName") + "</td>" +
                        "");
                String countSql = "SELECT COUNT(number) FROM shop_records WHERE userId = " +
                        userId + " AND productId = " +rs.getString("id") +
                        " ;";
                Statement stmt2 = conn.createStatement();
                ResultSet countRs = stmt2.executeQuery(countSql);
                while(countRs.next()){
                    out.print("<td>" + countRs.getString(1) + "</td>");
                }
                out.print("</tr>");
            }
            out.print("</table>");
        }
    } catch (Exception e) {
        out.println("Connection failed");
        e.printStackTrace();
    }
%>
<a href='javascript:history.go(-1)'>back</a>
</body>
</html>
