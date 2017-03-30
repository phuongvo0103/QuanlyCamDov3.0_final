package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.CellData;
import common.XuLy;
import form.ThanhToanForm;
import bean.DongTienLai;
import bo.ThanhToanBO;

public class ThanhToanAction extends Action {

	CellData cell = new CellData();
	XuLy xuLy = new XuLy();
	ThanhToanBO thanhToanBO = new ThanhToanBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ThanhToanForm thanhToanForm = (ThanhToanForm) form;
		/**
		 * Lấy dữ liệu từ client
		 */
		System.out.println("ma hop dong truoc khi gán sesion "+thanhToanForm.getMaCTHD());
		
		if (thanhToanForm.getMaCTHD()==0) {
			HttpSession session=request.getSession();
			int maTam  = Integer.parseInt(String.valueOf(session.getAttribute("maCTHDGH")));
			thanhToanForm.setMaCTHD(maTam);
		}
		System.out.println("ma hop dong sau khi gán sesion "+thanhToanForm.getMaCTHD());
		int maCTHD = thanhToanForm.getMaCTHD();
		
		System.out.println("ma cthd " + maCTHD);

		String xem = thanhToanForm.getXemTruoc();
		String ngayKTGH = thanhToanForm.getGiaHanDen();

		/**
		 * lấy dữ liệu từ server & xử lý DL theo maCTHD
		 */
		/* thông tin CTHD */
		String tenKhachHang = cell.getTenKhachHang(maCTHD);

		/* Gia Hạn */
		// lấy ngayKTHD từ maCTHD
		String ngayKTHD = cell.getNgayKetThuc(maCTHD);
		String soNgayDaHD = xuLy.demNgay(cell.getNgayCam(maCTHD), ngayKTHD) + " ngày";

		/* Thông tin thanh toán lãi */

		double tongTienGH = 0;
		double tienNoGH = 0;

		// nếu hợp đồng đã gia hạn
		if (cell.daGiaHan(maCTHD)) {
			tongTienGH = xuLy.tongTienGH(maCTHD);
			tienNoGH = xuLy.tienNoLai(maCTHD);
		}

		/* thông tin thanh toán */
		double giaCam = cell.getGiaCam(maCTHD);
		String tinhTrangGH = "Chưa gia hạn";

		String ngayBatDauHopDong = cell.getNgayCam(maCTHD);
		String ngayKetThuc = cell.getNgayKetThuc(maCTHD);

		int maLaiSuat = xuLy.maLaiSuat(ngayBatDauHopDong, ngayKetThuc, cell.getGiaCam(maCTHD));
		float mucLaiSuat = xuLy.getMucLaiSuat(maLaiSuat);

		if (cell.daGiaHan(maCTHD))
			tinhTrangGH = "Đã gia hạn";
		double tongTienLai = (giaCam * mucLaiSuat) / 100;

		double tongTienThanhToan = giaCam + tongTienLai + tongTienGH;
		double tienNoTT = giaCam + tongTienLai + tienNoGH;
		if (cell.daThanhToan(maCTHD))
			tienNoTT = 0;

		/**
		 * đẩy dữ liệu lên form
		 */
		
		thanhToanForm.setNgayKTHD(ngayKTHD);
		thanhToanForm.setSoNgayHopDong(soNgayDaHD);

		thanhToanForm.setMaCTHD(maCTHD);
		thanhToanForm.setTenKhachHang(tenKhachHang);

		thanhToanForm.setTongTienGiaHan(tongTienGH);
		thanhToanForm.setTienNoGiaHan(tienNoGH);
		
		thanhToanForm.setSoTienCam(giaCam);
		thanhToanForm.setTinhTrangGiaHan(tinhTrangGH);
		thanhToanForm.setNgayBatDauHopDong(ngayBatDauHopDong);
		thanhToanForm.setNgayKetThucHopDong(ngayKetThuc);
		thanhToanForm.setMucLaiSuat(mucLaiSuat);
		thanhToanForm.setTienNo(tienNoTT);
		thanhToanForm.setTongTien(tongTienThanhToan);

		/**
		 * Event click
		 */
		// nếu click xem
		if ("Xem".equals(xem)) {
			
			 int soNgay = xuLy.demNgay(ngayBatDauHopDong, ngayKTGH);
			
			 if (soNgay <= 0){ 
				 thanhToanForm.setThongBao("Ngày gia hạn phải lớn hơn ngày kết thúc");
				  return mapping.getInputForward(); 
			  }
			 

			// gửi session maCTHD
			HttpSession session = request.getSession();
			session.setAttribute("maCTHD", maCTHD);
			session.setAttribute("ngayKetThuc", ngayKTGH);

			return mapping.findForward("phiGiaHan");
			
		} else if ("Đóng lãi kỳ tiếp theo".equals(thanhToanForm.getDongLai())) {
			
			thanhToanBO.dongLaiKyTiep(maCTHD);
			// return mapping.getInputForward();
			return mapping.findForward("thanhcong");
		} else if ("Thanh toán".equals(thanhToanForm.getThanhToan())) {
			thanhToanBO.thanhToan(maCTHD);
			thanhToanBO.themThanhToan(maCTHD,tongTienThanhToan);	
			return mapping.findForward("daxong");
		}
		
		ArrayList<DongTienLai> listDongLai = thanhToanBO.getListDongLai(maCTHD);
		thanhToanForm.setListDongLai(listDongLai);

		return mapping.getInputForward();
	}
}
