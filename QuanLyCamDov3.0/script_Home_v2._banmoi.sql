USE [master]
GO
/****** Object:  Database [QuanLyCamDov2]    Script Date: 3/30/2017 1:45:48 AM ******/
CREATE DATABASE [QuanLyCamDov2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCamDov2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyCamDov2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyCamDov2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyCamDov2_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyCamDov2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCamDov2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCamDov2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyCamDov2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCamDov2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCamDov2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCamDov2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyCamDov2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCamDov2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyCamDov2] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCamDov2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCamDov2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCamDov2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCamDov2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyCamDov2]
GO
/****** Object:  Table [dbo].[ChiTietHopDong]    Script Date: 3/30/2017 1:45:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHopDong](
	[MaCTHD] [int] NOT NULL,
	[MaHopDong] [int] NOT NULL,
	[MaLaiSuat] [int] NOT NULL,
	[MaTaiSan] [int] NOT NULL,
	[NgayCam] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[SoTienCam] [float] NULL,
	[TinhTrang] [int] NULL,
	[TienThanhToan] [float] NULL,
 CONSTRAINT [PK_ChiTietHopDong_1] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongTienLai]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongTienLai](
	[MaDongLai] [int] NOT NULL,
	[MaCTHD] [int] NOT NULL,
	[TinhTrang] [int] NULL,
	[NgayDong] [datetime] NULL,
	[SoTienDong] [float] NULL,
 CONSTRAINT [PK_DongTienLai] PRIMARY KEY CLUSTERED 
(
	[MaDongLai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaHan]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaHan](
	[MaGiaHan] [int] NOT NULL,
	[MaLaiSuat] [int] NOT NULL,
	[MaCTHD] [int] NOT NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_GiaHan] PRIMARY KEY CLUSTERED 
(
	[MaGiaHan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHopDong] [int] NOT NULL,
	[MaKhachHang] [int] NOT NULL,
 CONSTRAINT [PK_HopDong_1] PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[GioiTinh] [int] NULL,
	[CMND] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LaiSuat]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaiSuat](
	[MaLaiSuat] [int] NOT NULL,
	[MucLaiSuat] [float] NULL,
	[TienGiaHan] [float] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LaiSuat] PRIMARY KEY CLUSTERED 
(
	[MaLaiSuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTaiSan]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiSan](
	[MaLoaiTaiSan] [int] NOT NULL,
	[TenLoaiTaiSan] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMucTaiSan] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiSan]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSan](
	[MaTaiSan] [int] NOT NULL,
	[MaLoaiTaiSan] [int] NOT NULL,
	[TenTaiSan] [nvarchar](50) NULL,
	[TinhTrang] [int] NOT NULL,
	[UrlHinhAnh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiSan] PRIMARY KEY CLUSTERED 
(
	[MaTaiSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhLy]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhLy](
	[MaThanhLy] [int] NOT NULL,
	[MaTaiSan] [int] NOT NULL,
	[TinhTrang] [int] NULL,
	[SoTienThanhLy] [float] NULL,
 CONSTRAINT [PK_ThanhLy] PRIMARY KEY CLUSTERED 
(
	[MaThanhLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaCTHD] [int] NOT NULL,
	[NgayThanhToan] [datetime] NULL,
	[TienThanhToan] [float] NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_HopDong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[HopDong] ([MaHopDong])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_HopDong]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_LaiSuat] FOREIGN KEY([MaLaiSuat])
REFERENCES [dbo].[LaiSuat] ([MaLaiSuat])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_LaiSuat]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_TaiSan] FOREIGN KEY([MaTaiSan])
REFERENCES [dbo].[TaiSan] ([MaTaiSan])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_TaiSan]
GO
ALTER TABLE [dbo].[DongTienLai]  WITH CHECK ADD  CONSTRAINT [FK_DongTienLai_ChiTietHopDong] FOREIGN KEY([MaCTHD])
REFERENCES [dbo].[ChiTietHopDong] ([MaCTHD])
GO
ALTER TABLE [dbo].[DongTienLai] CHECK CONSTRAINT [FK_DongTienLai_ChiTietHopDong]
GO
ALTER TABLE [dbo].[GiaHan]  WITH CHECK ADD  CONSTRAINT [FK_GiaHan_ChiTietHopDong] FOREIGN KEY([MaCTHD])
REFERENCES [dbo].[ChiTietHopDong] ([MaCTHD])
GO
ALTER TABLE [dbo].[GiaHan] CHECK CONSTRAINT [FK_GiaHan_ChiTietHopDong]
GO
ALTER TABLE [dbo].[GiaHan]  WITH CHECK ADD  CONSTRAINT [FK_GiaHan_LaiSuat] FOREIGN KEY([MaLaiSuat])
REFERENCES [dbo].[LaiSuat] ([MaLaiSuat])
GO
ALTER TABLE [dbo].[GiaHan] CHECK CONSTRAINT [FK_GiaHan_LaiSuat]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_KhachHang]
GO
ALTER TABLE [dbo].[TaiSan]  WITH CHECK ADD  CONSTRAINT [FK_TaiSan_LoaiTaiSan] FOREIGN KEY([MaLoaiTaiSan])
REFERENCES [dbo].[LoaiTaiSan] ([MaLoaiTaiSan])
GO
ALTER TABLE [dbo].[TaiSan] CHECK CONSTRAINT [FK_TaiSan_LoaiTaiSan]
GO
ALTER TABLE [dbo].[ThanhLy]  WITH CHECK ADD  CONSTRAINT [FK_ThanhLy_TaiSan] FOREIGN KEY([MaTaiSan])
REFERENCES [dbo].[TaiSan] ([MaTaiSan])
GO
ALTER TABLE [dbo].[ThanhLy] CHECK CONSTRAINT [FK_ThanhLy_TaiSan]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_ThanhToan_ChiTietHopDong] FOREIGN KEY([MaCTHD])
REFERENCES [dbo].[ChiTietHopDong] ([MaCTHD])
GO
ALTER TABLE [dbo].[ThanhToan] CHECK CONSTRAINT [FK_ThanhToan_ChiTietHopDong]
GO
/****** Object:  Trigger [dbo].[trigger_Del_TaiSan]    Script Date: 3/30/2017 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[trigger_Del_TaiSan]
on [dbo].[TaiSan]
INSTEAD OF delete
as
begin
	declare @MaTaiSan int,@MaCTHD int
	declare @MaHopDong int,@MaKhachHang int
	declare @MaDongLai int,@MaGiaHan int,@MaThanhLy int
	
	set @MaTaiSan=(select deleted.MaTaiSan from deleted)
	
	--xóa bảng thanh lý
	if exists (select MaThanhLy from ThanhLy where MaTaiSan=@MaTaiSan)
		begin
			delete from ThanhLy where MaTaiSan=@MaTaiSan
			print 'Xóa bảng thanh ly'
		end

	--xóa bảng gia hạn
	delete from GiaHan where MaCTHD in (select MaCTHD from ChiTietHopDong where MaTaiSan=@MaTaiSan)
	print 'Xóa bảng gia hạn'
	

	--xóa bảng đóng tiền lãi
	delete from DongTienLai where MaCTHD in (select MaCTHD from ChiTietHopDong where MaTaiSan=@MaTaiSan)
	print 'Xóa bảng đóng tiền lãi'

	--xóa bảng thanh toán
	delete from ThanhToan where MaCTHD in (select MaCTHD from ChiTietHopDong where MaTaiSan=@MaTaiSan)
	print 'Xóa bảng thanh toán'
		
	--tạo bảng tạm ChiTietHopDong
	select MaHopDong into TempTable from ChiTietHopDong where  MaTaiSan=@MaTaiSan

	--xóa bảng chi tiết hợp đồng
	if exists (select MaCTHD from ChiTietHopDong where MaTaiSan=@MaTaiSan)
		begin
			delete from ChiTietHopDong where MaTaiSan=@MaTaiSan
			print 'Xóa bảng chi tiết hợp đồng'
		end
	
	--tạo bảng tạm HopDong
	select MaKhachHang into TempHopDong from HopDong where MaHopDong in (select MaHopDong from TempTable)
	
	--xóa bảng hợp dôngf
	delete from HopDong where MaHopDong in (select MaHopDong from TempTable)
	print 'Xóa bảng hợp đồng'

	--xóa bảng khách hàng
	delete from KhachHang where MaKhachHang in (select MaKhachHang from TempHopDong)
	print 'Xóa bảng khách hàng'

	--xóa các bảng tạm
	drop table TempTable
	drop table TempHopDong
	print 'Xóa bảng tạm'

	-- xóa bảng tài sản
	delete from TaiSan where MaTaiSan=@MaTaiSan
	print 'Xóa tài sản'

end
GO
-----------------------tạo view cho hợp đồng hết hạn và sắp hết hạn--------------------------------
create view HopDongHetHanvaSapHetHan
as
select
ChiTietHopDong.MaCTHD,TenKhachHang,MucLaiSuat,TenTaiSan,NgayCam,case when NgayKetThuc IS NULL then NgayTra else NgayKetThuc end as KT,ChiTietHopDong.TinhTrang,SoTienCam,ChiTietHopDong.MaTaiSan from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan inner join LaiSuat on LaiSuat.MaLaiSuat=ChiTietHopDong.MaLaiSuat left join GiaHan on GiaHan.MaCTHD=ChiTietHopDong.MaCTHD where TaiSan.MaTaiSan not in (Select MaTaiSan from ThanhLy)
GO

USE [master]
GO
ALTER DATABASE [QuanLyCamDov2] SET  READ_WRITE 
GO

select * from HopDongHetHanvaSapHetHan
select * from HopDongHetHanvaSapHetHan where DATEDIFF(DAY,'2017-05-11',KT)<=0
