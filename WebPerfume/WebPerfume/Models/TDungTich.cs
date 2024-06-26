using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TDungTich
{
    public string MaDt { get; set; } = null!;

    public string? TenDt { get; set; }

    public virtual ICollection<TChiTietSp> TChiTietSps { get; set; } = new List<TChiTietSp>();
}
