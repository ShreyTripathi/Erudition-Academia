<%@ page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    function noMoretoSubmit()
    {
      var a =document.getElementById("#det");
      var b = document.getElementById("#ch1");
      var c = document.getElementById("#ch2");
      var d = document.getElementById("#ch3");
      var e = document.getElementById("#ch4");
      a.value="random";
      b.value="random";
      c.value="random";
      d.value="random";
      e.value="random";
    }
  </script>
  <style>
  .main_text{
    font-size: 1.3em;
    padding: 0em;
  }
  body {
   background: url('table.jpg') no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
  }
  textarea{
    border-radius: 1.0002em;
  }
  </style>
  <link rel="stylesheet" href="nav_css.css">
    <title>Enter Question For Quiz</title>
</head>
<body>
<%
	if(session.getAttribute("type")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
%>

<jsp:include page="navbar_public.jsp" />

<div class="container main_text">
<%
  String courseId = request.getParameter("courseId");
  String dbName = "modif_eru_acad";
  String user= "root";
  String pass= "root";
  Connection con = null;
  Statement st = null;
  ResultSet rs = null;
  try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
    st = con.createStatement();
    rs = st.executeQuery("select coursename from course where courseid='"+courseId+"'");
    if(rs.next()){
  %>

  <h1 class="text-center">Add Quiz for Course : <%=rs.getString("coursename")%></h1>
  <%
  }else{out.println("<div alert-danger>No Such Course Exists.</div>");}
}catch(Exception e){out.print(request.getParameter("courseId"));}finally{
  try{st.close();}
  catch(Exception e){}
  try {
    con.close();
  }catch(Exception e){}
}
%>
	<form action="enter_question_logic.jsp" method="post" id="myform">

	<table class="table main_text">
  <tbody>
		<%if(session.getAttribute("topic_name")!=null){
	%>
	<h2><%=session.getAttribute("topic_name").toString()%></h2>

	<%}
	 else{
	%>
	<tr><td><strong>Topic Name: </strong></td><td><input type="text" size="45" name="topic" required></td></tr>
  <tr><td><strong>Last Date For Submission: </strong></td><td><input type="date" name="last_date" required></td></tr>
  <%}%>
	<tr><td><strong>Question: </strong></td><td><textarea rows="2" cols="80" name="det" id="det" style="whitespace: pre-wrap;" required></textarea></td></tr>
	<tr><td><strong>Choice1: </strong></td><td><textarea rows="2" cols="80" name="choice1" id="ch1" required></textarea></td></tr>
	<tr><td><strong>Choice2: </strong></td><td><textarea rows="2" cols="80" name="choice2" id="ch2" required></textarea></td></tr>
	<tr><td><strong>Choice3: </strong></td><td><textarea rows="2" cols="80" name="choice3" id="ch3" required></textarea></td></tr>
	<tr><td><strong>Choice4: </strong></td><td><textarea rows="2" cols="80" name="choice4" id="ch4" required></textarea></td></tr>
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
  <input type="hidden" name="courseId" value="<%=courseId%>">
	<%if(session.getAttribute("topic_name")!=null){%>
		<tr><td><input type="submit" value="All Questions Submitted" name="quiz_stat" onclick="noMoretoSubmit()"></td></tr>
	<%
	}
	%>
	</table>
	</form>
</div>
</body>
</html>
