package common;

public class XuLyChuoi {

	public static String sGioiTinh(int gt) {
		return gt == 1 ? "Nam" : "Nữ";
	}

	public static String sTinhTrang(int tt) {
		return tt == 0 ? "Chưa thanh toán" : "Đã thanh toán";
	}
	
	public static String sTrangThai(int tt) {
		return tt == 0 ? "Chưa thanh lý" : "Đã thanh lý";
	}
}
