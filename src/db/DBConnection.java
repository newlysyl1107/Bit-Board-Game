package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static void initConnection() {		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Driver Loading Success!");			
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {		
		Connection conn = null;		
		try {
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.145:1521:xe", "hr", "hr");
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.8:1521:xe", "hr", "hr");
			
			System.out.println("DB Connection Success!");			
		} catch (SQLException e) {
			System.out.println("DB Connection Fail!");	
			e.printStackTrace();
		}
		
		return conn;
	}
}
