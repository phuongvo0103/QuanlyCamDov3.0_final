package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import bean.ThanhLy;
import bo.DangNhapBO;
import bo.ThanhLyBO;
import form.HangThanhLyForm;

public class HangThanhLyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		HangThanhLyForm hangThanhLyForm = (HangThanhLyForm) form;

		DangNhapBO dangNhapBO = new DangNhapBO();

		ThanhLyBO thanhLyBO = new ThanhLyBO();

		int page = 1;

		if (hangThanhLyForm.getPage() != 0) {

			page = hangThanhLyForm.getPage();
		}

		int maxEntriesPerPage = 6;

		ArrayList<ThanhLy> list = new ArrayList<>();
		ArrayList<ThanhLy> listPages = new ArrayList<>();
		Collection<Integer> pages = new ArrayList<>();

		list = thanhLyBO.getListHangThanhLy();

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);

		hangThanhLyForm.setListTL(listPages);
		hangThanhLyForm.setPages(pages);

		System.out.println("submit " + hangThanhLyForm.getSubmit());
		System.out.println("tài khoản " + hangThanhLyForm.getTaiKhoan());
		System.out.println("mật khẩu " + hangThanhLyForm.getMatKhau());
		
		if ("Đăng nhập".equals(hangThanhLyForm.getSubmit())) {
			
			boolean check = dangNhapBO.dangNhapHeThong(hangThanhLyForm.getTaiKhoan(),
					hangThanhLyForm.getMatKhau());
			
			if (check) {

				return mapping.findForward("thanhcong");

			} else {

				ActionErrors errors = new ActionErrors();
				errors.add("errorThongBao", new ActionMessage("thongBao.error"));

				hangThanhLyForm.setTaiKhoan(null);
				hangThanhLyForm.setTaiKhoan(null);

				saveErrors(request, errors);

				return mapping.getInputForward();
			}
		}

		return mapping.getInputForward();
	}

	// get list by offset and length thong ke khach hang
	public ArrayList<ThanhLy> getListByOffsetAndLength(ArrayList<ThanhLy> list, int offset, int length) {

		ArrayList<ThanhLy> arrayList = new ArrayList<>();

		// calc the to value
		int to = offset + length;
		// if offset or lenght exceed set them to list.size
		if (offset > list.size())
			offset = list.size();
		if (to > list.size())
			to = list.size();
		// add the list items to the return collection
		for (int i = offset; i < to; i++) {
			arrayList.add(list.get(i));
		}
		// return the collection
		return arrayList;
	}

	// get pages thong ke khach hang
	public Collection<Integer> getPages(ArrayList<ThanhLy> list, int length) {

		Collection<Integer> collection = new ArrayList<>();
		// calc how many pages are there
		int pages = list.size() / length;
		if (list.size() % length != 0)
			pages = pages + 1;

		// fill an collection with all pages
		for (int i = 1; i <= pages; i++) {
			collection.add(new Integer(i));
		}

		return collection;
	}

}
