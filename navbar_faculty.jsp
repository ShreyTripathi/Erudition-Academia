<nav class="navbar navbar-default" id="mynav" style="font-size:1.2em">
 <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="login.jsp" id="mylogo"><b>ERUDITION ACADEMIA</b></a>
    </div>
  <div class="navbar-default">
    <ul class="nav navbar-nav navbar-right" id="navright">
  <li><a href="my_course_list.jsp">View Courses</a></li>
	<li><a href="enter_question.jsp">Create Test</a></li>
	<li><a href="add_course.jsp">Add Course</a></li>
	<%if(session.getAttribute("uId")==null){%>
	<li><a href="login.jsp">Login</a></li>
	<li><a href="register.jsp">Register</a></li>
	<%
	}
	%>
	<%
	if(session.getAttribute("uId")!=null){
	%>
		<li><a href="fac_dash.jsp"><%=session.getAttribute("uId")%></a></li>
		<li><a href="logout.jsp">Logout</a></li>
	<%
	}
	%>
    </ul>
  </div>
 </div>
</nav>
