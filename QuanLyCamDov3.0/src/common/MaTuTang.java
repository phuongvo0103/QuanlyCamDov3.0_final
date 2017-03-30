package common;

import common.DataProvider;

public class MaTuTang extends DataProvider {

	DataProvider dp = new DataProvider();
	public String maKhachHang;
	public String maHopDong;

	public int getMaKH() {
		return dp.Ai("KhachHang", "MaKhachHang");
	}

	public int getMaHopDong() {
		return dp.Ai("HopDong", "MaHopDong");
	}

	public int getMaTaiSan() {
		return dp.Ai("TaiSan", "MaTaiSan");
	}

	public int getMaCTHD() {
		return dp.Ai("ChiTietHopDong", "MaCTHD");
	}

	public int getMaGiaHan() {
		return dp.Ai("GiaHan", "MaGiaHan");
	}

	public int getMaDongLai() {
		return dp.Ai("DongTienLai", "MaDongLai");
	}

	public static void main(String[] args) {
		MaTuTang maTuTang = new MaTuTang();

		// test mã tự tăng
		System.out.println(String.valueOf(maTuTang.getMaKH()));
		System.out.println(String.valueOf(maTuTang.getMaHopDong()));
		System.out.println(String.valueOf(maTuTang.getMaTaiSan()));
		System.out.println(String.valueOf(maTuTang.getMaCTHD()));
	}
}
