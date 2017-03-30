package bean;

public class LaiSuat {
	private int maLaiSuat;
	private float mucLaiSuat;
	private float tienGiaHan;
	private String moTa;

	public LaiSuat() {
		// TODO Auto-generated constructor stub
	}

	public LaiSuat(int maLaiSuat, float mucLaiSuat, float tienGiaHan, String moTa) {
		super();
		this.maLaiSuat = maLaiSuat;
		this.mucLaiSuat = mucLaiSuat;
		this.tienGiaHan = tienGiaHan;
		this.moTa = moTa;
	}

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

	public float getTienGiaHan() {
		return tienGiaHan;
	}

	public void setTienGiaHan(float tienGiaHan) {
		this.tienGiaHan = tienGiaHan;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

}
