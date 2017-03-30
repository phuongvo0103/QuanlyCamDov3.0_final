package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import bean.ThanhLy;

public class HangThanhLyForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String taiKhoan;
	private String matKhau;
	private String submit;
	private ArrayList<ThanhLy> listTL;
	private Collection<Integer> pages;
	private int page;

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

	public ArrayList<ThanhLy> getListTL() {
		return listTL;
	}

	public void setListTL(ArrayList<ThanhLy> listTL) {
		this.listTL = listTL;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		super.reset(mapping, request);
		try {
			request.setCharacterEncoding("UTF-8");

			setTaiKhoan(null);
			setMatKhau(null);
			setSubmit(null);
			/*
			 * setListTL(null); setPages(null);
			 */
			setPage(0);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub

		ActionErrors actionErrors = new ActionErrors();

		if ("submit".equalsIgnoreCase(getSubmit())) {
			if ((getTaiKhoan() == null || getTaiKhoan().length() == 0)
					|| (getMatKhau() == null || getMatKhau().length() == 0)) {

				setTaiKhoan(null);
				setMatKhau(null);

				actionErrors.add("errorDangNhap", new ActionMessage("dangnhap.error"));
			}
		}

		return actionErrors;
	}*/
}
