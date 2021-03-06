USE [master]
GO
/****** Object:  Database [QuanLyCamDov2]    Script Date: 3/30/2017 5:04:18 PM ******/
CREATE DATABASE [QuanLyCamDov2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCamDov2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyCamDov2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyCamDov2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyCamDov2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [QuanLyCamDov2] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [QuanLyCamDov2] SET RECOVERY FULL 
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
/****** Object:  Table [dbo].[ChiTietHopDong]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[DongTienLai]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[GiaHan]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[HopDong]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[LaiSuat]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[LoaiTaiSan]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[TaiSan]    Script Date: 3/30/2017 5:04:18 PM ******/
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
	[MoTa] [text] NULL,
 CONSTRAINT [PK_TaiSan] PRIMARY KEY CLUSTERED 
(
	[MaTaiSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhLy]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 3/30/2017 5:04:18 PM ******/
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
/****** Object:  View [dbo].[HopDongHetHanvaSapHetHan]    Script Date: 3/30/2017 5:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[HopDongHetHanvaSapHetHan]
as
select
ChiTietHopDong.MaCTHD,TenKhachHang,MucLaiSuat,TenTaiSan,NgayCam,case when NgayKetThuc IS NULL then NgayTra else NgayKetThuc end as KT,ChiTietHopDong.TinhTrang,SoTienCam,ChiTietHopDong.MaTaiSan from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan inner join LaiSuat on LaiSuat.MaLaiSuat=ChiTietHopDong.MaLaiSuat left join GiaHan on GiaHan.MaCTHD=ChiTietHopDong.MaCTHD where TaiSan.MaTaiSan not in (Select MaTaiSan from ThanhLy)
GO
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (1, 1, 4, 13, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A75D00000000 AS DateTime), 50000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (2, 2, 1, 14, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A74900000000 AS DateTime), 2000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (3, 4, 1, 17, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime), 467000, 0, 499690)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (4, 5, 1, 18, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A74900000000 AS DateTime), 200000, 0, 214000)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (5, 11, 1, 19, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A74900000000 AS DateTime), 3000000, 0, 3210000)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (6, 12, 1, 20, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A74800000000 AS DateTime), 100000, 0, 107000)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (7, 8, 1, 21, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime), 750000, 0, 802500)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (8, 9, 1, 22, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A77800000000 AS DateTime), 50000, 0, 53500)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (9, 13, 3, 23, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A78400000000 AS DateTime), 10000000, 0, 10780000.019073486)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (10, 14, 3, 24, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A77E00000000 AS DateTime), 25000000, 0, 26950000.047683716)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (11, 10, 4, 25, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A78200000000 AS DateTime), 50000000, 0, 54099999.904632568)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (12, 15, 5, 26, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A7A300000000 AS DateTime), 35000000, 0, 38010000.133514404)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (13, 17, 3, 27, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A76500000000 AS DateTime), 35000000, 0, 37730000.0667572)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (14, 18, 1, 28, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A75A00000000 AS DateTime), 5000000, 0, 5350000)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (15, 16, 1, 29, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A77900000000 AS DateTime), 290000, 0, 310300)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (16, 21, 2, 30, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A74900000000 AS DateTime), 12000000, 0, 12888000.011444092)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (17, 22, 3, 31, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime), 24000000, 0, 25872000.045776367)
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong], [SoTienDong]) VALUES (1, 1, 1, CAST(0x0000A76500000000 AS DateTime), 112000)
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong], [SoTienDong]) VALUES (2, 2, 1, CAST(0x0000A77000000000 AS DateTime), 190000)
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (1, 4, 1, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A76500000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (2, 1, 2, CAST(0x0000A74600000000 AS DateTime), CAST(0x0000A77000000000 AS DateTime))
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (1, 1)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (2, 2)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (4, 4)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (5, 5)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (8, 8)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (9, 9)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (10, 10)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (11, 11)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (12, 12)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (13, 13)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (14, 14)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (15, 15)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (16, 16)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (17, 17)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (18, 18)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (21, 21)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (22, 22)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (23, 23)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (1, N'Võ Thị Mỹ Hương', 0, 205733340, N'Đà Nẵng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (2, N'Võ Văn Phương', 1, 205126542, N'Quảng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (4, N'Nguyễn Hồng Vân', 0, 201365420, N'Quảng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (5, N'Lê Phan Như', 0, 241540979, N'Quảng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (8, N'Nguyễn Thị Minh Trang', 0, 201230254, N'Hội An')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (9, N'Phan Ngọc Phú', 0, 2131321, N'Quãng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (10, N'Đỗ Thị Mỹ Hằng', 0, 212571888, N'Nghia Hành')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (11, N'Tạ Thị Ngọc Huyền', 0, 205214532, N'Bình Định')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (12, N'Trần Thị Nguyệt', 0, 201632154, N'Quảng Bình')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (13, N'Đỗ Vũ Quân', 1, 203215645, N'Quãng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (14, N'Lê Văn Viễn', 1, 203215456, N'Quãng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (15, N'Nguyễn Bá Hoàng Ân', 1, 235652145, N'Ðà N?ng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (16, N'Hồ Thị Thanh Nhàn', 0, 2111211144, N'Đức Phổ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (17, N'Võ Ngọc Hải', 1, 206520125, N'Quảng Nam')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (18, N'Võ Ngọc Nam', 1, 230125654, N'Quảng Nam')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (21, N'Nguyễn Thị Sen', 0, 203125654, N'Đà Nẵng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (22, N'Nguyễn Ngọc Quang', 1, 212571888, N'Bình Định')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (23, N'Nguyễn Anh Đôn', 1, 213456779, N'Cầu Bàu Giang')
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (1, 7, 10000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (2, 7.4, 12000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (3, 7.8, 14000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (4, 8.2, 16000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (5, 8.6, 18000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (6, 9, 20000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (7, 9.4, 24000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (8, 9.9, 28000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (9, 10.4, 32000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (10, 10.9, 36000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (11, 11.4, 40000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (12, 11.8, 42000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (13, 12.2, 44000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (14, 12.4, 48000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (15, 12.6, 52000, NULL)
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (1, N'Xe')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (2, N'Thiết bị điện tử')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (3, N'Trang sức')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (4, N'Các loại giấy tờ')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'admin', N'12345')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'phuongvv', N'12345')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'vutt', N'12345')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (1, 1, N'sh 150i', 1, N'images/1490842287362.jpg', N'Màu den, xe Vi?t Nam, ch?y du?c 10000km')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (2, 1, N'Air Blade 2016', 1, N'images/1490842457685.jpg', N'Màu tr?ng, dã ch?y du?c 15000km')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (3, 2, N'Laptop Asus corei5', 1, N'images/1490842586296.jpg', N'ASUS Core i5 500GB HDD Laptop, m?i 90%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (4, 1, N'Liberty', 1, N'images/1490843379746.jpg', N'Màu den, dã ch?y du?c 20000')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (5, 4, N'CMND', 1, N'images/1490843466325.png', N'Ch?ng minh nhân dân')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (8, 2, N'TIVI SAMSUNG', 1, N'images/1490844180901.jpg', N'TIVI SAMSUNG 40 INCH')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (10, 3, N'Dây chuyền vàng', 1, N'images/1490847200701.jpg', N'd?p')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (11, 3, N'Đồng hồ', 1, N'images/1490847685524.jpg', N'm?u mã ch?t lu?ng')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (12, 2, N'SamSung Galaxy Note', 1, N'images/1490861329753.jpg', N'Hàng dã s? d?ng 20%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (13, 1, N'Liberty 3V i.e', 1, N'images/1490864013093.jpg', N'Dài x r?ng là 1.930 x 705 mm, chi?u dài co s? 1.325 mm, d? cao yên 775 mm; bình xang 7 lít, t?i tr?ng 116 kg.')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (14, 2, N'Iphone 5c', 1, N'images/1490864445156.jpg', N'Màu h?ng, b?n qu?c t? 32gb')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (15, 2, N'Macbook 2016 Gold', 1, N'images/1490864930294.jpg', N'S?n ph?m chính hãng APPLE
M?i 99%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (16, 2, N'Macbook 2016 Gold', 1, N'images/1490864954246.jpg', N'S?n ph?m chính hãng APPLE
M?i 99%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (17, 2, N'Sạc dự phòng Romoss Sense 6P', 1, N'images/1490865541569.jpg', N'Dung lu?ng pin luu tr? l?n d?n 20000mAh, màu tr?ng')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (18, 2, N'iPod Touch ', 1, N'images/1490865723337.jpg', N'Camera 2 megapixel ')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (19, 2, N'Laptop DELL', 1, N'images/1490865940178.jpg', N'Laptop Dell N5542 Intel Core i5 - RAM 4GB HDD 500GB, m?i 90%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (20, 2, N'Máy tính Casio', 1, N'images/1490866226108.jpg', N'Máy tính Casio FX-570VN PLUS ( xám ),m?i 97%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (21, 3, N'Trang sức bạc nam', 1, N'images/1490866265983.jpg', N'Ch?t li?u: B?c ta')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (22, 4, N'Chứng minh nhân dân', 1, N'images/1490866391256.jpg', N'Ðã ép nh?a')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (23, 2, N'Samsung Galaxy', 1, N'images/1490866491623.jpg', N'Samsung Galaxy S8, m?i 99%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (24, 1, N'Xe Exciter', 1, N'images/1490866617826.jpg', N'Xe Yamaha Exciter 150 2016, ch?y du?c 10000km, màu xanh')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (25, 1, N'Nissan Tiida đời 2009', 1, N'images/1490866646447.jpg', N'Ðã di kho?ng 10 v?n km')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (26, 1, N'Air blade 2016', 1, N'images/1490866823660.jpg', N'Air blade 2016, màu den, ch?y du?c 5000km')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (27, 1, N'Air blade 2016', 1, N'images/1490867103452.jpg', N'Air blade 2016, màu tr?ng, dã ch?y du?c 20000km')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (28, 2, N'SamSung GalaXy note 5', 1, N'images/1490867231395.jpg', N'SamSung GalaXy note 5, màu xanh den, m?i 80%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (29, 2, N'Loa bluetooth hình con thỏ', 1, N'images/1490867271386.jpg', N'Kích thu?c : 4.5 * 4.4 * 10 cm, Công su?t: 5W')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (30, 2, N'iPhone 7', 1, N'images/1490867402880.jpg', N'Ði?n tho?i iPhone 7 32GB, m?i 90%')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (31, 1, N'Honda Vision 2014', 1, N'images/1490867553631.jpg', N'Màu tr?ng')
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
/****** Object:  Trigger [dbo].[trigger_Del_TaiSan]    Script Date: 3/30/2017 5:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trigger_Del_TaiSan]
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
/****** Object:  View [dbo].[HopDongHetHanvaSapHetHan]    Script Date: 3/30/2017 5:05:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[HopDongHetHanvaSapHetHan]
as
select
ChiTietHopDong.MaCTHD,TenKhachHang,MucLaiSuat,TenTaiSan,NgayCam,case when NgayKetThuc IS NULL then NgayTra else NgayKetThuc end as KT,ChiTietHopDong.TinhTrang,SoTienCam,ChiTietHopDong.MaTaiSan from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan inner join LaiSuat on LaiSuat.MaLaiSuat=ChiTietHopDong.MaLaiSuat left join GiaHan on GiaHan.MaCTHD=ChiTietHopDong.MaCTHD where TaiSan.MaTaiSan not in (Select MaTaiSan from ThanhLy)
GO


USE [master]
GO
ALTER DATABASE [QuanLyCamDov2] SET  READ_WRITE 
GO
