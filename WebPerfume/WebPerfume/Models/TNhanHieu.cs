using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TNhanHieu
{
    public string MaNh { get; set; } = null!;

    public string? TenNh { get; set; }

    public virtual ICollection<TSanPham> TSanPhams { get; set; } = new List<TSanPham>();
}
