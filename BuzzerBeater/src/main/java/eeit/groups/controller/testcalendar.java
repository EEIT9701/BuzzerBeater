package eeit.groups.controller;

import java.sql.Date;
import java.util.Calendar;

public class testcalendar {

	public static void main(String[] args) {
		Date date = Date.valueOf("2017-11-30");
		System.out.println(date);
		System.out.println(date.after(Calendar.getInstance().getTime()));
		System.out.println(Calendar.getInstance().getTime());

	}

}
