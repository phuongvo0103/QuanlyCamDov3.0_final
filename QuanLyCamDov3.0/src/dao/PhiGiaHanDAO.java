package dao;

import java.sql.SQLException;
import java.text.ParseException;

import common.DataProvider;

public class PhiGiaHanDAO extends DataProvider {

	public static void main(String[] args) throws ParseException {
		/**
		 * test
		 */
		// ThanhToanDAO tt=new ThanhToanDAO();
		// System.out.println(tt.daGiaHan(1));
		// System.out.println(tt.getTenKhachHang(1));
		// System.out.println("Ngay bat dau: "+tt.getNgayCam(1));
		// System.out.println(tt.getGiaCam(1));
		//
		//
		// System.out.println(tt.getNgayBDGiaHan(5));
		// System.out.println(tt.daGiaHan(5));
	}

	/**
	 * Insert và bảng GiaHan
	 * 
	 * @param maGiaHan
	 * @param maLaiSuat
	 * @param maCTHD
	 * @param ngayCam
	 * @param ngayTra
	 */
	public boolean giaHanHopDong(int maGiaHan, int maLaiSuat, int maCTHD, String ngayCam, String ngayTra) {
		String querry = "insert into GiaHan values('" + maGiaHan + "','" + maLaiSuat + "','" + maCTHD + "','" + ngayCam
				+ "','" + ngayTra + "')";
		try {
			exU(querry);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void themDSDongLai(int maDongLai, int maCTHD, int i, String ngay, double soTienDong) {
		System.out.println("themDSDOnglai/maDongLai: " + maDongLai);
		String querry = "insert into DongTienLai values('" + maDongLai + "','" + maCTHD + "','" + i + "','" + ngay
				+ "','" + soTienDong + "')";
		try {
			exU(querry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
