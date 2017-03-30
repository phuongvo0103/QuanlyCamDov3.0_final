package bean;

public class DongTienLai {
	private int maDongLai;
	private int maCTHD;
	private int tinhTrang;
	private String tinhTrang1;
	private String ngayDong;
	private float soTienDong;

	public DongTienLai() {
		// TODO Auto-generated constructor stub
	}

	public DongTienLai(int maDongLai, int maCTHD, int tinhTrang, String ngayDong, float soTienDong) {
		super();
		this.maDongLai = maDongLai;
		this.maCTHD = maCTHD;
		this.tinhTrang = tinhTrang;
		this.ngayDong = ngayDong;
		this.soTienDong = soTienDong;
	}
	
	public String getTinhTrang1() {
		return tinhTrang1;
	}

	public void setTinhTrang1(String tinhTrang1) {
		this.tinhTrang1 = tinhTrang1;
	}

	public float getSoTienDong() {
		return soTienDong;
	}

	public void setSoTienDong(float soTienDong) {
		this.soTienDong = soTienDong;
	}

	public int getMaDongLai() {
		return maDongLai;
	}

	public void setMaDongLai(int maDongLai) {
		this.maDongLai = maDongLai;
	}

	public int getMaCTHD() {
		return maCTHD;
	}

	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}

	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int soTienDong) {
		this.tinhTrang = soTienDong;
	}

	public String getNgayDong() {
		return ngayDong;
	}

	public void setNgayDong(String ngayDong) {
		this.ngayDong = ngayDong;
	}

}
