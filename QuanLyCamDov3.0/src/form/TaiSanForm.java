package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

import bean.LoaiTaiSan;
import bean.TaiSan;

public class TaiSanForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int maTaiSan;
	private String tenTaiSan;
	private int maLoaiTaiSan;
	private String tinhTrang;
	private String moTa;
	private String hinhAnh;
	private String submit;
	private FormFile formFile;
	private ArrayList<TaiSan> list;
	private ArrayList<LoaiTaiSan> listLoaiTS;
	private Collection<Integer> pages;
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Collection<Integer> getPages() {
		return pages;
	}

	public void setPages(Collection<Integer> pages) {
		this.pages = pages;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public ArrayList<LoaiTaiSan> getListLoaiTS() {
		return listLoaiTS;
	}

	public void setListLoaiTS(ArrayList<LoaiTaiSan> listLoaiTS) {
		this.listLoaiTS = listLoaiTS;
	}

	public int getMaTaiSan() {
		return maTaiSan;
	}

	public void setMaTaiSan(int maTaiSan) {
		this.maTaiSan = maTaiSan;
	}

	public String getTenTaiSan() {
		return tenTaiSan;
	}

	public void setTenTaiSan(String tenTaiSan) {
		this.tenTaiSan = tenTaiSan;
	}

	public int getMaLoaiTaiSan() {
		return maLoaiTaiSan;
	}

	public void setMaLoaiTaiSan(int maLoaiTaiSan) {
		this.maLoaiTaiSan = maLoaiTaiSan;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public FormFile getFormFile() {
		return formFile;
	}

	public void setFormFile(FormFile formFile) {
		this.formFile = formFile;
	}

	public ArrayList<TaiSan> getList() {
		return list;
	}

	public void setList(ArrayList<TaiSan> list) {
		this.list = list;
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

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if ("them".equalsIgnoreCase(getSubmit())) {
			if (formFile.getFileSize() == 0) {
				errors.add("uploadedFile", new ActionMessage("errors.file.notselected"));
				System.out.println("loi upfile abc");
			}

			if (errors.isEmpty()) {
				if (!formFile.getContentType().equalsIgnoreCase("image/jpeg")
						&& !formFile.getContentType().equalsIgnoreCase("image/jpg")
						&& !formFile.getContentType().equalsIgnoreCase("image/pjpeg")) {
					errors.add("uploadedFile",
							new ActionMessage("errors.file.type", formFile.getFileName(), formFile.getContentType()));
					System.out.println("loi images abc" + formFile.getFileName() + " " + formFile.getContentType());
				}

				if (formFile.getFileSize() > 5000000) {
					errors.add("uploadedFile",
							new ActionMessage("errors.file.size", formFile.getFileName(), formFile.getFileSize()));
					System.out.println("loi images size " + formFile.getFileName() + " " + formFile.getFileSize());
				}

			}
		}
		return errors;
	}

}
