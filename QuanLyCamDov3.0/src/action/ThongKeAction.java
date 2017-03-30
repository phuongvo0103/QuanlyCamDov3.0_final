package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import bean.ChiTietHopDong;
import bean.DoanhThu;
import bean.ThanhLy;
import bo.CapNhatHangThanhLyBO;
import bo.LoaiTaiSanBO;
import bo.ThongKeBO;
import form.ThongKeForm;

public class ThongKeAction extends DispatchAction {

	public ActionForward listkhachhang(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse respone) throws Exception {

		// thong ke khach hang
		/*
		 * ThongKeForm thongKeForm=(ThongKeForm) form;
		 * 
		 * ThongKeBO thongKeBO=new ThongKeBO();
		 * 
		 * String nam=thongKeForm.getNam(); String thang=thongKeForm.getThang();
		 * 
		 * int page=thongKeForm.getPage();
		 * 
		 * int maxEntriesPerPage=0;
		 * 
		 * System.out.println("tao la nam "+nam);
		 * 
		 * ArrayList<KhachHang> list=new ArrayList<>();
		 * 
		 * if ((thang==null || thang.length()==0)&&(nam==null ||
		 * nam.length()==0)) {
		 * thongKeForm.setMassage("Vui lòng nhập năm,tháng !"); }else{
		 * 
		 * list=thongKeBO.getKhachHangByWord(Integer.parseInt(nam),
		 * Integer.parseInt(thang));
		 * 
		 * System.out.println(list.size()+" size");
		 * 
		 * if (list.size()==0) { thongKeForm.setMassage("không có dữ liệu !");
		 * }else{
		 * 
		 * //phan trang maxEntriesPerPage=list.size(); page=1;
		 * 
		 * int offset = maxEntriesPerPage * (page - 1);
		 * 
		 * ArrayList<KhachHang>
		 * listPage=getListByOffsetAndLength(list,offset,maxEntriesPerPage);
		 * 
		 * thongKeForm.setListKH(listPage);
		 * 
		 * thongKeForm.setPagesKH(getPages(list, maxEntriesPerPage));
		 * 
		 * thongKeForm.setSoLuong(list.size()+"");
		 * 
		 * float tongTien=0;
		 * 
		 * for (KhachHang khachHang : list) {
		 * tongTien+=khachHang.getChiTietHopDong().getSoTienCam(); }
		 * 
		 * thongKeForm.setTongTien(tongTien+""); } }
		 */

		return mapping.findForward("khachhang");
	}

	public ActionForward listsanpham(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse respone) throws Exception {

		// thong ke san pham trong kho

		ThongKeForm thongKeForm = (ThongKeForm) form;

		LoaiTaiSanBO loaiTaiSanBO = new LoaiTaiSanBO();
		// ThongKeBO thongKeBO=new ThongKeBO();

		thongKeForm.setListLoaiTS(loaiTaiSanBO.getListLoaiTaiSan());

		/*
		 * String nam=thongKeForm.getNam(); String thang=thongKeForm.getThang();
		 * String maLoaiTS=thongKeForm.getMaLoaiTS();
		 * 
		 * if (nam == null || nam.length()==0) {
		 * thongKeForm.setMassage("vui long chọn năm ??"); }else if (thang ==
		 * null || thang.length()==0) {
		 * thongKeForm.setMassage("vui long chọn tháng ??"); }else if
		 * (maLoaiTS==null || maLoaiTS.length()==0) {
		 * thongKeForm.setMassage("vui long chọn loại xe ??"); }else{
		 * ArrayList<TaiSan>
		 * list=thongKeBO.getSanPhamByWord(Integer.parseInt(nam),
		 * Integer.parseInt(thang), Integer.parseInt(maLoaiTS));
		 * 
		 * if (list.size()==0) { thongKeForm.setMassage("Không có dữ liệu ??");
		 * } else { thongKeForm.setListTS(list);
		 * thongKeForm.setSoLuong(list.size()+"");
		 * 
		 * float tongTien=0; for (TaiSan taiSan : list) {
		 * tongTien+=taiSan.getChiTietHopDong().getSoTienCam(); }
		 * 
		 * thongKeForm.setTongTien(tongTien+""); } }
		 */

		return mapping.findForward("sanpham");
	}

	public ActionForward listthanhtoan(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse respone) throws Exception {
		
		ThongKeForm thongKeForm = (ThongKeForm) form;
		ThongKeBO bo=new ThongKeBO();
		
		ArrayList<DoanhThu> dsDoanhThuTatCaCacNam=bo.ThongKeDoanhThuTatCaCacNam();
		
		thongKeForm.setListDT(dsDoanhThuTatCaCacNam);
		
		return mapping.findForward("doanhthu");
	}

