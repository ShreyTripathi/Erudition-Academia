<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
		String topic="";
		String det = request.getParameter("det").toLowerCase();
		String ch1 = request.getParameter("choice1").toLowerCase();
		String ch2 = request.getParameter("choice2").toLowerCase();
		String ch3 = request.getParameter("choice3").toLowerCase();
		String ch4 = request.getParameter("choice4").toLowerCase();
		String ans = request.getParameter("correct_answer");
		String diff_level = request.getParameter("diff_level");
		String submit_type = request.getParameter("quiz_stat").toLowerCase();
    String last_date = request.getParameter("last_date");
    String courseId = request.getParameter("courseId");
    int flag=0;

    if(!submit_type.equals("enter question"))
		{
				session.removeAttribute("topic_name");
        session.removeAttribute("courseid");
        session.removeAttribute("last_date");
				response.sendRedirect("fac_dash.jsp");
		}

		else if(session.getAttribute("topic_name")==null)
				{topic = request.getParameter("topic").toLowerCase();
          flag=1;
      }
			else
				{topic = session.getAttribute("topic_name").toString();
          last_date = session.getAttribute("last_date").toString();
          courseId = session.getAttribute("courseid").toString();
      }
		Connection con = null;
		Statement st1 = null,st2=null,st3 = null;
		ResultSet rs = null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st1 = con.createStatement();
      st2 = con.createStatement();
      st3 = con.createStatement();
      if(flag==1)
      {
        int j= st1.executeUpdate("insert into topic(courseid,topicname,lastdate) values('"+courseId+"','"+topic+"','"+last_date+"')");
      }
      rs = st3.executeQuery("select topicid from topic where courseid='"+courseId+"' and topicname='"+topic+"' and lastdate='"+last_date+"'");
      if(rs.next())
      {
        int topic_id = rs.getInt("topicid");
			  int i = st2.executeUpdate("insert into question(topicid,quesdet,choice1,choice2,choice3,choice4,correct_ans,diff_level) values("+topic_id+",'"+det+"','"+ch1+"','"+ch2+"','"+ch3+"','"+ch4+"','"+ans+"','"+diff_level+"')");
				session.setAttribute("topic_name",topic);
        session.setAttribute("courseid",courseId);
        session.setAttribute("last_date",last_date);
				request.getRequestDispatcher("enter_question.jsp").forward(request,response);
      }
		}catch(Exception e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			try{
        st1.close();
        st2.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</body>
</html>
