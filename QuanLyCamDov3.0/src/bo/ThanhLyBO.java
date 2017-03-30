package bo;

import java.util.ArrayList;

import bean.ThanhLy;
import dao.ThanhLyDAO;

public class ThanhLyBO {

	public ThanhLyBO() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ThanhLy> getListHangThanhLy() {

		return new ThanhLyDAO().getListHangThanhLy();
	}
}
