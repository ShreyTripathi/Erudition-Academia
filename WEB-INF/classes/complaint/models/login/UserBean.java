package complaint.models.login;
import java.io.*;
public class UserBean implements Serializable
{
	private int id;
	private String pass;
	public void setId(int id)
	{
		this.id = id;
	}
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	public int getId()
	{
		return id;
	}
	public String getPass()
	{
		return pass;
	}
}
