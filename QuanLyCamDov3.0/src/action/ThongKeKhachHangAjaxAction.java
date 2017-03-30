package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.KhachHang;
import bo.ThongKeBO;
import form.ThongKeForm;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ThongKeKhachHangAjaxAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		PrintWriter out = response.getWriter();

		ThongKeForm thongKeForm = (ThongKeForm) form;

		ThongKeBO thongKeBO = new ThongKeBO();

		String nam = thongKeForm.getNam();
		String thang = thongKeForm.getThang();
		int page = thongKeForm.getPage();

		int maxEntriesPerPage = 5;

		ArrayList<KhachHang> list = new ArrayList<>();
		ArrayList<KhachHang> listPages = new ArrayList<>();

		Collection<Integer> pages = new ArrayList<>();

		System.out.println("tao l� ajax " + thang);
		System.out.println("tao l� ajax " + nam);

		if (nam != null && thang != null) {

			list = thongKeBO.getKhachHangByWord(Integer.parseInt(nam), Integer.parseInt(thang));
			// phan trang
			maxEntriesPerPage = list.size();
			page = 1;
			page = thongKeForm.getPage();
		}

		if (list.size() > 0) {

			int offset = maxEntriesPerPage * (page - 1);

			listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
			pages = getPages(list, maxEntriesPerPage);
		}

		JSONObject obj = new JSONObject();

		JSONArray jsonArray = JSONArray.fromObject(listPages);
		JSONArray jsonArrayPages = JSONArray.fromObject(pages);

		obj.put("jsonArray", jsonArray);
		obj.put("pages", jsonArrayPages);

		System.out.println(obj);
		// System.out.println(jsonArrayPages);

		System.out.println("size " + list.size());

		out.println(obj);

		// out.println(jsonArrayPages);

		out.flush();

		return null;
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
