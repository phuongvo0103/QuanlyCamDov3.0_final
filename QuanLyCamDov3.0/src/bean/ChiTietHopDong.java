package bean;

public class ChiTietHopDong {

	private int maCTHD;
	private int maHopDong;
	private int maLaiSuat;
	private int maDongLai;
	private int maTaiSan;
	private String ngayCam;
	private String ngayTra;
	private float soTienCam;
	private int tinhTrang;
	private String trangThai;
	private KhachHang khachHang;
	private TaiSan taiSan;
	private LaiSuat laiSuat;
	private DongTienLai dongTienLai;
	private float tienThanhToan;
	private String ngayThanhToan;
	
	//format money
	private String soTienCamFormat;
	private String tienThanhToanFormat;
	
	/*
	 * Tình trạng hợp đông : 0: chưa thanh toán, 1: đã thanh toán
	 */

	public ChiTietHopDong() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietHopDong(int maCTHD, int maHopDong, int maLaiSuat, int maDongLai, int maTaiSan, String ngayCam,
			String ngayTra, float soTienCam, int tinhTrang, KhachHang khachHang, TaiSan taiSan, LaiSuat laiSuat,
			DongTienLai dongTienLai, float tienThanhToan) {
		super();
		this.maCTHD = maCTHD;
		this.maHopDong = maHopDong;
		this.maLaiSuat = maLaiSuat;
		this.maDongLai = maDongLai;
		this.maTaiSan = maTaiSan;
		this.ngayCam = ngayCam;
		this.ngayTra = ngayTra;
		this.soTienCam = soTienCam;
		this.tinhTrang = tinhTrang;
		this.khachHang = khachHang;
		this.taiSan = taiSan;
		this.laiSuat = laiSuat;
		this.dongTienLai = dongTienLai;
		this.tienThanhToan = tienThanhToan;
	}

	
	public String getNgayThanhToan() {
		return ngayThanhToan;
	}

	public void setNgayThanhToan(String ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}

	public String getSoTienCamFormat() {
		return soTienCamFormat;
	}

	public void setSoTienCamFormat(String soTienCamFormat) {
		this.soTienCamFormat = soTienCamFormat;
	}

	public String getTienThanhToanFormat() {
		return tienThanhToanFormat;
	}

	public void setTienThanhToanFormat(String tienThanhToanFormat) {
		this.tienThanhToanFormat = tienThanhToanFormat;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public float getTienThanhToan() {
		return tienThanhToan;
	}

	public void setTienThanhToan(float tienThanhToan) {
		this.tienThanhToan = tienThanhToan;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public TaiSan getTaiSan() {
		return taiSan;
	}

	public void setTaiSan(TaiSan taiSan) {
		this.taiSan = taiSan;
	}

	public LaiSuat getLaiSuat() {
		return laiSuat;
	}

	public void setLaiSuat(LaiSuat laiSuat) {
		this.laiSuat = laiSuat;
	}

	public DongTienLai getDongTienLai() {
		return dongTienLai;
	}

	public void setDongTienLai(DongTienLai dongTienLai) {
		this.dongTienLai = dongTienLai;
	}

	public int getMaCTHD() {
		return maCTHD;
	}

	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}

	public int getMaHopDong() {
		return maHopDong;
	}

	public void setMaHopDong(int maHopDong) {
		this.maHopDong = maHopDong;
	}

	public int getMaLaiSuat() {
		return maLaiSuat;
	}

	public void setMaLaiSuat(int maLaiSuat) {
		this.maLaiSuat = maLaiSuat;
	}

	public int getMaDongLai() {
		return maDongLai;
	}

	public void setMaDongLai(int maDongLai) {
		this.maDongLai = maDongLai;
	}

	public int getMaTaiSan() {
		return maTaiSan;
	}

	public void setMaTaiSan(int maTaiSan) {
		this.maTaiSan = maTaiSan;
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

	public float getSoTienCam() {
		return soTienCam;
	}

	public void setSoTienCam(float soTienCam) {
		this.soTienCam = soTienCam;
	}

	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

}
