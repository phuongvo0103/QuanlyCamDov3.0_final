package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
/*
 * 
 * 
 */
import org.apache.struts.action.ActionMapping;

import bean.ChiTietHopDong;
public class DanhSachHopDongForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ArrayList<ChiTietHopDong> listHD;
	private int page;
	private Collection<Integer> pages;
	
	public Collection<Integer> getPages() {
		return pages;
	}

	public void setPages(Collection<Integer> pages) {
		this.pages = pages;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ArrayList<ChiTietHopDong> getListHD() {
		return listHD;
	}

	public void setListHD(ArrayList<ChiTietHopDong> listHD) {
		this.listHD = listHD;
	}
	
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	try {
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
}
