<%@ page import="java.sql.*, quesPackage.QuestionBean, java.util.*"%>
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
      padding-top: 20px;S
      background-color: #f1f1f1;
      height: 100%;
    }*/
    /*vertical-menu properties*/
    .vertical-menu {
      background-color: #ccc;
      width: 200px;
      font-size: 1.2em;
      margin-right: 1.9em;
      padding: 1.2em;
      border: 1px solid;
      box-shadow: 3px 4px #666666;
      border-radius: 0.2em;
    }
    .vertical-menu a {
      background-color: #ddf;
      color: black;
      display: block;
      padding: 12px;
      text-decoration: none;
      border-radius: 0.5em;
      box-shadow: 3px 3px #666666;
    }

    .vertical-menu a:hover {
      background-color: #bfb;
      box-shadow: 0px 0px #333333;
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
  <link rel="stylesheet" href="video_css.css">
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
      jQuery.each($(".topicSelect"),function()
  		{
  			$(this).on("click",function(){
  				$("#topicId").val($(this).parent().children(':first-child').html());
  				$("#topicForm").submit();
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
Statement videoSt=null;
//,st3=null,st4=null;

//rs for course info,pdfRs for pdf and rs2 for video
ResultSet videoRs=null;
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

  videoSt = con.createStatement();

  videoRs = videoSt.executeQuery("select * from content where courseid='"+courseId+"' and filetype='video' order by unitname");
  int i=1,flag=0;
  %>

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

<div class="container-fluid">
  <div class="row content">
  <div class="vertical-menu text-center col-sm-3">
  <h3>Video Tab</h3>
  <hr>
  <%if(videoRs.next()){%>
  <table>
    <%do{%>
    <tr><td hidden><%=videoRs.getString("filename")%></td><td class="videoSelect videoTR"><a href="#"><%=videoRs.getString("filetitle")%></a></td></tr>
    <%}while(videoRs.next());
    %>
  </table>
  <%}//end of if
    else{out.println("<div class='alert-info'>No Videos yet in this course</div>");}//end of else
  }//end of try block
      catch(SQLException e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}//end of catch
		finally{
			try{
				videoSt.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}//end of finally
    %>
  <form id="videoForm" action="playvideo.jsp" method="post">
  <input type="hidden" name="videoFile" id="videoFile">
  <input type="hidden" name="courseId" value="<%=courseId%>">
  <input type="hidden" name="videoTitle" id="videoTitle">
  </form>
  </div>

  <!--Center div starts here-->
    <div class="col-sm-8 main_text">
    <h1>Solution</h1>
    <hr>
    <%!
      QuestionBean quesBean;
      ArrayList<QuestionBean> quesList1,quesList2,quesList3;
    %>
      <%
	       //out.println("<h2>Score: "+session.getAttribute("user_score").toString()+"</h2>");
          quesList3 = (ArrayList<QuestionBean>)session.getAttribute("quesList3");
          quesList2 = (ArrayList<QuestionBean>)session.getAttribute("quesList2");
          quesList1 = (ArrayList<QuestionBean>)session.getAttribute("quesList1");

         for(int k=0;k<quesList3.size();k++)
         {%><h3><b>Difficulty: High</b></h3>
           <h4><u><i><b>Question</b></i></u>:</h4>
           <%quesBean = quesList3.get(k);
           %><p><%=quesBean.getQuesDet()%></p>
           <h4><u><i><b>Correct Answer:</b></i></u></h4>
           <p style="color:green"><%
                    if(quesBean.getAns().equals("choice1")){out.println(quesBean.getCh1());}
                    else if(quesBean.getAns().equals("choice2")){out.println(quesBean.getCh2());}
                    else if(quesBean.getAns().equals("choice3")){out.println(quesBean.getCh3());}
                    else{out.println(quesBean.getCh4());}
          %>
          </p>
          <%
          if(quesBean.getIsCorrect()==0){%>
            <h4><u><i><b>Your Choice</b></i></u>: </h4>
             <p style="color:red">
              <%
              if(quesBean.getStudentChoice().equals("choice1")){out.println(quesBean.getCh1());}
                                     else if(quesBean.getStudentChoice().equals("choice2")){out.println(quesBean.getCh2());}
                                     else if(quesBean.getStudentChoice().equals("choice3")){out.println(quesBean.getCh3());}
                                     else{out.println(quesBean.getCh4());}
                    %></p>
           <%}//end of if

         }//end of for

         for(int k=0;k<quesList2.size();k++)
         {%><h3><b>Difficulty: Medium</b></h3>
           <h4><u><i><b>Question</b></i></u>:</h4>
           <%quesBean = quesList2.get(k);
           %><p><%=quesBean.getQuesDet()%></p>
            <h4><u><i><b>Correct Answer</b></i></u>:</h4>
             <p style="color:green"><%if(quesBean.getAns().equals("choice1")){out.println(quesBean.getCh1());}
                                    else if(quesBean.getAns().equals("choice2")){out.println(quesBean.getCh2());}
                                    else if(quesBean.getAns().equals("choice3")){out.println(quesBean.getCh3());}
                                    else{out.println(quesBean.getCh4());}
            %></p>
            <%
           if(quesBean.getIsCorrect()==0){%>
              <h4><u><i><b>Your Choice</b></i></u>: </h4>
              <p style="color:red"><%if(quesBean.getStudentChoice().equals("choice1")){out.println(quesBean.getCh1());}
                                     else if(quesBean.getStudentChoice().equals("choice2")){out.println(quesBean.getCh2());}
                                     else if(quesBean.getStudentChoice().equals("choice3")){out.println(quesBean.getCh3());}
                                     else{out.println(quesBean.getCh4());}
              %></p>
           <%}//end of if
         }//end of for
         for(int k=0;k<quesList1.size();k++)
         {%><h3><b>Difficulty: Low</b></h3>
           <h4><u><i><b>Question</b></i></u>:</h4>
           <%quesBean = quesList1.get(k);
           %><p><%=quesBean.getQuesDet()%></p>
           <h4><u><i><b>Correct Answer</b></i></u>:</h4>

            <p style="color:green"><%if(quesBean.getAns().equals("choice1")){out.println(quesBean.getCh1());}
                                   else if(quesBean.getAns().equals("choice2")){out.println(quesBean.getCh2());}
                                   else if(quesBean.getAns().equals("choice3")){out.println(quesBean.getCh3());}
                                   else{out.println(quesBean.getCh4());}
            %></p>
            <%
          if(quesBean.getIsCorrect()==0){%>
             <h4><u><i><b>Your Choice</b></i></u>: </h4>
             <p style="color:red"><%if(quesBean.getStudentChoice().equals("choice1")){out.println(quesBean.getCh1());}
                                    else if(quesBean.getStudentChoice().equals("choice2")){out.println(quesBean.getCh2());}
                                    else if(quesBean.getStudentChoice().equals("choice3")){out.println(quesBean.getCh3());}
                                    else{out.println(quesBean.getCh4());}
               %></p>
          <%}//end of if
         }//end of for
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