	public ActionForward hopdonghethan(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse respone) throws Exception {

		ThongKeForm thongKeForm = (ThongKeForm) form;

		ThongKeBO thongKeBO = new ThongKeBO();
		CapNhatHangThanhLyBO bo=new CapNhatHangThanhLyBO();
		
		//hợp đồng sắp hết hạn
		int page = 1;

		System.out.println("page " + thongKeForm.getPage());

		if (thongKeForm.getPage() != 0) {
			page = thongKeForm.getPage();
		}

		int maxEntriesPerPage = 10;

		ArrayList<ChiTietHopDong> list = new ArrayList<>();
		ArrayList<ChiTietHopDong> listPages = new ArrayList<>();

		Collection<Integer> pages = new ArrayList<>();

		list = thongKeBO.getListHopDongHetHan();

		int offset = maxEntriesPerPage * (page - 1);

		listPages = getListByOffsetAndLength(list, offset, maxEntriesPerPage);
		pages = getPages(list, maxEntriesPerPage);

		thongKeForm.setListHDHH(listPages);
		thongKeForm.setPages(pages);
		
		// hợp đồng sắp hết hạn
		int page_hd = 1;

		System.out.println("page " + thongKeForm.getPageHH());

		if (thongKeForm.getPageHH() != 0) {
			page_hd = thongKeForm.getPageHH();
		}

		int maxEntriesPerPage_hd = 10;

		ArrayList<ChiTietHopDong> list_hd = new ArrayList<>();
		ArrayList<ChiTietHopDong> listPages_hd = new ArrayList<>();

		Collection<Integer> pages_hd = new ArrayList<>();

		list_hd = thongKeBO.getHopDongHetHan();

		int offset_hd = maxEntriesPerPage_hd * (page_hd - 1);

		listPages_hd = getListByOffsetAndLength(list_hd, offset_hd, maxEntriesPerPage_hd);
		pages_hd = getPages(list_hd, maxEntriesPerPage_hd);

		thongKeForm.setListHH(listPages_hd);
		thongKeForm.setPagesHH(pages_hd);
		
		//
		thongKeForm.setKiemTraDongLai(thongKeBO.kiemTraDongLai());
		
		//
		thongKeForm.setListMaTaiSan(thongKeBO.layMaTaiSan());
		
		//thanh lý tài sản
		int page_tl = 1;

		System.out.println("page " + thongKeForm.getPageTL());

		if (thongKeForm.getPageTL() != 0) {
			page_hd = thongKeForm.getPageTL();
		}

		int maxEntriesPerPage_tl = 10;

		ArrayList<ThanhLy> list_tl = new ArrayList<>();
		ArrayList<ThanhLy> listPages_tl = new ArrayList<>();

		Collection<Integer> pages_tl = new ArrayList<>();

		list_tl = bo.layDanhSachHangThanhLy();

		int offset_tl = maxEntriesPerPage_tl * (page_tl - 1);

		listPages_tl = getListByOffsetAndLengthTL(list_tl, offset_tl, maxEntriesPerPage_tl);
		pages_tl = getPagesTL(list_tl, maxEntriesPerPage_tl);

		thongKeForm.setListTL(listPages_tl);
		thongKeForm.setPagesTL(pages_tl);
		
		//cập nhật trạng thái cho sản phẩm đã thanh lý : chưa thanh lý -> đã thanh lý
		if ("Cập nhật".equalsIgnoreCase(thongKeForm.getSubmit())) {
			if (thongKeForm.getMaThanhLy()!=0) {
				bo.capNhatHangThanhLy(thongKeForm.getMaThanhLy());
				return mapping.findForward("thanhcong");
			}
			return mapping.findForward("hopdong");
		}
		
		System.out.println("sắp hết hạn "+thongKeForm.getListHDHH().size());
		System.out.println("hết hạn "+thongKeForm.getListHH().size());
		System.out.println("Thanh lý "+thongKeForm.getListTL().size());

		return mapping.findForward("hopdong");
	}
	
	/**
	 * phân trang hợp đồng hết hạn, sắp hết hạn
	 * @param list
	 * @param offset
	 * @param length
	 * @return
	 */
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
	
	/**
	 * phân trang sản phẩm thanh lý
	 * @param list
	 * @param offset
	 * @param length
	 * @return
	 */
	// get list by offset and length
		public ArrayList<ThanhLy> getListByOffsetAndLengthTL(ArrayList<ThanhLy> list, int offset, int length) {

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

		// get pages
		public Collection<Integer> getPagesTL(ArrayList<ThanhLy> list, int length) {

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
