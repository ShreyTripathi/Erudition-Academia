<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>PDF Content in the Course</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }

    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px;padding-top: 1.5em;padding-left: 1.8em;}

    /* Set gray background color and 100% height
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }*/
    /*vertical-menu properties*/
    .vertical-menu {
      background-color: #ccc;
      width: 200px;
      font-size: 1.2em;
      padding: 1.2em;
    }
    .vertical-menu a {
      background-color: #eee;
      color: black;
      display: block;
      padding: 12px;
      text-decoration: none;
    }

    .vertical-menu a:hover {
      background-color: #ccc;
    }

    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
    .main_text{
      background-color: #eee;
      padding-left: 1.2em;
      font-size: 1.4em;
    }
  </style>
  <link rel="stylesheet" href="nav_css.css">
  <script>
  $(document).ready(function(){
  		jQuery.each($(".videoSelect"),function()
  		{
  			$(this).on("click",function(){
  				$("#videoFile").val($(this).parent().children(':first-child').html());
          $("#videoTitle").val($(this).html());
  				$("#videoForm").submit();
  			});
  		});
      jQuery.each($(".pdfSelect"),function()
  		{
  			$(this).on("click",function(){
  				$("#pdfFile").val($(this).parent().children(':first-child').html());
  				$("#pdfForm").submit();
  			});
  		});
  });
  </script>
</head>
<body>
  <%!String courseId;%>
<!--create connection and calling ResultSet for later use-->
<%!
Connection con = null;
Statement pdfSt = null,videoSt=null;
//,st3=null,st4=null;

//rs for course info,pdfRs for pdf and rs2 for video
ResultSet pdfRs=null,videoRs=null;
//,rs2=null,rs3=null,rs4=null;

String dbName = "modif_eru_acad";
String user= "root";
String pass= "root";
%>
<%
courseId = request.getParameter("courseId");
try{
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);

  pdfSt = con.createStatement();
  videoSt = con.createStatement();

  pdfRs = pdfSt.executeQuery("select filename,filetitle,unitname from content where courseid='"+courseId+"' and filetype='pdf' order by unitname");
  videoRs = videoSt.executeQuery("select * from content where courseid='"+courseId+"' and filetype='video' order by unitname");
  int i=1,flag=0;
  %>
  <!--Commented Code-->

  <!--<nav class="navbar navbar-inverse">
    <div class="container-fluid">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Logo</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">

        <ul class="nav navbar-nav navbar-right">
          <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
      </div>
      </div>
    </div>
  </nav>-->

  <!--Code Begins-->

  <div class="container-fluid">
  <jsp:include page="navbar_public.jsp" />
  </div>

  <div class="container-fluid" style="font-size:1.4em">
  <nav class="navbar navbar-default">
    <div class="container">
    <ul class="nav navbar-nav navbar-right">
          <li><a href="course_det_view1.jsp?courseId=<%=courseId%>">Course</a></li>
          <li><a href="see_announcements.jsp?courseId=<%=courseId%>">Announcement</a></li>
          <li><a href="download_pdf.jsp?courseId=<%=courseId%>">Download Content</a></li>
          <li><a href="quiz_list.jsp?courseId=<%=courseId%>">Quiz</a></li>
     </ul>
    </div>
  </nav>
  </div>

<div class="container-fluid text-center">
  <div class="row content">
  <div class="vertical-menu col-sm-3">
  <h3>Video Tab</h3>
  <hr>
  <%if(videoRs.next()){%>
  <table>
    <%do{%>
    <tr><td hidden><%=videoRs.getString("filename")%></td><td class="videoSelect"><a href="#"><%=videoRs.getString("filetitle")%></a></td></tr>
    <%}while(videoRs.next());
    %>
  </table>
  <%}
    else{out.println("<div class='alert-info'>No Videos yet in this course</div>");}
    %>
  <form id="videoForm" action="playvideo.jsp" method="post">
  <input type="hidden" name="videoFile" id="videoFile">
  <input type="hidden" name="courseId" value="<%=courseId%>">
  <input type="hidden" name="videoTitle" id="videoTitle">
  </form>
  </div>

  <!--Center div starts here-->
    <div class="col-sm-8 text-center main_text">
    <h1>Content List</h1>
    <hr>
      <%
	if(pdfRs.next())
	{%>
          <table class="table table-bordered" style="font-size:1.4em">
          <thead>
          <tr><th>File Name</th><th>Unit Name</th></tr>
          </thead>
         <tbody>
         <%do{%>
					<tr><td hidden><%=pdfRs.getString("filename")%></td><td class="pdfSelect"><%=pdfRs.getString("filetitle")%></td><td><%=pdfRs.getString("unitname")%></td></tr>
          <%}while(pdfRs.next());
  }
  else{out.println("<div class='alert-info'>No Content yet in this course</div>");}
          %>
          </tbody>
					</table>
				<form action="/content.pdf" method="post" id="pdfForm">
				<input type="hidden" name="fileName" id="pdfFile">
				</form>
      <hr>
    <%
  }//end of try block
      catch(Exception e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			try{
				pdfSt.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
    <!-- <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div> -->
  </div>
</div>

<!-- <footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer> -->

</body>
</html>
