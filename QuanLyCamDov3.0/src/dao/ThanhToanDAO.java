package dao;

import java.sql.SQLException;

import common.DataProvider;

public class ThanhToanDAO extends DataProvider {

	public void themThanhToan(int maCTHD, String ngaytt, double tongTienThanhToan) {
	String querry="insert into ThanhToan values('"+maCTHD+"','"+ngaytt+"','"+tongTienThanhToan+"')";
	try {
		exU(querry);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	
}
