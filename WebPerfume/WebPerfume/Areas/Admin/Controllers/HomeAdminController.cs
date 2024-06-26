using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebPerfume.Models;

namespace WebPerfume.Areas.Admin.Controllers
{
	[Area("admin")]
	[Route("admin")]
	[Route("admin/homeadmin")]
	public class HomeAdminController : Controller
	{
        IWebHostEnvironment webhost;
        public HomeAdminController(IWebHostEnvironment webhost)
        {
            this.webhost = webhost;
        }
        WebBanNuocHoaContext db = new WebBanNuocHoaContext();
		[Route("")]
		[Route("index")]
		public IActionResult Index()
		{
			//if (HttpContext.Request.Headers["Referer"].ToString() != "https://localhost:7296/")
			//{
			//	return RedirectToAction("Index", "Home");
			//}

			return View();
		}
        [Route("DanhSachDonHang")]
        public IActionResult DanhSachDonHang()
        {


            var lstDonHang = db.TOrders.AsNoTracking().OrderBy(x => x.TenKh);

            return View(lstDonHang);
        }

        [Route("ChiTietDonHang")]
        public IActionResult ChiTietDonHang(string searchString)
        {
            var lstDonHang = db.TOrderDetails.AsNoTracking().OrderBy(x => x.OrderDetailId);
            if (!String.IsNullOrEmpty(searchString))
            {

                searchString = searchString.ToLower();
                var sanpham = db.TOrderDetails.Where(x => x.OrderDetailId.ToString().Contains(searchString));

                return View(sanpham);
            };
            return View(lstDonHang);
        }


        [Route("InventoryStatistics")]
        public IActionResult InventoryStatistics()
        {
            var inventory = db.TSanPhams
                .Select(p => new InventoryViewModel
                {
                    ProductName = p.TenSp,
                    TotalInventory = (int)(p.TChiTietSps.Sum(c => c.SoLuong) - p.TOrderDetails.Sum(c => c.SoLuong))
                })
                .ToList();

            return View(inventory);
        }



        [Route("DanhSachSanPham")]
		public IActionResult DanhSachSanPham()
		{

			var listsanpham = db.TSanPhams.AsNoTracking().OrderBy(x => x.TenSp);

			return View(listsanpham);
		}
        [Route("ThemSanPham")]
        [HttpGet]
        public IActionResult ThemSanPham()
        {
            ViewBag.MaDd = new SelectList(db.TDacDiems.ToList(), "MaDd", "TenDd");
            ViewBag.MaNh = new SelectList(db.TNhanHieus.ToList(), "MaNh", "TenNh");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "TenLoai");
            
            return View();
        }
        [Route("ThemSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPham(TSanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra Tên SP chỉ chứa chữ cái và không chứa số
                //if (!Regex.IsMatch(sanPham.TenSp, "^[a-zA-Z]+$"))
                //{
                //	ModelState.AddModelError(nameof(sanPham.TenSp), "Tên sản phẩm chỉ được chứa chữ cái và không được chứa số.");
                //}

                //// Kiểm tra định dạng ảnh đại diện
                //if (sanPham.AnhDaiDien != null && Path.GetExtension(sanPham.AnhDaiDien) != ".jpg")
                //{
                //	ModelState.AddModelError(nameof(sanPham.AnhDaiDien), "Ảnh đại diện phải có định dạng .jpg.");
                //}

                //sanPham.MaSp = Guid.NewGuid().ToString();
                string uniqueFileName = Uploade(sanPham);
                if (uniqueFileName == "")
                {
                    uniqueFileName = "burberry_her.jpg";
                }
                sanPham.AnhSp = uniqueFileName;
                db.TSanPhams.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhSachSanPham", "Admin");
            }
            return View(sanPham);
        }

        //private string GenerateProductCode()
        //{
        //    // You can use various strategies to generate the product code
        //    // Here, I'm using a combination of a prefix and a timestamp
        //    string prefix = "PRD";
        //    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");

