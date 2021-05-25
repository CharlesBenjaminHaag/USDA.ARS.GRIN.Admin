using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;
using System.Web.UI;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Utilities;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using DocumentFormat.OpenXml.Drawing.Charts;
using System.Data;
using NLog;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class UtilitiesController : BaseController
    {
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();
        public ActionResult Index()
        {
            IndexViewModel viewModel = new IndexViewModel();

            try
            {
                return View("~/Views/Utilities/Index.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    string path = Path.Combine(Server.MapPath("~/App_Data"), fileName);

                    IndexViewModel viewModel = new IndexViewModel();

                    file.SaveAs(path);

                    ExcelUtility excelUtility = new ExcelUtility();

                    viewModel.UrlValidationList = excelUtility.Validate(path);
                    Session["UrlValidationList"] = viewModel.UrlValidationList;
                    return View("~/Views/Utilities/Index.cshtml", viewModel);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return null;
        }


        public FileResult Export()
        {
            List<FileMetaData> urlList = new List<FileMetaData>();            
            System.Data.DataTable dtExport = new System.Data.DataTable("URLValidation");
            dtExport.Columns.AddRange(new DataColumn[2] { new DataColumn("ImageURL"), new DataColumn("IsValid") });

            if (Session["UrlValidationList"] != null)
            {
                urlList = Session["UrlValidationList"] as List<FileMetaData>;
            }

            foreach (var result in urlList)
            {
                dtExport.Rows.Add(result.SourceURL, result.IsValid);
            }
            
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dtExport);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Grid.xlsx");
                }
            }
        }
    }
}