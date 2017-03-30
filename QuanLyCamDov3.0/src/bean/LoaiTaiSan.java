package bean;

public class LoaiTaiSan {
	private int maLoaiTaiSan;
	private String tenLoaiTaiSan;

	public LoaiTaiSan() {
		super();
	}

	public LoaiTaiSan(String tenLoaiTaiSan) {
		super();
		this.tenLoaiTaiSan = tenLoaiTaiSan;
	}

	public int getMaLoaiTaiSan() {
		return maLoaiTaiSan;
	}

	public void setMaLoaiTaiSan(int maLoaiTaiSan) {
		this.maLoaiTaiSan = maLoaiTaiSan;
	}

	public String getTenLoaiTaiSan() {
		return tenLoaiTaiSan;
	}

	public void setTenLoaiTaiSan(String tenLoaiTaiSan) {
		this.tenLoaiTaiSan = tenLoaiTaiSan;
	}
}
