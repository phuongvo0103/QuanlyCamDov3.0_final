package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectData {

	static Connection conn = null;

	static String url = "jdbc:sqlserver://localhost:1433;databaseName=QuanLyCamDov2";
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String user = "sa";
	static String pass = "01031997";

	static String url1 = "jdbc:sqlserver://localhost:1433;databaseName=QuanLyCamDov2";
	static String user1 = "sa";
	static String pass1 = "12345678";

	/**
	 * tao ket noi den database
	 * 
	 * @return
	 */
	public static Connection getConnect() {
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url1, user1, pass1);

			/*
			 * if (conn==null) {
			 * conn=DriverManager.getConnection(url,user1,pass1); }
			 */

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}
}
