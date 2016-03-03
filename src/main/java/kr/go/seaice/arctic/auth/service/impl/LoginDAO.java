package kr.go.seaice.arctic.auth.service.impl;

import kr.go.seaice.common.LoginVO;
import kr.go.seaice.common.MeAbstractDAO;


//@Repository
public class LoginDAO extends MeAbstractDAO{

	
	
	/**
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectOne("loginDAO.loginAction", vo);
    }

    /**
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchId", vo);
    }

    /**
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchPassword", vo);
    }

    /**
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("loginDAO.updatePassword", vo);
    }
	
}
