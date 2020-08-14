package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;
import dto.ReservationDto;

public class RevDao{
	
	public RevDao() {
		
	}
	
	public List<ReservationDto> getTodayReservationList(String YYYYMMDD, int tn) {
		/*
		INSERT
		//오늘날짜 자동입력 (sysdate)
		insert into sale_plan values('1309094885','S12011','xxxxxx',5,25000000,'1/4','1234',sysdate); 
		
		//기타 포맷형식으로 입력
		insert into sale_plan values('1309094885','S12011','xxxxxx',5,25000000,'1/4','1234',to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss')); 
		SELECT
		
		//포맷에 맞춰서 출력하기
		
		select to_char(writerdate, 'yyyy-mm-dd hh24:mi:ss') from sale_plan;
		 */
		
		String sql =  " SELECT * "
					+ " FROM BG_RESERVATION "
					+ " WHERE TO_CHAR(RDATE, 'YYYYMMDD') = ? AND TABLENUMBER = ? AND DEL = 0";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getTodayReservationList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, YYYYMMDD);
			psmt.setInt(2, tn);
			System.out.println("2/6 getTodayReservationList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getTodayReservationList success");
			
			while(rs.next()) {
				int i = 1;
				ReservationDto dto = new ReservationDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getTodayReservationList success");
			
		} catch (SQLException e) {
			System.out.println("getTodayReservationList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}
	public boolean insertRev(String YYYYMMDD, int tn ,int st, int et, int pn, String memo, String id) {
		
		String sql = " INSERT INTO BG_RESERVATION "
				+ " VALUES(SEQ_BG_RESERVATION.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ? , 0 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

	    try {
	    	conn = DBConnection.getConnection();
	    	System.out.println("1/6 insertRev success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 insertRev success!");
			
			psmt.setString(1, id);
			psmt.setString(2, YYYYMMDD);
			psmt.setInt(3, st);
			psmt.setInt(4, et);
			psmt.setInt(5, tn);
			psmt.setString(6, memo);
			psmt.setInt(7, pn);
			count = psmt.executeUpdate();
			System.out.println("3/6 insertRev success!");
			
		} catch (SQLException e) {
			System.out.println("insertRev fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count > 0 ? true:false; 
	}
	public List<ReservationDto> getMyReserv(String id, int page){
		String sql = " SELECT SEQ, ID, WDATE, RDATE, STARTTIME, ENDTIME, TABLENUMBER, MEMO, NUMBERPEOPLE, DEL "     
				+ " FROM ";

				sql += "(SELECT ROW_NUMBER()OVER(ORDER BY RDATE ASC) AS RNUM, ";
				sql += " SEQ, ID, WDATE, RDATE, STARTTIME, ENDTIME, TABLENUMBER, MEMO, NUMBERPEOPLE, DEL  " 
						+ " FROM BG_RESERVATION "
						+ "	WHERE ID = ? AND DEL = 0 AND RDATE >= SYSDATE ";
				sql += " ORDER BY RDATE ASC) ";
					
		        sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		System.out.println("sql: " + sql);
		
		int start, end;
		start = 1 + 10 * page; // 0 → 1 1 → 11 : 각 페이지 첫번째 글
		end = 10 + 10 * page; // 0 → 1 10 → 20 : 각 페이지 마지막 글
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMyReserv success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMyReserv success!");
			psmt.setString(1, id);
			psmt.setInt(2, start);
			psmt.setInt(3, end);
			rs = psmt.executeQuery();
			System.out.println("3/6 getMyReserv success!");
			while(rs.next()) {
				int i = 1;
				ReservationDto dto = new ReservationDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getMyReserv success!");
			
		} catch (SQLException e) {
			System.out.println("getMyReserv fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public boolean revDel(int seq) {
		
		String sql = " UPDATE BG_RESERVATION "
				+ " SET DEL = 1 "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 revdel success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 revdel success!");
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 revdel success!");
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count > 0? true : false;
	}

	public int getAllreserv(String id) {
		String sql = " SELECT COUNT(*) " 
					+ " FROM BG_RESERVATION "
					+ " WHERE ID = ? AND DEL=0 AND RDATE >= SYSDATE " ;
		//+ " WHERE ID = ? AND DEL=0 AND RDATE >= TO_DATE(TO_CHAR(SYSDATE , 'YYYYMMDD'))" ;
		
		System.out.println(sql);
		
		Connection conn = null; // DB Connection
		PreparedStatement psmt = null; // SQL
		ResultSet rs = null; // result

		int len = 0;
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 getSearchMem success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getSearchMem success!");
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			System.out.println("3/6 getSearchMem success!");
			if (rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("4/6 getSearchMem success!");
		} catch (SQLException e) {
			System.out.println("getSearchMem fail!");
			e.printStackTrace();
		} finally {

			DBClose.close(psmt, conn, rs);
		}
		return len;

	}
	
	public List<ReservationDto> getAllCurRev() {

		String sql =  " SELECT * "
					+ " FROM BG_RESERVATION "
					//+ " WHERE RDATE >= SYSDATE 
					+ " WHERE DEL = 0 "
					+ " ORDER BY RDATE ASC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllCurRev success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllCurRev success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllCurRev success");
			
			while(rs.next()) {
				int i = 1;
				ReservationDto dto = new ReservationDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getAllCurRev success");
			
		} catch (SQLException e) {
			System.out.println("getAllCurRev fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}
	
	public int revMonthCount (String date) {

		String sql =  " SELECT RDATE "
				+ " FROM BG_RESERVATION "
				+ " WHERE TO_CHAR(RDATE , 'YYYYMM') =  ?  ";

		/*
		String sql =  " SELECT COUNT(*) "
					+ " FROM BG_RESERVATION "
					+ " WHERE TO_CHAR(RDATE , 'YYYYMM') =  ?  ";
		/**/
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		// String rdate[] = null;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllCurRev success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllCurRev success");
			
			psmt.setString(1, date.trim());
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllCurRev success");
			
			// int w = 0;
			
			while(rs.next()) {
				// System.out.println(rs.getString(1));
				count++;
			}
			System.out.println("4/6 getAllCurRev success");
			System.out.println("count: " + count);
		} catch (SQLException e) {
			System.out.println("getAllCurRev fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		//return rdate;
		return count;
	}

}
