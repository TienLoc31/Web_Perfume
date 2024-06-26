using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TPhieuNhap
{
    public string SoHdn { get; set; } = null!;

    public DateTime? NgayNhap { get; set; }

    public string MaNcc { get; set; } = null!;

    public decimal? TongTienNhap { get; set; }

    public virtual TNhaCungCap MaNccNavigation { get; set; } = null!;

    public virtual ICollection<TChiTietPn> TChiTietPns { get; set; } = new List<TChiTietPn>();
}
