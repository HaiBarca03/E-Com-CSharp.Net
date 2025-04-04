using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ECommerceMVC.Data;

namespace ECommerceMVC.Controllers
{
    public class HangHoasController : Controller
    {
        private readonly Hshop2023Context _context;

        public HangHoasController(Hshop2023Context context)
        {
            _context = context;
        }

        // GET: HangHoas
        public async Task<IActionResult> Index()
        {
            var hshop2023Context = _context.HangHoas.Include(h => h.MaLoaiNavigation).Include(h => h.MaNccNavigation);
            return View(await hshop2023Context.ToListAsync());
        }

        // GET: HangHoas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hangHoa = await _context.HangHoas
                .Include(h => h.MaLoaiNavigation)
                .Include(h => h.MaNccNavigation)
                .FirstOrDefaultAsync(m => m.MaHh == id);
            if (hangHoa == null)
            {
                return NotFound();
            }

            return View(hangHoa);
        }

        // GET: HangHoa/Create
        public IActionResult Create()
        {
            ViewBag.MaLoai = _context.Loais.Select(l => new SelectListItem
            {
                Value = l.MaLoai.ToString(),
                Text = l.TenLoai
            }).ToList();

            ViewBag.MaNcc = _context.NhaCungCaps.Select(n => new SelectListItem
            {
                Value = n.MaNcc,
                Text = n.TenCongTy
            }).ToList();

            return View();
        }

        // POST: HangHoa/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(HangHoa hangHoa)
        {
            if (ModelState.IsValid)
            {
                _context.HangHoas.Add(hangHoa);
                _context.SaveChanges();

                return RedirectToAction(nameof(Index));
            }
            ViewBag.MaLoai = _context.Loais.Select(l => new SelectListItem
            {
                Value = l.MaLoai.ToString(),
                Text = l.TenLoai
            }).ToList();

            ViewBag.MaNcc = _context.NhaCungCaps.Select(n => new SelectListItem
            {
                Value = n.MaNcc,
                Text = n.TenCongTy
            }).ToList();

            return View(hangHoa);
        }

        // GET: HangHoas/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            // Check if the ID is null
            if (id == null)
            {
                return NotFound();
            }

            // Find the HangHoa entity by ID
            var hangHoa = await _context.HangHoas.FindAsync(id);

            // Check if the entity was found
            if (hangHoa == null)
            {
                return NotFound();
            }

            // Populate dropdown lists for MaLoai and MaNcc
            ViewData["MaLoai"] = new SelectList(_context.Loais, "MaLoai", "MaLoai", hangHoa.MaLoai);
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc", hangHoa.MaNcc);

            // Return the edit view with the found HangHoa
            return View(hangHoa);
        }


        [HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(int id, [Bind("MaHh,TenHh,TenAlias,MaLoai,MoTaDonVi,DonGia,Hinh,NgaySx,GiamGia,SoLanXem,MoTa,MaNcc")] HangHoa hangHoa)
{
    // Check if the ID matches the HangHoa's MaHh
    if (id != hangHoa.MaHh)
    {
        return NotFound();
    }

    // Log the details of HangHoa for debugging
    Console.WriteLine("HangHoa Details:");
    Console.WriteLine($"MaHh: {hangHoa.MaHh}, TenHh: {hangHoa.TenHh}, DonGia: {hangHoa.DonGia}, GiamGia: {hangHoa.GiamGia}");

    // Check if the model state is valid
    if (ModelState.IsValid)
    {
        try
        {
            // Update the HangHoa entity in the database
            _context.Update(hangHoa);
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            // Handle potential concurrency issues
            if (!HangHoaExists(hangHoa.MaHh))
            {
                return NotFound();
            }
            else
            {
                throw;
            }
        }
        
        // Redirect to the Index page after a successful update
        return RedirectToAction(nameof(Index));
    }

    // If model state is not valid, re-populate the dropdown lists
    ViewData["MaLoai"] = new SelectList(_context.Loais, "MaLoai", "MaLoai", hangHoa.MaLoai);
    ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc", hangHoa.MaNcc);

    // Return the view with the current data to display validation errors
    return View(hangHoa);
}


        // GET: HangHoas/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hangHoa = await _context.HangHoas
                .Include(h => h.MaLoaiNavigation)
                .Include(h => h.MaNccNavigation)
                .FirstOrDefaultAsync(m => m.MaHh == id);
            if (hangHoa == null)
            {
                return NotFound();
            }

            return View(hangHoa);
        }

        // POST: HangHoas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var hangHoa = await _context.HangHoas.FindAsync(id);
            if (hangHoa != null)
            {
                _context.HangHoas.Remove(hangHoa);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HangHoaExists(int id)
        {
            return _context.HangHoas.Any(e => e.MaHh == id);
        }
    }
}
