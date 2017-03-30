package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.TaiSan;
import bo.TaiSanBO;
import form.TaiSanForm;
import net.sf.json.JSONArray;

public class TimKiemTaiSanAjaxAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		PrintWriter out = response.getWriter();

		TaiSanForm taiSanForm = (TaiSanForm) form;

		ArrayList<TaiSan> list = new ArrayList<>();

		if (taiSanForm.getTenTaiSan() != null || taiSanForm.getTenTaiSan().length() != 0) {

			// byte[] b=taiSanForm.getTenTaiSan().getBytes("ISO-8859-1");
			System.out.println(taiSanForm.getTenTaiSan());

			list = new TaiSanBO().getListTimKiemTaiSan(taiSanForm.getTenTaiSan());
		}

		JSONArray jsonArray = null;

		if (list.size() > 0) {

			jsonArray = JSONArray.fromObject(list);

			System.out.println(jsonArray);
			System.out.println("size " + list.size());

			out.println(jsonArray);
		}

		out.flush();

		return null;
	}

}
