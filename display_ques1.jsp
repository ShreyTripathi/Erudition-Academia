<%@ page import="java.sql.*, quesPackage.QuestionBean, java.util.ArrayList"%>
<%if(session.getAttribute("uId")==null)response.sendRedirect("login.jsp");%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quiz</title>
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
      margin-right: 1.9em;
      border-radius: 0.3em;
      border-radius: 0.3em;
      border: 1px solid;
      box-shadow: 3px 4px #666666;
    }
    .vertical-menu a {
      background-color: #ddf;
      color: black;
      display: block;
      padding: 12px;
      text-decoration: none;
      border-radius: 0.5em;
      margin-bottom: 0.7em;
      box-shadow: 5px 4px #666666;
    }

    .vertical-menu a:hover {
      background-color: #bfb;
      box-shadow: 3px 2px #666666;
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
      box-shadow: 6px 5px #888888;
    }
    body {
     background: url('table.jpg') no-repeat center center fixed;
     -webkit-background-size: cover;
     -moz-background-size: cover;
     -o-background-size: cover;
     background-size: cover;
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
  });
  </script>
</head>
<body>
  <%!String courseId;%>
<!--create connection and calling ResultSet for later use-->
<%
String uId="";
Connection con = null;
Statement videoSt=null;
//,st3=null,st4=null;
if(session.getAttribute("uId")!=null)
{
  uId=session.getAttribute("uId").toString();
}
else
{
  response.sendRedirect("login.jsp");
}
//rs for course info,pdfRs for pdf and rs2 for video
ResultSet videoRs=null;
//,rs2=null,rs3=null,rs4=null;

String dbName = "modif_eru_acad";
String user= "root";
String pass= "root";
int topicId = Integer.parseInt(request.getParameter("topicId"));

courseId = request.getParameter("courseId");
try{
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
  videoSt = con.createStatement();

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
  <jsp:include page="navbar_public.jsp" />
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

<div class="container-fluid ">
  <div class="row content">
  <div class="vertical-menu text-center col-sm-3">
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
    <div class="col-sm-8 main_text">
    <h1>Quiz</h1>
    <hr>
      <%
	       QuestionBean quesBean = (QuestionBean)session.getAttribute("QuesBean");
      %>
				<form action="/next" method="post" id="topicForm">
        <table>
        <tr><td>Difficulty: <%=quesBean.getDiff()%></td></tr>
        <tr><td style="whitespace:pre-wrap;"><h2>Question</h2><%=quesBean.getQuesDet()%></td></tr>
        <tr><td><input type="hidden" name="courseId" value="<%=courseId%>"></td></tr>
        <tr><td><input type="hidden" name="topicId" value="<%=topicId%>"></td></tr>
        <tr><td><input type="hidden" name="diff_level" value="<%=quesBean.getDiff()%>">
        <tr><td><input type="hidden" name="quesId" value="<%=quesBean.getQuesId()%>"></td></tr>
        <tr><td><input type="radio" name="userCh" value="<%=quesBean.getCh1()%>"><%=quesBean.getCh1()%></td></tr>
        <tr><td><input type="radio" name="userCh" value="<%=quesBean.getCh2()%>"><%=quesBean.getCh2()%></td></tr>
        <tr><td><input type="radio" name="userCh" value="<%=quesBean.getCh3()%>"><%=quesBean.getCh3()%></td></tr>
        <tr><td><input type="radio" name="userCh" value="<%=quesBean.getCh4()%>"><%=quesBean.getCh4()%></td></tr>
        <tr><td><input type="hidden" name="correct_ans" value="<%=quesBean.getAns()%>"</td></tr>
        <tr><td><input type="submit" value="Are You Sure"></td></tr>
				</table>
				</form>
      <hr>
    <%
  }//end of try block
      catch(SQLException e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			try{
				videoSt.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
    /*if(session.getAttribute("cor_count")!=null)
    out.println(session.getAttribute("cor_count").toString());
    if(session.getAttribute("highL")!=null)
    out.println((ArrayList<Integer>)session.getAttribute("highL"));
    if(session.getAttribute("medL")!=null)
    out.println((ArrayList<Integer>)session.getAttribute("medL"));
    if(session.getAttribute("lowL")!=null)
    out.println((ArrayList<Integer>)session.getAttribute("lowL"));
    */
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
