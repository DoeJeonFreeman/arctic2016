package kr.go.seaice.arctic.auth.service.impl;

import kr.go.seaice.arctic.auth.service.ArcticIceLoginService;
import kr.go.seaice.common.LoginVO;
import kr.go.seaice.mybatis.ArcticUserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

@Service("loginService")
public class ArcticIceLoginServiceImpl implements ArcticIceLoginService{
	
	
	@Autowired 
	ArcticUserMapper userMapper;
	
//	@Autowired 
//	private ShaPasswordEncoder  shaPasswordEncoder;
	
	
	/* (non-Javadoc)
	 * @see kr.go.seaice.arctic.auth.service.ArcticIceLoginService#addUser(kr.go.seaice.common.LoginVO)
	 * @ see meContext-security.xml <authentication-manager>
	 */
	public void addUser(LoginVO user) {
//		String staticSalt = "EmiyaMulzomdao";
//		System.out.println(this.shaPasswordEncoder.encodePassword(user.getUserpw(), staticSalt));
//		user.setUserpw(this.shaPasswordEncoder.encodePassword(user.getUserpw(), staticSalt));
	    userMapper.insert(user);
	  }

	  public void addAuthority(String userid, String authority) {
	    userMapper.insertAuthority(userid, authority);
	  }
	  
	  public LoginVO login(String userid, String passwd) {
	    return userMapper.login(userid, passwd);
	  }
	  
	  public int editAccount(LoginVO user) {
	    return userMapper.update(user);
	  }

	  public int changePasswd(String currentPasswd, String newPasswd, String userid) {
	    return userMapper.updatePasswd(currentPasswd, newPasswd, userid);
	  }

	  public void bye(LoginVO user) {
	    userMapper.deleteAuthority(user.getUserid());
	    userMapper.delete(user);
	  }

	  public LoginVO getUser(String userid) {
	    return userMapper.selectOne(userid);
	  }


}
