import java.sql.*;
import java.io.IOException;
import quesPackage.QuestionBean;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MyEnterTopic extends HttpServlet{

  Connection con=null;
  Statement st=null,st1 = null;
  ResultSet rs=null,rs1 =null;

  HttpSession session=null;

  public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
  {
    ArrayList<Integer> highL = new ArrayList<Integer>();
    ArrayList<Integer> medL = new ArrayList<Integer>();
    ArrayList<Integer> lowL = new ArrayList<Integer>();

    response.setContentType("text/html");
    PrintWriter out= response.getWriter();
    String courseId = request.getParameter("courseId");
    session = request.getSession(false);
    int topicId = Integer.parseInt(request.getParameter("topicId"));
    String dbName = "modif_eru_acad";
    String user = "root";
    String pass = "root";
    if(session.getAttribute("uId")==null)
    {
      response.sendRedirect("login.jsp");
    }

    if(session.getAttribute("highL")!=null)
    {
      session.removeAttribute("highL");
    }
    if(session.getAttribute("medL")!=null)
    {
      session.removeAttribute("medL");
    }
    if(session.getAttribute("lowL")!=null)
    {
      session.removeAttribute("lowL");
    }
    if(session.getAttribute("cor_count")!=null)
    {
      session.removeAttribute("cor_count");
    }

    String uId = session.getAttribute("uId").toString();

    try{
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      st1 = con.createStatement();
      rs1 = st1.executeQuery("Select * from user_question where userid='"+uId+"' and quesid in (select quesid from question where topicid="+topicId+")");
      if(rs1.next())
      {
        response.sendRedirect("final_screen.jsp?courseId="+courseId+"&topicId="+topicId);
      }

      st = con.createStatement();
      rs = st.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid");
      while(rs.next()&&!rs.getString("diff_level").equals("medium"))
      {
        if(rs.getString("diff_level").equals("high"))
          highL.add(rs.getInt("quesid"));
        else
          lowL.add(rs.getInt("quesid"));
      }
      if(rs.getString("diff_level").equals("medium"))
      {
        QuestionBean quesBean = new QuestionBean();
        quesBean.setQuesId(rs.getInt("quesid"));
        quesBean.setQuesDet(rs.getString("quesdet"));
        quesBean.setCh1(rs.getString("choice1"));
        quesBean.setCh2(rs.getString("choice2"));
        quesBean.setCh3(rs.getString("choice3"));
        quesBean.setCh4(rs.getString("choice4"));
        if(rs.getString("correct_ans").equals("choice1"))
        quesBean.setAns(quesBean.getCh1());
        else if(rs.getString("correct_ans").equals("choice2"))
        quesBean.setAns(quesBean.getCh2());
        else if(rs.getString("correct_ans").equals("choice3"))
        quesBean.setAns(quesBean.getCh3());
        else
        quesBean.setAns(quesBean.getCh4());
        quesBean.setDiff(rs.getString("diff_level"));
        quesBean.setAttempted(3);
        quesBean.setStudentChoice("choice5");
        quesBean.setIsCorrect(3);
        quesBean.setTopicName(rs.getString("topicname"));
        session.setAttribute("QuesBean",quesBean);
        medL.add(quesBean.getQuesId());
      }
      while(rs.next())
      {
        if(rs.getString("diff_level").equals("high"))
          highL.add(rs.getInt("quesid"));
        else if(rs.getString("diff_level").equals("medium"))
          medL.add(rs.getInt("quesid"));
        else
          lowL.add(rs.getInt("quesid"));
      }
      session.setAttribute("lowL",lowL);
      session.setAttribute("medL",medL);
      session.setAttribute("highL",highL);

      response.sendRedirect("display_ques1.jsp?courseId="+courseId+"&topicId="+topicId);
    }catch(Exception e){out.println(e);}
    finally{
      try{
        rs.close();
      }
      catch(Exception e){}
      try{
        st.close();
      }
      catch(Exception e){}
    }
  }

}
