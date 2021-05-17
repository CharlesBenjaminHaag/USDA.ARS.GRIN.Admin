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
        protected CwrMapDAO _cwrMapDAO = null;
        protected CwrTraitDAO _cwrTraitDAO = null;
        protected FolderDAO _folderDAO = null;
        protected CitationDAO _citationDAO = null;
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
            this._cwrMapDAO = new CwrMapDAO(context);
            this._cwrTraitDAO = new CwrTraitDAO(context);
            this._folderDAO = new FolderDAO(context);
            this._citationDAO = new CitationDAO(context);
            this._referenceDAO = new ReferenceDAO(context);
            this._regulationDAO = new RegulationDAO(context);
            this._reportDAO = new ReportDAO(context);
        }

        // ****************************************************************************
        // GENUS
        // ****************************************************************************

        public DemoContainer Demo()
        {
            DemoContainer demoContainer = new DemoContainer();
            demoContainer.CropsForCWR = _cropForCwrDAO.Demo();
            demoContainer.Species = _speciesDAO.Demo();
            demoContainer.CWRTraits = _cwrTraitDAO.Demo();
            return demoContainer;
        }

        #region Genus
        public IQueryable<Genus> GetGenera()
        {
            return _genusDAO.Find();
        }

        public IQueryable<Genus> FindGenus(string searchString)
        {
            return _genusDAO.Find(searchString);
        }

        #endregion

        // ****************************************************************************
        // SPECIES
        // ****************************************************************************
        #region Species

        public Species GetSpecies(int id)
        {
            return _speciesDAO.Get(id);
        }

        public List<Species> FindSpecies(string searchString, bool includeSynonyms)
        {
            return _speciesDAO.Search(searchString, includeSynonyms);
        }

        public IQueryable<Species> FindSpecies(string searchText)
        {
            return _speciesDAO.Search("WHERE species_name LIKE '%" + searchText + "%'");
        }

        public IEnumerable<Species> FindAllSpecies()
        {
            return _speciesDAO.FindAll();
        }

        public List<Species> FindCachedSpecies()
        {
            return _speciesDAO.FindAllCached();
        }

        public IEnumerable<Species> FindUserSpecies(int cooperatorId)
        {
            return _speciesDAO.Search("WHERE ts.created_by = " + cooperatorId);
        }

        public IEnumerable<Species> FindRecentSpecies()
        {
            return _speciesDAO.Search("WHERE modified_date > DATEADD(MONTH, -1, GETDATE())");
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
            //return _speciesDAO.GetSpeciesAccessions(speciesId);
            return null;
        }

        #endregion Species

        // ****************************************************************************
        // CROP FOR CWR
        // ****************************************************************************
        #region Crop for CWR

        public IQueryable<CropForCWR> FindCropsForCWR(string searchText)
        {
            return _cropForCwrDAO.Search("WHERE crop_name LIKE '%" + searchText + "%'");
        }

        public IQueryable<CropForCWR> FindRecentCropsForCWR()
        {
            return _cropForCwrDAO.Search("WHERE modified_date > DATEADD(MONTH, -1, GETDATE())"); 
        }

        public IQueryable<CropForCWR> FindUserCropsForCWR(int cooperatorId)
        {
            return _cropForCwrDAO.Search("WHERE created_by = " + cooperatorId.ToString());
        }

        public CropForCWR GetCropForCWR(int id)
        {
            return _cropForCwrDAO.Get(id);
        }
       
        public IQueryable<CropForCWR> GetCropsForCWR()
        {
            return _cropForCwrDAO.Search("");
        }

        public ResultContainer AddCropForCWR(CropForCWR cropForCwr)
        {
            return _cropForCwrDAO.Add(cropForCwr);
        }
        public ResultContainer UpdateCropForCWR(CropForCWR cropForCwr)
        {
            return _cropForCwrDAO.Update(cropForCwr);
        }

        #endregion

        // ****************************************************************************
        // CWR MAP
        // ****************************************************************************
        #region CWR Map

        public IQueryable<CWRMap> GetCWRMaps(int cropForCwrId)
        {
            return _cropForCwrDAO.GetCWRMaps(cropForCwrId);
        }

        public IQueryable<CWRMap> FindCWRMaps(string searchText)
        {
            return _cwrMapDAO.Search("WHERE crop_common_name LIKE '%" + searchText + "%'");
        }

        public CWRMap GetCWRMap(int id)
        {
            return _cwrMapDAO.Get(id);
        }

        public IQueryable<CWRMap> FindUserCWRMaps(int cooperatorId)
        {
            return _cwrMapDAO.Search("WHERE created_by = " + cooperatorId.ToString());
        }

        public IQueryable<CWRMap> FindRecentCWRMaps()
        {
            return _cwrMapDAO.Search("WHERE modified_date > DATEADD(MONTH, -1, GETDATE())");
        }

        public IQueryable<CWRMap> FindRelatedCWRMaps(int cropForCwrId)
        {
            return _cwrMapDAO.Search("WHERE taxonomy_cwr_crop_id = " + cropForCwrId);
        }

        public ResultContainer AddCWRMap(CWRMap cropMap)
        {
            return _cwrMapDAO.Add(cropMap);
        }
        public ResultContainer UpdateCWRMap(CWRMap cropMap)
        {
            return _cwrMapDAO.Update(cropMap);
        }

        public ResultContainer DeleteCWRMap(int cropMapId)
        {
            CWRMap cWRMap = new CWRMap();
            cWRMap.ID = cropMapId;
            return _cropForCwrDAO.Remove(cWRMap);
        }

        public ResultContainer DeleteCWRMaps(string cropMapIdList)
        {
            //return _cropForCwrDAO.RemoveCWRMaps(cropMapIdList);
            return null;
        }

        #endregion CropMap

        // ****************************************************************************
        // CWR TRAIT
        // ****************************************************************************
        #region CWR Trait

        public IQueryable<CWRTrait> GetCWRTraits(int cropMapId)
        {
            return _cwrTraitDAO.FindAll();     
        }

        public IQueryable<CWRTrait> FindCWRTraits(string searchText)
        {
            return _cwrTraitDAO.Search("WHERE vtctcl.title LIKE '%" + searchText + "%' OR vtbtl.title LIKE '%" + searchText + "%'");
        }

        public IQueryable<CWRTrait> FindUserCWRTraits(int cooperatorId)
        {
            return _cwrTraitDAO.Search("WHERE tct.created_by = " + cooperatorId);
        }
        public IQueryable<CWRTrait> FindRecentCWRTraits()
        {
            return _cwrTraitDAO.Search("WHERE tct.modified_date > DATEADD(MONTH, -1, GETDATE())");
        }

        public CWRTrait GetCWRTrait(int id)
        {
            return _cwrTraitDAO.Get(id);
        }

        public ResultContainer AddCropTrait(CWRTrait cwrTrait)
        {
            return _cwrTraitDAO.Add(cwrTrait);
        }

        public ResultContainer UpdateCWRTrait(CWRTrait cropTrait)
        {
            return _cwrTraitDAO.Update(cropTrait);
        }

        public ResultContainer DeleteCWRTrait(CWRTrait cwrTrait)
        {
            return _cwrTraitDAO.Remove(cwrTrait);
        }
        public ResultContainer DeleteCWRTraits(int[] idList)
        {
            return _cwrTraitDAO.Remove(idList);
        }

        #endregion

        #region Citation

        public Citation GetCitation(int id)
        {
            return _citationDAO.Get(id);
        }
        public IEnumerable<Citation> GetCitationsByCategory(string category, int id)
        {
            return _citationDAO.GetByCategory(category, id);
        }
        public IEnumerable<Citation> GetCitationsByLiterature(int literatureId)
        {
            return _citationDAO.GetByLiterature(literatureId);
        }

        public IEnumerable<Citation> FindCitations(int searchType, Query query)
        {
            return _citationDAO.Search(searchType, query);
        }

        public List<Citation> FindCitations(int speciesId)
        {
            return _referenceDAO.GetCitations(speciesId);
        }
        public ResultContainer AddCitation(Citation citation)
        {
            return _citationDAO.Add(citation);
        }

        public ResultContainer UpdateCitation(Citation citation)
        {
            return _citationDAO.Update(citation);
        }
        #endregion

        #region Literature

        public Literature GetLiterature(int id)
        {
            return _citationDAO.GetLiterature(id);
        }

        public List<Literature> SearchLiterature(string searchText)
        {
            return _citationDAO.SearchLiterature(searchText);
        }
        public List<Literature> SearchLiterature(Query query)
        {
            return _citationDAO.SearchLiterature(query);
        }

        #endregion Literature

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
        public List<CodeValueReferenceItem> GetCodeValues(string groupName)
        {
            return _referenceDAO.GetCodeValues(groupName);
        }
        public List<CodeValueReferenceItem> GetGenePoolCodes()
        {
           return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_GENEPOOL").ToList();
        }
        public List<CodeValueReferenceItem> GetTraitClassCodes()
        {
            return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_TRAIT_CLASS").ToList();
        }
        public List<CodeValueReferenceItem> GetBreedingTypeCodes()
        {
            return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_BREEDING_TYPE").ToList();
        }
        public List<CodeValueReferenceItem> GetBreedingTypeCodes(string traitClassCode)
        {
            return _cropForCwrDAO.GetCodeValueReferenceItems().Where(x => x.GroupName == "CWR_BREEDING_TYPE").Where(y => y.Description.Contains(traitClassCode)).ToList();
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
