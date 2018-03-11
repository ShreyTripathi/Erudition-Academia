<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
		jQuery.each($(".selected"),function()
		{
			$(this).on("click",function(){
				$("#course").val($(this).html());
				$("#form1").submit();		
			});
		});
});
</script>
</head>
<body>
<jsp:include page="navbar_public.jsp" />
<div class="container">
<h1>List of Courses Present</h1>
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
			rs = st.executeQuery("select coursename,ffname,flname from course,faculty where course.fuserid=faculty.fuserid");
			if(rs.next())
			{
			%>	<form action="discussion_page.jsp" method="get" id="form1">
				<table>
				<tr><th>Click on Course's Name to enter the Forum</th></tr>
			<%
				do
				{%>
					<tr><td class=".selected"><%=rs.getString("coursename")%></td><td>By <%=rs.getString("ffname")%> <%=rs.getString("flname")%></td></tr>
				<%}while(rs.next());
			%>
				<tr><td><input type="hidden" name="course" id="course"></td></tr>
				</table>
				
				</form>
			<%}
		
		}catch(Exception e){
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
