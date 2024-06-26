using WebPerfume.Models;
namespace WebPerfume.ViewModels
{
    public class HomeProductDetailViewModel
    {
        public TSanPham sanPham { get; set; }
        public List<TAnhSp> anhSps { get; set; }

        public List<TDungTich> dungTichSp { get; set; } 
        public TChiTietSp chiTietSp { get; set; }

        public HomeProductDetailViewModel()
        {
			dungTichSp = new List<TDungTich>()
			{
				new TDungTich()
				{
					MaDt = "DT1",
					TenDt = "10ml"
				},
				new TDungTich()
				{
					MaDt = "DT2",
					TenDt = "20ml"
				},
				new TDungTich()
				{
					MaDt = "DT3",
					TenDt = "50ml"
				},
				new TDungTich()
				{
					MaDt = "DT4",
					TenDt = "100ml"
				}
			};
		}

	}
}
