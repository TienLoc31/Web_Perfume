using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebPerfume.Models;

public partial class TSanPham
{
    public string MaSp { get; set; } = null!;

    public string TenSp { get; set; } = null!;

    public int? GiaLonNhat { get; set; }

    public string? MaDd { get; set; }

    public string? MaNh { get; set; }

    public string? MaLoai { get; set; }

    public string? GioiThieuSp { get; set; }

    public string? AnhSp { get; set; }

    public virtual TDacDiem? MaDdNavigation { get; set; }

    public virtual TLoaiSp? MaLoaiNavigation { get; set; }

    public virtual TNhanHieu? MaNhNavigation { get; set; }
    [Display (Name = "Front Image")]
    [NotMapped]
    public IFormFile? FrontImage { get; set; }
    public virtual ICollection<TAnhSp> TAnhSps { get; set; } = new List<TAnhSp>();

    public virtual ICollection<TChiTietSp> TChiTietSps { get; set; } = new List<TChiTietSp>();

    public virtual ICollection<TOrderDetail> TOrderDetails { get; set; } = new List<TOrderDetail>();
}
