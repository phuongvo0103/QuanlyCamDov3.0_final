package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.TaiSan;
import bo.CapNhatHangThanhLyBO;
import form.CapNhatHangThanhLyForm;

public class CapNhatHangThanhLyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CapNhatHangThanhLyBO bo=new CapNhatHangThanhLyBO();
		
		CapNhatHangThanhLyForm capNhatHangThanhLyForm=(CapNhatHangThanhLyForm) form;
		
		int maCTHD=capNhatHangThanhLyForm.getMaCTHD();
		
		ArrayList<TaiSan> listTS=new ArrayList<>();
		
		if (maCTHD!=0) {
			TaiSan ts=bo.layDanhSachKhachHangTheoMaCTHD(maCTHD);
			listTS.add(ts);
			capNhatHangThanhLyForm.setListTS(listTS);
		}
		
		System.out.println(capNhatHangThanhLyForm.getSubmit());
		
		if ("Cập nhật".equalsIgnoreCase(capNhatHangThanhLyForm.getSubmit())) {
			
			bo.themHangThanhLy(capNhatHangThanhLyForm.getMaTaiSan(), capNhatHangThanhLyForm.getSoTienthanhly());
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa");
			return mapping.findForward("thanhcong");
		}
		
		capNhatHangThanhLyForm.setListTL(bo.layDanhSachHangThanhLy());
		
		return mapping.getInputForward();
	}
	
}
