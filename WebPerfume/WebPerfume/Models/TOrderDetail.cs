using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TOrderDetail
{
    public string MaSp { get; set; } = null!;

    public long OrderDetailId { get; set; }

    public int? SoLuong { get; set; }

    public decimal? ThanhTien { get; set; }

    public long? OrderId { get; set; }

    public virtual TSanPham MaSpNavigation { get; set; } = null!;

    public virtual TOrder? Order { get; set; }
}
