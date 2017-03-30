package common;

import java.text.ParseException;

public class CellData extends DataProvider {

	/**
	 * Hàm lấy tên khách hàng
	 * 
	 * @param maCTHD
	 * @return TenKhachHang
	 */
	public String getTenKhachHang(int maCTHD) {
		String querry = "select * from ChiTietHopDong,HopDong,KhachHang where KhachHang.MaKhachHang=HopDong.MaKhachHang and ChiTietHopDong.MaHopDong=HopDong.MaHopDong and MaCTHD='"
				+ maCTHD + "'";
		return getCell(querry, "TenKhachHang");
	}

	/**
	 * Hàm lấy ngày cầm
	 * 
	 * @param maCTHD
	 * @return NgayCam
	 */
	public String getNgayCam(int maCTHD) {
		String querry = "select * from ChiTietHopDong where MaCTHD='" + maCTHD + "'";
		return getCell(querry, "NgayCam");
	}

	/**
	 * Hàm kiểm tra CTHD đã dc gia hạn chưa?!
	 * 
	 * @param maCTHD
	 * @return boolean
	 */
	public boolean daGiaHan(int maCTHD) {
		String querry = "select * from GiaHan,ChiTietHopDong where GiaHan.MaCTHD=ChiTietHopDong.MaCTHD and ChiTietHopDong.MaCTHD='"+maCTHD+"'";
		System.out.println(demDong(querry));
		if (demDong(querry).equals("0"))
			return false;
		return true;
	}

	/**
	 * Hàm kiểm tra CTHD đã thanh toán chưa
	 * 
	 * @param maCTHD
	 * @return
	 */
	public boolean daThanhToan(int maCTHD) {
		String querry = "select * from ChiTietHopDong";
		if (getCell(querry, "TinhTrang").equals("1"))
			return true;
		return false;
	}

	/**
	 * Hàm lấy ngày bắt đầu gia hạn, 2 trường hợp: cthd đã và chưa gia hạn
	 * 
	 * @param maCTHD
	 * @return NgayKetThuc+1ngay
	 * @throws ParseException
	 */
	public String getNgayBDGiaHan(int maCTHD) throws ParseException {
		XuLy tt = new XuLy();
		String querry;
		String ngayBDGiaHan = new String();
		// nếu đã gia hạn
		if (daGiaHan(maCTHD)) {
			// lấy ngayTra trong ChiTietHopDong + 1
			querry = "select * from GiaHan where MaCTHD=" + maCTHD + "";
			ngayBDGiaHan = tt.congNgay(getCell(querry, "NgayKetThuc"), 1);
		} else {
			// chưa gia hạn : lấy ngayTra trong GiaHan + 1
			querry = "select * from ChiTietHopDong where MaCTHD=" + maCTHD + "";
			ngayBDGiaHan = tt.congNgay(getCell(querry, "NgayTra"), 1);
		}
		return ngayBDGiaHan;
	}

	/**
	 * Lay ngay ket thuc gia han
	 * 
	 * @param maCTHD
	 * @return
	 * @throws ParseException
	 */
	public String getNgayKetThuc(int maCTHD) throws ParseException {
		String querry;
		String ngayKetThuc = new String();
		// nếu đã gia hạn
		if (daGiaHan(maCTHD)) {
			// lấy ngayTra trong ChiTietHopDong + 1
			querry = "select * from GiaHan where MaCTHD=" + maCTHD + " order by MaGiaHan";
			ngayKetThuc = getCell(querry, "NgayKetThuc");
		} else {
			// chưa gia hạn : lấy ngayTra trong GiaHan + 1
			querry = "select * from ChiTietHopDong where MaCTHD='" + maCTHD + "'";
			ngayKetThuc = getCell(querry, "NgayTra");
		}
		return ngayKetThuc;
	}

	/**
	 * Hàm lấy giá cầm
	 * 
	 * @param maCTHD
	 * @return GiaCam
	 */
	public float getGiaCam(int maCTHD) {
		try {
			String querry = "select * from ChiTietHopDong where MaCTHD=" + maCTHD + "";
			return Float.parseFloat(getCell(querry, "SoTienCam"));
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * Ham lay tien gia han 1 ngay
	 * 
	 * @param maLaiSuat
	 * @return
	 */
	public float getTienGH1Ngay(int maLaiSuat) {
		String querry = "select * from LaiSuat where MaLaiSuat='" + maLaiSuat + "'";
		return Float.parseFloat(getCell(querry, "TienGiaHan"));
	}

	/**
	 * Ham lay so CMND
	 * 
	 * @param maCTHD
	 * @return
	 */
	public String getSoCMND(int maCTHD) {
		String querry = "Select * from ChiTietHopDong,HopDong,KhachHang where ChiTietHopDong.MaHopDong=HopDong.MaHopDong and HopDong.MaKhachHang=KhachHang.MaKhachHang";
		return getCell(querry, "CMND");
	}

	/**
	 * getMaDongLai = 0 - dong lai ky tiep
	 * 
	 * @param maCTHD
	 * @return
	 */
	public int getMaDongLaiIs0(int maCTHD) {
		String querry = "select * from DongTienLai where MaCTHD=" + maCTHD + " and TinhTrang=0 order by MaDongLai desc";
		if (getCell(querry, "MaDongLai").equals("null"))
			return 0;
		return Integer.parseInt(getCell(querry, "MaDongLai"));
	}

	public static void main(String[] args) throws ParseException {
		CellData c = new CellData();
		System.out.println("ngaykthd: " + c.getNgayKetThuc(1));
		System.out.println(c.getGiaCam(1));

		System.out.println(c.daThanhToan(4));
		
		System.out.println(c.daGiaHan(10));
	}
}
