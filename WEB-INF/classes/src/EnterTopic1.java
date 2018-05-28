import java.io.IOException;
import java.io.PrintWriter;
import quesPackage.QuestionBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
public class EnterTopic1 extends HttpServlet{

  private List<QuestionBean> quesList1 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList2 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList3 = new ArrayList<QuestionBean>();
  //private List<QuestionBean> ansList = new ArrayList<QuestionBean>();
  String dbName = "modif_eru_acad";
  String user= "root";
  String pass= "root";
  private int i=0,j=0,k=0;

  HttpSession session=null;
  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
  {
    String courseId = request.getParameter("courseId");
    int topicId = Integer.parseInt(request.getParameter("topicId"));
    session = request.getSession();
    if(session.getAttribute("QuesNo")==null)
    {
      session.setAttribute("QuesNo",0);
      if(this.sendMedium(topicId))
      {
        session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
        response.sendRedirect("display_ques.jsp?courseId="+courseId);
      }
    }
    else
    {
      String userCh = request.getParameter("userCh");

      if(this.evaluate(userCh,topicId))
      {
        session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
        response.sendRedirect("display_ques.jsp?courseId="+courseId);
      }
      else{
        response.sendRedirect("final_screen.jsp?courseId="+courseId);
      }
    }
  }

  public boolean sendMedium(int topicId)
  {
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement outSt = con.createStatement();
      ResultSet outRs =outSt.executeQuery("select quesid,quesdet,choice1,choice2,choice3,choice4,correct_ans from question where topicid="+topicId+" and diff_level='medium' and quesid not in (select quesid from user_question where userid='"+session.getAttribute("uId").toString()+"')");
      if(outRs.next())
      {
        QuestionBean quesBean = new QuestionBean();
        quesBean.setDiff("Medium");
        quesBean.setQuesId(outRs.getInt("quesid"));
        quesBean.setQuesDet(outRs.getString("quesdet"));
        quesBean.setCh1(outRs.getString("choice1"));
        quesBean.setCh2(outRs.getString("choice2"));
        quesBean.setCh3(outRs.getString("choice3"));
        quesBean.setCh4(outRs.getString("choice4"));
        String ans = outRs.getString("correct_ans");
        if(ans.equals("choice1"))
        quesBean.setAns(quesBean.getCh1());
        else if(ans.equals("choice2"))
        quesBean.setAns(quesBean.getCh2());
        else if(ans.equals("choice3"))
        quesBean.setAns(quesBean.getCh3());
        else
        quesBean.setAns(quesBean.getCh4());
        session.setAttribute("QuesBean",quesBean);
        return true;
      }
       return (this.sendLow(topicId));

    }catch(Exception e){}
      return false;
  }
  public boolean sendLow(int topicId)
  {
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement outSt = con.createStatement();
      ResultSet outRs =outSt.executeQuery("select quesid,quesdet,choice1,choice2,choice3,choice4,correct_ans from question where topicid="+topicId+" and diff_level='low' and quesid not in (select quesid from user_question where userid='"+session.getAttribute("uId").toString()+"')");
      if(outRs.next())
      {
        QuestionBean quesBean = new QuestionBean();
        quesBean.setDiff("Low");
        quesBean.setQuesId(outRs.getInt("quesid"));
        quesBean.setQuesDet(outRs.getString("quesdet"));
        quesBean.setCh1(outRs.getString("choice1"));
        quesBean.setCh2(outRs.getString("choice2"));
        quesBean.setCh3(outRs.getString("choice3"));
        quesBean.setCh4(outRs.getString("choice4"));
        String ans = outRs.getString("correct_ans");
        if(ans.equals("choice1"))
        quesBean.setAns(quesBean.getCh1());
        else if(ans.equals("choice2"))
        quesBean.setAns(quesBean.getCh2());
        else if(ans.equals("choice3"))
        quesBean.setAns(quesBean.getCh3());
        else
        quesBean.setAns(quesBean.getCh4());
        session.setAttribute("QuesBean",quesBean);
        return true;
      }
    }catch(Exception e){}
    return false;
  }
  public boolean sendHigh(int topicId)
  {
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement outSt = con.createStatement();
      ResultSet outRs =outSt.executeQuery("select quesid,quesdet,choice1,choice2,choice3,choice4,correct_ans from question where topicid="+topicId+" and diff_level='high' and quesid not in (select quesid from user_question where userid='"+session.getAttribute("uId").toString()+"')");
      if(outRs.next())
      {
        QuestionBean quesBean = new QuestionBean();
        quesBean.setDiff("High");
        quesBean.setQuesId(outRs.getInt("quesid"));
        quesBean.setQuesDet(outRs.getString("quesdet"));
        quesBean.setCh1(outRs.getString("choice1"));
        quesBean.setCh2(outRs.getString("choice2"));
        quesBean.setCh3(outRs.getString("choice3"));
        quesBean.setCh4(outRs.getString("choice4"));
        String ans = outRs.getString("correct_ans");
        if(ans.equals("choice1"))
        quesBean.setAns(quesBean.getCh1());
        else if(ans.equals("choice2"))
        quesBean.setAns(quesBean.getCh2());
        else if(ans.equals("choice3"))
        quesBean.setAns(quesBean.getCh3());
        else
        quesBean.setAns(quesBean.getCh4());
        session.setAttribute("QuesBean",quesBean);
        return true;
      }
       return (this.sendMedium(topicId));
    }catch(Exception e){}
      return false;
  }
  public boolean evaluate(String userCh,int topicId)
  {
    QuestionBean quesBean = (QuestionBean)session.getAttribute("QuesBean");
    if(quesBean.getDiff().equals("Medium"))
    {
      if(quesBean.getAns().equals(userCh))
      {
        return (this.sendHigh(topicId));

      }
      return (this.sendLow(topicId));

    }
    else if(quesBean.getDiff().equals("Low"))
    {
      if(quesBean.getAns().equals(userCh))
      {
        return (this.sendHigh(topicId));
      }
      return (this.sendLow(topicId));
    }

    if(!quesBean.getAns().equals(userCh))
        return (this.sendMedium(topicId));
      return (this.sendHigh(topicId));
    }
}
