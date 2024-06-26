using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebPerfume.Models;

namespace WebPerfume.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        WebBanNuocHoaContext db = new WebBanNuocHoaContext();
        [HttpGet]
        public IEnumerable<TSanPham> GetAllSanpham()
        {
            return db.TSanPhams.ToList();
        }
    }
}
