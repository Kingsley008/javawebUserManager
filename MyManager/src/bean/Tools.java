package bean;

public class Tools {
//提供一个方法解决中文乱码
	public static String getNewString(String input){
		String result="";
		try {
			result = new String(input.getBytes("iso-8859-1"),"UTF-8");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}
