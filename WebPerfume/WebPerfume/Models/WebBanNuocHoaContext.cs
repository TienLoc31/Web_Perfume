using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebPerfume.Models;

public partial class WebBanNuocHoaContext : DbContext
{
    public WebBanNuocHoaContext()
    {
    }

    public WebBanNuocHoaContext(DbContextOptions<WebBanNuocHoaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TAnhSp> TAnhSps { get; set; }

    public virtual DbSet<TChiTietHdb> TChiTietHdbs { get; set; }

    public virtual DbSet<TChiTietPn> TChiTietPns { get; set; }

    public virtual DbSet<TChiTietSp> TChiTietSps { get; set; }

    public virtual DbSet<TDacDiem> TDacDiems { get; set; }

    public virtual DbSet<TDungTich> TDungTiches { get; set; }

    public virtual DbSet<THoaDonBan> THoaDonBans { get; set; }

    public virtual DbSet<TKhachHang> TKhachHangs { get; set; }

    public virtual DbSet<TLoaiSp> TLoaiSps { get; set; }

    public virtual DbSet<TMuiHuong> TMuiHuongs { get; set; }

    public virtual DbSet<TNhaCungCap> TNhaCungCaps { get; set; }

    public virtual DbSet<TNhanHieu> TNhanHieus { get; set; }

    public virtual DbSet<TOrder> TOrders { get; set; }

    public virtual DbSet<TOrderDetail> TOrderDetails { get; set; }

    public virtual DbSet<TPhieuNhap> TPhieuNhaps { get; set; }

    public virtual DbSet<TSanPham> TSanPhams { get; set; }

    public virtual DbSet<TUser> TUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=TIENLOC;Initial Catalog=WebBanNuocHoa;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TAnhSp>(entity =>
        {
            entity.HasKey(e => new { e.MaSp, e.TenFileAnh }).HasName("pk_tAnhSP");

            entity.ToTable("tAnhSP");

            entity.Property(e => e.MaSp)
                .HasMaxLength(25)
                .HasColumnName("MaSP");
            entity.Property(e => e.TenFileAnh).HasMaxLength(100);

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.TAnhSps)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tAnhSP_tSanPham");
        });