        //    // Combine the prefix and timestamp to create a unique product code
        //    string productCode = $"{prefix}_{timestamp}";

        //    return productCode;
        //}
        //private static int productCounter = 0;
        //private string GenerateProductCode() //hàm tự tăng mã sản phẩm dạng PRD_000
        //{
        //    // You can use various strategies to format the counter
        //    // Here, I'm using a three-digit counter with leading zeros
        //    string counter = productCounter.ToString("D3");

        //    // Increment the counter for the next product
        //    productCounter++;

        //    // Combine the counter with a prefix to create the product code
        //    string productCode = $"PRD_{counter}";

        //    return productCode;
        //}

        //public string Uploade(TSanPham sanPham)
        //{
        //    string uniqueFileName = null;
        //    if (sanPham.FrontImage != null)
        //    {
        //        string uploadFolder = Path.Combine(webhost.WebRootPath, "ProductImages");
        //        uniqueFileName = Guid.NewGuid().ToString() + "_" + sanPham.FrontImage.FileName;
        //        string filePath = Path.Combine(uploadFolder, uniqueFileName);
        //        using (var fileStream = new FileStream(filePath, FileMode.Create))
        //        {
        //            sanPham.FrontImage.CopyTo(fileStream);
        //        }

        //        return uniqueFileName;
        //    }

        //    return null; // Handle the case where no image is uploaded
        //}
        [Route("HaiDuong")]
        private string Uploade(TSanPham sanPham)
        {
            if (sanPham.AnhSp != null)
            {
                string uploadsFolder = Path.Combine(webhost.WebRootPath, "ProductImages");
                string uniqueFileName = Guid.NewGuid().ToString() + "_" + sanPham.FrontImage.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    sanPham.FrontImage.CopyTo(fileStream);
                }

                return uniqueFileName;
            }
            else if (!string.IsNullOrEmpty(sanPham.AnhSp))
            {
                // Nếu chọn ảnh từ danh sách đã có
                return sanPham.AnhSp;
            }

            return "";
        }
        [Route("SuaSanPham")]
        [HttpGet]

        public IActionResult SuaSanPham(string maSanPham)
        {
            ViewBag.MaDd = new SelectList(db.TDacDiems.ToList(), "MaDd", "TenDd");
            ViewBag.MaNh = new SelectList(db.TNhanHieus.ToList(), "MaNh", "TenNh");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "TenLoai");
            var sanPham = db.TSanPhams.Find(maSanPham);
            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(TSanPham sanPham)
        {
            if (ModelState.IsValid)
            {

                string uniqueFileName = Uploade(sanPham);
                if (uniqueFileName == "")
                {
                    uniqueFileName = "burberry_her.jpg";
                }
                sanPham.AnhSp = uniqueFileName;
                //db.Entry(sanPham).State = (Microsoft.EntityFrameworkCore.EntityState)EntityState.Modified;
                db.Update(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhSachSanPham");

            }
            return View(sanPham);
        }
        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSanPham)
        {
            TempData["Message"] = "";
            var listChiTiet = db.TChiTietSps.Where(x => x.MaSp == maSanPham);
            foreach (var item in listChiTiet)
            {
                if (db.TChiTietHdbs.Where(x => x.MaChiTietSp == item.MaChiTietSp) != null)
                {
                    TempData["Message"] = "Khong xoa duoc san pham nay";
                    return RedirectToAction("DanhSachSanPham");
                }
            }
            var listAnh = db.TAnhSps.Where(x => x.MaSp == maSanPham);
            //var listOrder = db.TOrderDetails.Where(x => x.MaSp == maSanPham);
            if (listAnh != null) db.RemoveRange(listAnh);
            if (listChiTiet != null) db.RemoveRange(listChiTiet);
			//if (listOrder != null) db.RemoveRange(listOrder);
			db.Remove(db.TSanPhams.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "San pham da duoc xoa";
            return RedirectToAction("DanhSachSanPham");
        }
    }
}
