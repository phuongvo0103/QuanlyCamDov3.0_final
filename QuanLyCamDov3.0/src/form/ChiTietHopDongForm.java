package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import bean.ChiTietHopDong;
import bean.LoaiTaiSan;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * 
 * @author HCD-Fresher164
 *
 */
public class ChiTietHopDongForm extends ActionForm {
	/**
	 * 
	 * 
	 */
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * input
	 */
	// CTHD
	private ArrayList<ChiTietHopDong> listChiTietHopDong;
	private int MaCTHD;
	private String moTaTaiSan;
	private String urlHinhAnh;
	private float soTienCam;
	private String ngayCam;
	private String ngayTra;
	private float tienThanhToan;
	private FormFile file;
	
	/*
	 * format giá cầm float -> String (200000.0 -> 200,000)
	 */
	private String giaCam;
	
	/*
	 * format Date -> String
	 */
	private String soNgay;
	
	/**
	 * Quay lại danh sách hợp đồng
	 */
	private String quayLai;
	
	/**
	 * hiển thị thông báo
	 */
	private String thongBao;
	
	/**
	 * biến gán tạm  xử dụng chung trong form
	 */
	private String bienTam;
	
	// HopDong
	private int maHopDong;

	// Tai san
	private String tenTaiSan;

	// Danh Muc
	private int maDanhMuc;
	private String tenDanhMuc;
	private ArrayList<LoaiTaiSan> listDanhMuc = new ArrayList<LoaiTaiSan>();

	// Khach Hang
	private String maKhachHang;
	private String tenKhachHang;
	private String diaChi;

	// lai suat
	private int maLaiSuat;
	private float mucLaiSuat;

	/**
	 * event
	 */
	private String datHopDong;
	private String xemTruoc;
	
	/**
	 * phân trang
	 */
	private int page;
	private ArrayList<ChiTietHopDong> listPages;
	private Collection<Integer> pages;
	
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ArrayList<ChiTietHopDong> getListPages() {
		return listPages;
	}

	public void setListPages(ArrayList<ChiTietHopDong> listPages) {
		this.listPages = listPages;
	}

	public Collection<Integer> getPages() {
		return pages;
	}

	public void setPages(Collection<Integer> pages) {
		this.pages = pages;
	}

	public String getBienTam() {
		return bienTam;
	}

	public void setBienTam(String bienTam) {
		this.bienTam = bienTam;
	}

	public String getGiaCam() {
		return giaCam;
	}

	public void setGiaCam(String giaCam) {
		this.giaCam = giaCam;
	}

	public String getSoNgay() {
		return soNgay;
	}

	public void setSoNgay(String soNgay) {
		this.soNgay = soNgay;
	}

	public String getQuayLai() {
		return quayLai;
	}

	public void setQuayLai(String quayLai) {
		this.quayLai = quayLai;
	}

	public String getThongBao() {
		return thongBao;
	}

	public void setThongBao(String thongBao) {
		this.thongBao = thongBao;
	}

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}

	// -- CTHD
	public ArrayList<ChiTietHopDong> getListChiTietHopDong() {
		return listChiTietHopDong;
	}

	public void setListChiTietHopDong(ArrayList<ChiTietHopDong> listChiTietHopDong) {
		this.listChiTietHopDong = listChiTietHopDong;
	}

	public int getMaCTHD() {
		return MaCTHD;
	}

	public void setMaCTHD(int maCTHD) {
		MaCTHD = maCTHD;
	}

	public String getUrlHinhAnh() {
		return urlHinhAnh;
	}

	public void setUrlHinhAnh(String urlHinhAnh) {
		this.urlHinhAnh = urlHinhAnh;
	}

	public float getSoTienCam() {
		return soTienCam;
	}

	public void setSoTienCam(float giaCam) {
		this.soTienCam = giaCam;
	}

	public String getNgayCam() {
		return ngayCam;
	}

	public void setNgayCam(String ngayCam) {
		this.ngayCam = ngayCam;
	}

	public String getNgayTra() {
		return ngayTra;
	}

	public void setNgayTra(String ngayTra) {
		this.ngayTra = ngayTra;
	}

	public float getTienThanhToan() {
		return tienThanhToan;
	}

	public void setTienThanhToan(float tienThanhToan) {
		this.tienThanhToan = tienThanhToan;
	}

	// -- Há»£p Ä�á»“ng
	public int getMaHopDong() {
		return maHopDong;
	}

	public void setMaHopDong(int maHopDong) {
		this.maHopDong = maHopDong;
	}

	// -- TÃ i sáº£n
	public String getTenTaiSan() {
		return tenTaiSan;
	}

	public void setTenTaiSan(String tenTaiSan) {
		this.tenTaiSan = tenTaiSan;
	}

	public void setMoTaTaiSan(String moTaTaiSan) {
		this.moTaTaiSan = moTaTaiSan;
	}

	public String getMoTaTaiSan() {
		return moTaTaiSan;
	}

	// --Danh Má»¥c
	public int getMaDanhMuc() {
		return maDanhMuc;
	}

	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public ArrayList<LoaiTaiSan> getListDanhMuc() {
		return listDanhMuc;
	}

	public void setListDanhMuc(ArrayList<LoaiTaiSan> listDanhMuc) {
		this.listDanhMuc = listDanhMuc;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	// -- KhÃ¡ch HÃ ng
	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	// -- Lai suat
	public int getMaLaiSuat() {
		return maLaiSuat;
	}

	public void setMaLaiSuat(int maLaiSuat) {
		this.maLaiSuat = maLaiSuat;
	}

	public float getMucLaiSuat() {
		return mucLaiSuat;
	}

	public void setMucLaiSuat(float mucLaiSuat) {
		this.mucLaiSuat = mucLaiSuat;
	}

	// -- Event
	public String getDatHopDong() {
		return datHopDong;
	}

	public void setDatHopDong(String datHopDong) {
		this.datHopDong = datHopDong;
	}

	public String getXemTruoc() {
		return xemTruoc;
	}

	public void setXemTruoc(String xemTruoc) {
		this.xemTruoc = xemTruoc;
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
