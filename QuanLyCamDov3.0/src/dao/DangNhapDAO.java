package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.ConnectData;

public class DangNhapDAO extends ConnectData {

	public boolean dangNhapHeThong(String taiKhoan, String matKhau) {
		String sql = "SELECT* FROM NguoiDung where TaiKhoan='" + taiKhoan + "' and MatKhau='" + matKhau + "'";
		boolean check = false;
		ResultSet rs = null;
		try {
			Statement stmt = getConnect().createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			;
		}
		return check;
	}
}
