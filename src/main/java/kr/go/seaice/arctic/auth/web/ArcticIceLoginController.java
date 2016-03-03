package kr.go.seaice.arctic.auth.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.seaice.arctic.auth.service.ArcticIceLoginService;
import kr.go.seaice.common.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ArcticIceLoginController {

	/** TimeSeriesChartService */
//	@Resource(name="loginService")
	@Autowired
	private ArcticIceLoginService arcticiceloginService;
	
	 
		/**
		 * @param vo -LoginVO
		 * @return login page
		 * @exception Exception
		 * 
		 * /uat/uia/arcticUser.do
		 * 
		 */
	    @RequestMapping(value="/arctic/auth/admin/login.action")
		public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO,
				HttpServletRequest request,
				HttpServletResponse response,
				ModelMap model) 
				throws Exception {
	    	return "cmm/auth/ArcticAdminLogin";
		}
	
/*	    
	    @RequestMapping(value="/signUp", method=RequestMethod.GET)
	    public String signUp(Model model) {
	      model.addAttribute(WebContants.USER_KEY, new LoginVO());	  
	      return "cmm/meSignUp";
	    }

	    @RequestMapping(value="/signUp", method=RequestMethod.POST)
	    public String signUp(@Valid LoginVO user, BindingResult bindingResult) {
	      if (bindingResult.hasErrors()) {
	        return "cmm/meSignUp";	
	      }
	      
	      String authority = "ROLE_ADMIN";
	      
	      
	      arcticiceloginService.addUser(user);
	      arcticiceloginService.addAuthority(user.getUserid(), authority);
	      
//	      return "redirect:/users/welcome";
	      return "cmm/snippet";
	    }

	    @RequestMapping(value="/welcome", method=RequestMethod.GET)
	    public String welcome() {
	      return "users/welcome";
	    }

	    @RequestMapping(value="/login", method=RequestMethod.GET)
	    public String login() {
	      return "users/login";
	    }
	      
	    @RequestMapping(value="/editAccount", method=RequestMethod.GET)
	    public String editAccount(Principal principal, Model model) {
	      LoginVO user = arcticiceloginService.getUser(principal.getName());
	      model.addAttribute(WebContants.USER_KEY, user);
	      
	      return "users/editAccount";
	    }
	      
	    @RequestMapping(value="/editAccount", method=RequestMethod.POST)
	    public String editAccount(@Valid LoginVO user, BindingResult bindingResult, Principal principal) {
	      
	      if (bindingResult.hasErrors()) {
	      	return "users/editAccount";
	      }
	      
	      user.setUserid(principal.getName());

	      int check = arcticiceloginService.editAccount(user);
	      if (check < 1) {
	      	throw new AccessDeniedException("현재 비밀번호가 틀립니다.");
	      }
	      
	      return "redirect:/users/changePasswd";
	          
	    }
	      
	    @RequestMapping(value="/changePasswd", method=RequestMethod.GET)
	    public String changePasswd(Principal principal, Model model) {
	      LoginVO user = arcticiceloginService.getUser(principal.getName());
	      
	      model.addAttribute(WebContants.USER_KEY, user);
	      model.addAttribute("password", new Password());
	          
	      return "users/changePasswd";
	    }
	      
	    @RequestMapping(value="/changePasswd", method=RequestMethod.POST)
	    public String changePasswd(@Valid Password password, 
	  		  BindingResult bindingResult, 
	  		  Model model,
	  		  Principal principal) {
	  	  
	      if (bindingResult.hasErrors()) {
	      	LoginVO user = arcticiceloginService.getUser(principal.getName());
	      	model.addAttribute(WebContants.USER_KEY, user);
	      	
	      	return "users/changePasswd";
	      }
	      
	      int check = arcticiceloginService.changePasswd(password.getCurrentPasswd(), 
	      		password.getNewPasswd(), principal.getName());
	      
	      if (check < 1) {
	        throw new AccessDeniedException("현재 비밀번호가 틀립니다.");
	      } 
	      
	      return "redirect:/users/changePasswd_confirm";
	          
	    }
	      
	    @RequestMapping(value="/changePasswd_confirm", method=RequestMethod.GET)
	    public String changePasswd_confirm() {
	      return "users/changePasswd_confirm";
	    }
	      
	    @RequestMapping(value="/bye", method=RequestMethod.GET)
	    public String bye() {
	      return "users/bye";
	    }

	    @RequestMapping(value="/bye", method=RequestMethod.POST)
	    public String bye(String email, String passwd, HttpServletRequest req) 
	  		throws ServletException {
	      
    	  LoginVO user = arcticiceloginService.login(email, passwd);
    	  arcticiceloginService.bye(user);
//	      req.logout();
    	  ///j_spring_security_logout
	      
	      return "redirect:/users/bye_confirm";
	    }

	    @RequestMapping(value="/bye_confirm", method=RequestMethod.GET)
	    public String byeConfirm() {
	      return "users/bye_confirm";	  
	    }
	    */
	    
}
