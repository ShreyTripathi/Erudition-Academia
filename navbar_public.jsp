<nav class="navbar navbar-default">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">ERUDITION ACADEMIA</a>
    </div>
  <div class="container navbar-default"> 
    <ul class="nav navbar-nav navbar-right">
	<!--li><a href="quiz_list.jsp">Take Test</a></li-->
	<li><a href="my_course_list.jsp">Courses</a></li>
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
