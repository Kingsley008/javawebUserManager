package bean;

public class Tools {
//�ṩһ�����������������
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
