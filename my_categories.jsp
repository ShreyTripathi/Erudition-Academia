<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="jquery-3.3.1.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style>
.thumbnail {
  position: relative;
}
.thumbnail:hover{
  transform: scale(1.10);
}

.myimage {
  display: block;
  width: 100%;
  font-size: 1.8em;
  height: auto;
}

.caption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #008CBA;
}

.thumbnail:hover .caption {
  opacity: 1;
}

.mytext {
  color: white;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
  font-size: 1.2em;
}
body {
 background: url('courses.jpg') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}
</style>
<script>
$(document).ready(function(){
	jQuery.each($(".thumbnail"),function()
	{
		$(this).on("click",function()
		{
			$("#cat").val($(this).find(".cat").html());
			$("#form1").submit();
		});
	});
});
</script>
<link rel="stylesheet" href="nav_css.css">
<title>Category List</title>
</head>
<body>

<jsp:include page="navbar_public.jsp" />

<div class="container">

<%
		Connection con = null;
		Statement st = null;

		ResultSet rs = null;

		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		int i=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			rs = st.executeQuery("select distinct course.category from course");
			session.removeAttribute("courseid");

			if(rs.next())
			{%>
          <h1 style="color:#f1f1f1">List of Category of Courses:</h1>
          <hr>
        <%
				do
				{   String cat = rs.getString("category");
					%>
						    <a href="my_course_list.jsp?cat=<%=cat%>"><div class="col-md-4">
						      <div class="thumbnail">
						        <img class="myimage" src="courses_bg.jpeg" alt="Erudition Academia" style="width:100%;">
						          <div class="caption">
                      <div class="mytext">
							    <p class="cat"><%=cat%></p>
                        </div>
						          </div>
						      </div>
						    </div></a>
					<%

				}while(rs.next());//end of while
			}//end of if
			else{%>
				<div class="alert alert-warning">There are no courses uploaded yet.</div>
			<%
				if(session.getAttribute("uId")!=null)
				{
				%>
					<br><a href="stud_dash.jsp">Go Back</a>
				<%}
				else
				{%>
					<a href="login.jsp">Go Back</a>
				<%}

			}
			%>
			<form action="course_det_view1.jsp" method="get" id="form1">
			<input type="hidden" name="cat" id="cat">
			</form>
		<%
		}
		catch(Exception e)
		{
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			try{
				st.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</div>
</body>
</html>
