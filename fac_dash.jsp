<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
<script>
$(document).ready(function(){
	$("option").change(function(){
		if($(this).val()=="stud_det"||$(this).val()=="faculty_det")
		{
			$("#enterid").show();
		}
		else{
			$("#enterid").hide();
		}	
		});
	});
	/*jQuery.each($(".selected"),function(){
		$(this).on("click",function(){
			$("#c_name").val($(this).html());
			$("form1").submit();
		});
	});*/
});
</script>
</script>
</head>
<body>
<div class="container">
	<jsp:include page="navbar_public.jsp" />
<%
		if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
		{
			response.sendRedirect("login.jsp");
		}
		else if(session.getAttribute("type").toString().equals("student"))
		{
			request.getRequestDispatcher("stud_dash.jsp").forward(request,response);
		}
%>
		<h1>Faculty Dashboard</h1>
<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		Statement st1 = null;
		Statement st2 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;

		try{	
			
			String uType = session.getAttribute("type").toString();
			String uId = session.getAttribute("uId").toString();

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			st1 = con.createStatement();
			st2 = con.createStatement();

			rs= st.executeQuery("Select ffname,flname,dob,gender,graduate,street,city,state,country from "+uType+" where fuserid='"+uId+"'");
			rs1= st1.executeQuery("select * from admin where auserid='"+uId+"'");
			rs2= st2.executeQuery("select coursename,courseid from course where fuserid='"+uId+"'");

			if(rs.next())
			{%>
				<table>
				<tr><td>User Name:</td><td><%=rs.getString("ffname")%> <%=rs.getString("flname")%></td></tr>
				<tr><td>D.O.B. :</td><td><%=rs.getString("dob")%></td></tr>
				<tr><td>Gender :</td><td><%=rs.getString("gender")%></td></tr>
				<tr><td>Graduate :</td><td><%=rs.getString("graduate")%></td></tr>
				<tr><td>Address :</td><td><%=rs.getString("street")%></td></tr>
				<tr><td></td><td><%=rs.getString("city")%> <%=rs.getString("state")%></td></tr>
				<tr><td></td><td><%=rs.getString("country")%></td></tr>

				<tr><td></td><td></td></tr>				
				<tr><td><a href="enter_question.jsp">Create Quiz</a></td></tr>
				<tr><td><a href="add_course.jsp">Add a New Course</a></td></tr>
				</table>
				<hr>
				<%if(rs2.next()){%>
					<h2>Added Courses List</h2>
					<form action="add_course_det.jsp" method="get" id="form1">
					<table>
					<%
					do
					{%>
						<tr><td class="selected"><%=rs2.getString("coursename")%></td></tr>
					<%}while(rs2.next());
				}
				%>
				<input type="hidden" id="c_name" name="c_name">
				</table>
				</form>
<%				if(rs1.next())
				{%>	
					<hr>
					<h2>View Options:</h2>
					<hr>
					<form action="admin_view.jsp" method="get"> 
					<select name="view_choice">
						<option value="stud_det">view particular student details</option>
						<option value="faculty_det">view particular faculty details</option>
						<option value="faculties">view all faculty details</option>
						<option value="students">view all students details</option>
					</select>
					<input type="text" name="id" placeholder="EnterID of faculty or student" id="enterid">
					<input type="submit" value="see details">
					</form>
				<%}
			}
			
		}catch(Exception e){
		%>		<table>
				<tr><td><div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div></td></tr>
		<%
			out.println(e);
		}
		finally{
			try{
				session.removeAttribute("courseid");
				st.close();
				st1.close();
				st2.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</table>
</div>
</body>
</html>

