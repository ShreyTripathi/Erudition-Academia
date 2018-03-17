package complaint.models.login;
import java.sql.*;
public class Login_Auth
{
	public int validate()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstdb","admin_complain","");	
			System.out.println("Connection Successful");
			return 1;
		}
		catch(Exception e)
		{
			System.out.println("Not Connected");
			e.printStackTrace();
			return 0;
		}
	}
}