        modelBuilder.Entity<TChiTietHdb>(entity =>
        {
            entity.HasKey(e => new { e.MaHdb, e.MaChiTietSp });

            entity.ToTable("tChiTietHDB");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(25)
                .HasColumnName("MaHDB");
            entity.Property(e => e.MaChiTietSp)
                .HasMaxLength(25)
                .HasColumnName("MaChiTietSP");
            entity.Property(e => e.DonGiaBan).HasColumnType("money");
            entity.Property(e => e.GhiChu).HasMaxLength(100);

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.TChiTietHdbs)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDB_tChiTietSP");

            entity.HasOne(d => d.MaHdbNavigation).WithMany(p => p.TChiTietHdbs)
                .HasForeignKey(d => d.MaHdb)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDB_tHoaDonban");
        });

        modelBuilder.Entity<TChiTietPn>(entity =>
        {
            entity.HasKey(e => new { e.MaChiTietSp, e.SoHdn }).HasName("pk_tChiTietPN");

            entity.ToTable("tChiTietPN");

            entity.Property(e => e.MaChiTietSp)
                .HasMaxLength(25)
                .HasColumnName("MaChiTietSP");
            entity.Property(e => e.SoHdn)
                .HasMaxLength(25)
                .HasColumnName("SoHDN");
            entity.Property(e => e.DonGiaNhap).HasColumnType("money");
            entity.Property(e => e.Slnhap).HasColumnName("SLNhap");

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.TChiTietPns)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietPN_tChiTietSP");

            entity.HasOne(d => d.SoHdnNavigation).WithMany(p => p.TChiTietPns)
                .HasForeignKey(d => d.SoHdn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietPN_tPhieuNhap");
        });

        modelBuilder.Entity<TChiTietSp>(entity =>
        {
            entity.HasKey(e => e.MaChiTietSp).HasName("pk_tChiTietSP");

            entity.ToTable("tChiTietSP");

            entity.Property(e => e.MaChiTietSp)
                .HasMaxLength(25)
                .HasColumnName("MaChiTietSP");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(100);
            entity.Property(e => e.Hsd)
                .HasColumnType("date")
                .HasColumnName("HSD");
            entity.Property(e => e.MaDt)
                .HasMaxLength(25)
                .HasColumnName("MaDT");
            entity.Property(e => e.MaMuiHuong).HasMaxLength(25);
            entity.Property(e => e.MaSp)
                .HasMaxLength(25)
                .HasColumnName("MaSP");

            entity.HasOne(d => d.MaDtNavigation).WithMany(p => p.TChiTietSps)
                .HasForeignKey(d => d.MaDt)
                .HasConstraintName("FK_tChiTietSP_tDungTich");

            entity.HasOne(d => d.MaMuiHuongNavigation).WithMany(p => p.TChiTietSps)
                .HasForeignKey(d => d.MaMuiHuong)
                .HasConstraintName("FK_tChiTietSP_tMuiHuong");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.TChiTietSps)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietSP_tSanPham");
        });

        modelBuilder.Entity<TDacDiem>(entity =>
        {
            entity.HasKey(e => e.MaDd).HasName("pk_tDacDiem");

            entity.ToTable("tDacDiem");

            entity.Property(e => e.MaDd)
                .HasMaxLength(25)
                .HasColumnName("MaDD");
            entity.Property(e => e.ChiTietDd)
                .HasMaxLength(100)
                .HasColumnName("ChiTietDD");
            entity.Property(e => e.TenDd)
                .HasMaxLength(200)
                .HasColumnName("TenDD");
        });

        modelBuilder.Entity<TDungTich>(entity =>
        {
            entity.HasKey(e => e.MaDt).HasName("pk_tDungTich");

            entity.ToTable("tDungTich");

            entity.Property(e => e.MaDt)
                .HasMaxLength(25)
                .HasColumnName("MaDT");
            entity.Property(e => e.TenDt)
                .HasMaxLength(200)
                .HasColumnName("TenDT");
        });

        modelBuilder.Entity<THoaDonBan>(entity =>
        {
            entity.HasKey(e => e.MaHdb).HasName("pk_tHoaDonBan");

            entity.ToTable("tHoaDonBan");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(25)
                .HasColumnName("MaHDB");
            entity.Property(e => e.GhiChu).HasMaxLength(100);
            entity.Property(e => e.GiamGiaHdb).HasColumnName("GiamGiaHDB");
            entity.Property(e => e.MaKh)
                .HasMaxLength(25)
                .HasColumnName("MaKH");
            entity.Property(e => e.MaNv)
                .HasMaxLength(25)
                .HasColumnName("MaNV");
            entity.Property(e => e.NgayLapHd)
                .HasColumnType("datetime")
                .HasColumnName("NgayLapHD");
            entity.Property(e => e.PhuongThucTt).HasColumnName("PhuongThucTT");
            entity.Property(e => e.TongTienHd)
                .HasColumnType("money")
                .HasColumnName("TongTienHD");

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.THoaDonBans)
                .HasForeignKey(d => d.MaKh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tHoaDonBan_tKhachHang");
        });

        modelBuilder.Entity<TKhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKh).HasName("pk_tKhachHang");

            entity.ToTable("tKhachHang");

            entity.Property(e => e.MaKh)
                .HasMaxLength(25)
                .HasColumnName("MaKH");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(100);
            entity.Property(e => e.AnhKh)
                .HasMaxLength(100)
                .HasColumnName("AnhKH");
            entity.Property(e => e.DiaChi).HasMaxLength(150);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.GhiChu).HasMaxLength(100);
            entity.Property(e => e.GioiTinh).HasMaxLength(5);
            entity.Property(e => e.NgaySinh).HasColumnType("date");
            entity.Property(e => e.Sdt).HasColumnName("SDT");
            entity.Property(e => e.TenKh)
                .HasMaxLength(50)
                .HasColumnName("TenKH");
            entity.Property(e => e.Username)
                .HasMaxLength(100)
                .HasColumnName("username");

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.TKhachHangs)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_tKhachHang_tUser");
        });

        modelBuilder.Entity<TLoaiSp>(entity =>
        {
            entity.HasKey(e => e.MaLoai);

            entity.ToTable("tLoaiSP");

            entity.Property(e => e.MaLoai).HasMaxLength(25);
            entity.Property(e => e.TenLoai).HasMaxLength(100);
        });

        modelBuilder.Entity<TMuiHuong>(entity =>
        {
            entity.HasKey(e => e.MaMuiHuong);

            entity.ToTable("tMuiHuong");

            entity.Property(e => e.MaMuiHuong).HasMaxLength(25);
            entity.Property(e => e.HuongCuoi).HasMaxLength(100);
            entity.Property(e => e.HuongDau).HasMaxLength(100);
            entity.Property(e => e.HuongGiua).HasMaxLength(100);
        });

        modelBuilder.Entity<TNhaCungCap>(entity =>
        {
            entity.HasKey(e => e.MaNcc).HasName("pk_tNhaCungCap");

            entity.ToTable("tNhaCungCap");

            entity.Property(e => e.MaNcc)
                .HasMaxLength(25)
                .HasColumnName("MaNCC");
            entity.Property(e => e.DiaChi).HasMaxLength(200);
            entity.Property(e => e.Sdt).HasColumnName("SDT");
            entity.Property(e => e.TenNcc)
                .HasMaxLength(200)
                .HasColumnName("TenNCC");
        });

        modelBuilder.Entity<TNhanHieu>(entity =>
        {
            entity.HasKey(e => e.MaNh).HasName("pk_tNhanHieu");

            entity.ToTable("tNhanHieu");

            entity.Property(e => e.MaNh)
                .HasMaxLength(25)
                .HasColumnName("MaNH");
            entity.Property(e => e.TenNh)
                .HasMaxLength(200)
                .HasColumnName("TenNH");
        });

        modelBuilder.Entity<TOrder>(entity =>
        {
            entity.HasKey(e => e.OrderId);

            entity.ToTable("tOrder");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.MaKh)
                .HasMaxLength(100)
                .HasColumnName("MaKH");
            entity.Property(e => e.Pttt)
                .HasMaxLength(100)
                .HasColumnName("PTTT");
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .HasColumnName("SDT");
            entity.Property(e => e.TenKh)
                .HasMaxLength(50)
                .HasColumnName("TenKH");
        });

        modelBuilder.Entity<TOrderDetail>(entity =>
        {
            entity.HasKey(e => new { e.MaSp, e.OrderDetailId });

            entity.ToTable("tOrderDetail");

            entity.Property(e => e.MaSp)
                .HasMaxLength(25)
                .HasColumnName("MaSP");
            entity.Property(e => e.OrderDetailId)
                .ValueGeneratedOnAdd()
                .HasColumnName("OrderDetailID");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.ThanhTien).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.TOrderDetails)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tOrderDetail_tSanPham");

            entity.HasOne(d => d.Order).WithMany(p => p.TOrderDetails)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("FK_tOrderDetail_tOrder");
        });

        modelBuilder.Entity<TPhieuNhap>(entity =>
        {
            entity.HasKey(e => e.SoHdn).HasName("pk_tNhap");

            entity.ToTable("tPhieuNhap");

            entity.Property(e => e.SoHdn)
                .HasMaxLength(25)
                .HasColumnName("SoHDN");
            entity.Property(e => e.MaNcc)
                .HasMaxLength(25)
                .HasColumnName("MaNCC");
            entity.Property(e => e.NgayNhap).HasColumnType("datetime");
            entity.Property(e => e.TongTienNhap).HasColumnType("money");

            entity.HasOne(d => d.MaNccNavigation).WithMany(p => p.TPhieuNhaps)
                .HasForeignKey(d => d.MaNcc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tPhieuNhap_tNhaCungCap");
        });

        modelBuilder.Entity<TSanPham>(entity =>
        {
            entity.HasKey(e => e.MaSp).HasName("pk_tSanPham");

            entity.ToTable("tSanPham");

            entity.Property(e => e.MaSp)
                .HasMaxLength(25)
                .HasColumnName("MaSP");
            entity.Property(e => e.AnhSp)
                .HasMaxLength(100)
                .HasColumnName("AnhSP");
            entity.Property(e => e.GioiThieuSp)
                .HasMaxLength(150)
                .HasColumnName("GioiThieuSP");
            entity.Property(e => e.MaDd)
                .HasMaxLength(25)
                .HasColumnName("MaDD");
            entity.Property(e => e.MaLoai).HasMaxLength(25);
            entity.Property(e => e.MaNh)
                .HasMaxLength(25)
                .HasColumnName("MaNH");
            entity.Property(e => e.TenSp)
                .HasMaxLength(200)
                .HasColumnName("TenSP");

            entity.HasOne(d => d.MaDdNavigation).WithMany(p => p.TSanPhams)
                .HasForeignKey(d => d.MaDd)
                .HasConstraintName("FK_tSanPham_tDacDiem");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.TSanPhams)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_tSanPham_tLoaiSP");

            entity.HasOne(d => d.MaNhNavigation).WithMany(p => p.TSanPhams)
                .HasForeignKey(d => d.MaNh)
                .HasConstraintName("FK_tSanPham_tNhanHieu");
        });

        modelBuilder.Entity<TUser>(entity =>
        {
            entity.HasKey(e => e.Username);

            entity.ToTable("tUser");

            entity.Property(e => e.Username)
                .HasMaxLength(100)
                .HasColumnName("username");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .HasColumnName("email");
            entity.Property(e => e.Password)
                .HasMaxLength(256)
                .HasColumnName("password");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
