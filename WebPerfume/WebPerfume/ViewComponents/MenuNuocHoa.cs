using WebPerfume.Models;
using Microsoft.AspNetCore.Mvc;
using WebPerfume.Repository;

namespace WebPerfume.ViewComponents
{
    public class MenuNuocHoa : ViewComponent
    {
        private readonly IloaiNuocHoarepository _loaiSp;

        public MenuNuocHoa(IloaiNuocHoarepository loaiNuochoaRepository)
        {
            _loaiSp = loaiNuochoaRepository;
        }
        public IViewComponentResult Invoke()
        {
            var loaisp = _loaiSp.GetAllLoaiSP().OrderBy(x => x.TenLoai);
            return View(loaisp);
        }
    }
}

