public class QuestionBean {

  private int quesId;
	private String detail,ch1,ch2,ch3,ch4,ans,diff_level;

//setters
  public void setQuesId(int quesId)
  {
    this.quesId = quesId;
  }
  public void setQuesDet(String detail)
  {
    this.detail = detail;
  }
  public void setCh1(String ch1)
  {
    this.ch1 = ch1;
  }
  public void setCh2(String ch2)
  {
    this.ch2 = ch2;
  }
  public void setCh3(String ch3)
  {
    this.ch3 = ch3;
  }
  public void setCh4(String ch4)
  {
    this.ch4 = ch4;
  }
  public void setAns(String ans)
  {
    this.ans = ans;
  }
  public void setDiff(String diff_level)
  {
    this.diff_level = diff_level;
  }

  //getters
  public int getQuesId()
  {
    return quesId;
  }
  public String getQuesDet()
  {
    return detail;
  }
  public String getCh1()
  {
    return ch1;
  }
  public String getCh2()
  {
    return ch2;
  }
  public String getCh3()
  {
    return ch3;
  }
  public String getCh4()
  {
    return ch4;
  }
  public String getAns()
  {
    return ans;
  }
  public String getDiff()
  {
    return diff_level;
  }
}
