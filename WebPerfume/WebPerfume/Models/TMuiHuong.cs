using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TMuiHuong
{
    public string MaMuiHuong { get; set; } = null!;

    public string? HuongDau { get; set; }

    public string? HuongGiua { get; set; }

    public string? HuongCuoi { get; set; }

    public virtual ICollection<TChiTietSp> TChiTietSps { get; set; } = new List<TChiTietSp>();
}
