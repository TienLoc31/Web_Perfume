create database WebBanNuocHoa
use WebBanNuocHoa

--tao bang chi tiet phieu nhap
CREATE TABLE tChiTietPN(
	[SoHDN] nvarchar(25) NOT NULL,
	[MaChiTietSP] nvarchar(25) NOT NULL,
	[SLNhap] int NULL,
	[DonGiaNhap] money NULL,
	[ChietKhau] float NULL,
	CONSTRAINT [pk_tChiTietPN] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC,
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang phieuhap
CREATE TABLE tPhieuNhap(
	[SoHDN] nvarchar(25) NOT NULL,
	[NgayNhap] datetime NULL,
	[MaNCC] nvarchar(25) NOT NULL,
	CONSTRAINT [pk_tNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE tPhieuNhap add [TongTienNhap] money
GO

--tao bang nha cung cap
CREATE TABLE tNhaCungCap(
	[MaNCC] nvarchar(25) NOT NULL,
	[TenNCC] nvarchar(200) NULL,
	[DiaChi] nvarchar(200) NULL,
	[SDT] int NULL,
	CONSTRAINT [pk_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang khachhang
CREATE TABLE tKhachHang(
	[MaKH] nvarchar(25) NOT NULL,
	[TenKH] nvarchar(50) NULL,
	[username] nvarchar(100) NULL,
	[GioiTinh] nvarchar(5) NULL,
	[NgaySinh] date NULL,
	[DiaChi] nvarchar(150) NULL,
	[SDT] int NULL,
	[Email] nvarchar(100) NULL,
	[AnhKH] nvarchar(100) NULL,
	[GhiChu] nvarchar(100) NULL, 
	CONSTRAINT [pk_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
alter table tKhachHang
add [AnhDaiDien] nvarchar(100) NULL
GO
--tao bang hoadonban
CREATE TABLE tHoaDonBan(
	[MaHDB] nvarchar(25) NOT NULL,
	[NgayLapHD] datetime NULL,
	[MaKH] nvarchar(25) NOT NULL,
	[MaNV] nvarchar(25) NOT NULL,
	[TongTienHD] money NULL,
	[GiamGiaHDB] float NULL,
	[PhuongThucTT] tinyint NULL,
	[GhiChu] nvarchar(100) NULL,
	CONSTRAINT [pk_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang chi tiet hoa don ban
CREATE TABLE tChiTietHDB(
	[MaHDB] nvarchar(25) NOT NULL,
	[MaChiTietSP] nvarchar(25) NOT NULL,
	[SoLuongBan] int NULL,
	[DonGiaBan] money NULL,
	[GiamGia] float NULL,
	[GhiChu] nvarchar(100) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--tao bang san pham
CREATE TABLE tSanPham(
	[MaSP] nvarchar(25) NOT NULL,
	[TenSP] nvarchar(200) NOT NULL,
	[GiaLonNhat] int NULL,
	[MaDD] nvarchar(25)  NULL,
	[MaNH] nvarchar(25)  NULL,
	[MaLoai] nvarchar(25)  NULL,
	[GioiThieuSP] nvarchar(150)  NULL,
	[AnhSP] nvarchar(100) NULL,
	CONSTRAINT [pk_tSanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--tao bang chi tiet san pham
CREATE TABLE tChiTietSP(
	[MaChiTietSP] nvarchar(25) NOT NULL,
	[MaSP] nvarchar(25) NOT NULL,
	[ChiTietGiaBan] int NULL,
	[MaDT] nvarchar(25)  NULL,
	[MaMuiHuong] nvarchar(25)  NULL,
	[HSD] date NULL,
	[SoLuong] int NULL,
	[GiamGia] float NULL,
	[AnhDaiDien] nvarchar(100) NULL,
	CONSTRAINT [pk_tChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--tao bang anh san pham
CREATE TABLE tAnhSP(
	[MaSP] nvarchar(25) NOT NULL,
	[TenFileAnh] nvarchar(100) NOT NULL,
	[ViTri] smallint NULL,
	CONSTRAINT [pk_tAnhSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--tao bang dung tich
CREATE TABLE tDungTich(
	[MaDT] nvarchar(25) NOT NULL,
	[TenDT] nvarchar(200) NULL,
	CONSTRAINT [pk_tDungTich] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang dac diem
CREATE TABLE tDacDiem(
	[MaDD] nvarchar(25) NOT NULL,
	[TenDD] nvarchar(200) NULL,
	[ChiTietDD] nvarchar (100) NULL,
	CONSTRAINT [pk_tDacDiem] PRIMARY KEY CLUSTERED 
(
	[MaDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--tao bang nhan hieu
CREATE TABLE tNhanHieu(
	[MaNH] nvarchar(25) NOT NULL,
	[TenNH] nvarchar(200) NULL,
	CONSTRAINT [pk_tNhanHieu] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang loai san pham
CREATE TABLE tLoaiSP(
	[MaLoai] nvarchar(25) NOT NULL,
	[TenLoai] nvarchar(100) NULL,
 CONSTRAINT [PK_tLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--tao bang mui huong
CREATE TABLE tMuiHuong(
	[MaMuiHuong] nvarchar(25) NOT NULL,
	[HuongDau] nvarchar(100) NULL,
	[HuongGiua] nvarchar(100) NULL,
	[HuongCuoi] nvarchar(100) NULL,
 CONSTRAINT [PK_tMuiHuong] PRIMARY KEY CLUSTERED 
(
	[MaMuiHuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--tao bang Order
CREATE TABLE [dbo].[tOrder](
	[OrderID] bigint IDENTITY(1,1) NOT NULL,
	[CreatedDate] datetime NULL,
	[MaKH] nvarchar(100) NULL,
	[TenKH] nvarchar(50) NULL,
	[DiaChi] nvarchar(50) NULL,
	[SDT] nvarchar(50) NULL,
	[Email] nvarchar(50) NULL,
	[PTTT] nvarchar(100) null,
	[GhiChu] int NULL,
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--tao bang chi tiet order
CREATE TABLE [dbo].[tOrderDetail](
	[MaSP] nvarchar(25) NOT NULL,
	[OrderDetailID] bigint  NOT NULL,
	[SoLuong] int NULL,
	[ThanhTien] decimal(18, 0) NULL,
	[OrderID] bigint NULL,
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--tao bang nguoi dung
CREATE TABLE [dbo].[tUser](
	[username] nvarchar(100) NOT NULL,
	[password] nvarchar(256) NOT NULL,
	[email] nvarchar (100) NOT NULL,
	[LoaiUser] tinyint NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Tao Foreign key
ALTER TABLE [dbo].tSanPham  WITH CHECK ADD  CONSTRAINT [FK_tSanPham_tDacDiem] FOREIGN KEY([MaDD])
REFERENCES [dbo].[tDacDiem] ([MaDD])
GO
ALTER TABLE [dbo].tSanPham CHECK CONSTRAINT [FK_tSanPham_tDacDiem]
GO

ALTER TABLE [dbo].tSanPham  WITH CHECK ADD  CONSTRAINT [FK_tSanPham_tLoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[tLoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].tSanPham CHECK CONSTRAINT [FK_tSanPham_tLoaiSP]
GO

ALTER TABLE [dbo].tSanPham  WITH CHECK ADD  CONSTRAINT [FK_tSanPham_tNhanHieu] FOREIGN KEY([MaNH])
REFERENCES [dbo].[tNhanHieu] ([MaNH])
GO
ALTER TABLE [dbo].tSanPham CHECK CONSTRAINT [FK_tSanPham_tNhanHieu]
GO

ALTER TABLE [dbo].tAnhSP  WITH CHECK ADD  CONSTRAINT [FK_tAnhSP_tSanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tSanPham] ([MaSP])
GO
ALTER TABLE [dbo].tAnhSP CHECK CONSTRAINT [FK_tAnhSP_tSanPham]
GO

ALTER TABLE [dbo].tChiTietSP  WITH CHECK ADD  CONSTRAINT [FK_tChiTietSP_tSanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tSanPham] ([MaSP])
GO
ALTER TABLE [dbo].tChiTietSP CHECK CONSTRAINT [FK_tChiTietSP_tSanPham]
GO

ALTER TABLE [dbo].tOrderDetail  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tSanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tSanPham] ([MaSP])
GO
ALTER TABLE [dbo].tOrderDetail CHECK CONSTRAINT [FK_tOrderDetail_tSanPham]
GO

ALTER TABLE [dbo].tChiTietSP  WITH CHECK ADD  CONSTRAINT [FK_tChiTietSP_tDungTich] FOREIGN KEY([MaDT])
REFERENCES [dbo].[tDungTich] ([MaDT])
GO
ALTER TABLE [dbo].tChiTietSP CHECK CONSTRAINT [FK_tChiTietSP_tDungTich]
GO

ALTER TABLE [dbo].tChiTietSP  WITH CHECK ADD  CONSTRAINT [FK_tChiTietSP_tMuiHuong] FOREIGN KEY([MaMuiHuong])
REFERENCES [dbo].[tMuiHuong] ([MaMuiHuong])
GO
ALTER TABLE [dbo].tChiTietSP CHECK CONSTRAINT [FK_tChiTietSP_tMuiHuong]
GO

ALTER TABLE [dbo].tChiTietHDB  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tChiTietSP] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[tChiTietSP] ([MaChiTietSP])
GO
ALTER TABLE [dbo].tChiTietHDB CHECK CONSTRAINT [FK_tChiTietHDB_tChiTietSP]
GO

ALTER TABLE [dbo].tChiTietHDB  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonban] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[tHoaDonBan] ([MaHDB])
GO
ALTER TABLE [dbo].tChiTietHDB CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonban]
GO



ALTER TABLE [dbo].tHoaDonBan  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].tHoaDonBan CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO



ALTER TABLE [dbo].tKhachHang  WITH CHECK ADD  CONSTRAINT [FK_tKhachHang_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].tKhachHang CHECK CONSTRAINT [FK_tKhachHang_tUser]
GO


ALTER TABLE [dbo].tOrderDetail  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tOrder] ([OrderID])
GO
ALTER TABLE [dbo].tOrderDetail CHECK CONSTRAINT [FK_tOrderDetail_tOrder]
GO

ALTER TABLE [dbo].tChiTietPN  WITH CHECK ADD  CONSTRAINT [FK_tChiTietPN_tPhieuNhap] FOREIGN KEY([SoHDN])
REFERENCES [dbo].[tPhieuNhap] ([SoHDN])
GO
ALTER TABLE [dbo].tChiTietPN CHECK CONSTRAINT [FK_tChiTietPN_tPhieuNhap]
GO

ALTER TABLE [dbo].tChiTietPN  WITH CHECK ADD  CONSTRAINT [FK_tChiTietPN_tChiTietSP] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[tChiTietSP] ([MaChiTietSP])
GO
ALTER TABLE [dbo].tChiTietPN CHECK CONSTRAINT [FK_tChiTietPN_tChiTietSP]
GO

ALTER TABLE [dbo].tPhieuNhap  WITH CHECK ADD  CONSTRAINT [FK_tPhieuNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].tPhieuNhap CHECK CONSTRAINT [FK_tPhieuNhap_tNhaCungCap]
GO

--Insert

--insert tDungTich
INSERT [dbo].[tDungTich] ([MaDT] ,[TenDT]) VALUES (N'DT1', N'10 ml')
INSERT [dbo].[tDungTich] ([MaDT] ,[TenDT]) VALUES (N'DT2', N'20 ml')
INSERT [dbo].[tDungTich] ([MaDT] ,[TenDT]) VALUES (N'DT3', N'50 ml')
INSERT [dbo].[tDungTich] ([MaDT] ,[TenDT]) VALUES (N'DT4', N'100 ml')
GO

--insert tLoaiSP
INSERT [dbo].[tLoaiSP] ([MaLoai] ,[TenLoai]) VALUES (N'nam', N'Nam')
INSERT [dbo].[tLoaiSP] ([MaLoai] ,[TenLoai]) VALUES (N'nu', N'Nữ')
INSERT [dbo].[tLoaiSP] ([MaLoai] ,[TenLoai]) VALUES (N'uni', N'Unisex')
GO

--insert tDacDiem
INSERT [dbo].[tDacDiem] ([MaDD] ,[TenDD], [ChiTietDD]) VALUES (N'DD1', N' Perfume Oil', NULL)
INSERT [dbo].[tDacDiem] ([MaDD] ,[TenDD], [ChiTietDD]) VALUES (N'DD2', N' Perfume ', NULL)
INSERT [dbo].[tDacDiem] ([MaDD] ,[TenDD], [ChiTietDD]) VALUES (N'DD3', N' Eau de Parfum (EDP)', NULL)
INSERT [dbo].[tDacDiem] ([MaDD] ,[TenDD], [ChiTietDD]) VALUES (N'DD4', N' Eau de Toilette (EDT)', NULL)
INSERT [dbo].[tDacDiem] ([MaDD] ,[TenDD], [ChiTietDD]) VALUES (N'DD5', N' Eau de Cologne', NULL)
GO

--insert tNhanHieu
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'guc', N'Gucci')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'cha', N'Chanel')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'zar', N'Zara')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'bur', N'Burberry')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'dio', N'Dior')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'ck', N'Canvin & Klein')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'ysl', N'YSL')
INSERT [dbo].[tNhanHieu] ([MaNH], [TenNH]) VALUES (N'dg', N'Dolce & Gabbarna')
GO

--insert tMuihuong
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'cayco',NULL,NULL,NULL)
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'go',NULL,NULL,NULL)
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'camquyt',NULL,NULL,NULL)
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'traicay',NULL,NULL,NULL)
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'bienca',NULL,NULL,NULL)
INSERT [dbo].[tMuiHuong]([MaMuiHuong] ,[HuongDau] ,[HuongGiua] ,[HuongCuoi]) VALUES (N'mixing',NULL,NULL,NULL)
GO

--insert tSanPham
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_guilty1',N'Gucci Guilty Black Pour Homme', 2300000,N'DD4',N'nam', N'guc',N'gucci_guilty_homme.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_guilty2',N'Gucci Guilty Black Pour Femme', 2700000,N'DD3',N'nu', N'guc',N'gucci_guilty_femme.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_guilty3',N'Gucci Guilty Intense', 2550000,N'DD3',N'uni', N'guc',N'gucci_guilty_intense.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_bloom1',N'Gucci Bloom Ambrosia', 2900000,N'DD2',N'nu', N'guc',N'gucci_bloom_ambrosia.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_bloom2',N'Gucci Bloom', 2950000,N'DD3',N'nu', N'guc',N'gucci_bloom.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_bloom3',N'Gucci Bloom Acqua', 2600000,N'DD4',N'uni', N'guc',N'gucci_bloom_acqua.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_bloom4',N'Gucci Bloom Profumo', 2950000,N'DD3',N'nu', N'guc',N'gucci_bloom_profumo.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_memoire1',N'Gucci Memoire', 2100000,N'DD4',N'uni', N'guc',N'gucci_memoire.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'gucci_bamboo1',N'Gucci Bamboo', 2300000,N'DD4',N'nu', N'guc',N'gucci_bamboo.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'chanel_coco1',N'Chanel Coco Mademoiselle', 3500000,N'DD3',N'nu', N'cha',N'chanel_coco.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'chanel_no5_1',N'Chanel No5', 3550000,N'DD3',N'nu', N'cha',N'gucci_no5.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'chanel_chance1',N'Chanel Chance', 3050000,N'DD4',N'nu', N'guc',N'chanel_chance.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'chanel_blue1',N'Bleu De Chanel', 2500000,N'DD2',N'nam', N'cha',N'chanel_blue.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'chanel_allure1',N'Chanel Allure Homme Sport', 2700000,N'DD4',N'nam', N'cha',N'chanel_allure.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_red_vanilla1',N'Zara Red Vanilla', 1000000,N'DD5',N'uni', N'zar',N'zara_red.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_black',N'Zara Black Amber', 700000,N'DD5',N'nam', N'zar',N'zara_black_amber.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_wonder',N'Zara Wonder Rose', 3000000,N'DD3',N'nu', N'zar',N'zara_wonder_rose.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_orchid1',N'Zara Orchid', 900000,N'DD5',N'uni', N'zar',N'zara_orchid.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_man',N'Zara Man Blue Spirit', 1200000,N'DD3',N'nam', N'zar',N'zara_man_blue.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'zara_nuit',N'Zara Nuit', 800000,N'DD5',N'nam', N'zar',N'zara_nuit.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_her1',N'Burberry Her', 3000000,N'DD3',N'nu', N'bur',N'burberry_her.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_my',N'My Burberry', 2100000,N'DD4',N'nu', N'bur',N'my_burberry.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_mr',N'Mr Burberry', 1650000,N'DD3',N'nam', N'bur',N'mr_burberry.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_london1',N'Burberry London', 1400000,N'DD4',N'nu', N'bur',N'burberry_london.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_london2',N'Burberry Men London ', 1500000,N'DD3',N'nam', N'bur',N'burberry_men_london.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'burberry_beat',N'Burberry The Beat ', 1700000,N'DD3',N'uni', N'bur',N'burberry_thebeat.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dior_sauvage1',N'Dior Sauvage ', 3300000,N'DD3',N'nam', N'dio',N'dior_sauvage.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dior_j',N'Dior J Adore ', 3500000,N'DD2',N'nu', N'dio',N'dior_jadore.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dior_miss',N'Miss Dior ', 2800000,N'DD3',N'nu', N'dio',N'miss_dior.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dior_homme',N'Dior Homme Sport ', 3000000,N'DD4',N'nam', N'dio',N'dior_homme_sport.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ck_one_unisex',N'Calvin Klein (CK) One ', 1000000,N'DD2',N'uni', N'ck',N'ck_one.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ck_euphoria1',N'Calvin Klein CK Euphoria ', 1100000,N'DD4',N'nam', N'ck',N'ck_euphoria.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ck_eternity1',N'Calvin Klein Eternity ', 1150000,N'DD2',N'nam', N'ck',N'ck_eternity.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ck_free1',N'Calvin Klein Free ', 1120000,N'DD4',N'nam', N'ck',N'ck_free.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ck_all1',N'Calvin Klein All ', 1100000,N'DD3',N'uni', N'ck',N'ck_all.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ysl_libre1',N'YSL Libre ', 1100000,N'DD4',N'nu', N'ysl',N'ysl_libre.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ysl_y1',N'YSL Y ', 2600000,N'DD3',N'nam', N'ysl',N'ysl_y.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ysl_black',N'YSL Black Opium ', 3200000,N'DD3',N'nu', N'ysl',N'ysl_black_opium.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ysl_lanuit',N'YSL Lanuit De L Homme ', 2700000,N'DD3',N'nam', N'ysl',N'ysl_lanuit_homme.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'ysl_homme',N'YSL Homme Le Parfum', 2800000,N'DD2',N'uni', N'ysl',N'ysl_homme_parfum.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dg_light',N'Dolce Gabbana Light Blue', 1950000,N'DD4',N'nu', N'dg',N'dg_light_blue.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dg_one',N'Dolce Gabbana The Only One', 2400000,N'DD3',N'nu', N'dg',N'dg_only_one.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dg_intense1',N'Dolce & Gabbana Intense', 2650000,N'DD4',N'uni', N'dg',N'dg_intense.jpg',NULL)
INSERT [dbo].[tSanPham]([MaSP] ,[TenSP] ,[GiaLonNhat] ,[MaDD] ,[MaLoai],[MaNH] ,[AnhSP] ,[GioiThieuSP] ) VALUES (N'dg_light_forever',N'Dolce Gabbana Light Blue Forever', 2250000,N'DD3',N'nam', N'dg',N'dg_light_blue_forever.jpg',NULL)

--insert tChiTietSP
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty_10ml',N'gucci_guilty1',150000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty_20ml',N'gucci_guilty1',290000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty_50ml',N'gucci_guilty1',600000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty_100ml',N'gucci_guilty1',2300000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty2_10ml',N'gucci_guilty2',170000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty2_20ml',N'gucci_guilty2',350000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty2_50ml',N'gucci_guilty2',800000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty2_100ml',N'gucci_guilty2',2700000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty3_10ml',N'gucci_guilty3',160000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty3_20ml',N'gucci_guilty3',360000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty3_50ml',N'gucci_guilty3',900000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_guilty3_100ml',N'gucci_guilty3',2550000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom_10ml',N'gucci_bloom1',200000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom_20ml',N'gucci_bloom1',390000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom_50ml',N'gucci_bloom1',720000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom_100ml',N'gucci_bloom1',2900000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom2_10ml',N'gucci_bloom2',190000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom2_20ml',N'gucci_bloom2',400000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom2_50ml',N'gucci_bloom2',750000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom2_100ml',N'gucci_bloom2',2950000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom3_10ml',N'gucci_bloom3',200000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom3_20ml',N'gucci_bloom3',420000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom3_50ml',N'gucci_bloom3',750000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom3_100ml',N'gucci_bloom3',2600000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom4_10ml',N'gucci_bloom4',260000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom4_20ml',N'gucci_bloom4',500000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom4_50ml',N'gucci_bloom4',950000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bloom4_100ml',N'gucci_bloom4',2950000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_memoire_10ml',N'gucci_memoire1',310000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_memoire_20ml',N'gucci_memoire1',600000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_memoire_50ml',N'gucci_memoire1',1150000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_memoire_100ml',N'gucci_memoire1',2100000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bamboo_10ml',N'gucci_bamboo1',240000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bamboo_20ml',N'gucci_bamboo1',450000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bamboo_50ml',N'gucci_bamboo1',870000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'gucci_bamboo_100ml',N'gucci_bamboo1',2300000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_coco_10ml',N'chanel_coco1',250000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_coco_20ml',N'chanel_coco1',440000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_coco_50ml',N'chanel_coco1',900000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_coco_100ml',N'chanel_coco1',3500000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_no5_10ml',N'chanel_no5_1',350000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_no5_20ml',N'chanel_no5_1',650000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_no5_50ml',N'chanel_no5_1',1200000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_no5_100ml',N'chanel_no5_1',3550000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_chance_10ml',N'chanel_chance1',355000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_chance_20ml',N'chanel_chance1',660000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_chance_50ml',N'chanel_chance1',1300000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_chance_100ml',N'chanel_chance1',3050000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_blue_10ml',N'chanel_blue1',400000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_blue_20ml',N'chanel_blue1',750000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_blue_50ml',N'chanel_blue1',1400000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_blue_100ml',N'chanel_blue1',2500000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_allure_10ml',N'chanel_allure1',300000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_allure_20ml',N'chanel_allure1',500000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_allure_50ml',N'chanel_allure1',1200000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'chanel_allure_100ml',N'chanel_allure1',2700000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_red_vanilla_10ml',N'zara_red_vanilla1',140000, N'DT1',NULl,NULL,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_red_vanilla_20ml',N'zara_red_vanilla1',250000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_red_vanilla_50ml',N'zara_red_vanilla1',480000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_red_vanilla_100ml',N'zara_red_vanilla1',1000000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_black_10ml',N'zara_black',120000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_black_20ml',N'zara_black',200000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_black_50ml',N'zara_black',450000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_black_100ml',N'zara_black',700000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_wonder_10ml',N'zara_wonder',300000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_wonder_20ml',N'zara_wonder',500000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_wonder_50ml',N'zara_wonder',1200000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_wonder_100ml',N'zara_wonder',3000000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_orchid_10ml',N'zara_orchid1',100000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_orchid_20ml',N'zara_orchid1',190000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_orchid_50ml',N'zara_orchid1',360000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_orchid_100ml',N'zara_orchid1',900000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_man_10ml',N'zara_man',150000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_man_20ml',N'zara_man',290000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_man_50ml',N'zara_man',550000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_man_100ml',N'zara_man',1200000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_nuit_10ml',N'zara_nuit',110000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_nuit_20ml',N'zara_nuit',200000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_nuit_50ml',N'zara_nuit',400000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'zara_nuit_100ml',N'zara_nuit',800000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_her_10ml',N'burberry_her1',300000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_her_20ml',N'burberry_her1',550000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_her_50ml',N'burberry_her1',1200000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_her_100ml',N'burberry_her1',3000000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_my_10ml',N'burberry_my',200000, N'DT1',NULl,NULl,NULl,20,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_my_20ml',N'burberry_my',360000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_my_50ml',N'burberry_my',700000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_my_100ml',N'burberry_my',2100000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_mr_10ml',N'burberry_mr',270000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_mr_20ml',N'burberry_mr',500000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_mr_50ml',N'burberry_mr',1000000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_mr_100ml',N'burberry_mr',1650000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london_10ml',N'burberry_london1',180000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london_20ml',N'burberry_london1',350000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london_50ml',N'burberry_london1',680000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london_100ml',N'burberry_london1',1400000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london2_10ml',N'burberry_london2',160000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london2_20ml',N'burberry_london2',300000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london2_50ml',N'burberry_london2',550000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_london2_100ml',N'burberry_london2',1500000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_beat_10ml',N'burberry_beat',200000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_beat_20ml',N'burberry_beat',350000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_beat_50ml',N'burberry_beat',700000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'burberry_beat_100ml',N'burberry_beat',1700000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_one_unisex_10ml',N'ck_one_unisex',160000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_one_unisex_20ml',N'ck_one_unisex',300000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_one_unisex_50ml',N'ck_one_unisex',490000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_one_unisex_100ml',N'ck_one_unisex',1000000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_euphoria_10ml',N'ck_euphoria1',120000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_euphoria_20ml',N'ck_euphoria1',220000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_euphoria_50ml',N'ck_euphoria1',450000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_euphoria_100ml',N'ck_euphoria1',1100000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_eternity_10ml',N'ck_eternity1',160000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_eternity_20ml',N'ck_eternity1',300000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_eternity_50ml',N'ck_eternity1',550000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_eternity_100ml',N'ck_eternity1',1150000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_free_10ml',N'ck_free1',130000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_free_20ml',N'ck_free1',250000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_free_50ml',N'ck_free1',480000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_free_100ml',N'ck_free1',1120000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_all_10ml',N'ck_all1',140000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_all_20ml',N'ck_all1',250000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_all_50ml',N'ck_all1',500000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'ck_all_100ml',N'ck_all1',1100000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_sauvage_10ml',N'dior_sauvage1',400000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_sauvage_20ml',N'dior_sauvage1',750000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_sauvage_50ml',N'dior_sauvage1',1400000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_sauvage_100ml',N'dior_sauvage1',3300000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_j_10ml',N'dior_j',350000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_j_20ml',N'dior_j',680000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_j_50ml',N'dior_j',1350000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_j_100ml',N'dior_j',3500000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_miss_10ml',N'dior_miss',280000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_miss_20ml',N'dior_miss',5500000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_miss_50ml',N'dior_miss',1500000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_miss_100ml',N'dior_miss',2800000, N'DT4',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_homme_10ml',N'dior_homme',300000, N'DT1',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_homme_20ml',N'dior_homme',570000, N'DT2',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_homme_50ml',N'dior_homme',1100000, N'DT3',NULl,NULl,20,NULL,NULL)
INSERT [dbo].[tChiTietSP]([MaChiTietSP] ,[MaSP] ,[ChiTietGiaBan] ,[MaDT] ,[MaMuiHuong] ,[HSD] ,[SoLuong] ,[GiamGia] ,[AnhDaiDien]) VALUES (N'dior_homme_100ml',N'dior_homme',3000000, N'DT4',NULl,NULl,20,NULL,NULL)
