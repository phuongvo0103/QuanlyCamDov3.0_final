package action;

import java.io.PrintWriter;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.XuLy;
import form.ChiTietHopDongForm;
import net.sf.json.JSONArray;

public class TinhLaiSuatChiTietHopDongAjaxAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		response.setContentType("text/text;charset=utf-8");

		response.setHeader("cache-control", "no-cache");

		PrintWriter out = response.getWriter();

		ChiTietHopDongForm chiTietHopDongForm = (ChiTietHopDongForm) form;

		HashedMap hashedMap = new HashedMap();

		String ngayTra = chiTietHopDongForm.getNgayTra();
		float giaCam = chiTietHopDongForm.getSoTienCam();

		System.out.println("ngay " + ngayTra);
		System.out.println("gia " + giaCam);

		if (ngayTra != null && giaCam > 0) {

			hashedMap.put("giaCam", giaCam);
			hashedMap.put("ngayTra", ngayTra);
			// lấy số ngày, mức lãi suất, tổng tiền thanh toán
			XuLy tt = new XuLy();

			String thongBao = "";
			// lấy số ngày, gửi số ngày
			int soNgay = tt.demNgay(tt.ngayHt, ngayTra);

			if (soNgay < 1)
				thongBao = "Ngày đặt hợp đồng không thể nhỏ hơn ngày hiện tại";
			else {
				hashedMap.put("soNgay", soNgay);
				// lấy ma lãi suất, check ma lãi suất
				int maLaiSuat = tt.maLaiSuat(tt.ngayHt, ngayTra, giaCam);

				if (maLaiSuat == 11)
					thongBao = "Số ngày phải > 0"; // System.out.println("PhiHopDongAction
													// - soNgay <0");
				else if (maLaiSuat == 12)
					thongBao = "Số ngày phải < 360 ngày";// System.out.println("PhiHopDongAction
															// - soNgay >360");
				else if (maLaiSuat == 13)
					thongBao = "Số tiền phải > 0";// System.out.println("PhiHopDongAction
													// - soTien < 0");
				else if (maLaiSuat == 14)
					thongBao = "số tiền phải < 80tr";// System.out.println("PhiHopDongAction
														// - soTien > 80tr");
				else {
					hashedMap.put("maLaiSuat", String.valueOf(tt.getMucLaiSuat(maLaiSuat)) + "%");
					
					DecimalFormat format=new DecimalFormat("#.0");
					String tienTT=format.format(tt.getTienThanhToan(maLaiSuat, giaCam));
					// lấy tiền thanh toán, gửi tiền thanh toán
					hashedMap.put("tienThanhToan", tienTT);
				}
			}

			hashedMap.put("thongBao", thongBao);
		}

		JSONArray jsonArray = JSONArray.fromObject(hashedMap);

		System.out.println(jsonArray);
		System.out.println("size " + jsonArray.size());

		out.println(jsonArray);

		out.flush();

		return null;
	}

}
