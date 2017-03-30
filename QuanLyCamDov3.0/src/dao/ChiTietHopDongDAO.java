package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.KhachHang;
import bean.LaiSuat;
import bean.LoaiTaiSan;
import bean.TaiSan;
import common.DataProvider;
import common.Utilities;
import common.XuLyChuoi;

public class ChiTietHopDongDAO extends DataProvider {
	
	Utilities utilities=new Utilities();
	
	public ArrayList<LoaiTaiSan> getListDanhMuc() {
		String querry = "select * from LoaiTaiSan";
		LoaiTaiSan danhMucTaiSan;
		ArrayList<LoaiTaiSan> listDanhMuc = new ArrayList<LoaiTaiSan>();
		try {
			ResultSet rs = exQ(querry);
			while (rs.next()) {
				danhMucTaiSan = new LoaiTaiSan();
				danhMucTaiSan.setMaLoaiTaiSan(rs.getInt("MaLoaiTaiSan"));
				danhMucTaiSan.setTenLoaiTaiSan(rs.getString("TenLoaiTaiSan"));
				listDanhMuc.add(danhMucTaiSan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listDanhMuc;
	}

	public ArrayList<ChiTietHopDong> getListChiTietHopDong(int maHopDong) {
		String querry = "select cthd.MaCTHD,kh.TenKhachHang,kh.DiaChi,ts.TenTaiSan,ts.MoTa,"
				+ "cthd.NgayCam,cthd.NgayTra,cthd.SoTienCam,ls.MucLaiSuat,cthd.TienThanhToan,"
				+ "cthd.MaHopDong from ChiTietHopDong as cthd,TaiSan as ts,HopDong as hd, "
				+ "KhachHang as kh, LaiSuat as ls where cthd.MaTaiSan=ts.MaTaiSan and "
				+ "cthd.MaLaiSuat=ls.MaLaiSuat and hd.MaHopDong=cthd.MaHopDong and "
				+ "hd.MaKhachHang=kh.MaKhachHang and cthd.TinhTrang=0 and hd.MaHopDong="+maHopDong+" order by MaCTHD";
		
		ArrayList<ChiTietHopDong> listCTHD = new ArrayList<ChiTietHopDong>();
		ChiTietHopDong cthd;
		try {
			ResultSet rs = exQ(querry);
			while (rs.next()) {
				cthd = new ChiTietHopDong();
				cthd.setMaCTHD(rs.getInt("MaCTHD"));

				KhachHang khachHang = new KhachHang();
				khachHang.setTenKhachHang(rs.getString("TenKhachHang"));
				khachHang.setDiaChi(rs.getString("DiaChi"));
				cthd.setKhachHang(khachHang);

				TaiSan taiSan = new TaiSan();
				taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
				taiSan.setMoTa(rs.getString("MoTa"));
				cthd.setTaiSan(taiSan);

				cthd.setNgayCam( new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayCam")));
				cthd.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayTra")));
				
				String soTien=Utilities.priceWithDecimal(rs.getFloat("SoTienCam"));
				cthd.setSoTienCamFormat(soTien);
				cthd.setSoTienCam(rs.getFloat("SoTienCam"));
				cthd.setMaHopDong(rs.getInt("MaHopDong"));

				LaiSuat laiSuat = new LaiSuat();
				laiSuat.setMucLaiSuat(rs.getFloat("MucLaiSuat"));
				cthd.setLaiSuat(laiSuat);

				String tienTT=Utilities.priceWithDecimal(rs.getFloat("TienThanhToan"));
				cthd.setTienThanhToanFormat(tienTT);
				cthd.setTienThanhToan(rs.getFloat("TienThanhToan"));

				listCTHD.add(cthd);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCTHD;
	}
	
	public ArrayList<ChiTietHopDong> getListChiTietHopDong() {
		String querry = "select ChiTietHopDong.MaCTHD,KhachHang.TenKhachHang,DiaChi,TenTaiSan,"
				+ "NgayCam,NgayTra,SoTienCam,LaiSuat.MucLaiSuat,ChiTietHopDong.TinhTrang,NgayThanhToan,"
				+ "ThanhToan.TienThanhToan from ChiTietHopDong inner join TaiSan on ChiTietHopDong.MaTaiSan=TaiSan.MaTaiSan "
				+ "inner join HopDong on ChiTietHopDong.MaHopDong=HopDong.MaHopDong "
				+ "inner join KhachHang on HopDong.MaKhachHang=KhachHang.MaKhachHang "
				+ "inner join LaiSuat on ChiTietHopDong.MaLaiSuat=LaiSuat.MaLaiSuat "
				+ "left join ThanhToan on ChiTietHopDong.MaCTHD=ThanhToan.MaCTHD "
				+ "where ChiTietHopDong.MaTaiSan not in (select MaTaiSan from ThanhLy)";
		
		ArrayList<ChiTietHopDong> listCTHD = new ArrayList<ChiTietHopDong>();
		ChiTietHopDong cthd=null;
		try {
			ResultSet rs = exQ(querry);
			while (rs.next()) {
				cthd = new ChiTietHopDong();
				cthd.setMaCTHD(rs.getInt("MaCTHD"));

				KhachHang khachHang = new KhachHang();
				khachHang.setTenKhachHang(rs.getString("TenKhachHang"));
				khachHang.setDiaChi(rs.getString("DiaChi"));
				cthd.setKhachHang(khachHang);

				TaiSan taiSan = new TaiSan();
				taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
				cthd.setTaiSan(taiSan);

				cthd.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayCam")));
				cthd.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayTra")));
				
				if (rs.getString("NgayThanhToan")==null || rs.getString("NgayThanhToan").length()==0) {
					cthd.setNgayThanhToan(rs.getString("NgayThanhToan"));
				}else {
					cthd.setNgayThanhToan( new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("NgayThanhToan")));
				}
				
				
				String soTien=Utilities.priceWithDecimal(rs.getFloat("SoTienCam"));
				cthd.setSoTienCamFormat(soTien);
				cthd.setSoTienCam(rs.getFloat("SoTienCam"));

				LaiSuat laiSuat = new LaiSuat();
				laiSuat.setMucLaiSuat(rs.getFloat("MucLaiSuat"));
				cthd.setLaiSuat(laiSuat);
				
				String tienTT=Utilities.priceWithDecimal(rs.getFloat("TienThanhToan"));
				cthd.setTienThanhToanFormat(tienTT);
				cthd.setTienThanhToan(rs.getFloat("TienThanhToan"));
				cthd.setTinhTrang(rs.getInt("Tinhtrang"));
				
				cthd.setTrangThai(XuLyChuoi.sTinhTrang(rs.getInt("TinhTrang")));

				listCTHD.add(cthd);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCTHD;
	}

	public boolean  themTaiSan(int maTaiSan, int maDanhMuc, String tenTaiSan, int tinhTrang, String moTaTaiSan,
			String urlHinhAnh) {
		String querry = "insert into TaiSan values('" + maTaiSan + "','" + maDanhMuc + "',N'" + tenTaiSan + "','"
				+ tinhTrang + "',N'" + moTaTaiSan + "','" + urlHinhAnh + "')";
		try {
			exU(querry);
			System.out.println("ChiTietHopDongDAO/themTaiSan: success!");
			return true;
			
		} catch (SQLException e) {
			System.out.println("ChiTietHopDongDAO/themTaiSan: lỗi cmnr!");
			e.printStackTrace();
			return false;
		}
	}

	public boolean themChiTietHopDong(int maCTHD, int maHopDong, int maLaiSuat, int maTaiSan, String ngayCam,
			String ngayTra, double giaCam, int tinhTrang, double tienThanhToan) {
		String querry = "insert into ChiTietHopDong values('" + maCTHD + "','" + maHopDong + "','" + maLaiSuat + "','"
				+ maTaiSan + "','" + ngayCam + "','" + ngayTra + "','" + giaCam + "','" + tinhTrang + "','"
				+ tienThanhToan + "')";
		try {
			exU(querry);
			System.out.println("ChiTietHopDongDAO/themChiTietHopDong: success!");
			return true;
		} catch (SQLException e) {
			System.out.println("ChiTietHopDongDAO/themChiTietHopDong: Lỗi cmnr!");
			e.printStackTrace();
		}
		return false;
	}

	public void thanhToan(int maCTHD) {
		String querry = "update ChiTietHopDong set TinhTrang=1 where MaCTHD='" + maCTHD + "'";
		try {
			exU(querry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
