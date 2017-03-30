package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.TaiSan;
import bean.ThanhLy;
import common.ConnectData;
import common.Utilities;
import common.XuLyChuoi;

public class CapNhatHangThanhLyDAO extends ConnectData {
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement prepSta=null;
	
	public TaiSan layDanhSachKhachHangTheoMaCTHD(int maCTHD){
		TaiSan taiSan=null;
		String sql="select * from TaiSan where MaTaiSan in (select MaTaiSan from ChiTietHopDong where MaCTHD="+maCTHD+")";
		try {
			st=getConnect().createStatement();
			rs=st.executeQuery(sql);
			
			if (rs.next()) {
				taiSan=new TaiSan();
				
				taiSan.setMaTaiSan(rs.getInt("MaTaiSan"));
				taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return taiSan;
	}
	
	public ArrayList<ThanhLy> layDanhSachHangThanhLy(){
		ArrayList<ThanhLy> list=new ArrayList<>();
		
		try {
			st=getConnect().createStatement();
			rs=st.executeQuery("select ThanhLy.*,TenTaiSan from ThanhLy inner join TaiSan on ThanhLy.MaTaiSan=TaiSan.MaTaiSan");
			
			while (rs.next()) {
				ThanhLy thanhLy=new ThanhLy();
				thanhLy.setMaThanhLy(rs.getInt("MaThanhLy"));
				thanhLy.setMaTaiSan(rs.getInt("MaTaiSan"));
				
				thanhLy.setTinhTrang(rs.getInt("TinhTrang"));
				thanhLy.setTrangThai(XuLyChuoi.sTrangThai(rs.getInt("TinhTrang")));
				
				thanhLy.setSoTienThanhLy(Utilities.priceWithDecimal(rs.getFloat("SoTienThanhly")));
				thanhLy.setTenTaiSan(rs.getString("TenTaiSan"));
				
				list.add(thanhLy);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	Utilities utilities=new Utilities();
	
	public void themHangThanhLy(int maTaiSan,float soTienThanhLy){
		try {
			prepSta=getConnect().prepareStatement("insert into ThanhLy values(?,?,?,?)");
			
			int maThanhLy=utilities.Ai("ThanhLy", "MaThanhLy");
			prepSta.setInt(1, maThanhLy);
			prepSta.setInt(2, maTaiSan);
			prepSta.setInt(3, 0);
			prepSta.setFloat(4, soTienThanhLy);
			
			if (prepSta.executeUpdate()>0) {
				System.out.println("them thanh cong");
			} else {
				System.out.println("them that bai");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void capNhatHangThanhLy(int maThanhLy){
		try {
			prepSta=getConnect().prepareStatement("update ThanhLy set TinhTrang=? where MaThanhLy=?");
			
			prepSta.setInt(2, maThanhLy);
			prepSta.setInt(1, 1);

			if (prepSta.executeUpdate()>0) {
				System.out.println("cap nhat thanh cong");
			} else {
				System.out.println("cap nhat that bai");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
