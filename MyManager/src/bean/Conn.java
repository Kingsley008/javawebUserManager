//封装数据库连接
package bean;

import java.sql.*;

public class Conn {
	private String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	                
	private String url="jdbc:sqlserver://localhost:1433;DatabaseName=sqltest";

	private String uname="sa";
	private String pass="wbd_12345";

public Connection conn(){
      Connection conn= null;
	try {
		Class.forName(driver);//加载驱动
		conn= DriverManager.getConnection(url,uname, pass);//得到链接
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return conn;//返回这个连接
}
	


}
