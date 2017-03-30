package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.KhachHang;
import common.DataProvider;

public class HopDongDAO extends DataProvider {

	public ArrayList<KhachHang> getListHopDong() {
		ArrayList<KhachHang> listHopDong = new ArrayList<KhachHang>();
		KhachHang hopDong;
		String querry = "select hd.MaHopDong,kh.TenKhachHang,CMND,case when kh.GioiTinh=1 then N'Nam' else N'Nữ' end as 'GioiTinh',DiaChi  from HopDong as hd,KhachHang as kh where hd.MaKhachHang=kh.MaKhachHang order by MaHopDong";
		try {
			ResultSet rs = exQ(querry);
			while (rs.next()) {
				hopDong = new KhachHang();
				hopDong.setMaHopDong(rs.getInt("MaHopDong"));
				hopDong.setTenKhachHang(rs.getString("TenKhachHang"));
				hopDong.setSoCMND(rs.getString("CMND"));
				hopDong.setGioiTinh(rs.getString("GioiTinh"));
				hopDong.setDiaChi(rs.getString("DiaChi"));
				listHopDong.add(hopDong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listHopDong;
	}

	public void themHopDong(int maHopDong, int maKH) {
		String querry = "insert into HopDong values(" + maHopDong + "," + maKH + ")";
		try {
			exU(querry);
			System.out.println("HopDongDAO/themHopDong: Success!");
		} catch (SQLException e) {
			System.out.println("HopDongDAO/themHopDong: Fail!");
			e.printStackTrace();
		}
	}

	public void themKhachHang(int maKH, String tenKhachHang, int gioiTinh, int soCMND, String diaChi) {
		
		String diaChiFormat=String.format("%s", diaChi);
		System.out.println("dia chi format "+diaChiFormat);
		
		String querry = "insert into KhachHang values(" + maKH + ",N'" + tenKhachHang + "'," + gioiTinh + ",'" + soCMND
				+ "',N'" + diaChiFormat + "')";
		
		try {
			exU(querry);
			System.out.println("HopDongDAO/themKhachHang: Success!");
		} catch (SQLException e) {
			System.out.println("HopDongDAO/themKhachHang: Lỗi cmnr!");
			e.printStackTrace();
		}
	}
}
