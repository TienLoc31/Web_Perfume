using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class THoaDonBan
{
    public string MaHdb { get; set; } = null!;

    public DateTime? NgayLapHd { get; set; }

    public string MaKh { get; set; } = null!;

    public string MaNv { get; set; } = null!;

    public decimal? TongTienHd { get; set; }

    public double? GiamGiaHdb { get; set; }

    public byte? PhuongThucTt { get; set; }

    public string? GhiChu { get; set; }

    public virtual TKhachHang MaKhNavigation { get; set; } = null!;

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; set; } = new List<TChiTietHdb>();
}
