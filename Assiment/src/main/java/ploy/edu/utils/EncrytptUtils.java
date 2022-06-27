package ploy.edu.utils;

import org.mindrot.jbcrypt.BCrypt;

public class EncrytptUtils {
	
	public static String Encrypt(String origin) {
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		return encrypt;
	}
	
	public static boolean check(String origin,String encrytpt) {
		return BCrypt.checkpw(origin, encrytpt);
	}

}
