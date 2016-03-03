package kr.go.seaice.arctic.board.spring;

import java.io.File;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import kr.go.seaice.common.LoginVO;
import kr.go.seaice.common.PagingHelper;
import kr.go.seaice.common.WebContants;
import kr.go.seaice.common.meException.AuthenticationException;
import kr.go.seaice.arctic.board.Article;
import kr.go.seaice.arctic.board.AttachFile;
import kr.go.seaice.arctic.board.BoardService;
import kr.go.seaice.arctic.board.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/bbs")
public class BbsController {
    
    @Autowired
    private BoardService boardService;
    
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String list(String boardCd, Integer curPage, String searchWord, Model model) {
        
        int numPerPage = 10;
        int pagePerBlock = 10;
        
        int totalRecord = boardService.getTotalRecord(boardCd, searchWord);
        
        PagingHelper pagingHelper = 
        		new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);
        boardService.setPagingHelper(pagingHelper);

        List<Article> list = boardService.getArticleList(boardCd, searchWord);
        String boardNm = boardService.getBoardNm(boardCd);
        Integer listItemNo = boardService.getListItemNo();
        Integer prevPage = boardService.getPrevPage();
        Integer nextPage = boardService.getNextPage();
        Integer firstPage = boardService.getFirstPage();
        Integer lastPage = boardService.getLastPage();
        
        model.addAttribute("list", list);
        model.addAttribute("boardNm", boardNm);
        model.addAttribute("listItemNo", listItemNo);
        model.addAttribute("prevPage", prevPage);
        model.addAttribute("nextPage", nextPage);
        model.addAttribute("firstPage", firstPage);
        model.addAttribute("lastPage", lastPage);
        
