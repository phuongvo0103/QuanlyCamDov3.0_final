package bo;

import java.util.ArrayList;

import bean.DongTienLai;
import common.CellData;
import common.XuLy;
import dao.ChiTietHopDongDAO;
import dao.DongTienLaiDAO;
import dao.ThanhToanDAO;

public class ThanhToanBO {
	DongTienLaiDAO dtlDAO=new DongTienLaiDAO();
	ChiTietHopDongDAO cthdDAO=new ChiTietHopDongDAO();
	ThanhToanDAO thanhToanDAO=new ThanhToanDAO();
	CellData cell=new CellData();
	XuLy xl=new XuLy();
	public ArrayList<DongTienLai> getListDongLai(int maCTHD) {
		return dtlDAO.getListDongLai(maCTHD);
	}
	public boolean dongLaiKyTiep(int maCTHD) {
		int maDongLai=cell.getMaDongLaiIs0(maCTHD);
		if(maDongLai==0) return false;
		return dtlDAO.dongLaiKyTiep(maCTHD,maDongLai);
	}
	public void thanhToan(int maCTHD) {
		cthdDAO.thanhToan(maCTHD);
	}
	public void themThanhToan(int maCTHD, double tongTienThanhToan) {
	String ngaytt=xl.ngayHt;
	thanhToanDAO.themThanhToan(maCTHD,ngaytt,tongTienThanhToan);
	}
}
