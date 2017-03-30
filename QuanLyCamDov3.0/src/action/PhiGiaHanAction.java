package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.CellData;
import common.Utilities;
import common.XuLy;
import form.PhiGiaHanForm;
import bo.PhiGiaHanBO;

public class PhiGiaHanAction extends Action {
	double mucLaiSuat;
	double tienGH1ngay;
	double tongTienGH;
	double giaCam;
	double tongTienLai;
	double tongTienTT;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CellData cd = new CellData();
		XuLy xl = new XuLy();
		PhiGiaHanForm phiGiaHanForm = (PhiGiaHanForm) form;
		PhiGiaHanBO phiGiaHanBO = new PhiGiaHanBO();

		// lấy session maCTHD
		HttpSession session = request.getSession();
		int maCTHD = (Integer) session.getAttribute("maCTHD");

		// lấy tên khách hàng
		String tenKhachHang = cd.getTenKhachHang(maCTHD);

		// lấy CMND
		String soCMND = cd.getSoCMND(maCTHD);

		// lấy ngày bd hợp đồng
		String ngayBatDauHopDong = cd.getNgayCam(maCTHD);

		// lay ngay bat dau
		String ngayBatDauGH = cd.getNgayBDGiaHan(maCTHD);

		// lay ngay ket thuc khi xem trc
		String ngayKetThuc;
		if (session.getAttribute("ngayKetThuc") != null)
			ngayKetThuc = (String) session.getAttribute("ngayKetThuc");
		else
			ngayKetThuc = cd.getNgayKetThuc(maCTHD);

		/**
		 * lay thoiGianGH = ngayKetThuc - ngayBatDau
		 */
		int thoiGianGH = xl.demNgay(ngayBatDauGH, ngayKetThuc);

		int thoiGianHopDong = xl.demNgay(ngayBatDauHopDong, ngayKetThuc);

		String tinhTrangGH;
		if (xl.demNgay(ngayBatDauGH, ngayKetThuc) <= 30)
			tinhTrangGH = "đóng lãi theo tuần!";
		else
			tinhTrangGH = "đóng lãi theo tháng";

		System.out.println("PhiGiaHanAction/tinhTrangGH: " + tinhTrangGH);

		// lay maLaiSuat moi
		int maLaiSuat = xl.maLaiSuat(ngayBatDauHopDong, ngayKetThuc, cd.getGiaCam(maCTHD));

		String thongBao = "";
		if (cd.daGiaHan(maCTHD))
			thongBao = "Hợp đồng chỉ được gia hạn 1 lần";
		else if (maLaiSuat == 16)
			thongBao = "Số ngày phải > 0"; // System.out.println("PhiHopDongAction
											// - soNgay <0");
		else if (maLaiSuat == 17)
			thongBao = "Số ngày phải < 360 ngày";// System.out.println("PhiHopDongAction
													// - soNgay >360");
		else if (maLaiSuat == 18)
			thongBao = "Số tiền phải > 0";// System.out.println("PhiHopDongAction
											// - soTien < 0");
		else if (maLaiSuat == 19)
			thongBao = "số tiền phải < 80tr";// System.out.println("PhiHopDongAction
												// - soTien > 80tr");
		else if (maLaiSuat > 0 && maLaiSuat <= 15) {
			// lay muc lai suat moi
			mucLaiSuat = xl.getMucLaiSuat(maLaiSuat);
			System.out.println("PGHAT: " + mucLaiSuat);
			// lay tien gia han/ngay
			tienGH1ngay = cd.getTienGH1Ngay(maLaiSuat);

			// lay tong tien gia han

			// tongTienGH=Double.parseDouble(String.valueOf(tienGH1ngay))*thoiGianGH;
			tongTienGH = tienGH1ngay*thoiGianGH;

			// lay Gia Cam
			giaCam = cd.getGiaCam(maCTHD);

			// lay tong tien lai suat
			tongTienLai = (giaCam * xl.getMucLaiSuat(maLaiSuat)) / 100;

			// lay tong tien thanh toan
			tongTienTT = tongTienLai + tongTienGH + giaCam;

			// send to client
			phiGiaHanForm.setTinhTrangGH(tinhTrangGH);

			phiGiaHanForm.setTienGH1Ngay(xl.format(tienGH1ngay) + " đồng");
			phiGiaHanForm.setTongTienGH(xl.format(tongTienGH) + "");

			phiGiaHanForm.setMucLaiSuat(xl.format(mucLaiSuat) + " %");
			phiGiaHanForm.setTongTienLai(Utilities.priceWithDecimal((float)tongTienLai) + " đồng");

			phiGiaHanForm.setSoTienCam(xl.format(giaCam) + " ");
			phiGiaHanForm.setTongTienTT(xl.format(tongTienTT) + " ");
		}

		phiGiaHanForm.setMaCTHD(maCTHD);
		phiGiaHanForm.setTenKhachHang(tenKhachHang);
		phiGiaHanForm.setSoCMND(Integer.parseInt(soCMND));

		phiGiaHanForm.setNgayBatDauHopDong(ngayBatDauHopDong);
		phiGiaHanForm.setNgayBatDau(ngayBatDauGH);
		phiGiaHanForm.setNgayKetThuc(ngayKetThuc);
		phiGiaHanForm.setThoiGianGH(thoiGianGH + " ngày");
		phiGiaHanForm.setThoiGianHopDong(thoiGianHopDong + "ngày");
		phiGiaHanForm.setThongBao(thongBao);

		String giaHan = phiGiaHanForm.getGiaHan();

		if ("Gia Hạn".equals(giaHan)) {
			List<String> dsNgay = new ArrayList<String>();
			// lay so ngay
			if (thoiGianHopDong > 360)
				return mapping.findForward("phiGiaHan");
			else if (cd.daGiaHan(maCTHD))
				return mapping.findForward("phiGiaHan");
			else {
				if (thoiGianHopDong >= 0 && thoiGianHopDong <= 30)
					dsNgay = xl.danhSachNgay(ngayBatDauGH, ngayKetThuc, 7);
				else if (30 < thoiGianHopDong && thoiGianHopDong <= 365)
					dsNgay = xl.danhSachNgay(ngayBatDauGH, ngayKetThuc, 30);

				System.out.println("Danh sach ngay:");
				if (phiGiaHanBO.giaHanHopDong(maCTHD, ngayKetThuc)) {
					int maDongLai = 0;
					for (String ngay : dsNgay) {
						maDongLai++;
						System.out.println(ngay);
						phiGiaHanBO.themDSDongLai(maDongLai, maCTHD, ngay, tongTienGH / dsNgay.size());
					}
					
					session.setAttribute("maCTHDGH", maCTHD);
					
					return mapping.findForward("thanhToan");
				}
			}
		}
		// forward
		return mapping.findForward("phiGiaHan");
	}
}
