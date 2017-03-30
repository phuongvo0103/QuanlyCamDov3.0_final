package bo;
import java.util.ArrayList;
import bean.DongTienLai;
import dao.DongTienLaiDAO;
import common.CellData;

public class DongTienLaiBO {
	CellData cell=new CellData();
	DongTienLaiDAO dtlDAO=new DongTienLaiDAO();
	public ArrayList<DongTienLai> getListDongLai(int maCTHD) {
		return dtlDAO.getListDongLai(maCTHD);
	}
	
	public boolean dongLaiKyTiep(int maCTHD) {
		int maDongLai=cell.getMaDongLaiIs0(maCTHD);
		if(maDongLai==0) return false;
		return dtlDAO.dongLaiKyTiep(maCTHD,maDongLai);
	}
}
