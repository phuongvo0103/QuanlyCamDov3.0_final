package bo;

import java.util.ArrayList;

import bean.KhachHang;
import dao.HopDongDAO;

import common.MaTuTang;

public class HopDongBO {

	public ArrayList<KhachHang> getListHopDong() {
		HopDongDAO hopDongDAO = new HopDongDAO();
		return hopDongDAO.getListHopDong();
	}

	public void themHopDong(String tenKhachHang, int gioiTinh, int soCMND, String diaChi) {
		HopDongDAO hopDongDAO = new HopDongDAO();
		MaTuTang maTuTang = new MaTuTang();

		// lấy mã tự tăng
		int maHD = maTuTang.getMaHopDong();
		int maKH = maTuTang.getMaKH();

		// insert database
		hopDongDAO.themKhachHang(maKH, tenKhachHang, gioiTinh, soCMND, diaChi);
		hopDongDAO.themHopDong(maHD, maKH);
	}
}
