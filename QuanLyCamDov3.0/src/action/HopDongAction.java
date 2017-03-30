package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.KhachHang;
import bo.HopDongBO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.HopDongForm;

public class HopDongAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/text;charset=utf-8");
		
		HopDongBO hopDongBO = new HopDongBO();
		HopDongForm hopDongForm = (HopDongForm) form;

		// nÃºt thÃªm
		String them = hopDongForm.getThemHopDong();

		int page = 1;

		if (hopDongForm.getPage() != 0) {

			page = hopDongForm.getPage();
		}

		int maxEntriesPerPage = 5;

		ArrayList<KhachHang> list = new ArrayList<>();
		ArrayList<KhachHang> listPages = new ArrayList<>();
		Collection<Integer> pages = new ArrayList<>();

		list = hopDongBO.getListHopDong();

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);

		hopDongForm.setListHopDong(listPages);
		hopDongForm.setPages(pages);

		// event them
		System.out.println("HopDongAction - event them:" + them);
		if ("Thêm".equals(them)) {
			// lấy thông tin khách hàng
			String tenKhachHang = hopDongForm.getTenKhachHang();
			int gioiTinh = hopDongForm.getGioiTinh();
			int soCMND = hopDongForm.getSoCMND();
			String diaChi = hopDongForm.getDiaChi();

				// insert vÃ o database
				hopDongBO.themHopDong(tenKhachHang, gioiTinh, soCMND, diaChi);

			return mapping.findForward("thanhcong");
		}

		return mapping.getInputForward();
	}

	// get list by offset and length thong ke khach hang
	public ArrayList<KhachHang> getListByOffsetAndLength(ArrayList<KhachHang> list, int offset, int length) {

		ArrayList<KhachHang> arrayList = new ArrayList<>();

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
	public Collection<Integer> getPages(ArrayList<KhachHang> list, int length) {

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
