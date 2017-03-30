package bean;

import java.io.Serializable;

public class TaiSan implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int maTaiSan;
	private String tenTaiSan;
	private int maLoaiTaiSan;
	private String tenLoaiTaiSan;
	private int tinhTrang;
	private String moTa;
	private String hinhAnh;
	private LoaiTaiSan loaiTaiSan;
	private ChiTietHopDong chiTietHopDong;

	public TaiSan() {
		super();
	}

	public TaiSan(int maTaiSan, int maLoaiTaiSan, String tenTaiSan, int tinhTrang, String moTa, String hinhAnh) {
		super();
		this.maTaiSan = maTaiSan;
		this.tenTaiSan = tenTaiSan;
		this.maLoaiTaiSan = maLoaiTaiSan;
		this.tinhTrang = tinhTrang;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
	}

	public TaiSan(int maTaiSan, int maLoaiTaiSan, String tenTaiSan, int tinhTrang, String hinhAnh, String moTa,
			LoaiTaiSan loaiTaiSan) {
		super();
		this.maTaiSan = maTaiSan;
		this.tenTaiSan = tenTaiSan;
		this.maLoaiTaiSan = maLoaiTaiSan;
		this.tinhTrang = tinhTrang;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.loaiTaiSan = loaiTaiSan;
	}

	public TaiSan(int maLoaiTaiSan, String tenTaiSan, int tinhTrang, String moTa, String hinhAnh) {
		super();
		this.tenTaiSan = tenTaiSan;
		this.maLoaiTaiSan = maLoaiTaiSan;
		this.tinhTrang = tinhTrang;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
	}

	public int getMaLoaiTaiSan() {
		return maLoaiTaiSan;
	}

	public void setMaLoaiTaiSan(int maLoaiTaiSan) {
		this.maLoaiTaiSan = maLoaiTaiSan;
	}

	public LoaiTaiSan getLoaiTaiSan() {
		return loaiTaiSan;
	}

	public void setLoaiTaiSan(LoaiTaiSan loaiTaiSan) {
		this.loaiTaiSan = loaiTaiSan;
	}

	public ChiTietHopDong getChiTietHopDong() {
		return chiTietHopDong;
	}

	public void setChiTietHopDong(ChiTietHopDong chiTietHopDong) {
		this.chiTietHopDong = chiTietHopDong;
	}

	public int getMaTaiSan() {
		return maTaiSan;
	}

	public void setMaTaiSan(int maTaiSan) {
		this.maTaiSan = maTaiSan;
	}

	public String getTenTaiSan() {
		return tenTaiSan;
	}

	public void setTenTaiSan(String tenTaiSan) {
		this.tenTaiSan = tenTaiSan;
	}

	public String getTenLoaiTaiSan() {
		return tenLoaiTaiSan;
	}

	public void setTenLoaiTaiSan(String tenLoaiTaiSan) {
		this.tenLoaiTaiSan = tenLoaiTaiSan;
	}

	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
}
