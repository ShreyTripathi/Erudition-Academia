<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="jquery-3.3.1.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="register_css.css">
        <link rel="stylesheet" href="nav_css.css">
    <title>Register</title>
  </head>
        <script>
      		$(document).ready(function(){
      				$(".panel").show(1450);
      		});
      	</script>
        <body>
        <%if(session.getAttribute("uId")!=null)
          {
            response.sendRedirect("fac_dash.jsp");
          }
        %>
        <jsp:include page="navbar_login.jsp" />
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default" hidden>
                  <div class="panel-heading">
                    <h2 class="" align="center">Registration Form</h2>
                  </div>
                  <div class="panel-body">
                    <form class="form-horizontal" role="form" action="register_logic.jsp" method="post">
                      <table cellpadding="10">
                        <tr>
                          <td>
                            <label>User Type:
                            </label>
                          </td>
                          <td>
                            <select name="utype">
                              <option value="faculty">Faculty</option>
                              <option value="student">Student</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <br>
                              <br>
                                <strong style="text-align:center">Login Details<hr></strong>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <label>User ID:
                                  </label>
                                </td>
                                <td>
                                  <input type="text" name="userid" pattern="[a-zA-Z0-9]+" autocomplete="randomstring" required></td>
                                </tr>
                                <tr>
                                  <td>
                                    <label>Password:
                                    </label>
                                  </td>
                                  <td>
                                    <input type="password" name="pass" autocomplete="randomstring" required></td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <br>
                                        <br>
                                          <strong style="text-align:center">Personal Details<hr></strong>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <label>First Name:
                                            </label>
                                          </td>
                                          <td>
                                            <input type="text" name="ufName" required></td>
                                          </tr>
                                          <tr>
                                            <td>
                                              <label>Last Name:
                                              </label>
                                            </td>
                                            <td>
                                              <input type="text" name="ulName" required></td>
                                            </tr>
                                            <tr>
                                              <td>
                                                <label>Date of Birth:
                                                </label>
                                              </td>
                                              <td>
                                                <input type="date" name="udob" required></td>
                                              </tr>
                                              <tr>
                                                <td>
                                                  <label>Gender:
                                                  </label>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                  <input type="radio" name="gender" value="male" checked="checked">Male &nbsp;
                                                    <input type="radio" name="gender" value="female">Female</td>
                                                  </tr>
                                                  <tr>
                                                    <td>
                                                      <label>Graduate:
                                                      </label>
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td>
                                                      <input type="radio" name="graduate" value="yes">Yes &nbsp;
                                                        <input type="radio" name="graduate" value="no" checked="checked">No</td>
                                                      </tr>
                                                      <tr>
                                                        <td>
                                                          <label>Post Graduate:
                                                          </label>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <td>
                                                          <input type="radio" name="postgrad" value="yes">Yes &nbsp;
                                                            <input type="radio" name="postgrad" value="no" checked="checked">No</td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <br>
                                                                <br>
                                                                  <strong style="text-align:center">Contact Details<hr></strong>
                                                                  </td>
                                                                </tr>
                                                                <tr>
                                                                  <td>
                                                                    <label>Street Name</label>
                                                                  </td>
                                                                  <td>
                                                                    <input type="text" name="street" required></td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td>
                                                                      <label>City Name</label>
                                                                    </td>
                                                                    <td>
                                                                      <input type="text" name="city" required></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td>
                                                                        <label>State</label>
                                                                      </td>
                                                                      <td>
                                                                        <input type="text" name="state" required></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td>
                                                                          <label>Country</label>
                                                                        </td>
                                                                        <td>
                                                                          <input type="text" name="country" required></td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td>
                                                                            <label>Zip Code</label>
                                                                          </td>
                                                                          <td>
                                                                            <input type="text" name="zipcode" pattern ="[0-9]{6}" title="Pin Code Must be of 6 digits !"required></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td>
                                                                              <label>Email:
                                                                              </label>
                                                                            </td>
                                                                            <td>
                                                                              <input type="email" name="email_id" required></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td>
                                                                                <label>Phone</label>
                                                                              </td>
                                                                              <td>
                                                                                <input type="text" name="phoneno" pattern="[0-9]{10}" title="PhoneNo. Must be of 10 digits !" required></td>
                                                                              </tr>
                                                                              <tr>
                                                                                <td>
                                                                                  <br>
                                                                                  <input type="submit" value="Enter Details"></td>
                                                                                </tr>
                                                                              </table>
                                                                              </form>
                                                                            </div>
                                                                            <div class="panel-footer">
                                                                                          <h34 Already A member <a href="login.jsp">Login here</a></h4>
                                                                            </div>

                                                                          </div>
                                                                        </div>
                                                                      </div>
                                                                    </div>
                                                                  </div>
                                                                </body>
                                                              </html>
