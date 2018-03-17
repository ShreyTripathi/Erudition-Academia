<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	jQuery.each($(".thumbnail"),function()
	{
		$(this).on("click",function()
		{
			$("#courseId").val($(this).find(".cId").html());
			$("#form1").submit();
		});
	});
});
</script>
<title>Course List</title>
</head>
<body>
<div class="container">
<jsp:include page="navbar_public.jsp" />
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
			rs = st.executeQuery("select course.*,ffname,flname from course,faculty where faculty.fuserid=course.fuserid");
			session.removeAttribute("courseid");

			if(rs.next())
			{
				%>
					    <div class="col-md-4">
					      <div class="thumbnail">					     					         
						<img src="ea.jpeg" alt="Erudition Academia" style="width:100%">
					          <div class="caption">
						    <p style="text-align:right;" class="cId"><%=rs.getString("courseid")%></p>
					            <p><%=rs.getString("coursename")%></p>
					            <p><%=rs.getString("ffname")%> <%=rs.getString("flname")%></p>
					          </div>					     
					      </div>
					    </div>
				<%
				while(rs.next())
				{
					%>
						    <div class="col-md-4">
						      <div class="thumbnail">				
						        <img src="ea.jpeg" alt="Erudition Academia" style="width:100%">
						          <div class="caption">
							    <p style="text-align:right;" class="cId"><%=rs.getString("courseid")%></p>
						            <p><%=rs.getString("coursename")%></p>
						            <p><%=rs.getString("ffname")%> <%=rs.getString("flname")%></p>
						          </div>					     
						      </div>
						    </div>
					<%
				
				}//end of while
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
			<form action="course_det_view.jsp" method="get" id="form1">
			<input type="hidden" name="courseId" id="courseId">
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
