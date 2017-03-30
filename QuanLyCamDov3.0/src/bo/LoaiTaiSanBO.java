package bo;

import java.util.ArrayList;

import bean.LoaiTaiSan;
import dao.LoaiTaiSanDAO;

public class LoaiTaiSanBO {
	LoaiTaiSanDAO loaiTaiSanDAO = new LoaiTaiSanDAO();

	public ArrayList<LoaiTaiSan> getListLoaiTaiSan() {
		return loaiTaiSanDAO.getListLoaiTaiSan();
	}
}
