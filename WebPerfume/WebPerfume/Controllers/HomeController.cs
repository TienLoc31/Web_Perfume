using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using WebPerfume.Models;
using WebPerfume.ViewModels;
using X.PagedList;

namespace WebPerfum.Controllers
{
	public class HomeController : Controller
	{
		WebBanNuocHoaContext db = new WebBanNuocHoaContext();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index(int? page)
		{
			int pageSize = 8;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var lstsp = db.TSanPhams.AsNoTracking().OrderBy(x => x.TenSp); ;
			PagedList<TSanPham> lst = new PagedList<TSanPham>(lstsp, pageNumber, pageSize);
            return View(lst);
		}

		public IActionResult LoaiSanPham(String maloai, int? page)
		{
			int pageSize = 8;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var lstsp = db.TSanPhams.AsNoTracking().Where(x => x.MaLoai == maloai).OrderBy(x => x.TenSp);
			PagedList<TSanPham> lst = new PagedList<TSanPham>(lstsp, pageNumber, pageSize);
			ViewBag.maloai = maloai;
			return View(lst);
		}

		//      public IActionResult ProductDetail(string maSp)
		//      {
		//	var sanPham = db.TSanPhams.SingleOrDefault(x => x.MaSp == maSp);
		//	var anhSanPham = db.TAnhSps.Where(x => x.MaSp == maSp).ToList();
		//	ViewBag.anhSanPham = anhSanPham;
		//	return View(sanPham);
		//}
		public IActionResult productdetail(string maSp)
		{
			var sanPham = db.TSanPhams.SingleOrDefault(x => x.MaSp == maSp);
			var anhSanPham = db.TAnhSps.Where(x => x.MaSp == maSp).ToList();
			//var chiTiet = db.TChiTietSps.Where(x => x.MaSp == maSp).ToList();
			var homeProductDetailViewModel = new HomeProductDetailViewModel
			{
				sanPham = sanPham,
				anhSps = anhSanPham,
				
			};

			return View(homeProductDetailViewModel);
		}
        public IActionResult TimKiemSanPham(string nameSanPham, int? page)
        {
            ViewBag.nameSanPham = nameSanPham;
            int pageSize = 6;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.TSanPhams.Where(x => x.TenSp.Contains(nameSanPham)).ToList();
            PagedList<TSanPham> lt = new PagedList<TSanPham>(lst, pageNumber, pageSize);
            return View(lt);
        }
        public IActionResult Cart()
		{
			return RedirectToAction("Index", "cart");
		}
		public IActionResult Privacy()
		{
			return View();
		}

		//[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		//public IActionResult Error()
		//{
		//	return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		//}
	}
}