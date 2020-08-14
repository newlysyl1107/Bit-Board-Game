package member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import java.sql.Connection;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		return dao;
	}

	public MemberDto login(String id, String pw) {
		String sql = " SELECT SEQ, ID, PW, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL "
				+ " FROM BG_MEMBER " + " WHERE ID=? AND PW=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memDto = null;

		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 login success!");

			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			System.out.println("3/6 login success!");
			while (rs.next()) {
				int i = 1;
				memDto = new MemberDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getInt(i++),
						rs.getInt(i++));
			}
			System.out.println("4/6 login success!");
		} catch (SQLException e) {
			System.out.println("login fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return memDto;
	}

	public boolean addMember(MemberDto dto) {

		String sql = " INSERT INTO BG_MEMBER (SEQ, ID, PW, CALL_NUMBER, "
				+ " NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL) "
				+ " VALUES(SEQ_BG_MEMBER.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE, 0, 0 ) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success!");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getCall_number());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getEmail());
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success!");

		} catch (SQLException e) {
			System.out.println("addMember fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count > 0 ? true : false;
	}

	public boolean idCheck(String id) {

		String sql = " SELECT ID" + " FROM BG_MEMBER " + " WHERE ID=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 idCheck success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 idCheck success!");
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}
			System.out.println("3/6 idCheck success!");
		} catch (SQLException e) {
			System.out.println("idCheck fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return result > 0 ? true : false;
	}

	public boolean phoneNumChk(String call_number) {

		String sql = " SELECT ID" + " FROM BG_MEMBER " + " WHERE CALL_NUMBER=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 callNumCheck success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 callNumCheck success!");
			psmt.setString(1, call_number);
			rs = psmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}
			System.out.println("3/6 callNumCheck success!");
		} catch (SQLException e) {
			System.out.println("callNumCheck fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return result > 0 ? true : false;

	}

	public boolean emailChk(String email) {

		String sql = " SELECT EMAIL" + " FROM BG_MEMBER " + " WHERE EMAIL=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 emailCheck success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 emailCheck success!");
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}
			System.out.println("3/6 emailCheck success!");
		} catch (SQLException e) {
			System.out.println("emailCheck fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return result > 0 ? true : false;

	}

	public boolean pwdCheck(String id, String pwd) {

		String sql = " SELECT PW " + " FROM BG_MEMBER " + " WHERE ID=? AND PW=? ";
		System.out.println("pwdDao" + pwd);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int result = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 pwdCheck success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 pwdCheck success!");
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			while (rs.next()) {
				result = 1;
			}

			System.out.println("3/6 pwdCheck success!");
		} catch (SQLException e) {
			System.out.println("pwdCheck fail!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return result > 0 ? true : false;

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

	public boolean emailUpdate(String id, String email) {
		String sql = " UPDATE BG_MEMBER " + " SET EMAIL=? " + " WHERE ID=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 emailUpdate success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 emailUpdate success!");

			psmt.setString(1, email);
			psmt.setString(2, id);
			count = psmt.executeUpdate();
			System.out.println("3/6 emailUpdate success!");

		} catch (SQLException e) {
			System.out.println("emailUpdate fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;

	}

	public boolean pwUpdate(String id, String pw) {
		String sql = " UPDATE BG_MEMBER " + " SET PW=? " + " WHERE ID=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 pwUpdate success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 pwUpdate success!");

			psmt.setString(1, pw);
			psmt.setString(2, id);
			count = psmt.executeUpdate();
			System.out.println("3/6 pwUpdate success!");

		} catch (SQLException e) {
			System.out.println("pwUpdate fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;

	}

	public String findId(String name, String email) {

		String sql = " SELECT ID " + " FROM BG_MEMBER " + " WHERE NAME=? AND EMAIL=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String id = "";

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 findId success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 findId success!");

			psmt.setString(1, name);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			while (rs.next()) {
				id = rs.getString(1);
			}
			System.out.println("3/6 findId success");

		} catch (SQLException e) {
			System.out.println("findId fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return id;
	}

	public String findPw(String id, String email) {
		String sql = " SELECT PW " + " FROM BG_MEMBER " + " WHERE ID=? AND EMAIL=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String pw = "";

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 findPw success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 findPw success!");
			psmt.setString(1, id);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			while (rs.next()) {
				pw = rs.getString(1);
			}
			System.out.println("3/6 findPw success!");
		} catch (SQLException e) {
			System.out.println("findPw fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return pw;

	}

	public List<MemberDto> getMemList(String item, String sort, int page) {

		String sql = " SELECT SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM ";
		if (sort.equals("asc")) {

			if (item.equals("name")) {

				sql += "(SELECT ROW_NUMBER()OVER(ORDER BY AUTH DESC, NAME ASC) AS RNUM, ";
				sql += " SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM BG_MEMBER ";
				sql += " ORDER BY AUTH DESC, NAME ASC) ";

			} else if (item.equals("rdate")) {
				sql += "(SELECT ROW_NUMBER()OVER(ORDER BY AUTH DESC, REGDATE ASC) AS RNUM, ";
				sql += " SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM BG_MEMBER ";
				sql += " ORDER BY AUTH DESC, REGDATE ASC) ";
			}
		} else if (sort.equals("desc")) {
			if (item.equals("name")) {
				sql += "(SELECT ROW_NUMBER()OVER(ORDER BY AUTH DESC, NAME DESC) AS RNUM, ";
				sql += " SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM BG_MEMBER ";
				sql += " ORDER BY AUTH DESC, NAME DESC) ";

			} else if (item.equals("rdate")) {
				sql += "(SELECT ROW_NUMBER()OVER(ORDER BY AUTH DESC, REGDATE DESC) AS RNUM, ";
				sql += " SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM BG_MEMBER ";
				sql += " ORDER BY AUTH DESC, REGDATE DESC) ";
			}

		}

		sql += " WHERE RNUM >= ? AND RNUM <= ? ";

		System.out.println("item:" + item + " sort: " + sort);
		System.out.println("sql: " + sql);
		Connection conn = null;

		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<MemberDto>();

		int start, end;
		start = 1 + 10 * page; // 0 → 1 1 → 11 : 각 페이지 첫번째 글
		end = 10 + 10 * page; // 0 → 1 10 → 20 : 각 페이지 마지막 글

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemList success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemList success!");
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			System.out.println("3/6 getMemList success!");

			while (rs.next()) {
				int i = 1;
				MemberDto dto = new MemberDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}

			System.out.println("4/6 getMemList success!");
		} catch (SQLException e) {
			System.out.println("getMemList fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public int getAllMem() {
		String sql = " SELECT COUNT(*) " + " FROM BG_MEMBER ";

		Connection conn = null; // DB Connection
		PreparedStatement psmt = null; // SQL
		ResultSet rs = null; // result

		int len = 0;

		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllMem success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllMem success!");
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllMem success!");
			if (rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("4/6 getAllMem success!");
		} catch (SQLException e) {
			System.out.println("getAllMem fail!");
			e.printStackTrace();
		} finally {

			DBClose.close(psmt, conn, rs);
		}
		return len;

	}

	public MemberDto getMemDetail(String id) {
		String sql = " SELECT SEQ, ID, PW, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL "
				+ " FROM BG_MEMBER " + " WHERE ID=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memDto = null;

		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemDetail success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemDetail success!");

			psmt.setString(1, id);
			rs = psmt.executeQuery();
			System.out.println("3/6 getMemDetail success!");
			while (rs.next()) {
				int i = 1;
				memDto = new MemberDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getInt(i++),
						rs.getInt(i++));
			}
			System.out.println("4/6 getMemDetail success!");
		} catch (SQLException e) {
			System.out.println("getMemDetail fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return memDto;
	}

	public List<MemberDto> searchList(String item, String searchWord, int page) {

		String sql = " SELECT SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM ";
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY AUTH DESC, NAME ASC) AS RNUM, ";
		sql += " SEQ, ID, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " + " FROM BG_MEMBER ";
		
		if (item.equals("id")) {
			sql += " WHERE ID LIKE '%" + searchWord.trim() + "%' ";
	
		} else if (item.equals("name")) {
			sql += " WHERE NAME LIKE '%" + searchWord.trim() + "%' ";

		}
		sql += " ORDER BY AUTH DESC, NAME ASC) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		
		System.out.println("sql" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<MemberDto>();

		int start, end;
		start = 1 + 10 * page; // 0 → 1 1 → 11 : 각 페이지 첫번째 글
		end = 10 + 10 * page; // 0 → 1 10 → 20 : 각 페이지 마지막 글

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 searchList success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 searchList success!");
			//psmt.setString(1, searchWord);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 searchList success!");

			while (rs.next()) {
				int i = 1;
				MemberDto dto = new MemberDto(rs.getInt(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++),
												rs.getString(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++), 
												rs.getInt(i++));
				list.add(dto);
			}

			System.out.println("4/6 searchList success!");
		} catch (SQLException e) {
			System.out.println("searchList fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;

	}
	
	public int getSearchMem(String item, String searchWord ) {
	  System.out.println("searchWord: " + searchWord);
		
		String sql = " SELECT COUNT(*) " 
					+ " FROM BG_MEMBER ";
		if(item.equals("id")) {
				sql += " WHERE ID LIKE '%" + searchWord.trim() + "%' ";
		} else if(item.equals("name")) {
				sql += " WHERE NAME LIKE '%" + searchWord.trim() + "%' ";
		}
		Connection conn = null; // DB Connection
		PreparedStatement psmt = null; // SQL
		ResultSet rs = null; // result

		int len = 0;

		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 getSearchMem success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getSearchMem success!");
			// psmt.setString(1, searchWord);
			rs = psmt.executeQuery();
			
			System.out.println("3/6 getSearchMem success!");
			if (rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("len: " + len);
			System.out.println("4/6 getSearchMem success!");
			
		} catch (SQLException e) {
			System.out.println("getSearchMem fail!");
			e.printStackTrace();
		} finally {

			DBClose.close(psmt, conn, rs);
		}
		return len;

	}


}
