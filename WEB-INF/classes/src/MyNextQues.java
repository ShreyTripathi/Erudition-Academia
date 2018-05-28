import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

import java.io.IOException;
import java.io.PrintWriter;

import quesPackage.QuestionBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

public class MyNextQues extends HttpServlet{
  Connection con=null;
  Statement st=null,st1 = null,st2 = null;
  ResultSet rs=null,rs2=null;

  HttpSession session=null;

  ArrayList<Integer> highL=  null;
  ArrayList<Integer> medL = null;
  ArrayList<Integer> lowL = null;

  public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
  {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String courseId = request.getParameter("courseId");
    session = request.getSession(false);

    if(session.getAttribute("uId")==null)
      response.sendRedirect("login.jsp");

    if(session.getAttribute("highL")!=null)
      highL = (ArrayList<Integer>)session.getAttribute("highL");
    if(session.getAttribute("medL")!=null)
        medL = (ArrayList<Integer>)session.getAttribute("medL");
    if(session.getAttribute("lowL")!=null)
        lowL = (ArrayList<Integer>)session.getAttribute("lowL");

    int topicId = Integer.parseInt(request.getParameter("topicId"));
    int quesId = Integer.parseInt(request.getParameter("quesId"));
    String userCh = request.getParameter("userCh");
    String correct_ans = request.getParameter("correct_ans");
    String diff_level = request.getParameter("diff_level");
    boolean answer_right = checkAndRemove(quesId,userCh,correct_ans,diff_level);

    String uId = session.getAttribute("uId").toString();
    String dbName = "modif_eru_acad";
    String user = "root";
    String pass = "root";
    try{
      Class.forName("com.mysql.jdbc.Driver");
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
       st = con.createStatement();
       rs = st.executeQuery("select * from user_question where userid='"+uId+"' and quesid="+quesId+"");
       st1 = con.createStatement();
       int i=-100;
       if(answer_right)
       {
        if(rs.next()&&rs.getInt("correct")==0)
        {
          //out.println("ResultSet Not Empty");
            i = st1.executeUpdate("update user_question set correct=1 where userid='"+uId+"' and quesid="+quesId+"");
            if(session.getAttribute("cor_count")==null)
            {
              session.setAttribute("cor_count",1);
            }
            else
            {
              session.setAttribute("cor_count",Integer.parseInt(session.getAttribute("cor_count").toString())+1);
            }
        }
        else
        {
          //out.println("ResultSet Empty");
          i = st1.executeUpdate("insert into user_question(userid,quesid,user_choice,correct) values('"+uId+"',"+quesId+",'"+userCh+"',1)");

          if(session.getAttribute("cor_count")==null||Integer.parseInt(session.getAttribute("cor_count").toString())==2)
          {
            session.setAttribute("cor_count",1);
          }
          else
          {
            session.setAttribute("cor_count",Integer.parseInt(session.getAttribute("cor_count").toString())+1);
          }
        }

       }

       else
       {
        if(rs.next()&&rs.getInt("correct")==1)
        {
          i = st1.executeUpdate("update user_question set correct=0 where userid='"+uId+"' and quesid="+quesId+"");

          if(session.getAttribute("cor_count")==null||Integer.parseInt(session.getAttribute("cor_count").toString())==-1)
          {
              session.setAttribute("cor_count",0);
          }
          else
          {
              session.setAttribute("cor_count",Integer.parseInt(session.getAttribute("cor_count").toString())-1);
          }

        }
        else
        {
          i = st1.executeUpdate("insert into user_question(userid,quesid,user_choice,correct) values('"+uId+"',"+quesId+",'"+userCh+"',0)");
          if(session.getAttribute("cor_count")==null||Integer.parseInt(session.getAttribute("cor_count").toString())==-1)
          {
            session.setAttribute("cor_count",0);
          }
          else
          {
            session.setAttribute("cor_count",Integer.parseInt(session.getAttribute("cor_count").toString())-1);
          }
        }

       }

       if(Integer.parseInt(session.getAttribute("cor_count").toString())==2)
       {
        st2 = con.createStatement();
        if((diff_level.equals("medium")||diff_level.equals("high")))
        {
          if(!highL.isEmpty())
          rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+highL.get(0)+"");
          else if(!medL.isEmpty())
          rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+medL.get(0)+"");
        }
        else if(diff_level.equals("low"))
        {
          if(!medL.isEmpty())
          rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+medL.get(0)+"");
          else if(!lowL.isEmpty())
          rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+lowL.get(0)+"");
        }
       }
       else if(Integer.parseInt(session.getAttribute("cor_count").toString())==-1)
       {
         st2 = con.createStatement();
         if((diff_level.equals("medium")||diff_level.equals("low"))&&!lowL.isEmpty())
           rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+lowL.get(0)+"");
         else if(diff_level.equals("high"))
         {
           if(!medL.isEmpty())
           rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+medL.get(0)+"");
           else if(!lowL.isEmpty())
           rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+lowL.get(0)+"");
         }
       }
       else
       {
        st2 = con.createStatement();
        if(diff_level.equals("high")&&!highL.isEmpty())
        rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+highL.get(0)+"");
        else if(diff_level.equals("medium")&&!medL.isEmpty())
        rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+medL.get(0)+"");
        else if(!lowL.isEmpty())
        rs2 = st2.executeQuery("Select question.*,topicname from question,topic where topic.topicid="+topicId+" and question.topicid=topic.topicid and question.quesid="+lowL.get(0)+"");
       }
       if(rs2.next())
       {
         QuestionBean quesBean = new QuestionBean();
         quesBean.setQuesId(rs2.getInt("quesid"));
         quesBean.setQuesDet(rs2.getString("quesdet"));
         quesBean.setCh1(rs2.getString("choice1"));
         quesBean.setCh2(rs2.getString("choice2"));
         quesBean.setCh3(rs2.getString("choice3"));
         quesBean.setCh4(rs2.getString("choice4"));
         if(rs2.getString("correct_ans").equals("choice1"))
         quesBean.setAns(quesBean.getCh1());
         else if(rs2.getString("correct_ans").equals("choice2"))
         quesBean.setAns(quesBean.getCh2());
         else if(rs2.getString("correct_ans").equals("choice3"))
         quesBean.setAns(quesBean.getCh3());
         else
         quesBean.setAns(quesBean.getCh4());
         quesBean.setDiff(rs2.getString("diff_level"));
         quesBean.setAttempted(3);
         quesBean.setStudentChoice("choice5");
         quesBean.setIsCorrect(3);
         quesBean.setTopicName(rs2.getString("topicname"));
         session.setAttribute("QuesBean",quesBean);
         response.sendRedirect("display_ques1.jsp?courseId="+courseId+"&topicId="+topicId);
       }
       else{
         response.sendRedirect("final_screen.jsp?courseId="+courseId+"&topicId="+topicId);
       }
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
  public boolean checkAndRemove(int quesId,String userCh,String correct_ans,String diff_level)
  {
    if(medL.contains(quesId)||highL.contains(quesId)||lowL.contains(quesId))
    {
      if(diff_level.equals("medium"))
      {
        medL.remove(Integer.valueOf(quesId));
      }
      else if(diff_level.equals("high"))
      {
        highL.remove(Integer.valueOf(quesId));
      }
      else
      {
        lowL.remove(Integer.valueOf(quesId));
      }
    }

    if(userCh.equals(correct_ans))
      return true;
    else
        return false;
  }
}
