﻿using System;
using System.Collections.Generic;

namespace WebPerfume.Models;

public partial class TChiTietHdb
{
    public string MaHdb { get; set; } = null!;

    public string MaChiTietSp { get; set; } = null!;

    public int? SoLuongBan { get; set; }

    public decimal? DonGiaBan { get; set; }

    public double? GiamGia { get; set; }

    public string? GhiChu { get; set; }

    public virtual TChiTietSp MaChiTietSpNavigation { get; set; } = null!;

    public virtual THoaDonBan MaHdbNavigation { get; set; } = null!;
}
