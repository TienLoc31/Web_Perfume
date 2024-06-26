using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TOrder
{
    public long OrderId { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? MaKh { get; set; }

    public string? TenKh { get; set; }

    public string? DiaChi { get; set; }

    public string? Sdt { get; set; }

    public string? Email { get; set; }

    public string? Pttt { get; set; }

    public int? GhiChu { get; set; }

    public virtual ICollection<TOrderDetail> TOrderDetails { get; set; } = new List<TOrderDetail>();
}