        return "bbs/list";
    }
    
    
    @RequestMapping(value="/write_form", method=RequestMethod.GET)
    public String writeForm(String boardCd, Model model) {
        String boardNm = boardService.getBoardNm(boardCd);
        model.addAttribute("boardNm", boardNm);
        model.addAttribute("article", new Article());
        
        return "bbs/write_form";
    }

    @RequestMapping(value="/write", method=RequestMethod.POST)
    public String write(@Valid Article article,
    		BindingResult bindingResult,
    		Model model,
    		MultipartHttpServletRequest mpRequest,
    		Principal principal) throws Exception {
         
    	 if (bindingResult.hasErrors()) {
    		 String boardNm = boardService.getBoardNm(article.getBoardCd());
    		 model.addAttribute("boardNm", boardNm);
    		 
    		 return "bbs/write_form";
    	 }
    	 
         article.setUserid(principal.getName());
        
         article.setBoardCd(removeSuperBad(article.getBoardCd()));
         article.setContent(removeSuperBad(article.getContent()));
         article.setTitle(removeSuperBad(article.getTitle()));
        
        boardService.addArticle(article);

        //upload file
        Iterator<String> it = mpRequest.getFileNames();
        List<MultipartFile> fileList = new ArrayList<MultipartFile>();
        while (it.hasNext()) {
            MultipartFile multiFile = mpRequest.getFile((String) it.next());
            if (multiFile.getSize() > 0) {
                String filename = multiFile.getOriginalFilename();
                //multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
                fileList.add(multiFile);
            }
        }
        
        
        //insert filedata into db
        int size = fileList.size();
        for (int i = 0; i < size; i++) {
            MultipartFile mpFile = fileList.get(i);
            AttachFile attachFile = new AttachFile();
            String filename = mpFile.getOriginalFilename();
            attachFile.setFilename(removeSuperBad(filename));
       
	        //me 15 Nov 2015    
	        if(!checkVulnerability(filename)){
	        	break;
	        }  
	        //me 07 Oct 2015    
	        String pseudoname = "nmsc"+System.currentTimeMillis() + "oj." + filename.substring(filename.indexOf(".") + 1, filename.length());
	        mpFile.transferTo(new File(WebContants.UPLOAD_PATH + pseudoname));
	    	attachFile.setPseudoname(pseudoname);
	    	//me 07 Oct 2015    
	    	
            attachFile.setFiletype(mpFile.getContentType());
            attachFile.setFilesize(mpFile.getSize());
            attachFile.setArticleNo(article.getArticleNo());
            attachFile.setUserid(principal.getName());
            boardService.addAttachFile(attachFile);
        }
        
        return "redirect:/bbs/list?curPage=1&boardCd=" + article.getBoardCd();
    }

    	
    
    private String removeSuperBad(String str){
    	if(str != null){
    		System.out.println("======================");
    		System.out.println(str);
 		    str = str.replaceAll("\"","&gt;");
	        str = str.replaceAll("&", "&amp;");
	        str = str.replaceAll("<", "&lt;");
	        str = str.replaceAll(">", "&gt;");
	        str = str.replaceAll("%00", null);
	        str = str.replaceAll("\"", "&#34;");
	        str = str.replaceAll("\'", "&#39;");
	        str = str.replaceAll("%", "&#37;");    
	        str = str.replaceAll("../", "");
	        str = str.replaceAll("..\\\\", "");
	        str = str.replaceAll("./", "");
	        str = str.replaceAll("%2F", "");
	        System.out.println(str);
    	}
    	return str;
    }
    
    /*check vulnerability*/
    private boolean checkVulnerability(String fileName){
    	boolean isSafe = false;
    	String fileExt = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
    	String blockExt[] = {"jsp","jspx"};
//    	for(int i=0; i<blockExt.length;i++) {
//	    	if( blockExt[i].equals(fileExt) ){
//	    		isSafe = false;
//	    		break;
//    	    }
//    	}
    	
    	String allowExt[] = {"pdf","hwp","doc","xls","ppt","docx","xlsx","pptx"};
    	for(int i=0; i<allowExt.length;i++) {
    		if( allowExt[i].equals(fileExt) ){
    			isSafe = true;
    			break;
    		}
    	}
    	 
    	// Windows일 경우 (.) 및 세미콜론 파싱 오류 관련 처리
    	if(fileExt.length() == 0 ) {
    		isSafe = false;
    	}
    	if(fileName.contains(";")) {
    		isSafe = false;
    	}
    	return isSafe;
    }
    
    @RequestMapping(value="/view", method=RequestMethod.GET)
    public String view(Integer articleNo, 
            String boardCd, 
            Integer curPage,
            String searchWord,
            Model model) {

        boardService.increaseHit(articleNo);
        
        Article article = boardService.getArticle(articleNo);//상세보기에서 볼 게시글
        List<AttachFile> attachFileList = boardService.getAttachFileList(articleNo);
        Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
        Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
        List<Comment> commentList = boardService.getCommentList(articleNo);
        String boardNm = boardService.getBoardNm(boardCd);
        
        //상세보기에서 볼 게시글 관련 정보
        String title = article.getTitle();//제목
        String content = article.getContent();//내용
        content = content.replaceAll(WebContants.LINE_SEPARATOR, "<br />");
        int hit = article.getHit();//조회수
        String name = article.getName();//작성자 이름
        String userid = article.getUserid();//작성자 ID
        String regdate = article.getRegdateForView();//작성일

        model.addAttribute("title", title);
        model.addAttribute("content", content);
        model.addAttribute("hit", hit);
        model.addAttribute("name", name);
        model.addAttribute("userid", userid);
        model.addAttribute("regdate", regdate);
        model.addAttribute("attachFileList", attachFileList);
        model.addAttribute("nextArticle", nextArticle);
        model.addAttribute("prevArticle", prevArticle);
        model.addAttribute("commentList", commentList);

        //목록관련
        int numPerPage = 10;//페이지당 레코드 수
        int pagePerBlock = 10;//블록당 페이지 링크수
        
        int totalRecord = boardService.getTotalRecord(boardCd, searchWord);
        PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);
        boardService.setPagingHelper(pagingHelper);

        List<Article> list = boardService.getArticleList(boardCd, searchWord);
        
        int listItemNo = boardService.getListItemNo();
        int prevPage = boardService.getPrevPage();
        int nextPage = boardService.getNextPage();
        int firstPage = boardService.getFirstPage();
        int lastPage = boardService.getLastPage();
        
        model.addAttribute("list", list);
        model.addAttribute("listItemNo", listItemNo);
        model.addAttribute("prevPage", prevPage);
        model.addAttribute("firstPage", firstPage);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("nextPage", nextPage);
        model.addAttribute("boardNm", boardNm);
        
        return "bbs/view";
    }
    
    @RequestMapping(value="/addComment", method=RequestMethod.POST)
    public String addComment(Integer articleNo, 
            String boardCd, 
            Integer curPage, 
            String searchWord,
            String memo,
            Principal principal) throws Exception {
        
        Comment comment = new Comment();
        comment.setArticleNo(articleNo);
        comment.setUserid(removeSuperBad(principal.getName()));
        comment.setMemo(removeSuperBad(memo));
        
     	System.out.println(memo);
    	System.out.println(comment.getMemo());
        
        boardService.addComment(comment);
        
        searchWord = URLEncoder.encode(searchWord,"UTF-8");
        
        return "redirect:/bbs/view?articleNo=" + articleNo + 
            "&boardCd=" + boardCd + 
            "&curPage=" + curPage + 
            "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/updateComment", method=RequestMethod.POST)
    public String updateComment(Integer commentNo, 
            Integer articleNo, 
            String boardCd, 
            Integer curPage, 
            String searchWord, 
            String memo) throws Exception {
        
        Comment comment = boardService.getComment(commentNo);
        comment.setMemo(removeSuperBad(comment.getMemo()));
        boardService.modifyComment(comment);
        
        searchWord = URLEncoder.encode(searchWord, "UTF-8");
        
        return "redirect:/bbs/view?articleNo=" + articleNo + 
            "&boardCd=" + boardCd + 
            "&curPage=" + curPage + 
            "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/deleteComment", method=RequestMethod.POST)
    public String deleteComment(Integer commentNo, 
            Integer articleNo, 
            String boardCd, 
            Integer curPage, 
            String searchWord) throws Exception {
        
        Comment comment = boardService.getComment(commentNo);
        boardService.removeComment(comment);
//        boardService.removeComment(comment.getCommentNo());
        
        searchWord = URLEncoder.encode(searchWord,"UTF-8");
        
        return "redirect:/bbs/view?articleNo=" + articleNo + 
            "&boardCd=" + boardCd + 
            "&curPage=" + curPage + 
            "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/modify_form", method=RequestMethod.GET)
    public String modifyForm(Integer articleNo, 
            String boardCd,
            Model model) {
        
        Article article = boardService.getArticle(articleNo);
        String boardNm = boardService.getBoardNm(boardCd);
        
         //수정페이지에서의 보일 게시글 정보
        model.addAttribute("article", article);
        model.addAttribute("boardNm", boardNm);
        
        return "bbs/modify_form";
    }
    
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String modify(@Valid Article article,
    		BindingResult bindingResult,
    		Integer curPage,
    		String searchWord,
    		Model model,
    		MultipartHttpServletRequest mpRequest) throws Exception {
         
    	 if (bindingResult.hasErrors()) {
    		 String boardNm = boardService.getBoardNm(article.getBoardCd());
    		 model.addAttribute("boardNm", boardNm);
    		 
    		 return "bbs/modify_form";
    	 }
    	 
    	 
        String userid = boardService.getArticle(article.getArticleNo()).getUserid();
        article.setUserid(userid);
         
        article.setTitle(removeSuperBad(article.getTitle()));
        article.setContent(removeSuperBad(article.getContent()));
         //게시글 수정
        boardService.modifyArticle(article);

         //파일업로드
        Iterator<String> it = mpRequest.getFileNames();
        List<MultipartFile> fileList = new ArrayList<MultipartFile>();
        while (it.hasNext()) {
            MultipartFile multiFile = mpRequest.getFile((String) it.next());
            if (multiFile.getSize() > 0) {
                String filename = multiFile.getOriginalFilename();
                //multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename)); //doejeon 1116, 2015
                fileList.add(multiFile);
            }
        }
        
 
   	    
         //파일데이터 삽입
        int size = fileList.size();
        for (int i = 0; i < size; i++) {
            MultipartFile mpFile = fileList.get(i);
            AttachFile attachFile = new AttachFile();
            String filename = mpFile.getOriginalFilename();
            attachFile.setFilename(filename);								//
            
            //me 15 Nov 2015    
            if(!checkVulnerability(filename)){
            	break;
            }  
            //me 07 Oct 2015    
            String pseudoname = "nmsc"+System.currentTimeMillis() + "oj." + filename.substring(filename.indexOf(".") + 1, filename.length());
            mpFile.transferTo(new File(WebContants.UPLOAD_PATH + pseudoname));
        	attachFile.setPseudoname(pseudoname);
        	//me 07 Oct 2015
            
            
            attachFile.setFiletype(mpFile.getContentType());				//
            attachFile.setFilesize(mpFile.getSize());						//
            attachFile.setArticleNo(article.getArticleNo());				//
            attachFile.setUserid(article.getUserid());//첨부파일 소유자는 원글 소유자가 되도록 //
            boardService.addAttachFile(attachFile);
        }
        
        searchWord = URLEncoder.encode(searchWord,"UTF-8");
        
        return "redirect:/bbs/view?articleNo=" + article.getArticleNo() 
            + "&boardCd=" + article.getBoardCd() 
            + "&curPage=" + curPage 
            + "&searchWord=" + searchWord;

    }

