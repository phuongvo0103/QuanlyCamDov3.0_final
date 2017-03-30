package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import bean.TaiSan;
import bo.LoaiTaiSanBO;
import bo.TaiSanBO;
import form.TaiSanForm;
import common.Utilities;

public class TaiSanAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		TaiSanForm taiSanForm = (TaiSanForm) form;

		TaiSanBO taiSanBO = new TaiSanBO();
		LoaiTaiSanBO bo = new LoaiTaiSanBO();
		Utilities utilities = new Utilities();

		FormFile file = taiSanForm.getFormFile();
		taiSanForm.setListLoaiTS(bo.getListLoaiTaiSan());

		int page = 1;

		if (taiSanForm.getPage() != 0) {

			page = taiSanForm.getPage();
		}

		int maxEntriesPerPage = 6;

		ArrayList<TaiSan> list = new ArrayList<>();
		ArrayList<TaiSan> listPages = new ArrayList<>();
		Collection<Integer> pages = new ArrayList<>();

		list = taiSanBO.getListTaiSan();

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);

		taiSanForm.setList(listPages);
		taiSanForm.setPages(pages);

		if ("them".equalsIgnoreCase(taiSanForm.getSubmit())) {

			String filePathDr = getServlet().getServletContext().getRealPath("/") + "images";
			
			System.out.println(filePathDr);

			System.out.println(filePathDr);

			String url = utilities.loadImage(filePathDr, file);

			System.out.println(filePathDr);
			System.out.println(url);

			TaiSan taiSan = new TaiSan(taiSanForm.getMaLoaiTaiSan(), taiSanForm.getTenTaiSan(),
					Integer.parseInt(taiSanForm.getTinhTrang()), taiSanForm.getMoTa(), url);

			taiSanBO.themTaiSan(taiSan);

			return mapping.findForward("thanhcong");

		} else if ("Xóa".equalsIgnoreCase(taiSanForm.getSubmit())) {
			int maTS = taiSanForm.getMaTaiSan();
			if (maTS != 0) {
				taiSanBO.xoaTaiSan(maTS);
				System.out.println("da xoa " + maTS);

				return mapping.findForward("thanhcong");
			}
		}

		return mapping.getInputForward();
	}

	// get list by offset and length thong ke khach hang
	public ArrayList<TaiSan> getListByOffsetAndLength(ArrayList<TaiSan> list, int offset, int length) {

		ArrayList<TaiSan> arrayList = new ArrayList<>();

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
	public Collection<Integer> getPages(ArrayList<TaiSan> list, int length) {

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
