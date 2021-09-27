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
        protected AuthorDAO _authorDAO = null;
        protected CitationDAO _citationDAO = null;
        protected ReferenceDAO _referenceDAO = null;
        protected RegulationDAO _regulationDAO = null;
        protected ReportDAO _reportDAO = null;
        protected GeographyDAO geographyDAO = null;

        public TaxonomyService(string context)
        {
            this._familyDAO = new FamilyDAO(context);
            this._genusDAO = new GenusDAO(context);
            this._speciesDAO = new SpeciesDAO(context);
            this._cropForCwrDAO = new CropForCwrDAO(context);
            this._cwrMapDAO = new CwrMapDAO(context);
            this._cwrTraitDAO = new CwrTraitDAO(context);
            this._folderDAO = new FolderDAO(context);
            this._authorDAO = new AuthorDAO(context);
            this._citationDAO = new CitationDAO(context);
            this._referenceDAO = new ReferenceDAO(context);
            this._regulationDAO = new RegulationDAO(context);
            this._reportDAO = new ReportDAO(context);
            this.geographyDAO = new GeographyDAO(context);
        }

        #region Family

        public IQueryable<Family> FamilySearch(Query query)
        {
            return _familyDAO.Search(query);
        }

        public IQueryable<Family> GetFamilyFolderItems(int folderId)
        {
            return _familyDAO.GetFolderItems(folderId);
        }

        public Family GetFamily(int id)
        {
            return _familyDAO.Get(id);
        }

        public ResultContainer AddFamily(Family family)
        {
            return _familyDAO.Add(family);
        }

        public ResultContainer UpdateFamily(Family family)
        {
            return _familyDAO.Update(family);
        }

        #endregion

        #region Genus

        public IEnumerable<Genus> GenusSearch(Query query)
        {
            return _genusDAO.Search(query);
        }

        public IQueryable<Genus> GetGenusFolderItems(int folderId)
        {
            return _genusDAO.GetFolderItems(folderId);
        }

        public Genus GetGenus(int id)
        {
            return _genusDAO.Get(id);
        }
        public ResultContainer AddGenus(Genus genus)
        {
            return _genusDAO.Add(genus);
        }
        public ResultContainer UpdateGenus(Genus genus)
        {
            return _genusDAO.Update(genus);
        }

        public IQueryable<Genus> FindGenus(string searchString)
        {
            return _genusDAO.Find(searchString);
        }

        #endregion

        #region Species
        public System.Linq.IQueryable<Species> SpeciesSearch(Query query)
        {
            return _speciesDAO.Search(query);
        }
        public IQueryable<Species> GetSpeciesFolderItems(int folderId)
        {
            return _speciesDAO.GetFolderItems(folderId);
        }

        public Species GetSpecies(int id)
        {
            return _speciesDAO.Get(id);
        }
        public ResultContainer AddSpecies(Species species)
        {
            return _speciesDAO.Add(species);
        }

        public ResultContainer UpdateSpecies(Species species)
        {
            return _speciesDAO.Update(species);
        }

        #region Economic Use

        public IQueryable<EconomicUse> EconomicUseSearch(Query query)
        {
            return _speciesDAO.EconomicUseSearch(query);
        }

        public EconomicUse GetEconomicUse(int id)
        {
            return _speciesDAO.GetEconomicUse(id);
        }

        public ResultContainer AddEconomicUse(EconomicUse economicUse)
        {
            return _speciesDAO.AddEconomicUse(economicUse);
        }
        public ResultContainer UpdateEconomicUse(EconomicUse economicUse)
        {
            return _speciesDAO.UpdateEconomicUse(economicUse);
        }

        public ResultContainer DeleteEconomicUse(int id)
        {
            return _speciesDAO.DeleteEconomicUse(id);
        }

        #endregion

        #region Common Names
        public IQueryable<CommonName> CommonNameSearch(Query query)
        {
            return _speciesDAO.CommonNameSearch(query);
        }

        public ResultContainer AddCommonName(CommonName commonName)
        {
            return _speciesDAO.AddCommonName(commonName);
        }
        public ResultContainer UpdateCommonName(CommonName commonName)
        {
            return _speciesDAO.UpdateCommonName(commonName);
        }
        public ResultContainer DeleteCommonName(int id)
        {
            return _speciesDAO.DeleteCommonName(id);
        }
        #endregion

        #region Geography Map
        public IQueryable<GeographyMap> GeographyMapSearch(Query query)
        {
            return _speciesDAO.GeographyMapSearch(query);
        }
        public ResultContainer AddGeographyMap(GeographyMap geographyMap)
        {
            return _speciesDAO.AddGeographyMap(geographyMap);
        }
        public ResultContainer UpdateGeographyMap(GeographyMap geographyMap)
        {
            return _speciesDAO.UpdateGeographyMap(geographyMap);
        }
        public ResultContainer DeleteGeographyMap(int id)
        {
            return _speciesDAO.DeleteGeographyMap(id);
        }

        #endregion

        #endregion Species

        // ****************************************************************************
        // CROP FOR CWR
        // ****************************************************************************
        #region Crop for CWR

        public IEnumerable<CropForCWR> CropForCWRSearch(Query query)
        {
            return _cropForCwrDAO.Search(query);
        }
        public IEnumerable<CropForCWR> GetCropForCWRFolderItems(int folderId)
        {
            return _cropForCwrDAO.GetFolderItems(folderId);
        }

        public CropForCWR GetCropForCWR(int id)
        {
            return _cropForCwrDAO.Get(id);
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

        public IQueryable<CWRMap> CWRMapSearch(Query query)
        {
            return _cwrMapDAO.Search(query);
        }

        public CWRMap GetCWRMap(int id)
        {
            return _cwrMapDAO.Get(id);
        }

        public IEnumerable<CWRMap> GetCWRMapFolderItems(int folderId)
        {
            return _cwrMapDAO.GetFolderItems(folderId);
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

        #endregion 

        // ****************************************************************************
        // CWR TRAIT
        // ****************************************************************************
        #region CWR Trait

        public IQueryable<CWRTrait> CWRTraitSearch(Query query)
        {
            return _cwrTraitDAO.Search(query);
        }

        public CWRTrait GetCWRTrait(int id)
        {
            return _cwrTraitDAO.Get(id);
        }
        public IQueryable<CWRTrait> GetCWRTraitFolderItems(int folderId)
        {
            return _cwrTraitDAO.GetFolderItems(folderId);
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
        public IQueryable<Citation> GetCitationFolderItems(int folderId)
        {
            return _citationDAO.GetFolderItems(folderId);
        }

        public IEnumerable<Citation> CitationSearch(Query query)
        {
            return _citationDAO.Search(query);
        }

        public ResultContainer AddCitation(Citation citation)
        {
            return _citationDAO.Add(citation);
        }
        public ResultContainer AddTaxonCitation(int citationId, int taxonId, string dataSource)
        {
            return _citationDAO.AddTaxonCitation(citationId, taxonId, dataSource);
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
        public IQueryable<Literature> GetLiteratureFolderItems(int folderId)
        {
            return _citationDAO.GetLiteratureFolderItems(folderId);
        }

        public ResultContainer AddLiterature(Literature literature)
        {
            return _citationDAO.InsertLiterature(literature);
        }
        public ResultContainer UpdateLiterature(Literature literature)
        {
            return _citationDAO.UpdateLiterature(literature);
        }


        public IQueryable<Literature> SearchLiterature(string searchText)
        {
            return _citationDAO.SearchLiterature(searchText);
        }
        public IQueryable<Literature> SearchLiterature(Query query)
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
            return _folderDAO.Get(id);
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
            return _folderDAO.GetFolderItems(folderId, dataSource);
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

        #region Author

        public Author GetAuthor(int id)
        {
            return _authorDAO.Get(id);
        }
        public IQueryable<Author> AuthorSearch(Query query)
        {
            return _authorDAO.Search(query);
        }

        public ResultContainer AddAuthor(Author author)
        {
            return _authorDAO.Add(author);
        }

        public ResultContainer UpdateAuthor(Author author)
        {
            return _authorDAO.Update(author);
        }

        public ResultContainer DeleteAuthor(Author author)
        {
            return _authorDAO.Remove(author);
        }

        #endregion

        #region Regulation

        public Regulation GetRegulation(int id)
        {
            return _regulationDAO.Get(id);
        }

        public ResultContainer AddRegulation(Regulation regulation)
        {
            return _regulationDAO.Add(regulation);
        }
        public ResultContainer UpdateRegulation(Regulation regulation)
        {
            return _regulationDAO.Update(regulation);
        }
        public ResultContainer DeleteRegulation(int id)
        {
            //return _regulationDAO.DeleteRegulationMap
            return null;
        }

        public IQueryable<Regulation> RegulationSearch(Query query)
        {
            return _regulationDAO.Search(query);
        }
        public IQueryable<Regulation> GetRegulationFolderItems(int folderId)
        {
            return _regulationDAO.GetFolderItems(folderId);
        }
        public IQueryable<RegulationMap> RegulationMapSearch(Query query)
        {
            return _regulationDAO.SearchRegulationMaps(query);
        }
        public IQueryable<RegulationMap> GetRegulationMapFolderItems(int folderId)
        {
            return null;
            //return _regulationDAO.getrGetFolderItems(folderId);
        }
        #endregion

        #region Reference
        public List<CodeValueReferenceItem> GetCodeValues(string groupName)
        {
            return _referenceDAO.GetCodeValues(groupName);
        }

        public SysTable GetSysTable(int id)
        {
            return _referenceDAO.GetSysTable(id);
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

        public IEnumerable<Note> NoteSearch(string tableName, string searchString)
        {
            return _referenceDAO.NoteSearch(tableName, searchString);
        }
        public IEnumerable<Authority> AuthoritySearch(string tableName, string searchString)
        {
            return _referenceDAO.AuthoritySearch(tableName, searchString);
        }

        public IEnumerable<Protologue> ProtologueSearch(string searchText)
        {
            return _referenceDAO.ProtologueSearch(searchText);
        }

        public List<Cooperator> GetCreatedByCooperators(string tableName)
        {
            return _speciesDAO.GetCreatedByCooperators(tableName);
        }

        #endregion Reference

        #region Geography

        public List<Region> SearchRegions(string idList)
        {
            return geographyDAO.SearchRegions(idList);
        }

        public List<Country> SearchCountries(string idList)
        {
            return geographyDAO.SearchCountries(idList);
        }

        public List<Geography> SearchMunicipalities(string countryCodeList)
        {
            return geographyDAO.SearchMunicipalities(countryCodeList);
        }

        #endregion Geography

        #region Reports

        public SummaryReport FiscalYearSummary()
        {
            return _reportDAO.GetFiscalYearSummary();
        }

        #endregion Reports
    }
}
