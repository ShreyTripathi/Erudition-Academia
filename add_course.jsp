<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
	
%>
<div class="container">
	<jsp:include page="navbar_public.jsp" />
	<form action="add_course_logic.jsp" method="post">

	<table>
	<tr><td>Course Id: </td><td><input type="text" name="course_id" required></td></tr>
	<tr><td>Course Name: </td><td><input type="text" name="course_name" required></td></tr>
	<tr><td>Start Date: </td><td><input type="date" name="sdate" required></td></tr>
	<tr><td>Finish Date: </td><td><input type="date" name="edate" required></td></tr>
	<tr><td>Duration: </td><td><input type="text" name="duration" required></td></tr>
	<tr><td>Fee (In Rupees): </td><td><input type="text" name="fee" required></td></tr>
		<tr><td><input type="submit" value="submit quiz"></td></tr>
	</table>
	</form>
</div>
</body>
</html>