package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import bean.TaiSan;
import bean.ThanhLy;

public class CapNhatHangThanhLyForm extends ActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int maCTHD;
	private int maThanhLy;
	private int maTaiSan;
	private int tinhTrang;
	private float soTienthanhly;
	private ArrayList<TaiSan> listTS;
	private ArrayList<ThanhLy> listTL;
	private String submit;
	/*
	 * định dạng sang String
	 */
	private String tinhTrangFormat;
	private String soTienthanhlyFormat;
	
	
	public ArrayList<TaiSan> getListTS() {
		return listTS;
	}
	public void setListTS(ArrayList<TaiSan> listTS) {
		this.listTS = listTS;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public ArrayList<ThanhLy> getListTL() {
		return listTL;
	}
	public void setListTL(ArrayList<ThanhLy> listTL) {
		this.listTL = listTL;
	}
	public int getMaCTHD() {
		return maCTHD;
	}
	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}
	public int getMaThanhLy() {
		return maThanhLy;
	}
	public void setMaThanhLy(int maThanhLy) {
		this.maThanhLy = maThanhLy;
	}
	public int getMaTaiSan() {
		return maTaiSan;
	}
	public void setMaTaiSan(int maTaiSan) {
		this.maTaiSan = maTaiSan;
	}
	public int getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public float getSoTienthanhly() {
		return soTienthanhly;
	}
	public void setSoTienthanhly(float soTienthanhly) {
		this.soTienthanhly = soTienthanhly;
	}
	public String getTinhTrangFormat() {
		return tinhTrangFormat;
	}
	public void setTinhTrangFormat(String tinhTrangFormat) {
		this.tinhTrangFormat = tinhTrangFormat;
	}
	public String getSoTienthanhlyFormat() {
		return soTienthanhlyFormat;
	}
	public void setSoTienthanhlyFormat(String soTienthanhlyFormat) {
		this.soTienthanhlyFormat = soTienthanhlyFormat;
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
