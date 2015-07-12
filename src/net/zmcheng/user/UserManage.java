package net.zmcheng.user;
import java.sql.ResultSet;
import java.sql. Statement;
import java.sql.SQLException;

public class UserManage
{
	  public UserManage(){
		  super();
	  }
	  
	  public boolean Land(String Name,String Psw) throws ClassNotFoundException, SQLException{ 
			 
			 Statement statement = (Statement) new DbDriver().getConnection().createStatement();
			 ResultSet  rs  =    statement.executeQuery("select *  from member ");
			 boolean flag=false;
			 String Tempname=null;
			 String TempPsw=null;
			  while(rs.next()) {
			       Tempname=rs.getString("user_name");
			       TempPsw=rs.getString("user_psw");
			       if(Tempname!=null&&TempPsw!=null&&(Name.equals(Tempname)&&Psw.equals(TempPsw))){
			    	   flag=true;
			    	   break;
			       }
			 }
			   if(flag==true){
				   return true;
			   }
			   else return false;
		 }
	  
	 public void Zhuce(String Name,String Psw,String fname,String Tel) throws ClassNotFoundException, SQLException{ 
		 
		 Statement statement = (Statement) new DbDriver().getConnection().createStatement();
		 ResultSet  rs  =    statement.executeQuery("select *  from member");
		 if(!rs.next()) {
			 statement.execute("insert into member(user_id,user_name,user_psw,user_fname,user_tel) "
			 			+ "values ('1000','"+Name+"','"+Psw+"','"+fname+"','"+Tel+"');");
		 }
		 else {
				ResultSet set = statement.executeQuery("select max(user_id) from member;");
				if(set.next()){
					int ID = set.getInt("max(user_id)") + 1;
					 statement.execute("insert into member(user_id,user_name,user_psw,user_fname,user_tel) "
					 			+ "values ("+ID+",'"+Name+"','"+Psw+"','"+fname+"','"+Tel+"');");
				   }
		     }
	 }
	 
	 public User getInformation(String Name) throws ClassNotFoundException, SQLException{ 
		 
		 Statement statement = (Statement) new DbDriver().getConnection().createStatement();
		 ResultSet  rs  =    statement.executeQuery("select *  from member ");
		 String Tempname=null;
		 String Temppsw=null;
		 int Tempid;;
		 String Tempfname=null;
		 String Temptel=null;
		  while(rs.next()) {
			  Tempid=rs.getInt("user_id");
		       Tempname=rs.getString("user_name");
		       Temppsw=rs.getString("user_psw");
		      Tempfname=rs.getString("user_fname");
		      Temptel=rs.getString("user_tel");
		      if(Tempname.equals(Name)) {
		    	 User  ZanUser = new User(Tempid,Tempname,Temppsw,Tempfname,Temptel);
		    	   return ZanUser;
		      }
		 }
		  return new User();
	 }
	   /* public static void main(String args[]) throws Exception{
	    	UserManage  zan = new UserManage();
	    	   User  temp_user= zan.getInformation("zx");
	    	   System.out.println("sss"+temp_user.getId());
	    }*/
}
     