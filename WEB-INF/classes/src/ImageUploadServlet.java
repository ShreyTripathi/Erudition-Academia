import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.sql.*;

public class ImageUploadServlet extends HttpServlet {

//session attributes set are unit(containing unit Name) and fPath(containing File Path)
//session attributes already set are courseid which is used here

  Connection con = null;
  ResultSet rs=null;
  Statement st1 = null;
  String dbName = "modif_eru_acad";
  String user= "root";
  String pass= "root";

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException
  {
	// String done = "";
	String courseid ="";
	HttpSession session = request.getSession();
	String page="";
	String course_name="";
  String sdate="";
  String edate="";
  String fee="";
  String category="";
  String duration="";

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

       if (isMultipart) {
          // Create a factory for disk-based file items
          FileItemFactory factory = new DiskFileItemFactory();

          // Create a new file upload handler
          ServletFileUpload upload = new ServletFileUpload(factory);

         try {
		//String c_id = session.getAttribute("courseid").toString();
		String fileName = "";

		// try{
		// 	Class.forName("com.mysql.jdbc.Driver");
		// 	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		// 	 st1 = con.createStatement();
		// 	rs = st1.executeQuery("select coursename from course where courseid='"+c_id+"'");
		// 	if(rs.next())
		// 	{
		// 		sName = rs.getString("coursename");
		// 	}
		// 	else
		// 	{
		// 		response.sendRedirect("error.jsp");
		// 	}
    //
		// }//end of first inner try
		// catch(Exception e)
		// {
		// 	response.sendRedirect("error.jsp");
		// }
    //
		// finally{
		// 	try{
		// 		st1.close();
		// 	}catch(Exception e){e.printStackTrace();}
		// 	try{
		// 		con.close();
		// 	}catch(Exception e){e.printStackTrace();}
		// }//end of finally


		String delem = "/";
              // Parse the request
        	List <FileItem> items = upload.parseRequest(request);
                Iterator iterator = items.iterator();

	      //Name of the uploaded file
		File uploadedFile=null;

                while (iterator.hasNext()) {

                     FileItem item = (FileItem) iterator.next();
		     if (!item.isFormField())
		     {
                         fileName = item.getName();
                         String root = getServletContext().getRealPath("/");

                         uploadedFile = new File(root+"/"+fileName);
			item.write(uploadedFile);
			page="add_course_logic1.jsp";
         }
		     else
		     {
			String Name = item.getFieldName();
      if(Name.equals("category"))
			{
				category = item.getString();
			}
			if(Name.equals("course_id"))
			{
				courseid = item.getString();
			}
			if(Name.equals("course_name"))
			{
				course_name = item.getString();
			}
      if(Name.equals("sdate"))
      {
        sdate = item.getString();
      }
      if(Name.equals("fee"))
      {
        fee = item.getString();
      }
      if(Name.equals("edate"))
      {
        edate = item.getString();
      }
      if(Name.equals("duration"))
			{
				duration = item.getString();
			}
		     }
                     //end of if inside while
                 }//end of while

		session.setAttribute("courseid",courseid);
    if(uploadedFile!=null)
		session.setAttribute("fPath",uploadedFile.getAbsolutePath());
		session.setAttribute("course_name",course_name);
    session.setAttribute("category",category);
    session.setAttribute("sdate",sdate);
    session.setAttribute("edate",edate);
    session.setAttribute("fee",fee);
    session.setAttribute("duration",duration);

         }
	 catch (Exception e) {
          page="error.jsp";
         }//end of try catch
	response.sendRedirect(page);
       }//end of outer if

  }//end of doPost

}
