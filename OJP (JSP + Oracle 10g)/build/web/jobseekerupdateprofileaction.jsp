<%@ page import="java.sql.*" %>
<html>
<head>
<title>JobSeeker � Update Profile Action</title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String designation=request.getParameter("designation");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String keyskills=request.getParameter("keyskills");
String projects=request.getParameter("projects");
String itskills=request.getParameter("itskills");
String education=request.getParameter("education");
String certifications=request.getParameter("certifications");
String workdetails=request.getParameter("workdetails");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String hometown=request.getParameter("hometown");
String pin=request.getParameter("pin");
String maritialstatus=request.getParameter("maritialstatus");
String languagesknown=request.getParameter("languagesknown");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 ResultSet rs3=null;
 
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521";

  con=DriverManager.getConnection(url,"system","system");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("select * from login where username='"+username+"' and usertype='"+usertype+"' ");
  if(rs.next())
  {
	  rs1=stmt.executeQuery("select * from jobseekerprofile where username='"+username+"'");
	  if(rs1.next())
	  {
       rs2=stmt.executeQuery("update jobseekerprofile set username='"+username+"', fname='"+fname+"', lname='"+lname+"', designation='"+designation+"', location='"+location+"', experience='"+experience+"', email='"+email+"', mobile='"+mobile+"', keyskills='"+keyskills+"', projects='"+projects+"', itskills='"+itskills+"', education='"+education+"', certifications='"+certifications+"', workdetails='"+workdetails+"', dob='"+dob+"', gender='"+gender+"', hometown='"+hometown+"', pin='"+pin+"', maritialstatus='"+maritialstatus+"', languagesknown='"+languagesknown+"' where username='"+username+"' ");     // toLowerCase() is used to store data into table in LowerCase to remove case senstivity of fields except password. Password is case sensitive for security reasons.
	  }
	  else
	  {
	  rs3=stmt.executeQuery("insert into jobseekerprofile values('"+username+"','"+fname+"','"+lname+"','"+designation+"','"+location+"','"+experience+"','"+email+"','"+mobile+"','"+keyskills+"','"+projects+"','"+itskills+"','"+education+"','"+certifications+"','"+workdetails+"','"+dob+"','"+gender+"','"+hometown+"','"+pin+"','"+maritialstatus+"','"+languagesknown+"')");     // toLowerCase() is used to store data into table in LowerCase to remove case senstivity of fields except password. Password is case sensitive for security reasons.  
	  }
	  rs.close();
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("jobseekerprofile.jsp");
  
%>
</body>
</html>