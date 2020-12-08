using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Repository.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class TaxonomyService : BaseService
    {
        protected FamilyDAO _familyDAO = null;
        protected GenusDAO _genusDAO = null;
        protected SpeciesDAO _speciesDAO = null;
        protected CropForCwrDAO _cropForCwrDAO = null;
        protected FolderDAO _folderDAO = null;
        protected ReferenceDAO _referenceDAO = null;
        protected RegulationDAO _regulationDAO = null;
        protected ReportDAO _reportDAO = null;

        public TaxonomyService(string context)
        {
            // TODO: REFACTOR 
            this._familyDAO = new FamilyDAO(context);
            this._genusDAO = new GenusDAO(context);
            this._speciesDAO = new SpeciesDAO(context);
            this._cropForCwrDAO = new CropForCwrDAO(context);
            this._folderDAO = new FolderDAO(context);
            this._referenceDAO = new ReferenceDAO(context);
            this._regulationDAO = new RegulationDAO(context);
            this._reportDAO = new ReportDAO(context);
        }

        #region Genus

        public IQueryable<Genus> FindGenus(string searchString)
        {
            return _genusDAO.Find(searchString);
        }

        #endregion

        #region Species

        public Species GetSpecies(int id)
        {
            return _speciesDAO.Get(id);
        }

        public IQueryable<Species> FindSpecies(string searchString)
        {
            return _speciesDAO.Search(searchString);
        }

        public IQueryable<Species> FindUserSpecies(int cooperatorId)
        {
            return _speciesDAO.FindUserSpecies(cooperatorId);
        }

        public IQueryable<Species> FindRecentSpecies()
        {
            return _speciesDAO.FindRecentSpecies();
        }

        public ResultContainer AddSpecies(Species species)
        {
            return _speciesDAO.Add(species);
        }
        public ResultContainer UpdateSpecies(Species species)
        {
            return _speciesDAO.Update(species);
        }

        public List<Accession> GetAccessions(int speciesId)
        {
            return _speciesDAO.GetSpeciesAccessions(speciesId);
        }

        #endregion Species

        #region Crop for CWR

        public List<CropForCWR> FindCropsForCWR(string sqlWhereClause)
        {
            return _cropForCwrDAO.FindCropsForCwr(sqlWhereClause);
        }

        public CropForCWR GetCropForCWR(int id)
        {
            return _cropForCwrDAO.GetCropForCWR(id);
        }

        public List<CropForCWR> FindUserCrops(int cooperatorId)
        {
            return _cropForCwrDAO.FindUserCrops(cooperatorId);
        }

        public List<CropForCWR> FindRecentCrops()
        {
            return _cropForCwrDAO.FindRecentCrops();
        }

        public List<CropForCWR> GetCropsForCWR()
        {
            return _cropForCwrDAO.FindAll();
        }

        public ResultContainer AddCropForCWR(CropForCWR crop)
        {
            return _cropForCwrDAO.AddCropForCWR(crop);
        }
        public ResultContainer UpdateCropForCWR(CropForCWR crop)
        {
            return _cropForCwrDAO.UpdateCropForCWR(crop);
        }

        #endregion 

        #region CWR Map

        public List<CWRMap> GetCWRMaps(int cropForCwrId)
        {
            return _cropForCwrDAO.FindCWRMaps(cropForCwrId);
        }

        public List<CWRMap> FindCWRMaps(string sqlWhereClause)
        {
            return _cropForCwrDAO.FindCWRMaps(sqlWhereClause);
        }

        public CWRMap GetCWRMap(int id)
        {
            return _cropForCwrDAO.GetCWRMap(id);
        }

        public List<CWRMap> FindUserCWRMaps(int cooperatorId)
        {
            return _cropForCwrDAO.FindUserCWRMaps(cooperatorId);
        }

        public List<CWRMap> FindRecentCWRMaps()
        {
            return _cropForCwrDAO.FindRecentCWRMaps();
        }

        public ResultContainer AddCWRMap(CWRMap cropMap)
        {
            return _cropForCwrDAO.AddCWRMap(cropMap);
        }
        public ResultContainer UpdateCWRMap(CWRMap cropMap)
        {
            return _cropForCwrDAO.UpdateCWRMap(cropMap);
        }

        public ResultContainer DeleteCWRMap(int cropMapId)
        {
            return _cropForCwrDAO.RemoveCWRpMap(cropMapId);
        }

        public ResultContainer DeleteCWRMaps(string cropMapIdList)
        {
            return _cropForCwrDAO.RemoveCWRMaps(cropMapIdList);
        }

        #endregion CropMap

        #region CWR Trait

        public List<CropTrait> GetCropMapTraits(int cropMapId)
        {
            return _cropForCwrDAO.GetCropTraits(cropMapId);     
        }

        public CropTrait GetCropTrait(int id)
        {
            return _cropForCwrDAO.GetCropTrait(id);
        }

        public ResultContainer AddCropTrait(CropTrait cropTrait)
        {
            return _cropForCwrDAO.AddCropTrait(cropTrait);
        }

        public int UpdateCropTrait(CropTrait cropTrait)
        {
            return _cropForCwrDAO.UpdateCropTrait(cropTrait);
        }

        public ResultContainer DeleteCropTrait(int cropTraitId)
        {
            return _cropForCwrDAO.RemoveCropTrait(cropTraitId);
        }
        public ResultContainer DeleteCropTraits(string cropTraitIdList)
        {
            return _cropForCwrDAO.RemoveCropTraits(cropTraitIdList);
        }

        #endregion

        #region CWR

        public CropWildRelative GetCropWildRelative(int id)
        {
            return _cropForCwrDAO.GetCropWildRelative(id);
        }

        public DataTable FindCropWildRelatives(Query searchObject)
        {
            return _cropForCwrDAO.FindCropWildRelatives(searchObject);
        }
        public int InsertCropWildRelative(CropWildRelative cropWildRelative)
        {
            return _cropForCwrDAO.AddCropWildRelative(cropWildRelative);
        }

        public int UpdateCropWildRelative(CropWildRelative cropWildRelative)
        {
            return _cropForCwrDAO.UpdateCropWildRelative(cropWildRelative);
        }

        #endregion CWR

        public IEnumerable<Family> SearchFamilies(Query query)
        {
            return _familyDAO.Find(query);
        }

        #region Citation

        public Citation GetCitation(int id)
        {
            return _referenceDAO.GetCitation(id);
        }

        public IEnumerable<Citation> FindCitations(string searchString)
        {
            return _referenceDAO.FindCitations(searchString);
        }

        public List<Citation> FindCitations(int speciesId)
        {
            return _referenceDAO.GetCitations(speciesId);
        }

        #endregion

        #region Folder
        public IEnumerable<Folder> GetFolders(int cooperatorId)
        {
            return _folderDAO.Find(cooperatorId);
        }

        public Folder GetFolder(int id)
        {
            Folder folder = null;
            folder = _folderDAO.Get(id);
            //folder.FolderItems = _folderDAO.FindFolderItems(id, folder.DataSource);
            
            return folder;
        }

        public int AddFolder(Folder folder)
        {
            return _folderDAO.Add(folder);
        }

        public int UpdateFolder(Folder folder)
        {
            return _folderDAO.Update(folder);
        }

        public int DeleteFolder(int id)
        {
            return _folderDAO.Delete(id);
        }

        public DataTable GetFolderItems(int folderId, string dataSource)
        {
            return _folderDAO.FindFolderItems(folderId, dataSource);
        }

        public int DeleteFolderItem(int itemId)
        {
            return _folderDAO.RemoveItem(itemId);
        }

        public ResultContainer DeleteFolderItems(string folderItemList)
        {
            return _folderDAO.RemoveFolderItems(folderItemList);
        }

        #endregion

        #region Regulation

        public IQueryable<Regulation> FindUserRegulations(int cooperatorId)
        {
            return _regulationDAO.FindUserRegulations(cooperatorId);
        }
        public IQueryable<Regulation> FindRecentRegulations()
        {
            return _regulationDAO.FindRecentRegulations();
        }

        #endregion

        #region Reference

        public List<CodeValueReferenceItem> GetGenePoolCodes()
        {
           return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_GENEPOOL").ToList();
        }
        public IEnumerable<CodeValueReferenceItem> GetTraitClassCodes()
        {
            return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_TRAIT_CLASS").AsEnumerable();
        }
        public IEnumerable<CodeValueReferenceItem> GetBreedingTypeCodes()
        {
            return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_BREEDING_TYPE").AsEnumerable();
        }

        public IEnumerable<Note> FindNotes(string searchString, string context)
        {
            return _referenceDAO.FindNotes(searchString, context);
        }

        #endregion Reference

        #region Reports

        public SummaryReport FiscalYearSummary()
        {
            return _reportDAO.GetFiscalYearSummary();
        }

        #endregion Reports
    }
}
