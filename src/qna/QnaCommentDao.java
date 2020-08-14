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

public class QnaCommentDao {

	private static QnaCommentDao dao = new QnaCommentDao();
	
	private QnaCommentDao() {
		
	}

	public static QnaCommentDao getInstance() {
		return dao;
	}

	public int getQnaCount(int seq) {
		
		String sql = " SELECT count(*) "
				   + " FROM BG_QNA_COMMENTS "
				   + " WHERE DEL=0 AND QNANUMBER = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getQnaList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getQnaList success");
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			System.out.println("3/6 getQnaList success");
			
			if (rs.next()) {
				count = rs.getInt(1);		
			}
			System.out.println("4/6 getQnaList success");
			
		} catch (SQLException e) {
			System.out.println("getQnaList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}		
		return count;
	}

	public boolean setCommDelete(int commSeq) {
		String sql = " UPDATE BG_QNA_COMMENTS "
				   + " SET DEL=1 "
				   + " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 setCommDelete Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commSeq);
			System.out.println("2/6 setCommDelete Success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 setCommDelete Success");
			
		} catch (Exception e) {		
			System.out.println("setCommDelete Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;
	}

	
}
