package kr.go.seaice.arctic.board;

import java.util.HashMap;
import java.util.List;

import kr.go.seaice.common.PagingHelper;
import kr.go.seaice.mybatis.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardMapper boardMapper;
  
  private PagingHelper pagingHelper; //페이징 처리 유틸리티 클래스

//목록
//mysql  
//	public List<Article> getArticleList(String boardCd, String searchWord) {
//		Integer offset = pagingHelper.getStartRecord() - 1; //for mysql limit first number
//		Integer rowCount = pagingHelper.getNumPerPage();
//		
//		return boardMapper.selectListOfArticles(boardCd, searchWord, offset, rowCount);
//	}
  
  public List<Article> getArticleList(String boardCd, String searchWord) {
	    Integer startRownum = pagingHelper.getStartRecord();
	    Integer endRownum = pagingHelper.getEndRecord();
	    HashMap<String, String> hashmap = new HashMap<String, String>();
	    hashmap.put("boardCd", boardCd);
	    hashmap.put("searchWord", searchWord);
	    hashmap.put("start", startRownum.toString());
	    hashmap.put("end", endRownum.toString());

	    return boardMapper.selectListOfArticles(hashmap);
  	}
  
	
	//총 레코드수
	public int getTotalRecord(String boardCd, String searchWord) {
		HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		
		return boardMapper.selectCountOfArticles(hashmap);
	}

	//글쓰기
	public int addArticle(Article article) {
		return boardMapper.insert(article);
	}

	//첨부파일 추가
	public void addAttachFile(AttachFile attachFile) {
		boardMapper.insertAttachFile(attachFile);
	}
	
	//글수정
	public void modifyArticle(Article article) {
		boardMapper.update(article);
	}

	//글삭제
	public void removeArticle(Article article) {
		boardMapper.delete(article.getArticleNo());
	}

	//조회수 증가
	public void increaseHit(int articleNo) {
		boardMapper.updateHitPlusOne(articleNo);
	}

	//상세보기
	public Article getArticle(int articleNo) {
		return boardMapper.selectOne(articleNo);
	}

	//다음글
	public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		Integer no = articleNo;
		hashmap.put("articleNo", no.toString());
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		
		return boardMapper.selectNextOne(hashmap);
	}
	
	//이전글
	public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		Integer no = articleNo;
		hashmap.put("articleNo", no.toString());
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		
		return boardMapper.selectPrevOne(hashmap);
	}

	//첨부파일 리스트
	public List<AttachFile> getAttachFileList(int articleNo) {
		return boardMapper.selectListOfAttachFiles(articleNo);
	}

	//첨부파일 삭제
	public void removeAttachFile(AttachFile attachFile) {
		boardMapper.deleteFile(attachFile.getAttachFileNo());
	}

	//게시판 이름
	public String getBoardNm(String boardCd) {
		return boardMapper.selectOneBoardName(boardCd);
	}

	//댓글 쓰기
	public void addComment(Comment comment) {
		boardMapper.insertComment(comment);
	}
	
	//댓글 수정
	public void modifyComment(Comment comment) {
		boardMapper.updateComment(comment);
	}
	
	//댓글 삭제
	public void removeComment(Comment comment) {
		boardMapper.deleteComment(comment.getCommentNo());
	}
	
	//댓글 리스트
	public List<Comment> getCommentList(int articleNo) {
		return boardMapper.selectListOfComments(articleNo);
	}

	//첨부파일 찾기
	public AttachFile getAttachFile(int attachFileNo) {
		return boardMapper.selectOneAttachFile(attachFileNo);
	}

	//댓글 찾기
	public Comment getComment(int commentNo) {
		return boardMapper.selectOneComment(commentNo);
	}
	
	public int getListItemNo() {
		return pagingHelper.getListItemNo();
	}
	
	public int getPrevPage() {
		return pagingHelper.getPrevPage();
	}
	
	public int getFirstPage() {
		return pagingHelper.getFirstPage();
	}
	
	public int getLastPage() {
		return pagingHelper.getLastPage();
	}
	
	public int getNextPage() {
		return pagingHelper.getNextPage();
	}

	public void setPagingHelper(PagingHelper pagingHelper) {
		this.pagingHelper = pagingHelper;
	}

}