package MainAndNotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.NoticeDto;

public class NoticeDAO {
    
	
	
	private static NoticeDAO dao = new NoticeDAO();
	
	private NoticeDAO() {

	}
	
	public static NoticeDAO getInstance() {
		return dao;
	}
	
	
	
	// 공지 작성
	public boolean writeNotice(NoticeDto dto) {
		
		String sql = " INSERT INTO BG_NOTICE(SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL) "
				+ " VALUES(SEQ_BG_NOTICE.NEXTVAL, ?, SYSDATE, ?, ?, 0, 0) ";
		
		// null 값 방지 저스트 출력용도
		System.out.println(dto.getId());	
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getWdate());
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			count = psmt.executeUpdate();
			System.out.println("writeNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("writeNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	
	}
	
	
	// 공지 수정
	public boolean updateNotice(String title, String content, int seq) {
		
		String sql = " UPDATE BG_NOTICE "
				+ " SET TITLE = ? , CONTENT = ? "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("updateNotice 1/6 success");
			
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			System.out.println("updateNotice 2/6 success");
			
			count = psmt.executeUpdate();
			System.out.println("count = " + count);
			System.out.println("updateNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("updateNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
	// 공지 삭제
	public boolean deleteNotice(int seq) {
		
		String sql = " UPDATE BG_NOTICE "
				+ " SET DEL = 1 "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			
			System.out.println("deleteNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("deleteNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
//	
//	public List<NoticeDto> getNoticeList(String choice, String searchWord) {
//		
//		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
//				+ " FROM BG_NOTICE ";
//		
//		String sqlWord = "";
//		
//		if(choice.equals("title")) {
//			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
//		} else if(choice.equals("writer")) {
//			sqlWord = " WHERE ID ='" + searchWord.trim() + "'";
//		} else if(choice.equals("content")) {
//			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
//		}
//		sql += sqlWord;
//		
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		
//		List<NoticeDto> list = new ArrayList<NoticeDto>();
//		
//		
//		try {
//			conn = DBConnection.getConnection();
//			psmt = conn.prepareStatement(sql);
//			rs = psmt.executeQuery();
//			
//			while(rs.next()) {
//				int i = 1;
//				NoticeDto dto = new NoticeDto(rs.getInt(i++), 
//											  rs.getString(i++), 
//											  rs.getString(i++), 
//											  rs.getString(i++), 
//											  rs.getString(i++), 
//											  rs.getInt(i++),
//											  rs.getInt(i++));
//				list.add(dto);
//			}
//			System.out.println("getNoticeList Finally Success");
//			
//		} catch (SQLException e) {
//			System.out.println("getNoticeList Failed");
//			e.printStackTrace();
//		} finally {
//			DBClose.close(psmt, conn, rs);
//		}
//		return list;
//	}
	
	// 검색에 상관없이 모든 글의 개수
	public int getAllcount() {
		String sql = " SELECT COUNT(*) "
				+ " FROM BG_NOTICE "
				+ " WHERE DEL = 0 ";
		
		String sqlWord = "";
		
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int length = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				length = rs.getInt(1);
			}
			
			System.out.println("getAllNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("getAllNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return length;
	}
	
	// 검색한 글의 개수
	public int getSearchCount(String choice, String searchWord) {
		
		String sql = " SELECT COUNT(*) "
				+ " FROM BG_NOTICE "
				+ " WHERE DEL = 0 ";
		
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " AND TITLE LIKE '%" + searchWord.trim() + "%' ";
		} else if(choice.equals("writer")) {
			sqlWord = " AND ID = '" + searchWord.trim() + "'";
		} else if(choice.equals("content")) {
			sqlWord = " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int length = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				length = rs.getInt(1);
			}
			
			System.out.println("getAllNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("getAllNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return length;
	}
	
	
	// 공지사항 조회수
	public void viewCount(int seq) {
		String sql = " UPDATE BG_NOTICE "
				+ " SET READCOUNT = READCOUNT + 1 "
				+ " WHERE SEQ = " + seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			
			System.out.println("viewCount Finally Success");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("viewCount Failed");
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	
	// 공지사항 상세 조회
	public NoticeDto noticeDetail(int seq) {
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM BG_NOTICE "
				+ " WHERE SEQ = ? ";
		
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new NoticeDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getInt(6),
									rs.getInt(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
	
	// 검색결과 불러오기
	public List<NoticeDto> getSearchAllList(String choice, String searchWord, int pageNumber) {
		
	String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
			+ " FROM ";
	
		   sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
		   		+ "			SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
		   		+ " FROM BG_NOTICE "
		   		+ " WHERE DEL = 0 ";
		   
	String sqlWord = "";
	
	if(choice.equals("title")) {
		sqlWord = "AND TITLE LIKE '%" + searchWord + "%' ";
	} else if(choice.equals("writer")) {
		sqlWord = " AND ID='" + searchWord + "'";
	} else if(choice.equals("content")) {
		sqlWord = " AND CONTENT LIKE '%" + searchWord + "%' ";
	}
	sql += sqlWord;
	
	sql += " ORDER BY SEQ DESC )";
	sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<NoticeDto> list = new ArrayList<NoticeDto>();
	
	int start, end;
	
	start = 1 + 10 * pageNumber;
	end = 10 + 10 * pageNumber;
	
	try {
		conn = DBConnection.getConnection();
		psmt = conn.prepareStatement(sql);
		
		psmt.setInt(1, start);
		psmt.setInt(2, end);
		
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			int i = 1;
			NoticeDto dto = new NoticeDto(rs.getInt(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getInt(i++), 
										  rs.getInt(i++));
			list.add(dto);
					
		}
		
		System.out.println("getNoticePagingList Finally Success");
		
	} catch (SQLException e) {
		System.out.println("getNoticePagingList Failed");
		e.printStackTrace();
		
	} finally {
		DBClose.close(psmt, conn, rs);
	}
	
	return list;
	
		
	}
	
	
	// 검색 상관없이 모든 글 전부 다 불러오기 (단, 삭제한 글 del = 1 은 제외하고)
	
	public List<NoticeDto> showAllNotice(int pageNumber) {
		
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM ";
				
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
		   		+ "			SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
		   		+ " FROM BG_NOTICE "
		   		+ " WHERE DEL = 0 ";
		   
		String sqlWord = "";
		
		sql += sqlWord;
		
		sql += " ORDER BY SEQ DESC )";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
			
		ResultSet rs = null;
		PreparedStatement psmt = null;
		Connection conn = null;
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		int start, end;
		
		start = 1 + 10 * pageNumber;
		end = 10 + 10 * pageNumber;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				NoticeDto dto = new NoticeDto(rs.getInt(1), 
											  rs.getString(2), 
											  rs.getString(3), 
											  rs.getString(4), 
											  rs.getString(5), 
											  rs.getInt(6), 
											  rs.getInt(7));
				list.add(dto);
			}
			
			System.out.println("showAllNotice Finally Succeed");
			
		} catch (SQLException e) {
			System.out.println("showAllNotice Failed!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	
	
	
	// 이전글 불러오기
	public NoticeDto preNotice(int seq) {
		
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM BG_NOTICE "
				+ " WHERE SEQ = ( SELECT MAX(SEQ) FROM BG_NOTICE WHERE SEQ < ?  AND DEL = 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6");
			if(rs.next()) {
				dto = new NoticeDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getInt(6),
									rs.getInt(7));
			}
			System.out.println("6/6");
			//System.out.println("dto.seq" + dto.getSeq());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
		
	}
	
	// 다음글 불러오기
	public NoticeDto postNotice(int seq) {
		
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM BG_NOTICE "
				+ " WHERE SEQ = ( SELECT MIN(SEQ) FROM BG_NOTICE WHERE SEQ > ?  AND DEL = 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6");
			if(rs.next()) {
				dto = new NoticeDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getInt(6),
									rs.getInt(7));
			}
			System.out.println("6/6");
			//System.out.println("dto.seq" + dto.getSeq());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
		
	}
	/*
	// 다음글 불러오기
	
		public NoticeDto postNotice(int seq) {
		
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL, "
				+ " LEAD(SEQ, 1, 0) OVER(ORDER BY SEQ) "
				+ " FROM BG_NOTICE "
				+ " WHERE SEQ = ? AND DEL = 0 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new NoticeDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getInt(6),
									rs.getInt(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
		
	} */
	
}
