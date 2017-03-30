package bo;

import java.text.ParseException;

import dao.PhiGiaHanDAO;
import common.CellData;
import common.MaTuTang;
import common.XuLy;

public class PhiGiaHanBO {
	CellData cell = new CellData();
	XuLy xuLy = new XuLy();
	MaTuTang maTuTang = new MaTuTang();
	PhiGiaHanDAO phiGiaHanDAO = new PhiGiaHanDAO();

	public String getTenKhachHang(int maCTHD) {
		return cell.getTenKhachHang(maCTHD);
	}

	public boolean giaHanHopDong(int maCTHD, String ngayTra) throws ParseException {
		int maGiaHan = maTuTang.getMaGiaHan();

		String ngayCam = cell.getNgayCam(maCTHD);
		// lay gia cam cu
		float soTienCam = cell.getGiaCam(maCTHD);

		// lay ma lai suat moi
		int maLaiSuat = xuLy.maLaiSuat(ngayCam, ngayTra, soTienCam);

		System.out.println("ThanhToanBO/maLaiSuat: " + maLaiSuat);
		// insert database
		return phiGiaHanDAO.giaHanHopDong(maGiaHan, maLaiSuat, maCTHD, ngayCam, ngayTra);
	}

	public static void main(String[] args) throws ParseException {
		XuLy xuLy = new XuLy();
		System.out.println(xuLy.maLaiSuat("2017-03-21", "2017-04-10", 50000));
	}

	public void themDSDongLai(int maDongLai, int maCTHD, String ngay, double soTienDong) {
		int tinhTrang = 0;
		System.out.println("test madonglai");
		System.out.println("MaDongLai: " + maDongLai);
		phiGiaHanDAO.themDSDongLai(maDongLai, maCTHD, tinhTrang, ngay, soTienDong);
	}
}
