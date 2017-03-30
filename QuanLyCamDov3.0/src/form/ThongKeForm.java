package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import bean.ChiTietHopDong;
import bean.DoanhThu;
import bean.KhachHang;
import bean.LoaiTaiSan;
import bean.TaiSan;
import bean.ThanhLy;
import net.sf.json.JSONArray;

public class ThongKeForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int page;
	private String massage;
	private String nam;
	private String thang;

	private String soLuong;
	private String tongTien;

	private JSONArray array;

	// thống kê khách hàng
	private ArrayList<KhachHang> listKH;
	private Collection<Integer> pages;

	// thống kê sản phẩm
	private ArrayList<TaiSan> listTS;
	private ArrayList<LoaiTaiSan> listLoaiTS;
	private String maLoaiTS;

	// hợp đông sắp hết hạn
	private ArrayList<ChiTietHopDong> listHDHH;
	
	//hợp đồng hết hạn
	private ArrayList<ChiTietHopDong> listHH;
	private Collection<Integer> pagesHH;
	private int pageHH;
	
	//thanh lý tài sản
	private ArrayList<ThanhLy> listTL;
	private Collection<Integer> pagesTL;
	private int pageTL;
	private int maThanhLy;
	private String submit;
	
	//thống kê doanh thu
	private ArrayList<DoanhThu> listDT;
	
	/**
	 * kiểm tra hợp đồng có gia hạn hay không
	 */
	private int kiemTraDongLai;
	
	
	public ArrayList<DoanhThu> getListDT() {
		return listDT;
	}

	public void setListDT(ArrayList<DoanhThu> listDT) {
		this.listDT = listDT;
	}

	/**
	 * lấy mã tài sản
	 * @return
	 * 
	 */
	private ArrayList<Integer> listMaTaiSan;
	
	
	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public int getMaThanhLy() {
		return maThanhLy;
	}

	public void setMaThanhLy(int maThanhLy) {
		this.maThanhLy = maThanhLy;
	}

	public ArrayList<ThanhLy> getListTL() {
		return listTL;
	}

	public void setListTL(ArrayList<ThanhLy> listTL) {
		this.listTL = listTL;
	}

	public Collection<Integer> getPagesTL() {
		return pagesTL;
	}

	public void setPagesTL(Collection<Integer> pagesTL) {
		this.pagesTL = pagesTL;
	}

	public int getPageTL() {
		return pageTL;
	}

	public void setPageTL(int pageTL) {
		this.pageTL = pageTL;
	}

	public ArrayList<Integer> getListMaTaiSan() {
		return listMaTaiSan;
	}

	public void setListMaTaiSan(ArrayList<Integer> listMaTaiSan) {
		this.listMaTaiSan = listMaTaiSan;
	}

	public int getKiemTraDongLai() {
		return kiemTraDongLai;
	}

	public void setKiemTraDongLai(int kiemTraDongLai) {
		this.kiemTraDongLai = kiemTraDongLai;
	}

	public int getPageHH() {
		return pageHH;
	}

	public void setPageHH(int pageHH) {
		this.pageHH = pageHH;
	}

	public ArrayList<ChiTietHopDong> getListHH() {
		return listHH;
	}

	public void setListHH(ArrayList<ChiTietHopDong> listHH) {
		this.listHH = listHH;
	}

	public Collection<Integer> getPagesHH() {
		return pagesHH;
	}

	public void setPagesHH(Collection<Integer> pagesHH) {
		this.pagesHH = pagesHH;
	}

	public Collection<Integer> getPages() {
		return pages;
	}

	public void setPages(Collection<Integer> pagesKH) {
		this.pages = pagesKH;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public JSONArray getArray() {
		return array;
	}

	public void setArray(JSONArray array) {
		this.array = array;
	}

	public ArrayList<ChiTietHopDong> getListHDHH() {
		return listHDHH;
	}

	public void setListHDHH(ArrayList<ChiTietHopDong> listHDHH) {
		this.listHDHH = listHDHH;
	}

	public String getMaLoaiTS() {
		return maLoaiTS;
	}

	public void setMaLoaiTS(String tenLoaiTS) {
		this.maLoaiTS = tenLoaiTS;
	}

	public ArrayList<LoaiTaiSan> getListLoaiTS() {
		return listLoaiTS;
	}

	public void setListLoaiTS(ArrayList<LoaiTaiSan> listLoaiTS) {
		this.listLoaiTS = listLoaiTS;
	}

	public ArrayList<TaiSan> getListTS() {
		return listTS;
	}

	public void setListTS(ArrayList<TaiSan> listTS) {
		this.listTS = listTS;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getTongTien() {
		return tongTien;
	}

	public void setTongTien(String tongTien) {
		this.tongTien = tongTien;
	}

	public ArrayList<KhachHang> getListKH() {
		return listKH;
	}

	public void setListKH(ArrayList<KhachHang> listKH) {
		this.listKH = listKH;
	}

	public String getNam() {
		return nam;
	}

	public void setNam(String nam) {
		this.nam = nam;
	}

	public String getThang() {
		return thang;
	}

	public void setThang(String thang) {
		this.thang = thang;
	}

	public String getMassage() {
		return massage;
	}

	public void setMassage(String massage) {
		this.massage = massage;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		super.reset(mapping, request);

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
