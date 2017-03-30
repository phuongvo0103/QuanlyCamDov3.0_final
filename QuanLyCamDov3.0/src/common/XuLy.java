package common;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class XuLy extends DataProvider {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	public String ngayHt = sdf.format(cal.getTime());
	CellData cd = new CellData();

	/**
	 * Đếm số ngày
	 * 
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @return so ngày (int)
	 * @throws ParseException
	 */
	public int demNgay(String ngayBatDau, String ngayKetThuc) throws ParseException {
		Calendar cal1 = new GregorianCalendar();
		Calendar cal2 = new GregorianCalendar();
		try {
			Date date = sdf.parse(ngayBatDau);
			cal1.setTime(date);
			date = sdf.parse(ngayKetThuc);
			cal2.setTime(date);
			return (int) ((cal2.getTime().getTime() - cal1.getTime().getTime()) / (1000 * 60 * 60 * 24));
		} catch (Exception e) {
			e.printStackTrace();
			return -999999;
		}
	}
	
	/**
	 * kiểm tra hợp đồng có hết hạn chưa
	 * @param ngayKTHD
	 * @return
	 */
	public boolean kiemTraGiaHan(String ngayKTHD){
		boolean check=false;
		Calendar cal1 = new GregorianCalendar();
		Calendar cal2 = new GregorianCalendar();
		try {
			String ngayHienTai=sdf.format(new Date());
			
			Date date = sdf.parse(ngayHienTai);
			cal1.setTime(date);
			date = sdf.parse(ngayKTHD);
			cal2.setTime(date);
			int ngay= (int) ((cal1.getTime().getTime() - cal2.getTime().getTime()) / (1000 * 60 * 60 * 24));
			if (ngay<=0) {
				check=true;
			}else{
				check=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			check=false;
		}
		return check;
	}

	/**
	 * lấy mã lãi suất, exception: maLaiSuat=11,12,13,14
	 * 
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param soTienCam
	 * @return maLaiSuat(int)
	 * @throws ParseException
	 */
	public int maLaiSuat(String ngayBatDau, String ngayKetThuc, double soTienCam) throws ParseException {
		int soNgay = demNgay(ngayBatDau, ngayKetThuc);
		System.out.println("So ngay: " + soNgay);
		if (soNgay <= 0)
			return 16;
		else if (0 < soNgay && soNgay <= 60) {
			if(soTienCam<=0) return 18;
			if (0 < soTienCam && soTienCam <= 10000000)
				return 1;
			if (0 < soTienCam && soTienCam <= 20000000)
				return 2;
			if (20000000 < soTienCam && soTienCam <= 40000000)
				return 3;
			if (40000000 < soTienCam && soTienCam <= 60000000)
				return 4;
			if (60000000 < soTienCam && soTienCam <= 80000000)
				return 5;
			if(soTienCam>80) return 19;
		} else if (60 < soNgay && soNgay <= 120) {
			if(soTienCam<=0) return 18;
			if (0 < soTienCam && soTienCam <= 10000000)
				return 3;
			if (0 < soTienCam && soTienCam <= 20000000)
				return 4;
			if (20000000 < soTienCam && soTienCam <= 40000000)
				return 5;
			if (40000000 < soTienCam && soTienCam <= 60000000)
				return 6;
			if (60000000 < soTienCam && soTienCam <= 80000000)
				return 7;
			if(soTienCam>80) return 19;
		} else if (120 < soNgay && soNgay <= 180) {
			if(soTienCam<=0) return 18;
			if (0 < soTienCam && soTienCam <= 10000000)
				return 5;
			if (0 < soTienCam && soTienCam <= 20000000)
				return 6;
			if (20000000 < soTienCam && soTienCam <= 40000000)
				return 7;
			if (40000000 < soTienCam && soTienCam <= 60000000)
				return 8;
			if (60000000 < soTienCam && soTienCam <= 80000000)
				return 9;
			if(soTienCam>80) return 19;
		} else if (180 < soNgay && soNgay <= 240) {
			if(soTienCam<=0) return 18;
			if (0 < soTienCam && soTienCam <= 10000000)
				return 7;
			if (0 < soTienCam && soTienCam <= 20000000)
				return 8;
			if (20000000 < soTienCam && soTienCam <= 40000000)
				return 9;
			if (40000000 < soTienCam && soTienCam <= 60000000)
				return 10;
			if (60000000 < soTienCam && soTienCam <= 80000000)
				return 11;
			if(soTienCam>80) return 19;
		} 
		 else if (240 < soNgay && soNgay <= 300) {
			 if(soTienCam<=0) return 18;
			 if (0 < soTienCam && soTienCam <= 10000000)
					return 9;
				if (0 < soTienCam && soTienCam <= 20000000)
					return 10;
				if (20000000 < soTienCam && soTienCam <= 40000000)
					return 11;
				if (40000000 < soTienCam && soTienCam <= 60000000)
					return 12;
				if (60000000 < soTienCam && soTienCam <= 80000000)
					return 13;
				if(soTienCam>80) return 19;
			} 
		 else if (300 < soNgay && soNgay <= 360) {
			 if(soTienCam<=0) return 18;
			 if (0 < soTienCam && soTienCam <= 10000000)
					return 11;
				if (0 < soTienCam && soTienCam <= 20000000)
					return 12;
				if (20000000 < soTienCam && soTienCam <= 40000000)
					return 13;
				if (40000000 < soTienCam && soTienCam <= 60000000)
					return 14;
				if (60000000 < soTienCam && soTienCam <= 80000000)
					return 15;
				if(soTienCam>80) return 19;
			} 
		else if (soNgay > 360)
			return 17;
		return 0;
	}

	/**
	 * lay muc lai suat
	 * 
	 * @param maLaiSuat
	 * @return mucLaiSuat(float)
	 */
	public float getMucLaiSuat(int maLaiSuat) {
		try {
			String querry = "select * from LaiSuat where MaLaiSuat=" + maLaiSuat + "";
			return Float.parseFloat(getCell(querry, "MucLaiSuat"));
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * Lay tien thanh toan
	 * 
	 * @param maLaiSuat
	 * @param giaCam
	 * @return TienThanhTOan(double)
	 */
	public double getTienThanhToan(int maLaiSuat, double giaCam) {
		double mucLaiSuat = getMucLaiSuat(maLaiSuat);
		return (double) giaCam + giaCam * mucLaiSuat / 100;
	}

	/**
	 * cong ngay
	 * 
	 * @param ngayBatDau
	 * @param soNgay
	 * @return ngay moi (String)
	 * @throws ParseException
	 */
	public String congNgay(String ngayBatDau, int soNgay) throws ParseException {
		Date date = sdf.parse(ngayBatDau);
		cal.setTime(date);
		cal.add(Calendar.DATE, soNgay);
		String output = sdf.format(cal.getTime());
		return output;
	}

	/**
	 * lay danh sach ngay
	 * 
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param chuKyNgay
	 * @return danh sach ngay (ArrayList)
	 * @throws ParseException
	 */
	public List<String> danhSachNgay(String ngayBatDau, String ngayKetThuc, int chuKyNgay) throws ParseException {
		List<String> dsNgay = new ArrayList<String>();
		boolean check = false;
		String ngayToi = "";
		int i = 0;
		while (!check) {
			i++;
			if (i == 1)
				ngayToi = ngayBatDau;
			else {
				ngayToi = congNgay(ngayToi, chuKyNgay);
				if (demNgay(ngayToi, ngayKetThuc) < 0) {
					ngayToi = ngayKetThuc;
					check = true;
				}
				dsNgay.add(ngayToi);
			}
		}
		return dsNgay;
	}

	/**
	 * Ham lay tong tien gia han - truong hop xem trc, ngay k luu trong database
	 * 
	 * @param maCTHD
	 * @param ngayKetThuc
	 * @return tongTienGH(double)
	 * @throws ParseException
	 */
	public double tongTienGH(int maCTHD, String ngayKetThuc) throws ParseException {
		String ngayBatDau = cd.getNgayBDGiaHan(maCTHD);
		int maLaiSuat = maLaiSuat(ngayBatDau, ngayKetThuc, cd.getGiaCam(maCTHD));

		double tienGH1ngay = cd.getTienGH1Ngay(maLaiSuat);
		int thoiGianGH = demNgay(ngayBatDau, ngayKetThuc);

		return Double.parseDouble(String.valueOf(tienGH1ngay)) * thoiGianGH;
	}

	/**
	 * Ham lay tong tien gia han, truong hop ngay dc luu trong csdl
	 * @param maCTHD
	 * @return tongtienGH(double)
	 */
	public double tongTienGH(int maCTHD) {
		String querry = "select case when sum(SoTienDong) IS NULL then 0 else sum(SoTienDong) end as SoTienDong from DongTienLai where MaCTHD="
				+ maCTHD + "";
		return Double.parseDouble(getCell(querry, "SoTienDong"));
	}

	/**
	 * Ham lay tien no lai
	 * 
	 * @param maCTHD
	 * @param tongTienGH
	 * @return tienNoLai(double)
	 */
	public double tienNoLai(int maCTHD, double tongTienGH) {
		try {
			String querry = "select * from DongTienLai,ChiTietHopDong where ChiTietHopDong.MaCTHD=" + maCTHD
					+ " and DongTienLai.MaCTHD=ChiTietHopDong.MaCTHD and ChiTietHopDong.TinhTrang=0 and DongTienLai.TinhTrang=1";
			int soLanDaDong = Integer.parseInt(demDong(querry));
			System.out.println("soLanDaDong: " + soLanDaDong);
			double tienMoiKy;
			if (getCell(querry, "SoTienDong").equals("null"))
				tienMoiKy = 0;
			else {
				tienMoiKy = Double.parseDouble(getCell(querry, "SoTienDong"));
			}
			System.out.println(tienMoiKy);
			return tongTienGH - (tienMoiKy * soLanDaDong);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * Ham lay tien no lai
	 * @param maCTHD
	 * @param tongTienGH
	 * @return tienNoLai(double)
	 */
	public double tienNoLai(int maCTHD) {
		String querry = "select case when sum(SoTienDong) IS NULL then 0 else sum(SoTienDong) end as SoTienDong from DongTienLai where MaCTHD="+maCTHD+" and TinhTrang=0";
		return Double.parseDouble(getCell(querry, "SoTienDong"));
	}

	public static void main(String[] args) throws ParseException {
		XuLy tt = new XuLy();
		System.out.println(tt.tongTienGH(1));
		System.out.println(tt.tienNoLai(1, tt.tongTienGH(1)));
		
		if (tt.kiemTraGiaHan("2017-04-10")) {
			System.out.println("chưa hết hạn");
		}else{
			System.out.println("đã hết hạn");
		}
		
		System.out.println(tt.demNgay("2017-03-28 00:00:00", "2017-07-18"));
		
		System.out.println("2017-03-28 00:00:00".split(" "));
		
		String[] arr="2017-03-28 00:00:00".split(" ");
		
		System.out.println(arr[0]);
		
		System.out.println("muc lai suat: "+tt.getMucLaiSuat(2));
	}

	public String format(Double tien) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(tien);
	}

}
