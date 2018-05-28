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
public class EnterTopic extends HttpServlet{

  private List<QuestionBean> quesList1 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList2 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList3 = new ArrayList<QuestionBean>();
  //private List<QuestionBean> ansList = new ArrayList<QuestionBean>();

  private int i=0,j=0,k=0;
  Connection con=null;
  Statement st=null;
  ResultSet rs=null;

  HttpSession session=null;
  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
  {
    String courseId = request.getParameter("courseId");
    session = request.getSession();

    if(session.getAttribute("QuesNo")==null)
    {
      int topicId = Integer.parseInt(request.getParameter("topicId"));
      session.setAttribute("topicId",topicId);
      session.setAttribute("QuesNo",0);
      session.setAttribute("user_score",0);
      boolean isUploaded = this.uploadDataOnBean(topicId);
      if(!isUploaded)
      {
        response.sendRedirect("error.jsp");
      }
    }
    else
    {
      quesList1 = (ArrayList<QuestionBean>)session.getAttribute("quesList1");
      quesList2 = (ArrayList<QuestionBean>)session.getAttribute("quesList2");
      quesList3 = (ArrayList<QuestionBean>)session.getAttribute("quesList3");
      i=Integer.parseInt(session.getAttribute("i").toString());
      j=Integer.parseInt(session.getAttribute("j").toString());
      k=Integer.parseInt(session.getAttribute("k").toString());

      String userCh="";
      userCh = request.getParameter("userCh");
      QuestionBean quesBean = (QuestionBean)session.getAttribute("QuesBean");
      if(!userCh.equals("")||userCh!=null)
      {
        quesBean.setAttempted(1);
        quesBean.setStudentChoice(userCh);
      }
      else{
        quesBean.setAttempted(0);
      }
    }

    boolean isNext = this.calculate();
    boolean entered = this.enterIntoDB((QuestionBean)session.getAttribute("QuesBean"));
    if(!entered)
    {
      response.sendRedirect("error.jsp");
    }
    if(isNext)
    {
      response.sendRedirect("display_ques.jsp?courseId="+courseId);
    }
    else
    {
      response.sendRedirect("final_screen.jsp?courseId="+courseId);
    }
  }

