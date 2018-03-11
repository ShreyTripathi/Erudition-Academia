<%@page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<%

if(session.getAttribute("uId")==null)
{
	request.getRequestDispatcher("login.jsp").forward(request,response);	
}
if(!session.getAttribute("type").toString().equals("faculty"))
{
	request.getRequestDispatcher("stud_dash.jsp").forward(request,response);	
}
%>
<jsp:include page="navbar_public.jsp" />
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";
	String c_id = session.getAttribute("courseid").toString();
	String c_name="",sdate="",edate="",duration="",fee="";
	String fuserid = session.getAttribute("uId").toString();

	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();
		rs= st.executeQuery("select coursename,sdate,edate,duration,fee from course where courseid='"+c_id+"'");
		if(rs.next())
		{
			c_name=rs.getString("coursename");
			sdate = rs.getString("sdate");
			edate = rs.getString("edate");
			duration = rs.getString("duration");
			fee = rs.getString("fee");
		}
	}
	catch(Exception e){
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
	<h2><%=c_name%></h2>
	<hr>
	<form action="course_det_logic.jsp" method="post">
	<p>Add Some info:</p>
	<input type="text" name="det" />
	    <div class="panel panel-default">
	    	<div class="panel-heading">
	      	<h4 class="panel-title">      
	      	  Unit 1
	     	 </h4>
	    	</div>
	    	<div class="panel-body">Enter some info about unit1:<input type="text" name="unit1-info">
		</div>
	    </div>
	    <div class="panel panel-default">
	    	<div class="panel-heading">
	      	<h4 class="panel-title">      
	      	  Unit 2
	     	 </h4>
	    	</div>
	    	<div class="panel-body">Enter some info about unit2:<input type="text" name="unit2-info">
		</div>
	    </div>
	    <div class="panel panel-default">
	    	<div class="panel-heading">
	      	<h4 class="panel-title">      
	      	  Unit 3
	     	 </h4>
	    	</div>
	    	<div class="panel-body">Enter some info about unit3:<input type="text" name="unit3-info">
		</div>
	    </div>
	    <div class="panel panel-default">
	    	<div class="panel-heading">
	      	<h4 class="panel-title">      
	      	  Unit 4
	     	 </h4>
	    	</div>
	    	<div class="panel-body">Enter some info about unit 4:<input type="text" name="unit4-info">
		</div>
	    </div>
	    <table class="table table-bordered">
	    <tbody>
		<tr><td>How to Pass:</td>
		<td><input type="text" name="pass_cri"></td>
		</tr>
		<tr>
		<td>
		Language
		</td>
		<td><input type="text" name="lang"></td>
		</tr>
		<tr>
		<td>Starting Date: </td>
		<td><%=sdate%></td>
		</tr>
		<tr>
		<td>Finish Date: </td>
		<td><%=edate%></td>
		</tr>
		<tr>
		<td>Fee</td>
		<td><%=fee%></td>
		</tr>
		<tr><td><input type="submit" value="submit"></td></tr>
	    </tbody>
	    </table>
	</form>
</div>
</body>
</html>
