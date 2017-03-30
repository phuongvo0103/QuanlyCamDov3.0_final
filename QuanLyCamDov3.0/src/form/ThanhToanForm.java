package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import bean.DongTienLai;
import common.XuLy;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class ThanhToanForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	XuLy xl=new XuLy();
	
	private ArrayList<DongTienLai> listDongLai = new ArrayList<DongTienLai>();

	// group khách hàng
	private int maCTHD;
	private String tenKhachHang;

	// group lãi suất
	private String tongTienGiaHan;
	private String tienNoGiaHan;
	private String tienNoKyTiep;
	private String dongLai;

	// group gia hạn
	private String ngayKTHD;
	private String giaHanDen;
	private String xemTruoc;
	private String soNgayHopDong;
	private double tienNoTam;

	// group thanh toán
	private String tongTien;
	private String thanhToan;
	private String soTienCam;
	private String tinhTrangGiaHan;
	private String ngayBatDauHopDong;
	private String ngayKetThucHopDong;
	private String mucLaiSuat;
	private String tienNo;

	
	//thong bao
	private String thongBao;
	private String thongBaoTT;
	
	
	public double getTienNoTam() {
		return tienNoTam;
	}

	public void setTienNoTam(double tienNoTam) {
		this.tienNoTam = tienNoTam;
	}

	public String getSoNgayHopDong() {
		return soNgayHopDong;
	}

	public void setSoNgayHopDong(String soNgayHopDong) {
		this.soNgayHopDong = soNgayHopDong;
	}

	public String getThongBaoTT() {
		return thongBaoTT;
	}

	public void setThongBaoTT(String thongBaoTT) {
		this.thongBaoTT = thongBaoTT;
	}

	public String getThongBao() {
		return thongBao;
	}

	public void setThongBao(String thongBao) {
		this.thongBao = thongBao;
	}

	public ArrayList<DongTienLai> getListDongLai() {
		return listDongLai;
	}

	public void setListDongLai(ArrayList<DongTienLai> listDongLai) {
		this.listDongLai = listDongLai;
	}

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

	public String getTongTienGiaHan() {
		return tongTienGiaHan;
	}

	public void setTongTienGiaHan(double tongTienGiaHan) {
		this.tongTienGiaHan = xl.format(tongTienGiaHan)+" đồng";
	}

	public String getTienNoGiaHan() {
		return tienNoGiaHan;
	}

	public void setTienNoGiaHan(double tienNoGiaHan) {
		this.tienNoGiaHan = xl.format(tienNoGiaHan)+" đồng";
	}

	public String getTienNoKyTiep() {
		return tienNoKyTiep;
	}

	public void setTienNoKyTiep(String tienNoKyTiep) {
		this.tienNoKyTiep = tienNoKyTiep;
	}

	public String getDongLai() {
		return dongLai;
	}

	public void setDongLai(String dongLai) {
		this.dongLai = dongLai;
	}

	public String getNgayKTHD() {
		return ngayKTHD;
	}

	public void setNgayKTHD(String ngayKTHD) {
		this.ngayKTHD = ngayKTHD;
	}

	public String getGiaHanDen() {
		return giaHanDen;
	}

	public void setGiaHanDen(String giaHanDen) {
		this.giaHanDen = giaHanDen;
	}

	public String getXemTruoc() {
		return xemTruoc;
	}

	public void setXemTruoc(String xemTruoc) {
		this.xemTruoc = xemTruoc;
	}

	public String getTongTien() {
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = xl.format(tongTien)+ " đồng";
	}

	public String getThanhToan() {
		return thanhToan;
	}

	public void setThanhToan(String thanhToan) {
		this.thanhToan = thanhToan;
	}

	public String getSoTienCam() {
		return soTienCam;
	}

	public void setSoTienCam(double soTienCam) {
		this.soTienCam = xl.format(soTienCam)+" đồng";
	}

	public String getTinhTrangGiaHan() {
		return tinhTrangGiaHan;
	}

	public void setTinhTrangGiaHan(String tinhTrangGiaHan) {
		this.tinhTrangGiaHan = tinhTrangGiaHan;
	}

	public String getNgayBatDauHopDong() {
		return ngayBatDauHopDong;
	}

	public void setNgayBatDauHopDong(String ngayBatDauHopDong) {
		this.ngayBatDauHopDong = ngayBatDauHopDong;
	}

	public String getNgayKetThucHopDong() {
		return ngayKetThucHopDong;
	}

	public void setNgayKetThucHopDong(String ngayKetThucHopDong) {
		this.ngayKetThucHopDong = ngayKetThucHopDong;
	}

	public String getMucLaiSuat() {
		return mucLaiSuat;
	}

	public void setMucLaiSuat(float mucLaiSuat) {
		this.mucLaiSuat = mucLaiSuat+" %";
	}

	public String getTienNo() {
		return tienNo;
	}

	public void setTienNo(double tienNo) {
		this.tienNo = xl.format(tienNo)+" đồng";
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
