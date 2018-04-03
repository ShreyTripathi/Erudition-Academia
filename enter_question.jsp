<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .main_text{
    font-size: 1.4em;
    padding: 1.5em;
  }
  </style>
</head>
<body>
<%
	if(!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
%>
<div class="container-fluid">
<jsp:include page="navbar_public.jsp" />
</div>
<div class="container main_text">
	<form action="enter_question_logic.jsp" method="post">

	<table class="table">
  <tbody>
		<%if(session.getAttribute("topic_name")!=null){
	%>
	<h2><%=session.getAttribute("topic_name").toString()%></h2>

	<%}
	 else{
	%>
	<tr><td><strong>Topic Name: </strong></td><td><input type="text" size="45" name="topic"></td></tr><%}%>
	<tr><td><strong>Question: </strong></td><td><textarea rows="2" cols="80" name="det"></textarea></td></tr>
	<tr><td><strong>Choice1: </strong></td><td><textarea rows="2" cols="80" name="choice1"></textarea></td></tr>
	<tr><td><strong>Choice2: </strong></td><td><textarea rows="2" cols="80" name="choice2"></textarea></td></tr>
	<tr><td><strong>Choice3: </strong></td><td><textarea rows="2" cols="80" name="choice3"></textarea></td></tr>
	<tr><td><strong>Choice4: </strong></td><td><textarea rows="2" cols="80" name="choice4"></textarea></td></tr>
	<tr><td><strong>Answer: </strong></td><td><select name="correct_answer">
                                            <option value="choice1">Choice1</option>
                                            <option value="choice2">Choice2</option>
                                            <option value="choice3">Choice3</option>
                                            <option value="choice4">Choice4</option>
                                            </select></td></tr>
	<tr><td><strong>Difficulty Level:</strong></td></tr>
	<tr><td>High: </td><td><input type="radio" value="high" name="diff_level"></td></tr>
	<tr><td>Medium: </td><td><input type="radio" value="medium" name="diff_level"></td></tr>
	<tr><td>Low: </td><td><input type="radio" value="low" name="diff_level"></td></tr>
	<tr><td></td><td><input type="submit" value="enter question" name="quiz_stat"></td></tr>
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
