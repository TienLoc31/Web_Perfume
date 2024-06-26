using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TNhaCungCap
{
    public string MaNcc { get; set; } = null!;

    public string? TenNcc { get; set; }

    public string? DiaChi { get; set; }

    public int? Sdt { get; set; }

    public virtual ICollection<TPhieuNhap> TPhieuNhaps { get; set; } = new List<TPhieuNhap>();
}
