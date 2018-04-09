<%@page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>File Upload</title>
  <link rel="stylesheet" href="nav_css.css">
</head>
<body>
<jsp:include page="navbar_faculty.jsp" />
<div class="container">

    <%
	if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("type").toString().equals("student"))
	{
		response.sendRedirect("stud_dash.jsp");
	}

//in order to add files to courses later
  if(request.getParameter("courseId")!=null)
  {
    String c_id = request.getParameter("courseId");
    session.setAttribute("courseid",c_id);
  }

	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try{

		String uType = session.getAttribute("type").toString();
		String uId = session.getAttribute("uId").toString();
		String c_id= session.getAttribute("courseid").toString();

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();

		rs= st.executeQuery("Select coursename from course where courseid='"+c_id+"'");

		if(session.getAttribute("fPath")!=null)
		{
			session.removeAttribute("fPath");
			session.removeAttribute("unit");
			session.removeAttribute("fName");
      session.removeAttribute("fTitle");
      session.removeAttribute("fType");
		}

		if(rs.next())
		{
     %>
	<h1><p>SELECT FILES FOR THE UNITS BEING TAUGHT IN THE COURSE:</p><p> <%=rs.getString("coursename")%></p></h1>
  <hr>
        <form action="/fileuploadexample" method="post" enctype="multipart/form-data">
            <table class="table">
            <tr><td><label for="unitName">Select Unit: </label></td></tr>
            <tr><td><select name="unitName"/>
                    <option value="unit1">Unit 1</option>
                    <option value="unit2">Unit 2</option>
                    <option value="unit3">Unit 3</option>
                    <option value="unit4">Unit 4</option>
                  </select>
            </td></tr>
            <tr><td><label for="fileType">Select File Type: </label></td></tr>
            <tr><td><select name="fileType"/>
                    <option value="video">Video</option>
                    <option value="pdf">PDF</option>
                  </select>
            </td></tr>
            <tr><td><label for="fTitle">Enter Title for File: </label></td></tr>
            <tr><td><input type="text" name="fTitle" required></td></tr>
	          <tr><td><label for="fileName1">Select File:(Please Ensure that videos should be in <strong>MP4</strong> format)</label></td></tr>
            <tr><td><input id="fileName1" type="file" name="fileName" size="30" required></td></tr>
            <tr><td><input type="submit" value="Upload"/></td></tr>
	          </table>
        </form>
	<a href="fac_dash.jsp"><button type="submit">No More File To Submit</button>
	</a>
     <%
		}
		else{%>
			<div>Something is Fishy. </div>
			<a href="fac_dash.jsp">Go Back</a>
		<%
		}
    }catch(Exception e){
		%>		<table>
				<tr><td><div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div></td></tr>
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
</body>
</html>
