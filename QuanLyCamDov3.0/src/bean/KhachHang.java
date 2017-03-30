package bean;

import java.io.Serializable;

public class KhachHang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String maKhachHang;
	private String tenKhachHang;
	private String soCMND;
	private String gioiTinh;
	private String diaChi;
	private HopDong hopDong;
	private TaiSan taiSan;
	private int maHopDong;
	private ChiTietHopDong chiTietHopDong;

	public KhachHang() {
		// TODO Auto-generated constructor stub
	}

	public KhachHang(String maKhachHang, String tenKhachHang, String gioiTinh, String soCMND, String diaChi) {
		super();
		this.maKhachHang = maKhachHang;
		this.tenKhachHang = tenKhachHang;
		this.soCMND = soCMND;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
	}

	public int getMaHopDong() {
		return maHopDong;
	}

	public void setMaHopDong(int maHopDong) {
		this.maHopDong = maHopDong;
	}

	public HopDong getHopDong() {
		return hopDong;
	}

	public void setHopDong(HopDong hopDong) {
		this.hopDong = hopDong;
	}

	public TaiSan getTaiSan() {
		return taiSan;
	}

	public void setTaiSan(TaiSan taiSan) {
		this.taiSan = taiSan;
	}

	public ChiTietHopDong getChiTietHopDong() {
		return chiTietHopDong;
	}

	public void setChiTietHopDong(ChiTietHopDong chiTietHopDong) {
		this.chiTietHopDong = chiTietHopDong;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}

	public String getSoCMND() {
		return soCMND;
	}

	public void setSoCMND(String soCMND) {
		this.soCMND = soCMND;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
}
