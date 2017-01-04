//处理类，Business Logic,封装对UserData表的各种操作
package bean;
import java.sql.*;
import java.util.ArrayList;
public class Userbeancl {
	Conn con = new Conn();
	 Connection conn=con.conn();
	 Statement state=null;
	 ResultSet re =null;
	 private int rowCount=0; //一共有几条记录，查表得到 
	 private int pageCount=0;  //一共有几页，计算得到,返回
	 
	 public ArrayList al(int pageNow, int pageSize){
		 ArrayList<Userbean>al= new ArrayList<Userbean>();		
		 try {
			state =conn.createStatement();
			String sql="Select Count(*) from UserData;";
			re=state.executeQuery(sql);
			if(re.next()){
			rowCount =re.getInt(1);
			}
			if(rowCount%pageSize==0){
				pageCount =rowCount/pageSize;
				
			}else{
				pageCount = rowCount/pageSize+1;
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
				state =conn.createStatement();
				
				String sql=("select top "+pageSize+"* from UserData where Uid not in" +
						" (select top"+" "+pageSize*(pageNow-1)+" Uid From UserData) ");
				
				re=state.executeQuery(sql);
				while(re.next()){
				    Userbean ub = new Userbean();
					ub.setId(re.getInt(1));
					ub.setName(re.getString(2));
					ub.setPass(re.getString(3));
					ub.setMail(re.getString(4));
					ub.setGrade(re.getInt(5));
					al.add(ub);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				close();
			}
		 return al;
	 }
	 
	 public int getpageCount(){
		 return pageCount;
	 }
	 public void close(){
			try {
				if(re!=null){
					re.close();

				}
				if(state!=null){
	         state.close();
				}
				if(conn!=null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

	
//校对帐号和密码	
 public boolean checkit(String uname,String upasswd){
	 boolean b = false;
	 
	 try {
		 
		 if(conn.createStatement()==null){
			
		 }
		state =conn.createStatement();
		
		String sql="Select top 1 Upw from UserData where Uname='"+uname+"';";
		re=state.executeQuery(sql);
		if(re.next()){
			String pass = re.getString(1);
			if(pass.equals(upasswd)){
				b=true;
				
			}
			
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		close();
	}
	 
	 return b;
 }
 //删除方法 
 public boolean deleteit(int uid){
	 Conn conn = new Conn();
	 boolean b =false;
	 Connection con = conn.conn();
	 //PreparedStatement ps =null;
	 Statement state=null; 
	// ResultSet re =null;
	 try {
		state =con.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 String sql ="Delete from UserData where Uid ="+uid+";";
	 int a = 0;
	try {
		//a--受影响的行数
		a = state.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		 close();
	}
	 if(a==1){
	  b=true;
	 }
	
	 return b;
	
 }
 
 //更新用户方法
 /**
  * 
  * @author 小明 工位：123
  * @param uid:用户id
  * @param upw:用户密码
  * @param umail:用户邮箱
  * @param ugrade:用户级别
  * @return boolean：如果为true说明更新成功 反之亦然
  */
 public boolean update(String uid,String upw, String umail,String ugrade){
	 boolean b= false ;
	 Conn con = new Conn();
	 Connection conn = con.conn();
	 Statement state= null;
	 int c =0;
	 try {
		state = conn.createStatement();
		String sql = "Update UserData set Upw='"+upw+"',Uemail='"+umail+"',Uclass="+ugrade+" where Uid="+uid+";";
		 c = state.executeUpdate(sql);
		 if(c==1){
			 b=true;
		 }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		this.close();
	}
	 
			 return b;
 }
 
 //add新用户方法
 public boolean addUser (String uname,String upasswd,String mail,int grade){
	 boolean b =false;
 Conn con = new Conn();
 Connection conn = con.conn();
 //ResultSet re = null;
 Statement state= null;
 int r =0;
// int idd=0;
 try {
	state=conn.createStatement();
//  设置数据库自增 解决编号问题
//	String sql ="select count(*) from UserData";
//	re =state.executeQuery(sql);
//			
//	if(re.next()){
//		idd= re.getInt(1);
//		idd++;
//		
//	}
	String sql2 ="Insert into UserData values('"+uname+"','"+upasswd+"','"+mail+"',"+grade+")"
			+ " ;";
	r = state.executeUpdate(sql2);
//	System.out.print(r);
	if(r==1){
	  b=true;	
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally{
	close();
}
 

	 return b;
 }
 //查询用户方法
 public ArrayList als (String uname,String check){
	 ArrayList <Userbean> alss = new ArrayList<Userbean>();
	 Conn con = new Conn();
	 Connection conn = con.conn();
	 ResultSet re = null;
	 Statement state= null;
	 try {
		state =conn.createStatement();
		if(check.equals("1")){
		String sql1 = "select * from UserData where Uname='"+uname+"';";
		
		re=state.executeQuery(sql1);
		}else{
			 String sql2 = "select * from UserData where Uname like '"+uname+"%';";
			 re=state.executeQuery(sql2);
		}
		
		while(re.next()){
			Userbean ub = new Userbean ();
			ub.setId(re.getInt(1));
			ub.setName(re.getString(2));
			ub.setPass(re.getString(3));
			ub.setMail(re.getString(4));
			ub.setGrade(re.getInt(5));
			alss.add(ub);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 return alss;
 }

 

}

