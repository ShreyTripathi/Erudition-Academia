<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
%>
<div class="container">
	<jsp:include page="navbar_public.jsp" />
	<form action="enter_question_logic.jsp" method="post">

	<table>
		<%if(session.getAttribute("topic_name")!=null){
	%>	
	<h2><%=session.getAttribute("topic_name").toString()%></h2>
	<%}
	 else{
	%>
	<tr><td>Topic Name: </td><td><input type="text" name="topic"></td></tr><%}%>
	<tr><td>Question: </td><td><input type="text" name="det"></td></tr>
	<tr><td>Choice1: </td><td><input type="text" name="choice1"></td></tr>
	<tr><td>Choice2: </td><td><input type="text" name="choice2"></td></tr>
	<tr><td>Choice3: </td><td><input type="text" name="choice3"></td></tr>
	<tr><td>Choice4: </td><td><input type="text" name="choice4"></td></tr>
	<tr><td>Ans: </td><td><input type="text" name="correct_answer"></td></tr>
	<tr><td>Difficulty Level:</td></tr>
	<tr><td>High: </td><td><input type="radio" value="high" name="diff_level"></td></tr>
	<tr><td>Medium: </td><td><input type="radio" value="medium" name="diff_level"></td></tr>
	<tr><td>Low: </td><td><input type="radio" value="low" name="diff_level"></td></tr>
	<tr><td><input type="submit" value="enter question" name="quiz_stat"></td></tr>
	<%if(session.getAttribute("topic_name")!=null){%>
		<tr><td><input type="submit" value="submit quiz" name="quiz_stat"></td></tr>
	<%
	}
	%>
	</table>
	</form>
</div>
</body>
</html>
