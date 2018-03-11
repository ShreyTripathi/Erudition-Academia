<html>
<head>
<title>upload File</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="nav_css.css">
<script src="nav_js.js"></script>
</head>
<body>
	<jsp:include page="nav_user.jsp"/>
	<form method="post" action="/FileUpload" enctype="multipart/form-data">
		Choose a file : <input type="file" name="file"> 
		<input type="submit" value="upload">
	</form>
</body>
</html>
