<%@ page import="java.sql.*"%>
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
  <link rel="stylesheet" href="nav_css.css"/>
  <script>
    function add_newCat()
    {
      $("#my_cat").hide();
      $("#oldCat").attr('name','');
      var toshow = document.getElementById("newCat");
      var newCategory = document.getElementById("newCategory");
      toshow.style.display="block";
      $('#newCategory').attr('name', 'category');
    }
  </script>
</head>

<body>
<%
	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
  Connection con = null;
  Statement st = null;

  ResultSet rs = null;

  String dbName = "modif_eru_acad";
  String user= "root";
  String pass= "root";

  int i=0;
  %>
	<jsp:include page="navbar_public.jsp" />
<div class="container main_text text-center" style="background-color:#eee">
  <h1>Enter the Course Basic Info:</h1>
  <hr>
	<form action="/imageUpload" method="post" enctype="multipart/form-data">

	<table class="table text-left" style="font-size:1.2em">
  <tr><td>Select Category: </td><td id="my_cat"><select name="category" id="oldCat"><%try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
    st = con.createStatement();
    rs = st.executeQuery("select distinct course.category from course");
    session.removeAttribute("courseid");

      if(rs.next())
      {
        do
        {
          String cat = rs.getString("category");
          %><option value="<%=cat%>"><%=cat%></option>
          <%}while(rs.next());//end of while
      }//end of if
    }
    catch(Exception e){out.println("<div class='alert-danger'>Problem :"+e+"</div>");}
    finally{
      try{st.close();}catch(Exception e){}
      try{con.close();}catch(Exception e){}
    }
    %></select></td><td id="newCat" style="display:none"><input type="text" id="newCategory"></td><td><input type="button" value="Add new Category" onclick="add_newCat()"></td></tr>
	<tr><td>Course Id: </td><td><input type="text" name="course_id" size="8" required></td></tr>
  <tr><td>Image File: </td><td><input type="file" name="my_image_file"></td></tr>
	<tr><td>Course Name: </td><td><input type="text" size="50" name="course_name" required></td></tr>
	<tr><td>Start Date: </td><td><input type="date" name="sdate" size="12" required></td></tr>
	<tr><td>Finish Date: </td><td><input type="date" name="edate" size="12" required></td></tr>
	<tr><td>Duration: </td><td><input type="text" name="duration" size="12" placeholder="Duration in Hours" required></td></tr>
	<input type="hidden" name="fee" size="12" value="0" required>
		<tr><td><input type="submit" value="submit Course"></td><td></td></tr>
	</table>
	</form>
</div>
</body>
</html>
