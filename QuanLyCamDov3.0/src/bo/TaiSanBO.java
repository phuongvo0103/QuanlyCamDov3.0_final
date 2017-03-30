package bo;

import java.util.ArrayList;

import bean.TaiSan;
import dao.TaiSanDAO;

public class TaiSanBO {
	public TaiSanBO() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<TaiSan> getListTaiSan() {
		return new TaiSanDAO().getListTaiSan();
	}

	public void themTaiSan(TaiSan taiSan) {
		new TaiSanDAO().themTaiSan(taiSan);
	}

	public ArrayList<TaiSan> getListTimKiemTaiSan(String tenTaiSan) {
		return new TaiSanDAO().getListTimKiemTaiSan(tenTaiSan);
	}
	
	public void xoaTaiSan(int maTaiSan){
		new TaiSanDAO().xoaTaiSan(maTaiSan);
	}
}