  public boolean uploadDataOnBean(int topicId)
  {
    String dbName = "modif_eru_acad";
    String user= "root";
    String pass= "root";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid");
      while(rs.next())
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
        if(quesBean.getDiff().equals("low"))
        quesList1.add(quesBean);
        else if(quesBean.getDiff().equals("medium"))
        quesList2.add(quesBean);
        else if(quesBean.getDiff().equals("high"))
        quesList3.add(quesBean);
      }
      session.setAttribute("quesList1",quesList1);
      session.setAttribute("quesList2",quesList2);
      session.setAttribute("quesList3",quesList3);
      session.setAttribute("i",0);
      session.setAttribute("j",0);
      session.setAttribute("k",0);
      return true;
    }catch(Exception e){return false;}
    finally{
      try{
        rs.close();
      }
      catch(Exception e){}
      try{
        st.close();
      }
      catch(Exception e){}
      return true;
    }
  }

  // public boolean nextQues()
  // {
  //   QuestionBean quesBean = null;
  //   if(i>=quesList1.size()&&j>=quesList2.size()&&k>=quesList3.size())
  //     return false;
  //   if(j<quesList2.size()&&(Integer.parseInt(session.getAttribute("QuesNo").toString())==0||(this.calculate()==2)||(this.calculate()==3&&k>=quesList3.size())))
  //   {
  //     //System.out.println(j);
  //     quesBean=quesList2.get(Integer.parseInt(session.getAttribute("j").toString()));
  //     session.setAttribute("j",j+1);
  //     session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
  //     session.setAttribute("QuesBean",quesBean);
  //     return true;
  //   }
  //   if(k<quesList3.size()&&this.calculate()==3)
  //   {
  //     //System.out.println(k);
  //     quesBean=quesList3.get(Integer.parseInt(session.getAttribute("k").toString()));
  //     session.setAttribute("k",k+1);
  //     session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
  //     session.setAttribute("QuesBean",quesBean);
  //     return true;
  //   }
  //   if(i<quesList1.size()&&(this.calculate()==1||(j>=quesList2.size()&&this.calculate()==2)||(k>=quesList3.size()&&j>=quesList2.size()&&this.calculate()==3)))
  //   {
  //     quesBean = quesList1.get(Integer.parseInt(session.getAttribute("i").toString()));
  //     session.setAttribute("i",i+1);
  //     session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
  //     session.setAttribute("QuesBean",quesBean);
  //     return true;
  //   }
  //   return false;
  // }
  private boolean calculate()
  {
    session.setAttribute("QuesNo",Integer.parseInt(session.getAttribute("QuesNo").toString())+1);
    QuestionBean quesBean = null;
    if(session.getAttribute("QuesBean")!=null)
    quesBean =(QuestionBean)session.getAttribute("QuesBean");
    else
    {
      if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
      {
        session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
        session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
        return true;
      }
      else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
      {
        session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
        session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
        return true;
      }
      else
      {
        return false;
      }
    }

    if(quesBean.getDiff().equals("medium"))
    {
      if(quesBean.getAttempted()==0)
      {
        quesBean.setIsCorrect(2);
        if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else
        {
          return false;
        }
      }
      else if(quesBean.getStudentChoice().equals(quesBean.getAns()))
      {

        quesBean.setIsCorrect(1);
        if(Integer.parseInt(session.getAttribute("k").toString())<quesList3.size())
        {
          session.setAttribute("QuesBean",quesList3.get(Integer.parseInt(session.getAttribute("k").toString())));
          session.setAttribute("k",Integer.parseInt(session.getAttribute("k").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else{
          return false;
        }
      }
      else{//medium wrong-choice part
         quesBean.setIsCorrect(0);
         if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
         {
           session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
           session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
           return true;
         }
         else
         {
           return false;
         }
       }
    }//end of medium

    else if(quesBean.getDiff().equals("low"))
    {

      if(quesBean.getAttempted()==0)
      {//not attempted quesion
        quesBean.setIsCorrect(2);
        if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else
        {
          return false;
        }
      }

      else if(quesBean.getStudentChoice().equals(quesBean.getAns()))
      {//correct choice
        quesBean.setIsCorrect(1);
        if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else
        {
          return false;
        }
      }

      else
      {
        quesBean.setIsCorrect(0);
        if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else
        {
          return false;
        }
      }
    }

    else if(quesBean.getDiff().equals("high"))
    {
      if(quesBean.getAttempted()==0)
      {
        quesBean.setIsCorrect(2);
        if(Integer.parseInt(session.getAttribute("k").toString())<quesList3.size())
        {
          session.setAttribute("QuesBean",quesList3.get(Integer.parseInt(session.getAttribute("k").toString())));
          session.setAttribute("k",Integer.parseInt(session.getAttribute("k").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("k").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else{
          return false;
        }
      }
      else if(quesBean.getStudentChoice().equals(quesBean.getAns()))
      {
        quesBean.setIsCorrect(1);
        if(Integer.parseInt(session.getAttribute("k").toString())<quesList3.size())
        {
          session.setAttribute("QuesBean",quesList3.get(Integer.parseInt(session.getAttribute("k").toString())));
          session.setAttribute("k",Integer.parseInt(session.getAttribute("k").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(Integer.parseInt(session.getAttribute("i").toString())));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else{
          return false;
        }
      }
      else
      {
        quesBean.setIsCorrect(0);
        if(Integer.parseInt(session.getAttribute("j").toString())<quesList2.size())
        {
          session.setAttribute("QuesBean",quesList2.get(Integer.parseInt(session.getAttribute("j").toString())));
          session.setAttribute("j",Integer.parseInt(session.getAttribute("j").toString())+1);
          return true;
        }
        else if(Integer.parseInt(session.getAttribute("i").toString())<quesList1.size())
        {
          session.setAttribute("QuesBean",quesList1.get(i));
          session.setAttribute("i",Integer.parseInt(session.getAttribute("i").toString())+1);
          return true;
        }
        else
        {
          return false;
        }
      }
    }
    else{return false;}
  }

  public boolean enterIntoDB(QuestionBean quesBean)
  {
    String dbName = "modif_eru_acad";
    String user= "root";
    String pass= "root";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement st = con.createStatement();
      int i =st.executeUpdate("insert into user_question(userid,quesid,user_choice,correct) values('"+session.getAttribute("uId").toString()+"',"+quesBean.getQuesId()+",'"+quesBean.getStudentChoice()+"',"+quesBean.getIsCorrect()+")");
      return true;
    }
    catch(Exception e){return false;}
    finally{
      try{
        st.close();
      }
      catch(Exception e){}
      try{
        con.close();
      }catch(Exception e){}
    }
  }
}
