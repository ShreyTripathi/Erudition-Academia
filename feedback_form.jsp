<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Feed Back Form</title>
</head>
<body>
<div class="container">
<%
	if(!session.getAttribute("type").toString().equals("student"))
	{
%>		<div class="alert alert-info">Only Students are allowed to give feedbacks.</div>
		<a href="logout.jsp">Go Back</a>	
<%	}
%>
	<jsp:include page="navbar_public.jsp" />
	<h1>FeedBack Form</h1>
	<form action="feedback_logic.jsp" method="post">
	<label>Course Name : </label><input type="text" name="courseName" placeholder="Enter Course Name" required>
	<ol>
		<li>	<label>How much did you like the course?</label><br>
			  <input type="radio" name="course_rate" value="5" checked> 5<br>
			  <input type="radio" name="course_rate" value="4"> 4<br>
			  <input type="radio" name="course_rate" value="3"> 3<br>
			  <input type="radio" name="course_rate" value="2"> 2<br>
			  <input type="radio" name="course_rate" value="1"> 1
		</li>
		<li>	<label>How much did you like the course content?</label><br>
			  <input type="radio" name="content_rate" value="5" checked> 5<br>
			  <input type="radio" name="content_rate" value="4"> 4<br>
			  <input type="radio" name="content_rate" value="3"> 3<br>
			  <input type="radio" name="content_rate" value="2"> 2<br>
			  <input type="radio" name="content_rate" value="1"> 1
		</li>
		<li>	<label>How much was the course understandable?</label><br>
			  <input type="radio" name="understand" value="5" checked> 5<br>
			  <input type="radio" name="understand" value="4"> 4<br>
			  <input type="radio" name="understand" value="3"> 3<br>
			  <input type="radio" name="understand" value="2"> 2<br>
			  <input type="radio" name="understand" value="1"> 1
		</li>
		<li>	<label>Any Suggestions for improvement in the course?</label><br>
			  <input type="text" name="improve"> 
		</li>
		<input type="submit">
		
	</ol>
	</form>
</div>
</body>
</html>
