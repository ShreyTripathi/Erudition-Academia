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
	if(session.getAttribute("uId")==null)
	{%>
		<div class= "container"><div class="alert alert-danger">Sorry, you need to <a href="login.jsp">login</a> or <a href="register.jsp">register</a> first.</div>
		</div>
	<%
	}
	
	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";
				
	String topic_name = request.getParameter("topic");
	Connection con = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	String diff="",ans_st="";

	if(session.getAttribute("ans_st")!=null&&session.getAttribute("diff_level")!=null)
	{
		ans_st = session.getAttribute("ans_st").toString();
		diff = session.getAttribute("diff_level").toString();
	}

	try{	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);

		st1 = con.createStatement();
		st2 = con.createStatement();
		st3 = con.createStatement();

		rs1= st1.executeQuery("Select det,diff_level,choice1,choice2,choice3,choice4,id from question where topic_name='"+topic_name+"' and diff_level='low'");
		rs2= st2.executeQuery("Select det,diff_level,choice1,choice2,choice3,choice4,id from question where topic_name='"+topic_name+"' and diff_level='medium'");
		rs3= st3.executeQuery("Select det,diff_level,choice1,choice2,choice3,choice4,id from question where topic_name='"+topic_name+"' and diff_level='high'");
		 if(rs1!=null||rs2!=null||rs3!=null)
		{
			if((session.getAttribute("ans_st")==null)||(ans_st.equals("incorrect")&&diff.equals("high"))||(ans_st.equals("correct")&&diff.equals("low")))
			{
				if(rs2.next())
				{
				diff = rs2.getString("diff_level");
				%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs2.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"></td><td><%=rs2.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"></td><td><%=rs2.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"></td><td><%=rs2.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"></td><td><%=rs2.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs2.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else if(rs1.next())
				{
				diff = rs1.getString("diff_level");
				%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs1.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs1.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs1.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs1.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs1.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs1.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else if(rs3.next())
				{
				diff = rs3.getString("diff_level");
			%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs3.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs3.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs3.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs3.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs3.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs3.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else{
				session.removeAttribute("qId");
				session.removeAttribute("diff_level");
				session.removeAttribute("ans_st");
				session.setAttribute("topic_name",topic_name);
			%>
				<p>Thank you for Taking The Quiz.</p>
				<table>				
				<tr><td>Score: </td><td><%=session.getAttribute("score").toString()%></td></tr>
				<tr><td><a href="analysis.jsp">See Analysis of Quiz</a></td></tr>
				</table>	
				<%}
			}
			else if(ans_st.equals("correct")&&diff.equals("medium"))
			{
				if(rs3.next())
				{
				diff = rs3.getString("diff_level");
			%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs3.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs3.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs3.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs3.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs3.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs3.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else if(rs2.next())
				{
				diff = rs2.getString("diff_level");
				%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>		
				<td><%=rs2.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"></td><td><%=rs2.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"></td><td><%=rs2.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"></td><td><%=rs2.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"></td><td><%=rs2.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs2.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else if(rs1.next())
				{
				diff = rs1.getString("diff_level");
				%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs1.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs1.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs1.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs1.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs1.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs1.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else{
				session.removeAttribute("qId");
				session.removeAttribute("diff_level");
				session.removeAttribute("ans_st");
				session.setAttribute("topic_name",topic_name);
			%>
				<p>Thank you for Taking The Quiz.</p>
				<table>				
				<tr><td>Score: </td><td><%=session.getAttribute("score").toString()%></td></tr>
				<tr><td><a href="analysis.jsp">See Analysis of Quiz</a></td></tr>
				</table>	
				<%}					
			}
			else if(ans_st.equals("incorrect")&&diff.equals("medium"))
			{
				if(rs1.next())
				{
				diff = rs1.getString("diff_level");
				%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs1.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs1.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs1.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs1.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs1.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs1.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else if(rs2.next())
				{
				diff = rs2.getString("diff_level");
				%>		
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs2.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"></td><td><%=rs2.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"></td><td><%=rs2.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"></td><td><%=rs2.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"></td><td><%=rs2.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs2.getString("id"));
				session.setAttribute("diff_level",diff);
				}
				else if(rs3.next())
				{
				diff = rs3.getString("diff_level");
			%>
				<form action="quiz_logic.jsp" method="post">
				<table>
				<tr><td>Question : </td>
				<td><%=rs3.getString("det")%></td><td><%=diff%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice1"><%=rs3.getString("choice1")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice2"><%=rs3.getString("choice2")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice3"><%=rs3.getString("choice3")%></td></tr>
				<tr><td></td><td><input type="radio" name="answer" value="choice4"><%=rs3.getString("choice4")%></td></tr>
				<%
				session.setAttribute("qId",rs3.getString("id"));
				session.setAttribute("diff_level",diff);
				%>
				<tr><td><input type="submit" value="submit"></td></tr>
				</table>				
				</form>
				<%
				}
				else{
				session.removeAttribute("qId");
				session.removeAttribute("diff_level");
				session.removeAttribute("ans_st");
				session.setAttribute("topic_name",topic_name);
			%>
				<p>Thank you for Taking The Quiz.</p>
				<table>				
				<tr><td>Score: </td><td><%=session.getAttribute("score").toString()%></td></tr>
				<tr><td><a href="analysis.jsp">See Analysis of Quiz</a></td></tr>
				</table>	
				<%}
			}
	}
		else{
			session.removeAttribute("qId");
			session.removeAttribute("diff_level");
			session.removeAttribute("ans_st");
			session.setAttribute("topic_name",topic_name);
			%>
			<p>Thank you for Taking The Quiz.</p>
			<table>				
			<tr><td>Score: </td><td><%=session.getAttribute("score").toString()%></td></tr>
			<tr><td><a href="analysis.jsp">See Analysis of Quiz</a></td></tr>
			</table>	
		<%
		}	
	}catch(Exception e){

		e.printStackTrace();
	}
	finally{
		try{
			st1.close();
			st2.close();
			st3.close();
		}catch(Exception e){}
		try{
			con.close();
		}catch(Exception e){}
	}
%>
</div>
</body>
</html>
