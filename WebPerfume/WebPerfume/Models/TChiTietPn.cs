using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TChiTietPn
{
    public string SoHdn { get; set; } = null!;

    public string MaChiTietSp { get; set; } = null!;

    public int? Slnhap { get; set; }

    public decimal? DonGiaNhap { get; set; }

    public double? ChietKhau { get; set; }

    public virtual TChiTietSp MaChiTietSpNavigation { get; set; } = null!;

    public virtual TPhieuNhap SoHdnNavigation { get; set; } = null!;
}
