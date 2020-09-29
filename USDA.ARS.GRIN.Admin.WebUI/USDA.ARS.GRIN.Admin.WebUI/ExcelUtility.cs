using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Data;
using System.Threading.Tasks;
using ExcelDataReader;
using System.Diagnostics;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI
{



    public class ExcelUtility
    {
        public List<FileMetaData> Validate(string filePathName)
        {
            List<FileMetaData> fileList = new List<FileMetaData>();

            using (var stream = File.Open(filePathName, FileMode.Open, FileAccess.Read))
            {
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {
                    var result = reader.AsDataSet(new ExcelDataSetConfiguration()
                    {
                        ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                        {
                            UseHeaderRow = false
                        }
                    });
                    DataTable dt = result.Tables[0];
                    foreach (DataRow row in dt.Rows)
                    {
                        string fieldValue = row[0].ToString();
                        if (!String.IsNullOrEmpty(fieldValue))
                        {
                            FileMetaData fileMetaData = new FileMetaData();
                            fileMetaData = GetFileMetaData(fieldValue);
                            fileMetaData.SourceURL = fieldValue;

                            //fileMetaData.IsValid = RemoteFileExists(fileMetaData.SourceURL);
                            fileList.Add(fileMetaData);
                        }
                    }
                }
            }
            return fileList;
        }

        private FileMetaData GetFileMetaData(string url)
        {
            FileMetaData fileMetaData = new FileMetaData();

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "HEAD";
            HttpWebResponse response = request.GetResponse() as HttpWebResponse;

            if (response.StatusCode == HttpStatusCode.OK)
            { 
                fileMetaData.IsValid = true;
                fileMetaData.FileSize = response.ContentLength;
                fileMetaData.LastModified = response.LastModified;
            }
            else
            {
                fileMetaData.IsValid = false;
            }

            return fileMetaData;
        }

        private bool RemoteFileExists(string url)
        {
            try
            {
                //Creating the HttpWebRequest
                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
                //Setting the Request method HEAD, you can also use GET too.
                request.Method = "HEAD";
                //Getting the Web Response.
                HttpWebResponse response = request.GetResponse() as HttpWebResponse;
                //Returns TRUE if the Status code == 200
                
                
                response.Close();
                return (response.StatusCode == HttpStatusCode.OK);
            }
            catch
            {
                //Any exception will returns false.
                return false;
            }
        }
    }
}
