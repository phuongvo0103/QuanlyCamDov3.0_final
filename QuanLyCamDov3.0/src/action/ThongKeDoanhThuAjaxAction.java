package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.DoanhThu;
import bo.ThongKeBO;
import form.ThongKeForm;
import net.sf.json.JSONArray;

public class ThongKeDoanhThuAjaxAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		PrintWriter out = response.getWriter();

		ThongKeForm thongKeForm = (ThongKeForm) form;
		ThongKeBO bo=new ThongKeBO();
		
		int nam=Integer.parseInt(thongKeForm.getNam());
		
		System.out.println("tao là năm "+ nam);
		
		ArrayList<DoanhThu> dsDoanhThuTheoNam=bo.ThongKeDoanhThuTheoThangCuaNam(nam);
		
		JSONArray mangDoanhThuTheoNam=JSONArray.fromObject(dsDoanhThuTheoNam);
		
		System.out.println("DoanhThuTheoNam "+mangDoanhThuTheoNam);
		
		out.println(mangDoanhThuTheoNam);
		
		out.flush();
		
		return null;
	}
	
}
