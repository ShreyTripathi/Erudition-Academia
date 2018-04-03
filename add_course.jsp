<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.main_text{
  font-size: 1.4em;
  padding: 1.5em;
}
</style>
<link rel="stylesheet" href="nav_css.css"/>
<body>
<%
	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}

%>
	<jsp:include page="navbar_public.jsp" />
<div class="container main_text text-center" style="background-color:#eee">
  <h1>Enter the Course Basic Info:</h1>
  <hr>
	<form action="add_course_logic.jsp" method="post">

	<table class="table text-left" style="font-size:1.2em">
	<tr><td>Course Id: </td><td><input type="text" name="course_id" size="8" required></td></tr>
	<tr><td>Course Name: </td><td><input type="text" size="50" name="course_name" required></td></tr>
	<tr><td>Start Date: </td><td><input type="date" name="sdate" size="12" required></td></tr>
	<tr><td>Finish Date: </td><td><input type="date" name="edate" size="12" required></td></tr>
	<tr><td>Duration: </td><td><input type="text" name="duration" size="12" placeholder="Duration in Hours" required></td></tr>
	<input type="hidden" name="fee" size="12" value="0" required>
		<tr><td><input type="submit" value="submit quiz"></td><td></td></tr>
	</table>
	</form>
</div>
</body>
</html>
