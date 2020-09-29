using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Repository.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Service
{
   public class BaseService
    {
        //protected CropForCwrDAO _cropDAO = new CropForCwrDAO();
        //protected SpeciesDAO _speciesDAO = new SpeciesDAO();
        //protected FamilyDAO _familyDAO = new FamilyDAO();
        
        //protected ReferenceRepository _referenceRepository = new ReferenceRepository();
        //protected FolderDAO _folderDAO = new FolderDAO();
        //protected RegulationDAO _regulationDAO = new RegulationDAO();

        public FileMetaData GetFileMetaData(string url)
        {
            FileMetaData fileMetaData = new FileMetaData();

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "HEAD";

            try
            {

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
            }
            catch (Exception ex)
            {
                fileMetaData.IsValid = false;
            }
            return fileMetaData;
        }

    }
}
