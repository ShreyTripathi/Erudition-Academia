<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

		String courseId = request.getParameter("courseId");
		
		try{	
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			rs = st.executeQuery("select course_det.*,coursename,sdate,edate,fee from course_det,course where course_det.courseid='"+courseId+"' and course.courseid='"+courseId+"'");
			int i=1,flag=0;
			if(rs.next())
			{%>
				<h2><%=rs.getString("coursename")%></h2>
				<hr>
				<p><%=rs.getString("courseinfo")%>
				</p>
				<div class="panel-group" id="accordion">
				<%
				while(flag!=1&&i<=4)
				{
					String unitinfo=rs.getString("unit"+i+"info");
					if(unitinfo==null||unitinfo.equals("")||unitinfo.equals("null")||rs.wasNull())
					{flag=1;i=100;break;}
				%>
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <h4 class="panel-title">
						Unit <%=i%>
					      </h4>
					    </div>
    					    <div class="panel-body"><%=unitinfo%></div>
					  </div>
				<%
					i++;
				}%>
				</div>

			    <table class="table table-bordered">
			    <tbody>
				<tr><td>How to Pass:</td>
				<td><%=rs.getString("passcri")%></td>
				</tr>
				<tr>
				<td>
				Language
				</td>
				<td><%=rs.getString("lang")%></td>
				</tr>
				<tr>
				<td>Starting Date: </td>
				<td><%=rs.getString("sdate")%></td>
				</tr>
				<tr>
				<td>Finish Date: </td>
				<td><%=rs.getString("edate")%></td>
				</tr>
				<tr>
				<td>Fee</td>
				<td><%=rs.getString("fee")%></td>
				</tr>
			    </tbody>
			    </table>
			<%
			}
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
