package kr.go.seaice.arctic.auth.service.impl;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

public class SimplePasswordEncodingTester {
	public static void main(String[] args) {
//		ShaPasswordEncoder pe =new ShaPasswordEncoder();
//		pe.setEncodeHashAsBase64(true);
		ShaPasswordEncoder pe =new ShaPasswordEncoder(256);
		String raw = "goqld1357!";  //해빙1357!
		String salt = "EmiyaMulzomdao";
		String encoded = pe.encodePassword(raw, salt);
		System.out.println(encoded);
	}
}
