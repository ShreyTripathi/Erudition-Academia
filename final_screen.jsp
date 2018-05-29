<%@ page import="java.sql.*, quesPackage.QuestionBean, java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quiz</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="jquery-3.3.1.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
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
  });
  </script>
</head>
<body>
  <%!String courseId,topicId;%>
<!--create connection and calling ResultSet for later use-->
<%!
Connection con = null;
Statement videoSt=null,st1=null,statement1=null;
//,st3=null,st4=null;

//rs for course info,pdfRs for pdf and rs2 for video
ResultSet videoRs=null,rs1 = null;
//,rs2=null,rs3=null,rs4=null;

String dbName = "modif_eru_acad";
String user= "root";
String pass= "root";
String uId = "";
%>
<%
courseId = request.getParameter("courseId");
topicId = request.getParameter("topicId");
if(session.getAttribute("uId")==null)
  response.sendRedirect("login.jsp");
else
uId = session.getAttribute("uId").toString();
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
      // ArrayList<QuestionBean> quesList1,quesList2,quesList3;
    %>
      <%
      Gson gsonObj = new Gson();
      Map<Object,Object> map = null;
      List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
      String dataPoints = null;
      try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
        st1 = con.createStatement();
        String xVal, yVal;
        String correctAns="",diff_level="";
        int i=1,score=0;
        rs1 = st1.executeQuery("select question.*,user_question.* from question,user_question where question.quesid=user_question.quesid and user_question.userid='"+uId+"' and question.topicid="+topicId+"");
	       //out.println("<h2>Score: "+session.getAttribute("user_score").toString()+"</h2>");
          //quesList3 = (ArrayList<QuestionBean>)session.getAttribute("quesList3");
          //quesList2 = (ArrayList<QuestionBean>)session.getAttribute("quesList2");
          //quesList1 = (ArrayList<QuestionBean>)session.getAttribute("quesList1");
          if(rs1.next())
          {
            do{
                  diff_level = rs1.getString("diff_level");
                  xVal=Integer.toString(i);
                  if(rs1.getInt("correct")==1)
                  {
                    if(diff_level.equals("high"))
                    {
                      yVal= Integer.toString(5);
                      score+=5;
                    }
                    else if(diff_level.equals("medium"))
                    {
                      yVal= Integer.toString(3);
                      score+=3;
                    }
                    else
                    {
                      yVal= Integer.toString(2);
                      score+=2;
                    }
                  }
                  else
                  {
                    yVal = Integer.toString(0);
                  }
                  map = new HashMap<Object,Object>(); map.put("x", Integer.parseInt(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
                  dataPoints = gsonObj.toJson(list);
                  i++;
              %>
            <p><strong style="font-size:1.2em"><i>Question </i><%=i-1%></strong>:</p>
            <p><strong><i>Difficulty</i></strong>: <i> <%=diff_level%></i></p>
            <p><%=rs1.getString("quesdet")%></p>
            <p><b>Your Choice</b>:<span style="color:blue"><i><%=rs1.getString("user_choice")%></i></span></p>
            <p><b>Correct Answer</b>:<span style="color:green"><i><%correctAns=rs1.getString("correct_ans"); out.println(rs1.getString(correctAns));%></i></span></p>
            <br>
            <%}while(rs1.next());
            %>
            <h1 style="color:Green;background-color:#51F051"><b><i><u>Score</u>:</i></b> <%=score%></h1>
            <br>
            <%
          }
          else{
            response.sendRedirect("stud_dash.jsp");
          }
         //session.removeAttribute("QuesNo");
         session.removeAttribute("QuesBean");
         // session.removeAttribute("quesList1");
         // session.removeAttribute("quesList2");
         // session.removeAttribute("quesList3");
       }
       catch(Exception e){

 			out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
      dataPoints=null;
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

    //start of code for graphs

    // try
    // {
    //   Class.forName("com.mysql.jdbc.Driver");
    //   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
    //   statement1 = con.createStatement();
    //   String xVal, yVal;
    //   String correctAns="";
    //   rs1 = statement1.executeQuery("select question.*,user_question.* from question,user_question where question.quesid=user_question.quesid and user_question.userid='"+uId+"' and question.topicid="+topicId+"");
    //   int i=1;
    //   while(rs1.next())
    //   {
    //     xVal=Integer.toString(i);
    //     if(rs1.getInt("correct")==1)
    //     {
    //       if(diff_level").equals("high"))
    //       yVal= Integer.toString(5);
    //     else if(diff_level").equals("medium"))
    //       yVal= Integer.toString(3);
    //     else
    //         yVal= Integer.toString(2);
    //     }
    //     else
    //     {
    //       yVal = Integer.toString(0);
    //     }
    //     map = new HashMap<Object,Object>(); map.put("x", Integer.parseInt(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
    //     dataPoints = gsonObj.toJson(list);
    //     i++;
    //   }
    // }
    // catch(Exception e){
	  //    out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
    //    dataPoints = null;
    // }//end of catch
 // finally{
 //   try{
 //     videoSt.close();
 //   }catch(Exception e){}
 //   try{
 //     con.close();
 //   }catch(Exception e){}
 // }//end of finally

  %>
  <!--Commented code-->
    <!-- <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div> -->

<!--The below Code is for displaying chart-->
<script type="text/javascript">
window.onload = function() {

<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
animationEnabled: true,
exportEnabled: true,
title: {
  text: "Quiz Performance Chart"
},
data: [{
  type: "area", //change type to bar, line, area, pie, etc
  dataPoints: <%out.print(dataPoints);%>
}]
});
chart.render();
<% } %>

}
</script>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<br><br><br>
</div>
</div>

<!-- <footer class="container-fluid text-center">
<p>Footer Text</p>
</footer> -->

</body>
</html>
