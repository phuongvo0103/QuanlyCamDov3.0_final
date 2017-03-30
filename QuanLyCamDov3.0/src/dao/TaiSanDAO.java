package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.LoaiTaiSan;
import bean.TaiSan;
import common.ConnectData;
import common.Utilities;

public class TaiSanDAO extends ConnectData {
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement prepSt = null;

	private Utilities utilities = null;

	public ArrayList<TaiSan> getListTaiSan() {
		ArrayList<TaiSan> list = new ArrayList<>();
		try {
			st = getConnect().createStatement();
			rs = st.executeQuery("select TaiSan.*,LoaiTaiSan.TenLoaiTaiSan from TaiSan"
					+ " inner join LoaiTaiSan on TaiSan.MaLoaiTaiSan=LoaiTaiSan.MaLoaiTaiSan");
			while (rs.next()) {
				LoaiTaiSan loaiTaiSan = new LoaiTaiSan();
				loaiTaiSan.setTenLoaiTaiSan(rs.getString(7));

				TaiSan taiSan = new TaiSan(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), loaiTaiSan);

				list.add(taiSan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	public void themTaiSan(TaiSan taiSan) {
		utilities = new Utilities();
		int ma = utilities.Ai("TaiSan", "maTaiSan");
		try {
			prepSt = getConnect().prepareStatement("insert into TaiSan values(?,?,?,?,?,?)");
			prepSt.setInt(1, ma);
			prepSt.setInt(2, taiSan.getMaLoaiTaiSan());
			prepSt.setString(3, taiSan.getTenTaiSan());
			prepSt.setInt(4, taiSan.getTinhTrang());
			prepSt.setString(5, taiSan.getHinhAnh());
			prepSt.setString(6, taiSan.getMoTa());

			prepSt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	public void xoaTaiSan(int maTaiSan){ 
		try { 
			prepSt=getConnect().prepareStatement("delete from TaiSan where MaTaiSan=?");
	  
			prepSt.setInt(1, maTaiSan);
			
			 if(prepSt.executeUpdate()>0) {
				 
				 System.out.println("xóa thành cong");
			  
			 } 
		 }catch (SQLException e) { // TODO
			 e.printStackTrace(); 
		 }finally {
			try {
				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	 

	public ArrayList<TaiSan> getListTimKiemTaiSan(String tenTaiSan) {
		ArrayList<TaiSan> list = new ArrayList<>();
		try {
			st = getConnect().createStatement();
			rs = st.executeQuery("select TaiSan.*,TenLoaiTaiSan from "
					+ "TaiSan inner join LoaiTaiSan on TaiSan.MaLoaiTaiSan=LoaiTaiSan.MaLoaiTaiSan "
					+ "where TaiSan.TenTaiSan like '%" + tenTaiSan + "%'");
			while (rs.next()) {
				LoaiTaiSan loaiTaiSan = new LoaiTaiSan();
				loaiTaiSan.setTenLoaiTaiSan(rs.getString(7));

				TaiSan taiSan = new TaiSan(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), loaiTaiSan);

				list.add(taiSan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				getConnect().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}
