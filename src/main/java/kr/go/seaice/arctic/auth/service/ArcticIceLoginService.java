package kr.go.seaice.arctic.auth.service;


import org.springframework.security.access.prepost.PreAuthorize;

import kr.go.seaice.common.LoginVO;

public interface ArcticIceLoginService {
	
	/**
	 * @return LoginVO
	 * 
	 * @param vo    LoginVO
	 * @exception Exception Exception
	 */
//	public LoginVO loginAction(LoginVO vo)
//	  throws Exception;
	
	 public LoginVO login(String id, String pw);

	  //회원가입
	  public void addUser(LoginVO user);

	  //회원권한 추가
	  public void addAuthority(String userid, String authority);


	  //내 정보 수정
	  @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	  public int editAccount(LoginVO user);

	  //비밀번호 변경
	  @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	  public int changePasswd(String currentPasswd, String newPasswd, String userid);

	  @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER') and #user.userid == principal.username")
	  public void bye(LoginVO user);

	  @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	  public LoginVO getUser(String userid);
}
