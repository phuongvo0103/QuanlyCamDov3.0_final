package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.LoaiTaiSan;
import common.ConnectData;

public class LoaiTaiSanDAO extends ConnectData {

	public ArrayList<LoaiTaiSan> getListLoaiTaiSan() {
		String sql = "SELECT MaLoaiTaiSan, TenLoaiTaiSan FROM LoaiTaiSan";
		ResultSet rs = null;
		try {
			Statement stmt = getConnect().createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<LoaiTaiSan> listLoaiTaiSan = new ArrayList<LoaiTaiSan>();
		LoaiTaiSan loaiTaiSan;
		try {
			while (rs.next()) {
				loaiTaiSan = new LoaiTaiSan();

				loaiTaiSan.setMaLoaiTaiSan(rs.getInt("MaLoaiTaiSan"));
				loaiTaiSan.setTenLoaiTaiSan(rs.getString("TenLoaiTaiSan"));

				listLoaiTaiSan.add(loaiTaiSan);
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
		return listLoaiTaiSan;
	}
}
