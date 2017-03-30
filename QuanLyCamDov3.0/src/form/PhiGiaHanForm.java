package form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class PhiGiaHanForm extends ActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int maCTHD;
	private String tenKhachHang;
	private int soCMND;
	
	private String ngayBatDauHopDong;
	private String ngayBatDau;
	private String ngayKetThuc;
	private String thoiGianGH;
	private String tinhTrangGH;
	private String thoiGianHopDong;
	private String tienGH1Ngay;
	private String tongTienGH;
	
	private String mucLaiSuat;
	private String tongTienLai;
	
	private String soTienCam;
	private String tongTienTT;
	
	private String thongBao;
	private String giaHan;
	
	public int getMaCTHD() {
		return maCTHD;
	}
	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}
	public String getTenKhachHang() {
		return tenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}
	
	public int getSoCMND() {
		return soCMND;
	}
	public void setSoCMND(int soCMND) {
		this.soCMND = soCMND;
	}

	public String getNgayBatDauHopDong() {
		return ngayBatDauHopDong;
	}
	public void setNgayBatDauHopDong(String ngayBatDauHopDong) {
		this.ngayBatDauHopDong = ngayBatDauHopDong;
	}
	public String getNgayBatDau() {
		return ngayBatDau;
	}
	public void setNgayBatDau(String ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	public String getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(String ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public String getThoiGianGH() {
		return thoiGianGH;
	}
	public void setThoiGianGH(String thoiGianGH) {
		this.thoiGianGH = thoiGianGH;
	}
	public String getTinhTrangGH() {
		return tinhTrangGH;
	}
	public void setTinhTrangGH(String tinhTrangGH) {
		this.tinhTrangGH = tinhTrangGH;
	}
	public String getThoiGianHopDong() {
		return thoiGianHopDong;
	}
	public void setThoiGianHopDong(String thoiGianHopDong) {
		this.thoiGianHopDong = thoiGianHopDong;
	}
	public String getTienGH1Ngay() {
		return tienGH1Ngay;
	}
	public void setTienGH1Ngay(String tienGH1Ngay) {
		this.tienGH1Ngay = tienGH1Ngay;
	}
	public String getTongTienGH() {
		return tongTienGH;
	}
	public void setTongTienGH(String tongTienGH) {
		this.tongTienGH = tongTienGH;
	}
	public String getMucLaiSuat() {
		return mucLaiSuat;
	}
	public void setMucLaiSuat(String mucLaiSuat) {
		this.mucLaiSuat = mucLaiSuat;
	}
	public String getTongTienLai() {
		return tongTienLai;
	}
	public void setTongTienLai(String tongTienLai) {
		this.tongTienLai = tongTienLai;
	}
	public String getSoTienCam() {
		return soTienCam;
	}
	public void setSoTienCam(String soTienCam) {
		this.soTienCam = soTienCam;
	}
	public String getTongTienTT() {
		return tongTienTT;
	}
	public void setTongTienTT(String tongTienTT) {
		this.tongTienTT = tongTienTT;
	}
	public String getThongBao() {
		return thongBao;
	}
	public void setThongBao(String thongBao) {
		this.thongBao = thongBao;
	}
	
	public String getGiaHan() {
		return giaHan;
	}
	public void setGiaHan(String giaHan) {
		this.giaHan = giaHan;
	}
	

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		super.reset(mapping, request);
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
