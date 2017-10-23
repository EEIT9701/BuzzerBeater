package eeit.filter;

public class subtime {

	public static void main(String[] args) {
		String t = "insert into PersonalData values ('70018','4001','3002','35:11','10','20','1','1','5','6','8','6','3','1','0','2','1','26','1');";
		String[] arr = t.split("\'");
		String[] ms = arr[7].split(":");
		int i = (new Integer(ms[0])*60)+new Integer(ms[1]);
		arr[7]= Integer.toString(i);
		System.out.println(arr[7]);

	}

}
