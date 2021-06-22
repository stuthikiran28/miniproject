<%@ page import ="java.sql.*" %>
<link rel="stylesheet" href ="innerdesign2.css"/> 
<%
String user = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String adhaar_no = request.getParameter("adhaar_no");
String cpass = request.getParameter("cpass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test600",
"root", "root");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass,adhaar,cpass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','"+adhaar_no+"','"+cpass+"', CURDATE())");
if (i > 0 && pwd.equals(cpass)) {
//session.setAttribute("userid", user);
response.sendRedirect("welcome.jsp");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
response.sendRedirect("missmatch.jsp");
}
%>
