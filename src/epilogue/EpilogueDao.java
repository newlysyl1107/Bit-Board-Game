package epilogue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.EpilogueDto;

public class EpilogueDao {
	
	private static EpilogueDao dao = new EpilogueDao();
	
	private EpilogueDao() {
	}
	
	public static EpilogueDao getInstance() {
		return dao;
	}
	
	public boolean writeEpilogue(EpilogueDto epilogue) {
		
		String sql = " INSERT INTO BG_EPILOGUE "
				+ " (SEQ, ID, "
				+ " REF, STEP, DEPTH, "		
				+ " THUMBNAIL,TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT) "
				+ " VALUES(SEQ_BG_EPILOGUE.NEXTVAL, ?, "
				+ " 	(SELECT NVL(MAX(REF), 0) + 1 FROM BG_EPILOGUE), "	
				+ "     0, 0, "
				+ " 	'Main', ?, ?, SYSDATE, "
				+ "		0, 0) ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeEpilogue success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 writeEpilogue success" + epilogue);
			
			psmt.setString(1, epilogue.getId());
			psmt.setString(2, epilogue.getTitle());
			psmt.setString(3, epilogue.getContent());
			System.out.println("2-1/6 writeEpilogue success" + epilogue.getContent());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writeEpilogue success");
			
		} catch (SQLException e) {
			System.out.println("writeEpilogue fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}		
		
		return count>0?true:false;
	}

	public EpilogueDto getEpilogue(int seq) {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
						+ " THUMBNAIL, TITLE, CONTENT, WDATE, "
						+ " DEL, READCOUNT "
						+ " FROM BG_EPILOGUE "
						+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		EpilogueDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getEpilogue success");
		
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getEpilogue success");
			
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getEpilogue success");
			
			if(rs.next()) {
				int i = 1;
				dto = new EpilogueDto(rs.getInt(i++), 
									rs.getString(i++), 
									rs.getInt(i++), 
									rs.getInt(i++), 
									rs.getInt(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++),
									rs.getString(i++),
									rs.getInt(i++), 
									rs.getInt(i++));
			}
			System.out.println("4/6 getEpilogue success");
			
		} catch (SQLException e) {
			System.out.println("getEpilogue fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return dto;
	}
	
	public void readcount(int seq) {
		
		String sql = "  UPDATE BG_EPILOGUE"
					+ "	SET READCOUNT = READCOUNT + 1 "
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
	

	public boolean epilogueReply(int seq, EpilogueDto epilogue) {
	
		String sql1 = " UPDATE BG_EPILOGUE "
					+ " SET STEP=STEP+1 "
					+ " WHERE REF = ? "
					+ "	AND STEP > (SELECT STEP FROM BG_EPILOGUE WHERE SEQ=?) ";
		

		String sql2 = " INSERT INTO BG_EPILOGUE "
					+ " (SEQ, ID, REF, STEP, DEPTH, "
					+ "  THUMBNAIL, TITLE, CONTENT, WDATE, DEL, READCOUNT) "
					+ "  VALUES(SEQ_BG_EPILOGUE.NEXTVAL, ?, "
					+ "		( ? ), "					
				//  + "		(SELECT REF  FROM BG_EPILOGUE WHERE SEQ=?), "
					+ "		(SELECT STEP FROM BG_EPILOGUE WHERE SEQ=?) + 1, "
					+ "		(SELECT DEPTH FROM BG_EPILOGUE WHERE SEQ=?) + 1, " 
					+ "		  ' ', ?, ?, SYSDATE, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);			
			System.out.println("1/6 epilogueReply success");
			
			// update
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 epilogueReply success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 epilogueReply success");
			
			// psmt 초기화
			psmt.clearParameters();
			
			// insert
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, epilogue.getId());
			psmt.setInt(2, seq);	// ref
			psmt.setInt(3, seq);	// step
			psmt.setInt(4, seq);	// depth
			//psmt.setString(5, epilogue.getThumbnail());
			psmt.setString(5, epilogue.getTitle());
			psmt.setString(6, epilogue.getContent());

			System.out.println("4/6 epilogueReply success" );
			
			count = psmt.executeUpdate();
			System.out.println("5/6 epilogueReply success");
			conn.commit();			
			
		} catch (SQLException e) {
			System.out.println("epilogueReply  fail");			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}				
			e.printStackTrace();
		} finally {			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {	e.printStackTrace(); }
			
			DBClose.close(psmt, conn, null);
			System.out.println("6/6 answer success");
		}
		
		return count>0?true:false;
	}
	
	public boolean updateEpilogue(int seq, String title, String content) {
		String sql = " UPDATE BG_EPILOGUE SET "
				+ " TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateEpilogue success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			System.out.println("2/6 updateEpilogue success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 updateEpilogue success");
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, null);
			System.out.println("5/6 updateEpilogue success");
		}		
		
		return count > 0 ? true : false;
	}

	public boolean deleteEpilogue(int seq) {
		
		String sql = " UPDATE BG_EPILOGUE "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 S deleteEpilogue");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 S deleteEpilogue");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 S deleteEpilogue");
			
		} catch (Exception e) {		
			System.out.println("fail deleteEpilogue");
			e.printStackTrace();
			
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;
	}
	

	public int getAllEpilogue(String choice, String searchWord) {
		
		String sql = " SELECT COUNT(*) FROM BG_EPILOGUE WHERE STEP = 0";
		
		String sqlWord = "";
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
		}else if(choice.equals("writer") && !searchWord.equals("")) {
			sqlWord = " WHERE ID='" + searchWord.trim() + "'";
		}else if(choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
				
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				len = rs.getInt(1);
			}			
		} catch (SQLException e) {
			System.out.println("getAllEpilogue fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;		
	}
	
	
	public List<EpilogueDto> getEpiloguePagingList(String choice, String searchWord, int page){

		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " THUMBNAIL, TITLE, CONTENT, WDATE, "
					+ " DEL, READCOUNT "
					+ " FROM ";
		
			   sql += "(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, "
			   		+ "	SEQ, ID, REF, STEP, DEPTH, "
			   		+ " THUMBNAIL, TITLE, CONTENT, WDATE, "
			   		+ " DEL, READCOUNT "
			   		+ " FROM BG_EPILOGUE "
			   		+ " WHERE STEP = 0 ";	
		
		String sqlWord = "";
		if(choice.equals("title")) {
			sqlWord = "AND TITLE LIKE '%" + searchWord.trim() + "%' ";
		}else if(choice.equals("writer") && !searchWord.equals("")) {
			sqlWord = "AND ID='" + searchWord.trim() + "'";
		}else if(choice.equals("content")) {
			sqlWord = " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		sql += sqlWord;
		
		sql += " ORDER BY REF DESC, STEP ASC) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		
		
		System.out.println("sql" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<EpilogueDto> list = new ArrayList<EpilogueDto>();			
		
		int start, end;
		start = 1 + 10 * page;	
		end = 10 + 10 * page;	
		
		
		
		try {
			conn = DBConnection.getConnection();
				System.out.println("1/6 getEpiloguePagingList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
				System.out.println("2/6 getEpiloguePagingList success");
			
			rs = psmt.executeQuery();
				System.out.println("3/6 getEpiloguePagingList success");
			
			while(rs.next()) {
				int i = 1;
				EpilogueDto dto = new EpilogueDto(rs.getInt(i++), 
													rs.getString(i++), 
													rs.getInt(i++), 
													rs.getInt(i++), 
													rs.getInt(i++), 
													rs.getString(i++), 
													rs.getString(i++),
													rs.getString(i++), 
													rs.getString(i++),
													rs.getInt(i++), 
													rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getEpiloguePagingList success");
			
		} catch (SQLException e) {
			System.out.println("getEpiloguePagingList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
		
	}
	

	public List<EpilogueDto> getEpilogueReplies(int seq) {
		String sql = "  SELECT * FROM BG_EPILOGUE "
					+ " WHERE REF = ? ";
	
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<EpilogueDto> list = new ArrayList<EpilogueDto>();
		
		try {
			conn = DBConnection.getConnection();
				System.out.println("1/6 getEpilogueReplies success, seq =" + seq);
		
			psmt = conn.prepareStatement(sql);
				System.out.println("2/6 getEpilogueReplies success");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
				System.out.println("3/6 getEpilogueReplies success");
				
					
			while(rs.next()) {
				int i = 1;
				EpilogueDto dto = new EpilogueDto(rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getInt(i++), 
												rs.getInt(i++));
				list.add(dto);
				System.out.println("4/6 getEpilogueReplies success = dto :" + dto );
			}
			
			
		} catch (SQLException e) {
			System.out.println("getEpilogueReplies fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}

public int getReplyCount(int seq) {
		
		String sql = "  SELECT COUNT(REF) FROM BG_EPILOGUE"
				    + " WHERE REF=?  AND  THUMBNAIL <> 'Main' " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReplyCount success" + sql);
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);			
			System.out.println("2/6 getReplyCount success + ref = " +sql );
			rs=psmt.executeQuery();
			
			if(rs.next()) { 
				count=rs.getInt(1); 
				}
			
			System.out.println("3/6 getReplyCount success"+ count);
			
		} catch (SQLException e) {
			System.out.println("getReplyCount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return count;
	}

}