using WebPerfume.Models;
using WebPerfume.Repository;
namespace WebPerfume.Repository
{
    public class LoaiNuocHoaRepository : IloaiNuocHoarepository
    {
        private readonly WebBanNuocHoaContext _context;
        public LoaiNuocHoaRepository(WebBanNuocHoaContext context)
        {
            _context = context;
        }
        public TLoaiSp Add(TLoaiSp loaisp)
        {
            _context.TLoaiSps.Add(loaisp);
            _context.SaveChanges();
            return loaisp;
        }

        public TLoaiSp Delete(string maloaisp)
        {
            throw new NotImplementedException();
        }

        public TLoaiSp GetCaulacbo(string maloaisp)
        {
            return _context.TLoaiSps.Find(maloaisp);
        }

        public IEnumerable<TLoaiSp> GetAllLoaiSP()
        {
            return _context.TLoaiSps;
        }

        public TLoaiSp Update(TLoaiSp loaisp)
        {
            _context.Update(loaisp);
            _context.SaveChanges();
            return loaisp;
        }

		
	}
}
