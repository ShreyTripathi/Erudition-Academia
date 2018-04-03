import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
public class EnterTopic extends HttpServlet{

  private List<QuestionBean> quesList1 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList2 = new ArrayList<QuestionBean>();
  private List<QuestionBean> quesList3 = new ArrayList<QuestionBean>();
  private List<Integer> attempted = new ArrayList<Integer>();


  HttpSession session=null;
  private int
  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
  {
    String courseId = request.getParameter("courseId");
    String topicId = request.getParameter("topicId");
    session = request.getSession();

    if(session.getAttribute("QuesNo")==null)
    {
      this.uploadDataOnBean();
    }
    this.nextQues();
  }
  public void uploadDataOnBean()
  {
    String dbName = "modif_eru_acad";
    String user= "root";
    String pass= "root";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("Select * from question where topicid="+topicId+"");
      while(rs.next())
      {
        QuestionBean quesBean = new QuestionBean();
        quesBean.setQuesId(rs.getInt("quesid"));
        quesBean.setQuesDet(rs.getString("quesdet"));
        quesBean.setCh1(rs.getString("choice1"));
        quesBean.setCh2(rs.getString("choice2"));
        quesBean.setCh3(rs.getString("choice3"));
        quesBean.setCh4(rs.getString("choice4"));
        quesBean.setAns(rs.getString("correct_ans"));
        quesBean.setDiff(rs.getString("diff_level"));
        if(quesBean.getDiff().equals("low"))
        quesList1.append(quesBean);
        else if(quesBean.getDiff().equals("medium"))
        quesList2.append(quesBean);
        else if(quesBean.getDiff().equals("high"))
        quesList3.append(quesBean);
      }
    }catch(Exception e){response.sendRedirect(error.jsp);}
  }
  public void nextQues()
  {
    if(session.getAttribute("QuesNo")==null)
    {
      session.setAttribute("QuesNo",0);
    }
    if((Integer.parseInt(session.getAttribute("QuesNo")toString())==0||(Integer.parseInt(session.getAttribute("QuesNo").toString())!=0&&(this.calculate()==2)||(this.calculate()==3&&quesList3.isEmpty())))&&!quesList2.isEmpty())
    {
      quesList2.get(0);
      quesList2.remove(0);
    }
    else if((Integer.parseInt(session.getAttribute("QuesNo").toString())!=0&&this.calculate()==1||((this.calculate()==2||this.caculate()==3)&&quesList2.isEmpty()))&&!quesList1.isEmpty())
    {
      quesList1.get(0);
      quesList1.remove(0);
    }
    else if((Integer.parseInt(session.getAttribute("QuesNo").toString())!=0&&this.calculate()==3&&!quesList3.isEmpty())
    {
      quesList3.get(0);
      quesList3.remove(0);
    }
  }
}
