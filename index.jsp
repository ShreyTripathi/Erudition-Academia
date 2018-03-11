<html>
<head>
<title>Login</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="nav_js.js"></script>
<link rel="stylesheet" href="nav_css.css">
<link rel="stylesheet" href="index_css.css">
</head>
<body>
	<!--Form to be submitted to the login Servlet-->
<div class="container">		
<jsp:include page="navbar_public.jsp" />
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                  <strong>Login</strong>
                </div>
                <div class="panel-body">				
	<form class="form-horizontal" role="form" action="login_logic.jsp" method="POST">
                    <div class="form-group">
			<label for="userType" class="col-sm-3 control-label">
                            Select User</label>
                        <div class="col-sm-9">
			   <select class="form-control" id="userType" name="utype"  required="">
        			<option>Faculty</option>
        			<option>Student</option>
      			   </select>
			</div>
		    </div>
		    <div class="form-group">
                        <label for="inputUserId" class="col-sm-3 control-label">
                            User ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputUserId" placeholder="User Id" name="uId" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pwd" required="">
                        </div>
                    </div>
		<div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                </div>
		</form>
	   </div>	
	   <div class="panel-footer">
                    Not Registered? <a href="register.jsp">Register here</a></div>
           </div>
        </div>
    </div>
</div>

</body>
</html>
