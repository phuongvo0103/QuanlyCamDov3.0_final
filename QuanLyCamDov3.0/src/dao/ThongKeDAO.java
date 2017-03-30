package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.ChiTietHopDong;
import bean.DoanhThu;
import bean.KhachHang;
import bean.LaiSuat;
import bean.TaiSan;
import common.ConnectData;
import common.Utilities;
import common.XuLyChuoi;

public class ThongKeDAO extends ConnectData {
	private Statement st = null;
	private ResultSet rs = null;

	public ArrayList<KhachHang> getKhachHangByWord(int nam, int thang) {
		ArrayList<KhachHang> list = new ArrayList<KhachHang>();
		try {
			String sql = "select * from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang"
					+ " inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong "
					+ "inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan where YEAR(ChiTietHopDong.NgayCam)="
					+ nam + " " + "and MONTH(ChiTietHopDong.NgayCam)=" + thang + "";
			st = getConnect().createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				KhachHang khachHang = new KhachHang(String.valueOf(rs.getInt(1)), rs.getString(2),
						XuLyChuoi.sGioiTinh(rs.getInt(3)), rs.getString(4), rs.getString(5));

				ChiTietHopDong chiTietHopDong = new ChiTietHopDong();
				// chiTietHopDong.setMaHopDong(rs.getInt(6));

				Date dateNgayCam = new Date(rs.getDate(12).getTime());
				Date dateNgayTra = new Date(rs.getDate(13).getTime());

				chiTietHopDong.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayCam));
				chiTietHopDong.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayTra));
				chiTietHopDong.setSoTienCam(rs.getInt(14));

				TaiSan taiSan = new TaiSan();
				taiSan.setTenTaiSan(rs.getString(19));

				khachHang.setChiTietHopDong(chiTietHopDong);
				khachHang.setTaiSan(taiSan);

				list.add(khachHang);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<TaiSan> getSanPhamByWord(int nam, int thang, int maLoai) {
		ArrayList<TaiSan> list = new ArrayList<TaiSan>();
		try {
			String sql = "select TaiSan.*,LoaiTaiSan.TenLoaiTaiSan,ChiTietHopDong.NgayCam,"
					+ "ChiTietHopDong.NgayTra,ChiTietHopDong.SoTienCam "
					+ "from TaiSan inner join LoaiTaiSan on TaiSan.MaLoaiTaiSan=LoaiTaiSan.MaLoaiTaiSan "
					+ "inner join ChiTietHopDong on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan "
					+ "where YEAR(ChiTietHopDong.NgayCam)=" + nam + " and MONTH(ChiTietHopDong.NgayCam)=" + thang + " "
					+ "and LoaiTaiSan.MaLoaiTaiSan=" + maLoai + "";
			st = getConnect().createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {

				TaiSan taiSan = new TaiSan();

				taiSan.setMaTaiSan(rs.getInt(1));
				taiSan.setTenLoaiTaiSan(rs.getString(7));
				taiSan.setTenTaiSan(rs.getString(3));
				/*taiSan.setTinhTrang(rs.getInt(4));*/
				taiSan.setHinhAnh(rs.getString(5));

				ChiTietHopDong chiTietHopDong = new ChiTietHopDong();
				chiTietHopDong.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate(8)));
				chiTietHopDong.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate(9)));
				chiTietHopDong.setSoTienCam(rs.getInt(10));

				taiSan.setChiTietHopDong(chiTietHopDong);

				list.add(taiSan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			getConnect();
		}
		return list;
	}

	public ArrayList<ChiTietHopDong> getListHopDongHetHan() {
		ArrayList<ChiTietHopDong> list = new ArrayList<ChiTietHopDong>();

		String strDate = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date());
		Date date = null;
		try {
			date = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(strDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println("" + date);
		java.sql.Date currentDate = new java.sql.Date(date.getTime());
		System.out.println("sql " + currentDate);

		try {
			String sql = "select * from HopDongHetHanvaSapHetHan where DATEDIFF(DAY,'"+currentDate+"',KT)>0 and DATEDIFF(DAY,'"+currentDate+"',KT)<4";
			st = getConnect().createStatement();

			rs = st.executeQuery(sql);
			while (rs.next()) {

				ChiTietHopDong cTHD = new ChiTietHopDong();

				cTHD.setMaCTHD(rs.getInt("MaCTHD"));
				/*
				 * System.out.println("Abc"+rs.getDate(6));
				 * System.out.println("Abcd"+rs.getString("NgayTra"));
				 */
				Date dateNgayCam = new Date(rs.getDate("NgayCam").getTime());
				Date dateNgayTra = new Date(rs.getDate("KT").getTime());

				cTHD.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayCam));
				cTHD.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayTra));
				cTHD.setTinhTrang(rs.getInt("TinhTrang"));
				
				cTHD.setSoTienCamFormat(Utilities.priceWithDecimal(rs.getFloat("SoTienCam")));

				KhachHang khachHang = new KhachHang();
				khachHang.setTenKhachHang(rs.getString("TenKhachHang"));
				cTHD.setKhachHang(khachHang);

				LaiSuat laiSuat = new LaiSuat();
				laiSuat.setMucLaiSuat(rs.getFloat("MucLaiSuat"));
				cTHD.setLaiSuat(laiSuat);

				TaiSan taiSan = new TaiSan();
				taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
				cTHD.setTaiSan(taiSan);

				list.add(cTHD);
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
			};
		}
		return list;
	}
	
	public ArrayList<ChiTietHopDong> getHopDongHetHan() {
		ArrayList<ChiTietHopDong> list = new ArrayList<ChiTietHopDong>();

		String strDate = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date());
		Date date = null;
		try {
			date = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(strDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println("" + date);
		java.sql.Date currentDate = new java.sql.Date(date.getTime());
		System.out.println("sql " + currentDate);

		try {
			String sql = "select * from HopDongHetHanvaSapHetHan where DATEDIFF(DAY,'"+currentDate+"',KT)<=0";
			
			/*String sql="select * from Temp_a where DATEDIFF(DAY,'2017-03-28',KT)<=0";*/
			
			st = getConnect().createStatement();

			rs = st.executeQuery(sql);
			while (rs.next()) {

				ChiTietHopDong cTHD = new ChiTietHopDong();

				cTHD.setMaCTHD(rs.getInt("MaCTHD"));
				/*
				 * System.out.println("Abc"+rs.getDate(6));
				 * System.out.println("Abcd"+rs.getString("NgayTra"));
				 */
				Date dateNgayCam = new Date(rs.getDate("NgayCam").getTime());
				Date dateNgayTra = new Date(rs.getDate("KT").getTime());

				cTHD.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayCam));
				cTHD.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayTra));
				cTHD.setTinhTrang(rs.getInt("TinhTrang"));
				
				cTHD.setSoTienCamFormat(Utilities.priceWithDecimal(rs.getFloat("SoTienCam")));

				KhachHang khachHang = new KhachHang();
				khachHang.setTenKhachHang(rs.getString("TenKhachHang"));
				cTHD.setKhachHang(khachHang);

				LaiSuat laiSuat = new LaiSuat();
				laiSuat.setMucLaiSuat(rs.getFloat("MucLaiSuat"));
				cTHD.setLaiSuat(laiSuat);

				TaiSan taiSan = new TaiSan();
				taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
				taiSan.setMaTaiSan(rs.getInt("MaTaiSan"));
				cTHD.setTaiSan(taiSan);

				list.add(cTHD);
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
		
		System.out.println("list HDHH "+list.size());
		
		return list;
	}

	public int kiemTraDongLai(){
		int kt=0;
		String sql="select * from ChiTietHopDong where MaCTHD in (select MaCTHD from GiaHan)";
		try {
			st = getConnect().createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				kt=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kt;
	}
	
	public ArrayList<Integer> layMaTaiSan(){
		ArrayList<Integer> list=new ArrayList<>();
		
		String sql="select MaTaiSan from ThanhLy";
		try {
			st = getConnect().createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				while (rs.next()) {
					list.add(rs.getInt(1));
				}
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
	
	public ArrayList<DoanhThu> ThongKeDoanhThuTheoThangCuaNam(int nam){
		ArrayList<DoanhThu> list=new ArrayList<>();
		String sql="select NgayThanhToan,"
				+ "(SUM(ThanhToan.TienThanhToan)+SUM(case  when SoTienThanhLy IS NULL then 0 else SoTienThanhLy end)) TongDoanhThu "
				+ "from ThanhLy right Join ChiTietHopDong on ThanhLy.MaTaiSan=ChiTietHopDong.MaTaiSan "
				+ "inner join ThanhToan on ChiTietHopDong.MaCTHD=ThanhToan.MaCTHD "
				+ "where YEAR(NgayThanhToan)="+nam+"  group by MONTH(NgayThanhToan),NgayThanhToan";
		try {
			st=getConnect().createStatement();

			rs=st.executeQuery(sql);
			
			while (rs.next()) {
				DoanhThu doanhThu=new DoanhThu();
				
				String date= new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("NgayThanhToan"));
				
				String[] arr= date.split("-");
				
				System.out.println(arr[0]+","+arr[1]+","+arr[2]);
				doanhThu.setNgayThanhToan(arr[0]+","+arr[1]+","+arr[2]);
				
				doanhThu.setTongDoanhThu(rs.getFloat("TongDoanhThu"));
				
				list.add(doanhThu);
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
	
	public ArrayList<DoanhThu> ThongKeDoanhThuTatCaCacNam(){
		ArrayList<DoanhThu> list=new ArrayList<>();
		String sql="select YEAR(NgayThanhToan) Nam,(SUM(ThanhToan.TienThanhToan)+SUM(case  when SoTienThanhLy IS NULL then 0 else SoTienThanhLy end)) TongDoanhThu "
				+ "from ThanhLy right Join ChiTietHopDong on ThanhLy.MaTaiSan=ChiTietHopDong.MaTaiSan "
				+ "inner join ThanhToan on ChiTietHopDong.MaCTHD=ThanhToan.MaCTHD group by YEAR(NgayThanhToan)";
		try {
			st=getConnect().createStatement();

			rs=st.executeQuery(sql);
			
			while (rs.next()) {
				DoanhThu doanhThu=new DoanhThu();
				
				doanhThu.setNam(rs.getString("Nam"));
				
				doanhThu.setTongDoanhThu(rs.getFloat("TongDoanhThu"));
				
				list.add(doanhThu);
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
}
