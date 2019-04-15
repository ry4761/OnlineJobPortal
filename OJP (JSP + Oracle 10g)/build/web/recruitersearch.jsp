<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter - Search </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1> Recruiter </h1>
<% 
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=username %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
Search Job Seeker<br><br>
<form method="get" action="recruitersearchresult.jsp">
<input type="search" name="search">
<input type="submit" value="Search">
</form>
<jsp:include page="footer.jsp"/>
</body>
</html>