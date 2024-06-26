using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace WebPerfume.Models;

   
public class InventoryViewModel
{
    public string ProductName { get; set; }
    public int TotalInventory { get; set; }
    public TChiTietSp chiTietSp { get; set; }
    public TOrderDetail orderDetail { get; set; }
}
    

