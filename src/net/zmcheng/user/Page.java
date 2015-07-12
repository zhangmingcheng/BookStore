package net.zmcheng.user;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql. Statement;
import java.sql.SQLException;

public class Page {
 
	private int pageSize=8;//一页显示的记录数
    int pageCount;//总共的页数
	public Page(){
		super();
	}
	//获取总页数函数
	public int  Page() throws ClassNotFoundException, SQLException{ 
		String sql = "SELECT * FROM member";
		Statement  stat = new DbDriver().getConnection().createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
		ResultSet rs = stat.executeQuery(sql);
		rs.last();//将游标移动到最后一行
		int size = rs.getRow();//获得最后一行行数
		//计算分页后的总数
        pageCount=(size%pageSize==0)?(size/pageSize):(size/pageSize+1);
        return pageCount;
	}
  
}
