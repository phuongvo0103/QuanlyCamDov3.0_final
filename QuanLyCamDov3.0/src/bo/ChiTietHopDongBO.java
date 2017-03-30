package bo;

import java.text.ParseException;
import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.LoaiTaiSan;
import dao.ChiTietHopDongDAO;

import common.MaTuTang;
import common.XuLy;

public class ChiTietHopDongBO {
	MaTuTang maTuTang = new MaTuTang();
	ChiTietHopDongDAO chiTietHopDongDAO = new ChiTietHopDongDAO();

	int maTaiSan = maTuTang.getMaTaiSan();

	public ArrayList<LoaiTaiSan> getListDanhMuc() {
		return chiTietHopDongDAO.getListDanhMuc();
	}

	public ArrayList<ChiTietHopDong> getListChiTietHopDong(int maHopDong) {
		return chiTietHopDongDAO.getListChiTietHopDong(maHopDong);
	}
	
	public ArrayList<ChiTietHopDong> getListChiTietHopDong() {
		return chiTietHopDongDAO.getListChiTietHopDong();
	}

	public boolean themChiTietHopDong(int maHopDong, String ngayTra, double giaCam) throws ParseException {
		// lấy maCTHD
		int maCTHD = maTuTang.getMaCTHD();

		System.out.println("ChiTietHopDongBO/themChiTietHopDong/giaCam: " + giaCam);
		System.out.println("ChiTietHopDongBO/themChiTietHopDong/ngayTra: " + ngayTra);

		// lấy mã lãi suất
		XuLy xuLy = new XuLy();
		int maLaiSuat = xuLy.maLaiSuat(xuLy.ngayHt, ngayTra, giaCam);

		// test mã lãi suất
		System.out.println("ChiTietHopDongBO/themChiTietHopDong - maLaiSuat: " + maLaiSuat);

		// ngày cầm
		String ngayCam = xuLy.ngayHt;

		// tình trạng, chưa chưa hết hạn =1
		int tinhTrang = 0;

		double tienThanhToan = xuLy.getTienThanhToan(maLaiSuat, giaCam);
		// số tiền hoặc tgian hopdong quá giới hạn
		if (maLaiSuat == 0)
			return false;
		return chiTietHopDongDAO.themChiTietHopDong(maCTHD, maHopDong, maLaiSuat, maTaiSan, ngayCam, ngayTra, giaCam,
				tinhTrang, tienThanhToan);
	}

	public boolean themTaiSan(int maDanhMuc, String tenTaiSan, String urlHinhAnh, String moTaTaiSan) {
		int tinhTrang = 1;
		// String urlHinhAnh="Chưa xu ly";
		return chiTietHopDongDAO.themTaiSan(maTaiSan, maDanhMuc, tenTaiSan, tinhTrang, urlHinhAnh, moTaTaiSan);
	}

	public void thanhToan(int maCTHD) {
		chiTietHopDongDAO.thanhToan(maCTHD);
	}
}
