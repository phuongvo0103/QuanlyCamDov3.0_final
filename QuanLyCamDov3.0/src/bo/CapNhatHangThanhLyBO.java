package bo;

import java.util.ArrayList;

import bean.TaiSan;
import bean.ThanhLy;
import dao.CapNhatHangThanhLyDAO;

public class CapNhatHangThanhLyBO {
	
	private CapNhatHangThanhLyDAO dao=null;
	
	public CapNhatHangThanhLyBO() {
		// TODO Auto-generated constructor stub
		dao=new CapNhatHangThanhLyDAO();
	}
	
	public TaiSan layDanhSachKhachHangTheoMaCTHD(int maCTHD){
		return dao.layDanhSachKhachHangTheoMaCTHD(maCTHD);
	}
	
	public ArrayList<ThanhLy> layDanhSachHangThanhLy(){
		return dao.layDanhSachHangThanhLy();
	}
	
	public void themHangThanhLy(int maTaiSan,float soTienThanhLy){
		 dao.themHangThanhLy( maTaiSan,soTienThanhLy);
	}
	
	public void capNhatHangThanhLy(int maThanhLy){
		dao.capNhatHangThanhLy(maThanhLy);
	}
}
