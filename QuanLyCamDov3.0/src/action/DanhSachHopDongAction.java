package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.ChiTietHopDong;
import bo.ChiTietHopDongBO;
import form.DanhSachHopDongForm;

public class DanhSachHopDongAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		DanhSachHopDongForm danhSachHopDongForm=(DanhSachHopDongForm) form;
		
		ChiTietHopDongBO chiTietHopDongBO=new ChiTietHopDongBO();
		
		int page = 1;

		System.out.println("page " + danhSachHopDongForm.getPage());

		if (danhSachHopDongForm.getPage() != 0) {
			page = danhSachHopDongForm.getPage();
		}

		int maxEntriesPerPage = 8;

		ArrayList<ChiTietHopDong> list = new ArrayList<>();
		ArrayList<ChiTietHopDong> listPages = new ArrayList<>();

		Collection<Integer> pages = new ArrayList<>();
		
		list = chiTietHopDongBO.getListChiTietHopDong();

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);
		
		danhSachHopDongForm.setListHD(listPages);
		danhSachHopDongForm.setPages(pages);
		
		return mapping.getInputForward();
	}
	// get list by offset and length
		public ArrayList<ChiTietHopDong> getListByOffsetAndLength(ArrayList<ChiTietHopDong> list, int offset, int length) {

			ArrayList<ChiTietHopDong> arrayList = new ArrayList<>();

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

		// get pages 
		public Collection<Integer> getPages(ArrayList<ChiTietHopDong> list, int length) {

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