/*    @RequestMapping(value="/download", method=RequestMethod.POST)
    public String download(String filename, Model model) {
        model.addAttribute("filename", filename);

        return "inc/download";
    }
*/
    @RequestMapping(value="/deleteAttachFile", method=RequestMethod.POST)
    public String deleteAttachFile(Integer attachFileNo, 
            Integer articleNo, 
            String boardCd, 
            Integer curPage, 
            String searchWord) throws Exception {
        
        AttachFile attachFile = boardService.getAttachFile(attachFileNo);
        boardService.removeAttachFile(attachFile);
//        boardService.removeAttachFile(attachFileNo);
        
        searchWord = URLEncoder.encode(searchWord,"UTF-8");
        
        return "redirect:/bbs/view?articleNo=" + articleNo + 
            "&boardCd=" + boardCd + 
            "&curPage=" + curPage + 
            "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/del", method=RequestMethod.POST)
    public String del(Integer articleNo, 
            String boardCd, 
            Integer curPage, 
            String searchWord) throws Exception {
        
        Article article = boardService.getArticle(articleNo);
        boardService.removeArticle(article);
//        boardService.removeArticle(article.getArticleNo());

        searchWord = URLEncoder.encode(searchWord, "UTF-8");
        
        return "redirect:/bbs/list?boardCd=" + boardCd + 
            "&curPage=" + curPage + 
            "&searchWord=" + searchWord;

    }
    
}