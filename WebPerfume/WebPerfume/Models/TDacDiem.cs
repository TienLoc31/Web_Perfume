using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TDacDiem
{
    public string MaDd { get; set; } = null!;

    public string? TenDd { get; set; }

    public string? ChiTietDd { get; set; }

    public virtual ICollection<TSanPham> TSanPhams { get; set; } = new List<TSanPham>();
}
