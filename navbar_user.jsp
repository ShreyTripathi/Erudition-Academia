<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Erudition Academia</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span><p id="user"><%if(session.getAttribute("uId")!=null){%>
<%=session.getAttribute("uId")%>
<%}%>
<%else{%>
	User Name<%}%></p></a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span><p id="status"> Logout</p></a></li> 
    </ul>
  </div>
</nav>
<!--<nav class="navbar navbar-default">
  <div class="container navbar-default"> 
    <ul class="nav navbar-nav navbar-right">
	<li><a href="#">Announcement</a></li>
	<li><a href="#">Progress</a></li>
	<li><a href="#">Course</a></li>
	<li><a href="#">Discussion</a></li>
    </ul>
  </div>
</nav>-->

