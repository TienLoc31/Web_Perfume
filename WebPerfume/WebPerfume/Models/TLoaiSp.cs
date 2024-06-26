using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TLoaiSp
{
    public string MaLoai { get; set; } = null!;

    public string? TenLoai { get; set; }

    public virtual ICollection<TSanPham> TSanPhams { get; set; } = new List<TSanPham>();
}
