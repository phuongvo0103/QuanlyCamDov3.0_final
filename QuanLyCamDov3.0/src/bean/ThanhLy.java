package bean;

import java.io.Serializable;

public class ThanhLy implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int maThanhLy;
	private int maTaiSan;
	private String soTienThanhLy;
	private String tenTaiSanThanhLy;
	private String hinhAnh;
	private String trangThai;
	
	/*
	 * tình trạng 0,1 -> trang thái : chưa thanh lý, đã thanh lý
	 */
	private int tinhTrang;
	
	/**
	 * lấy tên tài sản
	 */
	private String tenTaiSan;

	public ThanhLy() {
		// TODO Auto-generated constructor stub
	}

	public ThanhLy(int maThanhLy, int maTaiSan, String soTienThanhLy, String tenTaiSanThanhLy, String hinhAnh) {
		super();
		this.maThanhLy = maThanhLy;
		this.maTaiSan = maTaiSan;
		this.soTienThanhLy = soTienThanhLy;
		this.tenTaiSanThanhLy = tenTaiSanThanhLy;
		this.hinhAnh = trangThai;
	}
	
	
	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public String getTenTaiSan() {
		return tenTaiSan;
	}

	public void setTenTaiSan(String tenTaiSan) {
		this.tenTaiSan = tenTaiSan;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public int getMaThanhLy() {
		return maThanhLy;
	}

	public void setMaThanhLy(int maThanhLy) {
		this.maThanhLy = maThanhLy;
	}

	public int getMaTaiSan() {
		return maTaiSan;
	}

	public void setMaTaiSan(int maTaiSan) {
		this.maTaiSan = maTaiSan;
	}

	public String getSoTienThanhLy() {
		return soTienThanhLy;
	}

	public void setSoTienThanhLy(String soTienThanhLy) {
		this.soTienThanhLy = soTienThanhLy;
	}

	public String getTenTaiSanThanhLy() {
		return tenTaiSanThanhLy;
	}

	public void setTenTaiSanThanhLy(String tenTaiSanThanhLy) {
		this.tenTaiSanThanhLy = tenTaiSanThanhLy;
	}
}
