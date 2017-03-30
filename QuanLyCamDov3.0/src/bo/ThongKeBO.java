package bo;

import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.DoanhThu;
import bean.KhachHang;
import bean.TaiSan;
import dao.ThongKeDAO;

public class ThongKeBO {
	public ThongKeBO() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<KhachHang> getKhachHangByWord(int nam, int thang) {
		return new ThongKeDAO().getKhachHangByWord(nam, thang);
	}

	public ArrayList<TaiSan> getSanPhamByWord(int nam, int thang, int maLoai) {
		return new ThongKeDAO().getSanPhamByWord(nam, thang, maLoai);
	}

	public ArrayList<ChiTietHopDong> getListHopDongHetHan() {
		return new ThongKeDAO().getListHopDongHetHan();
	}
	
	public ArrayList<ChiTietHopDong> getHopDongHetHan() {
		return new ThongKeDAO().getHopDongHetHan();
	}
	
	public int kiemTraDongLai(){
		return new ThongKeDAO().kiemTraDongLai();
	}
	
	public ArrayList<Integer> layMaTaiSan(){
		return new ThongKeDAO().layMaTaiSan();
	}
	
	public ArrayList<DoanhThu> ThongKeDoanhThuTheoThangCuaNam(int nam){
		return new ThongKeDAO().ThongKeDoanhThuTheoThangCuaNam(nam);
	}
	
	public ArrayList<DoanhThu> ThongKeDoanhThuTatCaCacNam(){
		return new ThongKeDAO().ThongKeDoanhThuTatCaCacNam();
	}
}
