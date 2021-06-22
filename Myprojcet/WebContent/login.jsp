<%@ page import ="java.sql.*" %>
<link rel="stylesheet" href ="innerdesign2.css"/>
<%

String userid = request.getParameter("uname");    
String pwd = request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test600",
"root", "root");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
if (rs.next()) {
session.setAttribute("userid", userid);
//out.println("welcome " + userid);
//out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("home.jsp");
} else {
out.println("Invalid username/password <a href='index.jsp'></a>");
}
%>
