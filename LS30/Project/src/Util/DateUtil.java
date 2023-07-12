package Util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.Date;
import java.util.Properties;

public class DateUtil {
	
	public static final Properties errors =new Properties();
	static {
		try {
			InputStream is=new FileInputStream("errors.config");
			errors.load(is);
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static LocalDate dateToLocalDate(Date date) {
		return LocalDate.ofEpochDay(date.getTime()/86400000).plusDays(1);
	}
	
}
