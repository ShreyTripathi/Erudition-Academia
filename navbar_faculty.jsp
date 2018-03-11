<nav class="navbar navbar-default">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">ERUDITION ACADEMIA</a>
    </div>
  <div class="container navbar-default">
    <ul class="nav navbar-nav navbar-right">
	<li><a href="enter_question.jsp">Add Test</a></li>
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
</nav>
