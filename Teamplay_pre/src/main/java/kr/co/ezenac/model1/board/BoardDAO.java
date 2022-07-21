package kr.co.ezenac.model1.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import kr.co.ezenac.model1.common.JDBConnection;

public class BoardDAO extends JDBConnection{         
   
   public BoardDAO(ServletContext application) {      
      super(application);                        
   }
   
   public int selectCount(Map<String, Object> map) {
      int totalCount = 0;      //결과(게시물 수)를 담는 변수
      
      String query = "SELECT COUNT(*) FROM BOARD";
      
      if(map.get("searchWord") != null) {
         query += " WHERE " +map.get("searchField") + " " 
               + " LIKE '%" +map.get("searchWord") + "%'";
      }
      
      try {
         stmt = con.createStatement();   
         rs = stmt.executeQuery(query);      
         rs.next();                  
         totalCount = rs.getInt(1);      
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return totalCount;
   }
   
   public List<BoardDTO> selectList(Map<String, Object> map) {
      List<BoardDTO> bbs = new ArrayList<>();      
      
      String query = "SELECT * FROM BOARD";
      
      if(map.get("searchWord") != null) {        
         query += " WHERE " +map.get("searchField") + " " 
               + " LIKE '%" +map.get("searchWord") + "%'";
      }
      
      query += " ORDER BY NUM DESC ";     
      
      try {
         stmt = con.createStatement();   
         rs = stmt.executeQuery(query);   

         while(rs.next()) {
            //쿼리 실행 결과인 게시물 내용을 dto에 저장
            BoardDTO dto = new BoardDTO();
            dto.setNum(rs.getString("num"));           
            dto.setTitle(rs.getNString("title"));          
            dto.setContent(rs.getString("content"));      
            dto.setPostdate(rs.getDate("postdate"));      
            dto.setId(rs.getString("id"));                
            dto.setVisitcount(rs.getString("visitcount"));   
            dto.setUpfile(rs.getString("upfile"));         
            
            bbs.add(dto);                           
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return bbs;
   }
   
   public int insertWrite(BoardDTO dto) {
      int result = 0;
      
      String query = "INSERT INTO board(num,title,content,id,visitcount,upfile) "
                +"VALUES (seq_board_num.nextval,?,?,?,0,?)";
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, dto.getTitle());
         psmt.setString(2, dto.getContent());
         psmt.setString(3, dto.getId());
         psmt.setString(4, dto.getUpfile());
         
         result = psmt.executeUpdate();
         
         
      } catch (SQLException e) {
         System.out.println("게시물 입력 중 예외 발생");
         e.printStackTrace();
      }
      
      return result;
   }
   
   public BoardDTO selectView (String num) {      
      BoardDTO dto = new BoardDTO();
      
      String query = "SELECT b.*, m.NAME "
                  + "FROM MEMBER m "
                  + "INNER JOIN BOARD b ON m.ID = b.ID "
                  + "WHERE num = ?"; 
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, num);    
         rs = psmt.executeQuery();   
         
         if (rs.next()) {         
            dto.setNum(rs.getString(1));
            dto.setTitle(rs.getString(2));
            dto.setContent(rs.getString("content"));
            dto.setPostdate(rs.getDate("postdate"));
            dto.setId(rs.getString("id"));
            dto.setVisitcount(rs.getString(6));
            dto.setName(rs.getString("name"));      
            dto.setUpfile(rs.getString("upfile"));
            
         }
         
      } catch (SQLException e) {
         System.out.println("게시물 상세보기 중 예외 발생");
         e.printStackTrace();
      }
      
      return dto;         
   }
   
   public void updateVisitCount(String num) {   
      
      String query = "UPDATE BOARD SET VISITCOUNT = VISITCOUNT + 1 "
                 +"WHERE NUM = ?";
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, num);            
         psmt.executeQuery();            
         
      } catch (SQLException e) {
         System.out.println("게시물 조회수 증가 중 예외 발생");
         e.printStackTrace();
      }
   }
   
   public int updateEdite(BoardDTO dto) {
      int result = 0;
      
      String query = "UPDATE BOARD SET TITLE = ?, CONTENT = ? "
                  +"WHERE NUM = ?";
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, dto.getTitle());
         psmt.setString(2, dto.getContent());
         psmt.setString(3, dto.getNum());
         
         result = psmt.executeUpdate();     
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return result;                     
   }
   
   public int deletPost(BoardDTO dto) {
      int result = 0;
      
      String query = "DELETE FROM BOARD  WHERE NUM = ?";
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, dto.getNum());
         
         result = psmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return result;
   }
}