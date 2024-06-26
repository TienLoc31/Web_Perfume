using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TChiTietSp
{
    public string MaChiTietSp { get; set; } = null!;

    public string MaSp { get; set; } = null!;

    public int? ChiTietGiaBan { get; set; }

    public string? MaDt { get; set; }

    public string? MaMuiHuong { get; set; }

    public DateTime? Hsd { get; set; }

    public int? SoLuong { get; set; }

    public double? GiamGia { get; set; }

    public string? AnhDaiDien { get; set; }

    public virtual TDungTich? MaDtNavigation { get; set; }

    public virtual TMuiHuong? MaMuiHuongNavigation { get; set; }

    public virtual TSanPham MaSpNavigation { get; set; } = null!;

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; set; } = new List<TChiTietHdb>();

    public virtual ICollection<TChiTietPn> TChiTietPns { get; set; } = new List<TChiTietPn>();
}
