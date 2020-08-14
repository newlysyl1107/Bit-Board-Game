package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.TableDto;

public class TableDao {

	public TableDao() {
		
	}
	
	public List<TableDto> getReservationTableList() {
		String sql =  " SELECT * "
					+ " FROM BG_TABLE "
					+ " WHERE ISRESERVAITONTABLE = 1 ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getTableList success");
			
		} catch (SQLException e) {
			System.out.println("getTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	
	
	
	// 테이블 전체 불러오기 (추후 삭제 예정)
	public List<TableDto> getAllTableList() {
		String sql =  " SELECT * "
					+ " FROM BG_TABLE ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getAllTableList success");
			
		} catch (SQLException e) {
			System.out.println("getAllTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	
	
	// 삭제 가능 테이블
	public List<TableDto> getAbleDelTableList() {
		String sql = " SELECT DISTINCT BG_TABLE.TABLENUMBER, BG_TABLE.NUMBERPEOPLE, BG_TABLE.ISRESERVAITONTABLE  "
				+ " FROM (SELECT * FROM BG_RESERVATION WHERE BG_RESERVATION.RDATE >= SYSDATE) BG_RESERVATION "
				+ " RIGHT JOIN BG_TABLE ON BG_TABLE.TABLENUMBER = BG_RESERVATION.TABLENUMBER "
				+ " WHERE BG_RESERVATION.TABLENUMBER IS NULL ";
				
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getAllTableList success");
			
		} catch (SQLException e) {
			System.out.println("getAllTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	
	// 삭제 불가능 테이블 
	public List<TableDto> getNoDelTableList() {
		String sql =  " SELECT DISTINCT BG_TABLE.TABLENUMBER, BG_TABLE.NUMBERPEOPLE, BG_TABLE.ISRESERVAITONTABLE  "  
				+ " FROM (SELECT * FROM BG_RESERVATION WHERE BG_RESERVATION.RDATE >= SYSDATE) BG_RESERVATION "
				+ " INNER JOIN BG_TABLE ON BG_TABLE.TABLENUMBER = BG_RESERVATION.TABLENUMBER ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getAllTableList success");
			
		} catch (SQLException e) {
			System.out.println("getAllTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	
	public int tableCount() {
	String sql =  " SELECT COUNT(*) "
				+ " FROM BG_TABLE "
				+ " WHERE ISRESERVAITONTABLE = 1 " ;

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int tableNum = 0;
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/6 getTableList success");
		
		psmt = conn.prepareStatement(sql);
		System.out.println("2/6 getTableList success");
		
		rs = psmt.executeQuery();
		System.out.println("3/6 getTableList success");
		
		while(rs.next()) {
			tableNum = rs.getInt(1);

		}
		System.out.println("4/6 getTableList success");
		
	} catch (SQLException e) {
		System.out.println("getTableList fail");
		e.printStackTrace();
	} finally {
		DBClose.close(psmt, conn, rs);			
	}
	return tableNum;
	}
	
	public boolean tableDel(int tableNum) {
		String sql = " DELETE FROM BG_TABLE "
				+ "	WHERE TABLENUMBER  = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 tableDel success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 tableDel success");
			
			psmt.setInt(1, tableNum);
			count = psmt.executeUpdate();
			System.out.println("3/6 tableDel success");
		} catch (SQLException e) {
			System.out.println("tableDel fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0? true:false;
		
	}

	public boolean callNumUpdate(String id, String phoneNum) {
		String sql = " UPDATE BG_MEMBER " + " SET CALL_NUMBER=? " + " WHERE ID=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 callNumUpdate success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 callNumUpdate success!");
			psmt.setString(1, phoneNum);
			psmt.setString(2, id);
			count = psmt.executeUpdate();
			System.out.println("3/6 callNumUpdate success!");

		} catch (SQLException e) {
			System.out.println("callNumUpdate fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;

	}

	public boolean AdminTableUpdate(int[] tnValues, int[] pnValues, int[] isRev, int[] originalPk) {
		String sql =  " UPDATE BG_TABLE " 
					+ " SET TABLENUMBER = ? , NUMBERPEOPLE = ? , ISRESERVAITONTABLE = ?  " 
					+ " WHERE TABLENUMBER = ? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			System.out.println("1/6 AdminTableUpdate success!");
			
			
			for(int i = 0; i < originalPk.length; i++) {
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 AdminTableUpdate success!");

				psmt.setInt(1, tnValues[i]);
				psmt.setInt(2, pnValues[i]);
				psmt.setInt(3, isRev[i]);
				psmt.setInt(4, originalPk[i]);
				
				int temp = psmt.executeUpdate();
				count += temp;
				System.out.println("3/6 AdminTableUpdate success!");
			}
			
			for(int i = originalPk.length; i < tnValues.length; i++) {
				sql =  " INSERT INTO BG_TABLE(TABLENUMBER , NUMBERPEOPLE , ISRESERVAITONTABLE) " 
						+ " VALUES(? , ?, ? ) "; 
				
				psmt = conn.prepareStatement(sql);
				System.out.println("4/6 AdminTableUpdate success!");

				psmt.setInt(1, tnValues[i]);
				psmt.setInt(2, pnValues[i]);
				psmt.setInt(3, isRev[i]);
				
				int temp = psmt.executeUpdate();
				count += temp;
				System.out.println("5/6 AdminTableUpdate success!");
			}
			
			System.out.println(count + "개의 데이터가 수정되거나 삽입되었습니다.");
			conn.commit();

		} catch (SQLException e) {
			System.out.println("AdminTableUpdate fail!");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			count = 0;
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;

	}
	
}






















