package kr.go.seaice.mybatis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.go.seaice.arctic.board.Article;
import kr.go.seaice.arctic.board.AttachFile;
import kr.go.seaice.arctic.board.Comment;

public interface BoardMapper {
	
	//list mysql Aug 2015
		public List<Article> selectListOfArticles(
				@Param("boardCd") String boardCd,
				@Param("searchWord") String searchWord,
				@Param("offset") Integer offset,
				@Param("rowCount") Integer rowCount);	
	
//	//list for oracle Sep 2015
	  public List<Article> selectListOfArticles(HashMap<String, String> hashmap);  

	  //count of totalRecord
	  public int selectCountOfArticles(HashMap<String, String> hashmap);

	  public int insert(Article article);   

	  public void insertAttachFile(AttachFile attachFile);

	  public void update(Article article);  

	  public void delete(int articleNo);

	  public void updateHitPlusOne(int articleNo);  

	  public Article selectOne(int articleNo);

	  public Article selectNextOne(HashMap<String, String> hashmap); 

	  public Article selectPrevOne(HashMap<String, String> hashmap);

	  public List<AttachFile> selectListOfAttachFiles(int articleNo);    

	  public void deleteFile(int attachFileNo); 

	  public String selectOneBoardName(String boardCd);

	  public void insertComment(Comment comment);   

	  public void updateComment(Comment comment);

	  public void deleteComment(int commentNo);

	  public List<Comment> selectListOfComments(int articleNo);

	  public AttachFile selectOneAttachFile(int attachFileNo);

	  public Comment selectOneComment(int commentNo);
}
