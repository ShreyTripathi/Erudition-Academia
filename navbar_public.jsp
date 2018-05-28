<nav class="navbar navbar-default" id="mynav" style="font-size:1.2em">
	<div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.html" id="mylogo"><b>ERUDITION ACADEMIA</b></a>
    </div>
  <div class="navbar-default">
    <ul class="nav navbar-nav navbar-right" id="navright">
	<!--<li><a href="quiz_list.jsp">Take Test</a></li>-->
	<li><a href="my_categories.jsp">Courses</a></li>
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
