package notice.service;

//p658
//article_Content테이블에 조회하는 데이터가 존재하지 않으면 익셉션이 발생된다
//그에 해당하는 사용자정의예외 클래스
public class ArticleContentNotFoundException 
	extends RuntimeException{

}
