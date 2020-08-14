package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.QnaCommentDto;
import dto.QnaDto;

public class QnaDao {

   private static QnaDao dao = new QnaDao();
   
   private QnaDao() {
   }

   public static QnaDao getInstance() {
      return dao;
   }

   public List<QnaDto> getQnaList() {
      
      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM BG_QNA "
               + " ORDER BY WDATE DESC";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<QnaDto> list = new ArrayList<QnaDto>();
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaList success");
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 getQnaList success");
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaList success");
         
         while (rs.next()) {
            int i = 1;
            QnaDto dto = new QnaDto( rs.getInt(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++)   );
            list.add(dto);            
         }
         System.out.println("4/6 getQnaList success");
         
      } catch (SQLException e) {
         System.out.println("getQnaList fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }      
      return list;
   }
   
   
   public List<QnaDto> getQnaNoticeList() {
      
      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM BG_QNA "
               + " WHERE ID IN (SELECT ID FROM BG_MEMBER WHERE AUTH=1) AND DEL=0"
               + " ORDER BY WDATE DESC ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<QnaDto> list = new ArrayList<QnaDto>();
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaNoticeList success");
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 getQnaNoticeList success");
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaNoticeList success");
         
         while (rs.next()) {
            int i = 1;
            QnaDto dto = new QnaDto( rs.getInt(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++)   );
            list.add(dto);            
         }
         System.out.println("4/6 getQnaNoticeList success");
         
      } catch (SQLException e) {
         System.out.println("getQnaNoticeList fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }      
      return list;
   }
   
   

   public boolean setQnaWrite(QnaDto dto) {
      
      String sql = " INSERT INTO BG_QNA (SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA )"
               + " VALUES (SEQ_BG_QNA.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, 0, 0, 0) ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;
         
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaWrite Success");
         
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 setQnaWrite Success");
         
         psmt.setString(1, dto.getId());
         psmt.setString(2, dto.getTitle());
         psmt.setString(3, dto.getContent());
         psmt.setInt(4, dto.getIs_secret());
         
         count = psmt.executeUpdate();
         System.out.println("3/6 setQnaWrite Success");
         
      } catch (SQLException e) {
         System.out.println("setQnaWrite fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);         
      }
      return count>0?true:false;
   }

   public QnaDto getQnaDetail(int seq) {
      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM BG_QNA "
               + " WHERE SEQ=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      QnaDto dto = null;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaDetail success");
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 getQnaDetail success");
         psmt.setInt(1, seq);
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaDetail success");
         
         if(rs.next()) {
            int i = 1;
            dto = new QnaDto( rs.getInt(i++),
                         rs.getString(i++),
                         rs.getString(i++),
                         rs.getString(i++),
                         rs.getString(i++),
                         rs.getInt(i++),
                         rs.getInt(i++),
                         rs.getInt(i++),
                         rs.getInt(i++),
                         rs.getInt(i++)   );
         }
         System.out.println("4/6 getQnaDetail success");
         
      } catch (SQLException e) {
         System.out.println("getQnaDetail fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);
      }
      return dto;
   }

   public boolean setQnaUpdate(int seq, String title, String content, int is_secret) {
      String sql = " UPDATE BG_QNA "
               + " SET TITLE=?, CONTENT=?, IS_SECRET=? "
               + " WHERE SEQ=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;

      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaUpdate Success");
         
         psmt=conn.prepareStatement(sql);
         System.out.println("2/6 setQnaUpdate Success");
         
         psmt.setString(1, title);
         psmt.setString(2, content);
         psmt.setInt(3, is_secret);
         psmt.setInt(4, seq);
         System.out.println("3/6 setQnaUpdate Success");
         
         count = psmt.executeUpdate();
         System.out.println("4/6 setQnaUpdate Success");
         
      } catch (SQLException e) {
         System.out.println("setQnaUpdate Fail");
         e.printStackTrace();
      } finally{
         DBClose.close(psmt, conn, null);
         System.out.println("5/6 S updateBbs");
      }      
      return count>0?true:false;
   }

   public boolean setQnaDelete(int seq) {
      String sql = " UPDATE BG_QNA "
               + " SET DEL=1 "
               + " WHERE SEQ=? ";
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaDelete Success");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         System.out.println("2/6 setQnaDelete Success");
         
         count = psmt.executeUpdate();
         System.out.println("3/6 setQnaDelete Success");
         
      } catch (Exception e) {      
         System.out.println("setQnaDelete Fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);         
      }
      
      return count>0?true:false;
   }

