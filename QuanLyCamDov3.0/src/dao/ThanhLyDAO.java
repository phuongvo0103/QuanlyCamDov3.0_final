	package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ThanhLy;
import common.ConnectData;
import common.Utilities;

public class ThanhLyDAO extends ConnectData {

	private Statement st = null;
	private ResultSet rs = null;

	public ThanhLyDAO() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ThanhLy> getListHangThanhLy() {
		ArrayList<ThanhLy> list = new ArrayList<>();

		try {
			st = getConnect().createStatement();
			rs = st.executeQuery("select ThanhLy.*,TaiSan.TenTaiSan,TaiSan.UrlHinhAnh from ThanhLy inner join TaiSan "
					+ "on ThanhLy.MaTaiSan=TaiSan.MaTaiSan where ThanhLy.MaTaiSan in (select MaTaiSan from TaiSan)");

			while (rs.next()) {
	
				ThanhLy thanhLy = new ThanhLy();
				
				thanhLy.setMaThanhLy(rs.getInt("MaThanhLy"));
				thanhLy.setMaTaiSan(rs.getInt("MaTaiSan"));
				thanhLy.setTinhTrang(rs.getInt("TinhTrang"));
				
				String tien = Utilities.priceWithDecimal(rs.getFloat("SoTienThanhLy"));
				thanhLy.setSoTienThanhLy(tien);
				
				thanhLy.setTenTaiSan(rs.getString("TenTaiSan"));
				thanhLy.setHinhAnh(rs.getString("UrlHinhAnh"));
				
				list.add(thanhLy);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}
