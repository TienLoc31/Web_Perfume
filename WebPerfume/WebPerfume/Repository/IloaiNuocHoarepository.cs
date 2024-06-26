using WebPerfume.Models;
namespace WebPerfume.Repository
{
    public interface IloaiNuocHoarepository
    {
		TLoaiSp Add(TLoaiSp loaisp);
        TLoaiSp Update(TLoaiSp loaisp);
        TLoaiSp Delete(String maloaisp);
        TLoaiSp GetCaulacbo(String maloaisp);
        IEnumerable<TLoaiSp> GetAllLoaiSP();
    }
}
