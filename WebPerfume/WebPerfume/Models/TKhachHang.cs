using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TKhachHang
{
    public string MaKh { get; set; } = null!;

    public string? TenKh { get; set; }

    public string? Username { get; set; }

    public string? GioiTinh { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? DiaChi { get; set; }

    public string? Sdt { get; set; }

    public string? Email { get; set; }

    public string? AnhKh { get; set; }

    public string? GhiChu { get; set; }

    public string? AnhDaiDien { get; set; }

    public virtual ICollection<THoaDonBan> THoaDonBans { get; set; } = new List<THoaDonBan>();

    public virtual TUser? UsernameNavigation { get; set; }
}
