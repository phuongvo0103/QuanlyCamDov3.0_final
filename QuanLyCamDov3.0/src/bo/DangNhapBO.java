package bo;

import dao.DangNhapDAO;

public class DangNhapBO {
	public DangNhapBO() {
		// TODO Auto-generated constructor stub
	}

	public boolean dangNhapHeThong(String taiKhoan, String matKhau) {
		return new DangNhapDAO().dangNhapHeThong(taiKhoan, matKhau);
	}
}