   public List<QnaDto> getQnaSearchList(String choice, String searchWord) {
      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM BG_QNA ";
      
      String sqlWord = "";
      if(choice.equals("title")) {
         sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
      }else if(choice.equals("writer")) {
         sqlWord = " WHERE ID='" + searchWord.trim() + "'";
      }else if(choice.equals("content")) {
         sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
      }
      sql += sqlWord;
      sql += " ORDER BY WDATE DESC ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      List<QnaDto> list = new ArrayList<QnaDto>();
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaSearchList success");
         
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 getQnaSearchList success");
         
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaSearchList success");
         
         while(rs.next()) {
            int i = 1;
            QnaDto dto = new QnaDto( rs.getInt(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++)   );
            list.add(dto);
         }
         System.out.println("4/6 getQnaSearchList success");
      } catch (SQLException e) {
         System.out.println("getQnaSearchList fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }
      return list;      
   }
   

   public int getQnaListCount(String choice, String searchWord) {
      String sql = " SELECT COUNT(*) FROM BG_QNA WHERE DEL=0 AND (ID != 'aa' OR ID != 'ADMIN')";
               
      
      String sqlWord = "";
      if(choice.equals("title")) {
         sqlWord += " AND TITLE LIKE '%" + searchWord.trim() + "%' ";
      }else if(choice.equals("writer") && !searchWord.equals("")) {
         sqlWord += " AND ID='" + searchWord.trim() + "'";
      }else if(choice.equals("content")) {
         sqlWord += " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
      }
      sql += sqlWord;
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      int allCount = 0;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaListCount success");
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 getQnaListCount success");
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaListCount success");
         if(rs.next()) {
            allCount = rs.getInt(1);
         }   
         System.out.println("4/6 getQnaListCount success");
      } catch (SQLException e) {
         System.out.println("getQnaListCount fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }
      return allCount;      
   }
   
   
public List<QnaDto> getQnaPagingList(String choice, String searchWord, int page){
      
      //System.out.println("dao로 들어온 choice : " + choice);
      //System.out.println("dao로 들어온 searchWord : " + searchWord);
      //System.out.println("dao로 들어온 page : " + page);
      

      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM ";
      
            sql += "( SELECT ROW_NUMBER()OVER(ORDER BY A.WDATE DESC) AS RNUM, " 
               + " A.SEQ, A.ID, A.TITLE, A.CONTENT, A.WDATE, A.READCOUNT, A.IS_SECRET, A.IS_ANSWER, A.DEL, A.BESTQNA " 
                + " FROM BG_QNA  A, BG_MEMBER B ";   
      
      String sqlWord = " WHERE A.DEL=0 AND A.ID = B.ID AND B.AUTH != 1 "; //삭제 제외
      if(choice.equals("title")) {
         sqlWord += " AND TITLE LIKE '%" + searchWord.trim() + "%' ";
      }else if(choice.equals("writer") && !searchWord.equals("")) {
         sqlWord += " AND A.ID='" + searchWord.trim() + "'";
      }else if(choice.equals("content")) {
         sqlWord += " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
      }
      sql += sqlWord;
      
      //sql += " ORDER BY WDATE DESC ) ";
      sql += " ) ";
      sql += " WHERE RNUM >= ? AND RNUM <= ? ";
      
      
      System.out.println(sql);
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<QnaDto> list = new ArrayList<QnaDto>();
      
      int start, end;
      //start = 1 + 10 * page;   // 0 -> 1   1 -> 11
      //end = 10 + 10 * page;   // 0 -> 10  1 -> 20
      
      //start = 1 + 5 * page;   // 0 -> 1   1 -> 6    2 -> 11
      //end = 5 + 5 * page;      // 0 -> 5   1 -> 10  2 -> 15
      
      start = 1 + 15 * page;   // 0 -> 1   1 -> 6    2 -> 11
      end = 15 + 15 * page;      // 0 -> 5   1 -> 10  2 -> 15
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaPagingList success");
         System.out.println(sql);
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, start);
         psmt.setInt(2, end);         
         System.out.println("2/6 getQnaPagingList success");
         
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaPagingList success");
         
         while(rs.next()) {
            int i = 1;
            QnaDto dto = new QnaDto( rs.getInt(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++)   );
            list.add(dto);
         }
         System.out.println("4/6 getQnaPagingList success");
         
      } catch (SQLException e) {
         System.out.println("getQnaPagingList fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }   
      return list;
   }

   public void getReadCount(int seq) {
      String sql = " UPDATE BG_QNA " 
               + " SET READCOUNT=READCOUNT+1 " 
               + " WHERE SEQ=? ";

      Connection conn = null;
      PreparedStatement psmt = null;

      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 readcount success");

         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         System.out.println("2/6 readcount success");

         psmt.executeUpdate();
         System.out.println("3/6 readcount success");

      } catch (SQLException e) {
         System.out.println("readcount fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);
      }

   }

   public boolean setQnaComment(QnaCommentDto qnaCommentDto) {
      String sql = " INSERT INTO BG_QNA_COMMENTS ( SEQ, ID, CONTENT, QNANUMBER, WDATE, DEL )"
               + " VALUES (SEQ_BG_QNA_COMMENTS.NEXTVAL, ?, ?, ?, SYSDATE, 0) ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;
         
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaComment Success");
         
         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 setQnaComment Success");
         
         psmt.setString(1, qnaCommentDto.getId());
         psmt.setString(2, qnaCommentDto.getContent());
         psmt.setInt(3, qnaCommentDto.getQnamumber());
         
         count = psmt.executeUpdate();
         System.out.println("3/6 setQnaComment Success");
         
      } catch (SQLException e) {
         System.out.println("setQnaComment fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);         
      }
      return count>0?true:false;
   }

   public List<QnaCommentDto> getComment(int seq) {
      String sql = " SELECT SEQ, ID, WDATE, QNANUMBER, CONTENT, DEL "
               + " FROM BG_QNA_COMMENTS "
               + " WHERE QNANUMBER=? " 
               + " ORDER BY WDATE ";
             
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<QnaCommentDto> list = new ArrayList<QnaCommentDto>();
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getComment success");
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         System.out.println("2/6 getComment success");
         rs = psmt.executeQuery();
         System.out.println("3/6 getComment success");
         
         while (rs.next()) {
            int i = 1;
            QnaCommentDto dto = new QnaCommentDto( rs.getInt(i++),
                                        rs.getString(i++),
                                        rs.getString(i++),
                                        rs.getInt(i++),
                                        rs.getString(i++),
                                        rs.getInt(i++)   );
            list.add(dto);            
         }
         System.out.println("4/6 getComment success");
         
      } catch (SQLException e) {
         System.out.println("getComment fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }      
      return list;
   
   }

   public boolean setQnaAnswerWait(int seq) {
      String sql = " UPDATE BG_QNA "
               + " SET IS_ANSWER=0 "
               + " WHERE SEQ=? ";
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaAnswerWait Success");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         System.out.println("2/6 setQnaAnswerWait Success");
         
         count = psmt.executeUpdate();
         System.out.println("3/6 setQnaAnswerWait Success");
         
      } catch (Exception e) {      
         System.out.println("setQnaAnswerWait Fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);         
      }
      
      return count>0?true:false;
   }

public List<QnaDto> getNoAnsList(int page){
   
         
      System.out.println("getNoAnsList : " + page);
      
      String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
               + " FROM ";
      
            sql += "( SELECT ROW_NUMBER()OVER(ORDER BY A.WDATE ASC) AS RNUM, " 
            + " A.SEQ, A.ID, A.TITLE, A.CONTENT, A.WDATE, A.READCOUNT, A.IS_SECRET, A.IS_ANSWER, A.DEL, A.BESTQNA " 
            + " FROM BG_QNA  A , BG_MEMBER B "
            + " WHERE A.IS_ANSWER=0 AND A.ID = B.ID AND B.AUTH != 1 ) "
            + " WHERE RNUM >= ? AND RNUM <= ? "
            + " ORDER BY WDATE ASC ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<QnaDto> list = new ArrayList<QnaDto>();
      
      int start, end;
      //start = 1 + 10 * page;   // 0 -> 1   1 -> 11
      //end = 10 + 10 * page;   // 0 -> 10  1 -> 20
      
      start = 1 + 15 * page;   // 0 -> 1   1 -> 6    2 -> 11
      end = 15 + 15 * page;      // 0 -> 5   1 -> 10  2 -> 15
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 getQnaPagingList success");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, start);
         psmt.setInt(2, end);         
         System.out.println("2/6 getQnaPagingList success");
         
         rs = psmt.executeQuery();
         System.out.println("3/6 getQnaPagingList success");
         
         while(rs.next()) {
            int i = 1;
            QnaDto dto = new QnaDto( rs.getInt(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getString(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++),
                               rs.getInt(i++)   );
            list.add(dto);
         }
         System.out.println("4/6 getQnaPagingList success");
         
      } catch (SQLException e) {
         System.out.println("getQnaPagingList fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, rs);         
      }   
      return list;
   }

public int getNoAnsCount(){
   String sql = " SELECT COUNT(*) FROM BG_QNA A, BG_MEMBER B "
           + " WHERE A.IS_ANSWER=0 AND A.ID=B.ID AND B.AUTH != '1' ";

   
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   
   int count = 0;
   
   try {
      conn = DBConnection.getConnection();
      System.out.println("1/6 getQnaPagingList success");
      
      psmt = conn.prepareStatement(sql);
      System.out.println("2/6 getQnaPagingList success");
      
      rs = psmt.executeQuery();
      System.out.println("3/6 getQnaPagingList success");
      
      while(rs.next()) {
         count = rs.getInt(1);
      }
      System.out.println("4/6 getQnaPagingList success");
      
   } catch (SQLException e) {
      System.out.println("getQnaPagingList fail");
      e.printStackTrace();
   } finally {
      DBClose.close(psmt, conn, rs);         
   }   
   return count;
}

   public boolean setQnaAnswerEnd(int seq) {
      String sql = " UPDATE BG_QNA "
               + " SET IS_ANSWER=1 "
               + " WHERE SEQ=? ";
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 setQnaAnswerEnd Success");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         System.out.println("2/6 setQnaAnswerEnd Success");
         
         count = psmt.executeUpdate();
         System.out.println("3/6 setQnaAnswerEnd Success");
         
      } catch (Exception e) {      
         System.out.println("setQnaAnswerEnd Fail");
         e.printStackTrace();
      } finally {
         DBClose.close(psmt, conn, null);         
      }
      
      return count>0?true:false;
   }
   
}