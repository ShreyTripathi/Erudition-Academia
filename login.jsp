<html>
<head>
<title>Login</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="jquery-3.3.1.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="index_css.css"/>
<link rel="stylesheet" href="nav_css.css">
	<script>
		$(document).ready(function(){
				$(".panel").show();
		});
	</script>
</head>
<script>
	$(document).ready(function(){
			$(".panel").show(1450);
	});
</script>
<body>
<%
	if(session.getAttribute("uId")!=null)
	{
		if(session.getAttribute("type").toString().equals("faculty"))
		{
			response.sendRedirect("fac_dash.jsp");
		}
		if(session.getAttribute("type").toString().equals("student"))
		{
			response.sendRedirect("stud_dash.jsp");
		}
	}
%>
<!--Form to be submitted to the login Servlet-->

<jsp:include page="navbar_login.jsp" />
<%
if(request.getAttribute("error")!=null)
{
	out.println(request.getAttribute("error").toString());
}%>
<div class="container" style="font-size:1.2em">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                  <h2 align="center">Login Form</h2>
                </div>
                <div class="panel-body">
	<form class="form-horizontal" role="form" action="login_logic.jsp" method="POST">
                    <div class="form-group">
			<label for="userType" class="col-md-3 control-label">
                            Select User</label>
                        <div class="col-sm-9">
			   <select class="form-control" id="userType" name="utype" required="">
        			<option>Faculty</option>
        			<option>Student</option>
      			   </select>
			</div>
		    </div>
		    <div class="form-group">
                        <label for="inputUserId" class="col-md-3 control-label">
                            User ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputUserId" placeholder="User Id" name="uId" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pwd" required>
                        </div>
                    </div>
		    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-lg" style="margin-top:-1.2em">
                                Sign in</button>
                                 <!--button type="reset" class="btn btn-default btn-lg" style="margin-top:-1.2em">
                                Reset</button-->
                        </div>
                </div>
		</form>
	   </div>
	   <div class="panel-footer">
                    <h4>Not Registered? <a href="register.jsp">Register here</a></h4>
			</div>
           </div>
        </div>
    </div>
</div>

</body>
</html>
