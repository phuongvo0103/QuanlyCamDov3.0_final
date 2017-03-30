package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.DongTienLai;
import common.DataProvider;

public class DongTienLaiDAO extends DataProvider{

	public ArrayList<DongTienLai> getListDongLai(int maCTHD) {
	String querry="select DongTienLai.MaDongLai,ChiTietHopDong.MaCTHD,case when DongTienLai.TinhTrang=1 then N'Đã đóng' else N'Chưa đóng' end as TinhTrang, NgayDong, SoTienDong from DongTienLai,ChiTietHopDong where ChiTietHopDong.MaCTHD="+maCTHD+" and DongTienLai.MaCTHD=ChiTietHopDong.MaCTHD and ChiTietHopDong.TinhTrang=0 order by MaDongLai";
	ArrayList<DongTienLai> listDongLai=new ArrayList<DongTienLai>();
	DongTienLai dtl;
	try {
		ResultSet rs=exQ(querry);
		dtl=new DongTienLai();
		while(rs.next())
		{
		dtl=new DongTienLai();
		dtl.setMaDongLai(rs.getInt("MaDongLai"));
		dtl.setMaCTHD(rs.getInt("MaCTHD"));
		dtl.setTinhTrang1(rs.getString("TinhTrang"));
		dtl.setNgayDong( new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayDong")));
		dtl.setSoTienDong(rs.getFloat("SoTienDong"));
		listDongLai.add(dtl);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return listDongLai;
	}

	public boolean dongLaiKyTiep(int maCTHD, int maDongLai) {
		String querry="update DongTienLai set TinhTrang=1 where MaCTHD="+maCTHD+" and MaDongLai="+maDongLai+"";
		try {
			exU(querry);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
