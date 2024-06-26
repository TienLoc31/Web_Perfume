using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebPerfume.Models;

namespace WebPerfume.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductApiController : ControllerBase
	{
		WebBanNuocHoaContext db = new WebBanNuocHoaContext();
		[HttpGet]
		public IEnumerable<TSanPham> GetAllProduct()
		{
			var products = (from p in db.TSanPhams
							select new TSanPham
							{
								MaSp = p.MaSp,
								TenSp = p.TenSp,
								GiaLonNhat = p.GiaLonNhat,
								MaLoai = p.MaLoai,
								AnhSp = p.AnhSp,
							}).ToList();
			return products;
		}

		[HttpGet("{maloai}")]
		public IEnumerable<TSanPham> GetAllProductByCategory( string maloai)
		{
			var products = (from p in db.TSanPhams
							where p.MaLoai == maloai
							select new TSanPham
							{
								MaSp = p.MaSp,
								TenSp = p.TenSp,
								GiaLonNhat = p.GiaLonNhat,
								MaLoai = p.MaLoai,
								AnhSp = p.AnhSp,
							}).ToList();
			return products;
		}


	}
}
