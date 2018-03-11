<html>
<head>
<title>Login Form</title>
<form action="/LoginServlet" method="post">
<% if(request.getAttribute("np")!=null){
%>
<p style="color:blue">The user is not present</p>
<%
}
%>
<table>
<tr><td>ID:</td><td><input type="text" name="id" /></td></tr>
<tr><td>Password:</td><td><input type="password" name="pass" /></td></tr>
</table>
<input type="submit" value="Enter Portal">
</form>
</body>
</html>
