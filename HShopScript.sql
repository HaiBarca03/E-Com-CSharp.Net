IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Hshop2023')
BEGIN
  CREATE DATABASE Hshop2023;
END;
GO

USE [Hshop2023]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHh] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHh] [int] IDENTITY(1,1) NOT NULL,
	[TenHh] [nvarchar](50) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[NgaySx] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNcc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHh
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHh = cthd.MaHh


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHh] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNcc] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHh] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102150, 11077, 1060, 34, 2, 0.059999998658895493)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102151, 11077, 1064, 33.25, 2, 0.029999999329447743)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102152, 11077, 1066, 17, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102153, 11077, 1073, 15, 2, 0.0099999997764825821)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102154, 11077, 1075, 7.75, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102155, 11077, 1077, 13, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102231, 11111, 1002, 19, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102232, 11111, 1024, 4.5, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102233, 11112, 1004, 22, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102234, 11112, 1005, 21.35, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102235, 11112, 1006, 25, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102236, 11113, 1042, 14, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102237, 11113, 1023, 9, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102238, 11114, 1002, 19, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHh], [DonGia], [SoLuong], [GiamGia]) VALUES (102239, 11114, 1053, 32.8, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1001, N'Aniseed Syrup 123', N'1001-aniseed-syrup-123', 1000, N'10 boxes x 20 bags', 190, N'41MJUdI2jdL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' value="EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors"', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1002, N'Change', N'1002-change', 1000, N'10 boxes x 20 bags', 19, N'41TexqWVkHL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1562, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1003, N'Tên mới sửa', N'1003-aniseed-syrup', 1001, N'12 - 550 ml bottles', 1001, N'31EPGSm2s1L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 491, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1004, N'Chef Anton''s Cajun Seasoning', N'1004-chef-antons-cajun-seasoning', 1001, N'48 - 6 oz jars', 22, N'41CIcYRxJKL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 216, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1005, N'Chef Anton''s Gumbo Mix', N'1005-chef-antons-gumbo-mix', 1001, N'36 boxes', 21.35, N'41G38jC0ajL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 134, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1006, N'Grandma''s Boysenberry Spread', N'1006-grandmas-boysenberry-spread', 1001, N'12 - 8 oz jars', 25, N'41iDo0HDhbL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 153, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1007, N'Uncle Bob''s Organic Dried Pears', N'1007-uncle-bobs-organic-dried-pears', 1006, N'12 - 1 lb pkgs.', 30, N'81k1XbQ6nQL._SL1500_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 5006, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1008, N'Northwoods Cranberry Sauce', N'1008-northwoods-cranberry-sauce', 1001, N'12 - 12 oz jars', 40, N'41LMouG6j7L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1009, N'Mishi Kobe Niku', N'1009-mishi-kobe-niku', 1005, N'18 - 500 g pkgs.', 97, N'21meTyhQebL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1010, N'Ikura', N'1010-ikura', 1007, N'12 - 200 ml jars', 31, N'31hCgES5GXL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1011, N'Queso Cabrales', N'1011-queso-cabrales', 1003, N'1 kg pkg.', 21, N'31jsjfVfH9L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1012, N'Queso Manchego La Pastora', N'1012-queso-manchego-la-pastora', 1003, N'10 - 500 g pkgs.', 38, N'41BiMx1FKyL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1013, N'Konbu', N'1013-konbu', 1007, N'2 kg box', 6, N'31ioCUUFnoL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1014, N'Tofu', N'1014-tofu', 1006, N'40 - 100 g pkgs.', 23.25, N'81Q1DvOnnoL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1015, N'Genen Shouyu', N'1015-genen-shouyu', 1001, N'24 - 250 ml bottles', 15.5, N'41qlcUEhNmL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1016, N'Pavlova', N'1016-pavlova', 1002, N'32 - 500 g boxes', 17.45, N'41iji4-9UsL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 329, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1017, N'Alice Mutton', N'1017-alice-mutton', 1005, N'20 - 1 kg tins', 39, N'31LAnW1JFqL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1018, N'Carnarvon Tigers', N'1018-carnarvon-tigers', 1007, N'16 kg pkg.', 62.5, N'31yxRemzRLL._SS350_ (1).jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1019, N'Teatime Chocolate Biscuits', N'1019-teatime-chocolate-biscuits', 1002, N'10 boxes x 12 pieces', 9.2, N'41KALboJKuL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 12, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1020, N'Sir Rodney''s Marmalade', N'1020-sir-rodneys-marmalade', 1002, N'30 gift boxes', 81, N'41sl3FN6NpL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1021, N'Sir Rodney''s Scones', N'1021-sir-rodneys-scones', 1002, N'24 pkgs. x 4 pieces', 10, N'41w4TlVPhGL.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1022, N'Gustaf''s KnÃ¤ckebrÃ¶d', N'1022-gustafs-knckebrd', 1004, N'24 - 500 g pkgs.', 21, N'31pT+SdvQXL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 40, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1023, N'TunnbrÃÂ¶d', N'1023-tunnbrd', 1004, N'12 - 250 g pkgs.', 9, N'31YOss-gC-L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 762, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1024, N'GuaranÃ¡ FantÃ¡stica', N'1024-guaran-fantstica', 1000, N'12 - 355 ml cans', 4.5, N'41V4Ds2PtZL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 96, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1025, N'NuNuCa NuÃÂ-Nougat-Creme', N'1025-nunuca-nu-nougat-creme', 1002, N'20 - 450 g glasses', 14, N'41XX7Pi240L.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1026, N'GumbÃ¤r GummibÃ¤rchen', N'1026-gumbr-gummibrchen', 1002, N'100 - 250 g bags', 31.23, N'41-yvkFqVZL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1027, N'Schoggi Schokolade', N'1027-schoggi-schokolade', 1002, N'100 - 100 g pieces', 43.9, N'41ZE9SmWdzL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1028, N'RÃ¶ssle Sauerkraut', N'1028-rssle-sauerkraut', 1006, N'25 - 825 g cans', 45.6, N'91FM0Hog9FL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1029, N'ThÃ¼ringer Rostbratwurst', N'1029-thringer-rostbratwurst', 1005, N'50 bags x 30 sausgs.', 123.79, N'31ncPnMYCxL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 2, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1030, N'Nord-Ost Matjeshering', N'1030-nord-ost-matjeshering', 1007, N'10 - 200 g glasses', 25.89, N'41lffECD-sL._SY445_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1031, N'Gorgonzola Telino', N'1031-gorgonzola-telino', 1003, N'12 - 100 g pkgs', 12.5, N'41IPLmZIKhL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1032, N'Mascarpone Fabioli', N'1032-mascarpone-fabioli', 1003, N'24 - 200 g pkgs.', 32, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1033, N'Geitost', N'1033-geitost', 1003, N'500 g', 2.5, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHh], [TenHh], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySx], [GiamGia], [SoLanXem], [MoTa], [MaNcc]) VALUES (1034, N'Sasquatch Ale', N'1034-sasquatch-ale', 1000, N'24 - 12 oz bottles', 14, N'41WvZnGYUkL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 7, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')

SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11047, N'EASTC', CAST(N'2024-04-24T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11048, N'BOTTM', CAST(N'2024-04-24T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-04-30T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11049, N'GOURL', CAST(N'2024-04-24T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-05-04T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11050, N'FOLKO', CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-05-25T00:00:00.000' AS DateTime), CAST(N'2024-05-05T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11051, N'LAMAI', CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-05-25T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11052, N'HANAR', CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-05-25T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11053, N'PICCO', CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-05-25T00:00:00.000' AS DateTime), CAST(N'2024-04-29T00:00:00.000' AS DateTime), NULL, N'Geislweg 14', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11054, N'CACTU', CAST(N'2024-04-28T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11055, N'HILAA', CAST(N'2024-04-28T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-05T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11056, N'EASTC', CAST(N'2024-04-28T00:00:00.000' AS DateTime), CAST(N'2024-05-12T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11057, N'NORTS', CAST(N'2024-04-29T00:00:00.000' AS DateTime), CAST(N'2024-05-27T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'South House 300 Queensbridge', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11058, N'BLAUS', CAST(N'2024-04-29T00:00:00.000' AS DateTime), CAST(N'2024-05-27T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11059, N'RICAR', CAST(N'2024-04-29T00:00:00.000' AS DateTime), CAST(N'2024-06-10T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'Av. Copacabana, 267', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11060, N'FRANS', CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-05-04T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11061, N'GREAL', CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-06-11T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11062, N'REGGC', CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), NULL, N'Strada Provinciale 124', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKh], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11063, N'HUNGO', CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-05-06T00:00:00.000' AS DateTime), NULL, N'8 Johnstown Road', N'Cash', N'Airline', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO

INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'hello', N'1', N'nnghiem@yahoo.com', 0, CAST(N'2011-01-12T07:00:00.000' AS DateTime), N'aaa', N'aaa', N'hello@abc.com', N'man.gif', 0, 2, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'KH0002', N'a0cd8c2ab5e0bd6f61ba4ffa626f5c3e', N'Lê Văn Thê', 1, CAST(N'2000-11-11T00:00:00.000' AS DateTime), N'105 Bà Huyện Thanh Quan', N'0123456789', N'aspnhatnghe@gmail.com', NULL, 0, 0, N'kt2[v')

GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1000, N'Đồng hồ', N'dong-ho', N'Soft drinks, coffees, teas, beers, and ales', N'Best.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1001, N'Laptop', N'lap-top', N'Sweet and savory sauces, relishes, spreads, and seasonings', N'Certificate.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1002, N'Máy ảnh', N'may-anh', N'Desserts, candies, and sweet breads', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1003, N'Điện thoại', N'dien-thoai', N'Cheeses', N'Bell.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1004, N'Nước hoa', N'nuoc-hoa', N'Breads, crackers, pasta, and cereal', N'Favourites.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1005, N'Trang sức', N'trang-suc', N'Prepared meats', N'Dice.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1006, N'Giày', N'giay', N'Dried fruit and bean curd', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1007, N'Vali', N'vali', N'Seaweed and fish', N'Microsoft.png')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'AP', N'Apple', N'apple.gif', N'Petter Pike', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Moble Device')
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'MO', N'Motorola', N'motorola.gif', N'John David', N'john@gmail.com', N'0918456987', N'22 Rose, Messachuset, United States', N'Communication Company')
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NK', N'Nokia', N'Nokia.gif', N'Okawa', N'okawa@gmail.com', N'0913745789', N'123 Revenue, Tokyo, Japan', N'Famous company')
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SM', N'Seamen', N'semen.gif', N'David Brown', N'brown@gmail.com', N'0987456876', N'23 New World, Texas, United Kindom', N'Digital device company')
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SS', N'Samsung', N'samsung.gif', N'LeeSongChai', N'lee@yahoo.com', N'0913745789', N'456 Romario, Seaul, Korea', N'The best company')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (1, N'lvc', N'BGD', CAST(N'2017-12-17T10:10:06.877' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (4, N'nva', N'BGD', CAST(N'2017-12-17T10:15:51.333' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (5, N'nva', N'PKT', CAST(N'2017-12-17T10:16:19.203' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (6, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:19.213' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', NULL)
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
GO
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySx]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHh])
REFERENCES [dbo].[HangHoa] ([MaHh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHh])
REFERENCES [dbo].[HangHoa] ([MaHh])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNcc])
REFERENCES [dbo].[NhaCungCap] ([MaNcc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHh])
REFERENCES [dbo].[HangHoa] ([MaHh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
