using WebPerfume.Models;
using WebPerfume.Models.Cart;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;


namespace WebPerfume.Areas.Cart.Controllers
{
    [Area("cart")]
    [Route("cart")]

    public class CartHomeController : Controller
    {
		WebBanNuocHoaContext db = new WebBanNuocHoaContext();

        private const string CartSession = "CartSession";

        
        

        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            TempData["Message"] = "Sản phẩm đã được thêm vào giỏ hàng";
            var cart = HttpContext.Session.GetString(CartSession);
            var list = new List<Cartitem>();
            if (cart != null)
            {
                var productList = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
                list = productList;
            }
            return View(list);
        }

        [Route("AddiItem")]
        public ActionResult AddiItem(string id, int quantity)
        {
            var cart = HttpContext.Session.GetString(CartSession);
            if (cart != null)
            {
                var productList = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
                var item = productList.Find(p => p.sanPham.MaSp == Convert.ToString(id));

                if (item != null)
                {
                    item.Quantity += quantity;
                }
                else
                {
                    var sanPham = db.TSanPhams.Find(id);
                    if (sanPham != null)
                    {
                        item = new Cartitem();
                        item.sanPham = sanPham;
                        item.Quantity = quantity;
                        productList.Add(item);
                    }
                }
                cart = JsonConvert.SerializeObject(productList);
                HttpContext.Session.SetString(CartSession, cart);
            }
            else
            {
                var sanPham = db.TSanPhams.Find(id);
                if (sanPham != null)
                {
                    var item = new Cartitem();
                    item.sanPham = sanPham;
                    item.Quantity = quantity;
                    var list = new List<Cartitem>();
                    list.Add(item);
                    cart = JsonConvert.SerializeObject(list);
                    HttpContext.Session.SetString(CartSession, cart);
                }
            }
            return RedirectToAction("Index");
        }


        
        //[HttpPost]
        //public ActionResult UpdateQuantity(string productId, int quantity)
        //{
        //    // find the Cartitem object with the matching product code
        //    var cart = HttpContext.Session.GetString(CartSession);
        //    if (cart != null)
        //    {
        //        var productList = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
        //        var item = productList.Find(p => p.sanPham.MaSp == productId);
        //        if (item != null)
        //        {
        //            // update the quantity property of the Cartitem object
        //            item.Quantity = quantity;

        //            // save the updated cart to the session
        //            cart = JsonConvert.SerializeObject(productList);
        //            HttpContext.Session.SetString(CartSession, cart);

        //            // return the updated quantity to the client
        //            return Json(new { quantity = item.Quantity });
        //        }
        //    }

        //    // if the Cartitem object was not found or the cart is empty, return a quantity of 0 to the client
        //    return Json(new { quantity = 0 });
        //}



        [Route("RemoveItem")]
        public IActionResult RemoveItem(string id)
        {
            var cart = HttpContext.Session.GetString(CartSession);
            if (cart != null)
            {
                var productList = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
                var item = productList.Find(p => p.sanPham.MaSp == Convert.ToString(id));
                if (item != null)
                {
                    productList.Remove(item);
                    cart = JsonConvert.SerializeObject(productList);
                    HttpContext.Session.SetString(CartSession, cart);
                }
            }
            return RedirectToAction("Index");
        }

        [Route("ClearCart")]
        public IActionResult ClearCart()
        {
            HttpContext.Session.Remove(CartSession); // Xóa session giỏ hàng
            return RedirectToAction("Index");
        }

        [Route("Payment")]
        [HttpGet]
        public IActionResult Payment()
        {
            TempData["Message"] = "Sản phẩm đã được thêm vào giỏ hàng";
            var cart = HttpContext.Session.GetString(CartSession);
            var list = new List<Cartitem>();
            if (cart != null)
            {
                var productList = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
                list = productList;
            }
            return View(list);
        }

        [Route("Payment")]
        [HttpPost]
        
        public IActionResult Payment(string CustomerName, string Email, string Phone, string Address,string PhuongThucThanhToan)
        {
            TempData["Message"] = "Đặt hàng thành công";
            var cart = HttpContext.Session.GetString(CartSession);
            var list = new List<Cartitem>();
            if (cart != null)
            {
                list = JsonConvert.DeserializeObject<List<Cartitem>>(cart);
            }
            if (ModelState.IsValid)
            {
                // Sinh mã khách hàng ngẫu nhiên
                string maKhachHang = Guid.NewGuid().ToString().Substring(0, 8);
                var order = new TOrder
                {
                    CreatedDate = DateTime.Now,
                    DiaChi = Address,
                    TenKh = CustomerName,
                    //GioiTinh = Sexual,
                    Email = Email,
                    Sdt = Phone,
                    MaKh = maKhachHang, // Gán mã khách hàng vào đơn hàng
                    Pttt = PhuongThucThanhToan
                };
                db.TOrders.Add(order);
                db.SaveChanges();
                var orderId = order.OrderId;

                var khachHang = new TKhachHang
                {
                    MaKh = maKhachHang,
                    TenKh = CustomerName,
                    //GioiTinh = Sexual,
                    Email = Email,
                    Sdt = Phone,
                    DiaChi = Address
                    // Các trường khác nếu cần
                };
                db.TKhachHangs.Add(khachHang);
                db.SaveChanges();

                foreach (var item in list)
                {
                    
                    var orderDetail = new TOrderDetail
                    {
                        OrderId= orderId,
                        //OrderDetailId = Guid.NewGuid().ToString(),
                        MaSp = item.sanPham.MaSp,
                        SoLuong = item.Quantity,
                        ThanhTien = item.sanPham.GiaLonNhat
                    };
                    db.TOrderDetails.Add(orderDetail);
                    db.SaveChanges();
                }

                HttpContext.Session.Remove(CartSession);
                return RedirectToAction("Success", "Cart");
            }
            return View(list);
        }
        [Route("Success")]
        public ActionResult Success()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ProcessPayment(TOrder order)
        {
            if (order != null)
            {
                if (order.Pttt == "thanh-toan-bang-tai-khoan-ngan-hang")
                {
                    return RedirectToAction("SuccessBank", "CartHome", order);
                }
                else if (order.Pttt == "thanh-toan-khi-giao-hang")
                {
                    return RedirectToAction("SuccessCOD", "CartHome", order);
                }
            }

            return View();
        }


        [Route("SuccessBank")]
        public ActionResult SuccessBank()
        {
            var latestOrder = db.TOrders.AsNoTracking().OrderByDescending(x => x.CreatedDate).FirstOrDefault();
            return View(latestOrder);
        }

        [Route("SuccessCOD")]
        public ActionResult SuccessCOD()
        {
            // xử lý phương thức thanh toán khi nhận hàng
            return View();
        }


        

    }
}