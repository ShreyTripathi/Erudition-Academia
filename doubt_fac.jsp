<%@ page import="java.sql.ResultSet, java.sql.Connection, java.sql.Statement,java.sql.DriverManager, java.util.Date,java.text.SimpleDateFormat"%>
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
.main_text{
  font-size: 1.4em;
}
body {
 background: url('table.jpg') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}
</style>
<script>
$(document).ready(function(){
  jQuery.each($('.my_button'),function(){
    $(this).on('click',function(){
      $('#submit_answer').val($(this).parent().find(".my_answer").html());
      $('#doubtid').val($(this).parent().find(".doubtId").html());
      $('#answer_form').submit();
    });
  });
});
</script>
<link rel="stylesheet" href="nav_css.css">
</head>
<body>
<jsp:include page="navbar_public.jsp" />
<div class="container main_text text-center">
<%
  String courseId="";
   courseId= request.getParameter("courseId");

	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
	String uId = session.getAttribute("uId").toString();
	String uType= session.getAttribute("type").toString();

		Connection con = null;
		Statement st = null,checkCourseSt=null,st1=null;
		ResultSet rs = null,checkCourseRs=null,rs1=null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
      st1 = con.createStatement();
      checkCourseSt = con.createStatement();
      checkCourseRs = checkCourseSt.executeQuery("select coursename from course where courseid='"+courseId+"'");
			rs = st.executeQuery("select * from doubt where courseid = '"+courseId+"'and not doubtanswer='null' order by dated desc");
      rs1 = st1.executeQuery("select * from doubt where courseid = '"+courseId+"'and doubtanswer='null' order by dated desc");
      if(!checkCourseRs.next()){out.println("<div class='alert alert-danger'>Wrong Course Id Passed. Make Sure Course Id is correct.</div>");}
      else{
        String courseName = checkCourseRs.getString("coursename");
      if(rs.next())
      { int i=1;
        %>

        <h1>Doubts Table</h1>
        <p style="font-size:1.2em">CourseId: <%=courseId%></p>
        <table class="table table-bordered">
        <thead><tr><th>Doubt No.</th><th>Topic</th><th>Content</th><th>Date</th><th>Answer</th></tr></thead>
        <tbody>
      <%
        do{ String answer = rs.getString("doubtanswer");
          %>
            <tr><td><%=i%></td><td><%=rs.getString("doubtheading")%></td><td><%=rs.getString("content")%></td><td><%=rs.getString("dated")%></td><td><%=answer%></td></tr>
        <%i++;
      }while(rs.next());
        %>
        </tbody>
        </table>
      <%}//end of if
      if(rs1.next())
      { int i=1;
        %>

        <h1>Doubts Table</h1>
        <p style="font-size:1.2em">CourseId: <%=courseId%></p>
        <form id="answer_form" action="answer_doubt.jsp" method="post">
        <input type="hidden" name="answer" id="submit_answer">
        <table class="table table-bordered">
        <thead><tr><th>Doubt No.</th><th>Topic</th><th>Content</th><th>Date</th><th>Answer</th></tr></thead>
        <tbody>
      <%
        do{
            int doubtid  = rs1.getInt("doubtid");
          %>
            <tr><input type="hidden" name="doubtId" id="<%=doubtid%>" value="<%=doubtid%>"></td></tr><tr><td><%=i%></td><td><%=rs1.getString("doubtheading")%></td><td><%=rs1.getString("content")%></td><td><%=rs1.getString("dated")%></td><td><textarea class="my_answer" cols="55" rows="3" required="required"></textarea></td><td><input type="submit" value="submit"></td></tr>
        <%i++;
      }while(rs1.next());
        %>
        </tbody>
        </table>
        </form>
      <%}//end of if
      else{%>
          <div class="alert alert-info">No Doubts are needed to be answered for this course.</div>
      <%}
		}//end of outer else
  }catch(Exception e){
		%>
			<div class="alert alert-danger">Doubt is needed to be related to a particular <strong>Course. </strong></div>
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
		}//end of finally

    %>
<br>

<div><a href="fac_dash.jsp">Go Back</a></div>
</div>
</body>
</html>
