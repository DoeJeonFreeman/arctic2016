package kr.go.seaice.mybatis;

import kr.go.seaice.common.LoginVO;

import org.apache.ibatis.annotations.Param;


public interface ArcticUserMapper {
	
    public void insert(LoginVO user);
    
    public void insertAuthority(@Param("userid") String userid, @Param("authority") String authority);
    
    public void deleteAuthority(@Param("userid") String userid); 
    
    
    /**
     * @param vo LoginVO --> id/pw
     * @return LoginVO
     * @exception Exception
     */
    public LoginVO login(
    		@Param("userid") String userid,
    		@Param("userpw") String userpw);  
    

    public int update(LoginVO user);

    public int updatePasswd(
      @Param("currentPasswd") String currentPasswd, 
      @Param("newPasswd") String newPasswd, 
      @Param("userid") String userid);

    public int delete(LoginVO user);

    
    public LoginVO selectOne(String email);
    
    
    
    
}
