package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ChiTietHopDong;
import bean.LoaiTaiSan;
import bo.ChiTietHopDongBO;
import common.Utilities;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ChiTietHopDongForm;

public class ChiTietHopDongAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/text;charset=utf-8");
		
		ChiTietHopDongBO cthdBO = new ChiTietHopDongBO();
		ChiTietHopDongForm chiTietHopDongForm = (ChiTietHopDongForm) form;

		Utilities utilities = new Utilities();

		/**
		 * GÃ¡Â»ï¿½i session
		 */
		HttpSession session = request.getSession();
		Integer maHopDong = chiTietHopDongForm.getMaHopDong();

		// kiÃ¡Â»Æ’m tra maHopDong cÃƒÂ³ tÃ¡Â»â€œn tÃ¡ÂºÂ¡i!?
		if (maHopDong == 0) {
			maHopDong = Integer.parseInt((String) session.getAttribute("maHopDong"));
		}
		// lÃ†Â°u maHopDong lÃƒÂªn session
		session.setAttribute("maHopDong", String.valueOf(maHopDong));

		// test maHopDong
		System.out.println("maHopDong:" + maHopDong);
		/**
		 * check event
		 */
		// event datHopDong
		String datHopDong = chiTietHopDongForm.getDatHopDong();
		// test datHopDong
		System.out.println("ChiTietHopDongAction/datHopDong: " + datHopDong);

		// lÃ¡ÂºÂ¥y input tÃ¡Â»Â« browser
		int maDanhMuc = chiTietHopDongForm.getMaDanhMuc();
		String tenTaiSan = chiTietHopDongForm.getTenTaiSan();
		String moTaTaiSan = chiTietHopDongForm.getMoTaTaiSan();
		float giaCam = chiTietHopDongForm.getSoTienCam();
		String ngayTra = chiTietHopDongForm.getNgayTra();

		if ("Đặt hợp đồng".equals(datHopDong)) {
			/**
			 * 
			 */
			// test
			System.out.println("test thông tin - ChiTietHopDongAction:");
			System.out.println("maDanhMuc: " + maDanhMuc);
			System.out.println("tenTaiSan: " + tenTaiSan);
			System.out.println("moTaTaiSan: " + moTaTaiSan);
			System.out.println("giaCam: " + giaCam);
			System.out.println("hopDongDen: " + ngayTra);

			String filePathDr = getServlet().getServletContext().getRealPath("/") + "images";
			System.out.println(filePathDr);
			String url = utilities.loadImage(filePathDr, chiTietHopDongForm.getFile());
			// insert database
			if (cthdBO.themTaiSan(maDanhMuc, tenTaiSan, url, moTaTaiSan)) {
				cthdBO.themChiTietHopDong(maHopDong, ngayTra, giaCam);

				return mapping.findForward("thanhcong");
			} else {

				return mapping.findForward("thatbai");
			}
		}
		
		/**
		 * server
		 */
		// lay danh sach danh muc
		ArrayList<LoaiTaiSan> listDanhMuc = new ArrayList<LoaiTaiSan>();
		listDanhMuc = cthdBO.getListDanhMuc();
		/**
		 * client
		 */
		//
		chiTietHopDongForm.setListDanhMuc(listDanhMuc);
		
		
		/*
		 * phân trang
		 */
		int page = 1;

		System.out.println("page " + chiTietHopDongForm.getPage());

		if (chiTietHopDongForm.getPage() != 0) {
			page = chiTietHopDongForm.getPage();
		}

		int maxEntriesPerPage = 3;

		ArrayList<ChiTietHopDong> list = new ArrayList<>();
		ArrayList<ChiTietHopDong> listPages = new ArrayList<>();

		Collection<Integer> pages = new ArrayList<>();
		
		list = cthdBO.getListChiTietHopDong(maHopDong);

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);
		
		chiTietHopDongForm.setListPages(listPages);
		chiTietHopDongForm.setPages(pages);

		//
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
