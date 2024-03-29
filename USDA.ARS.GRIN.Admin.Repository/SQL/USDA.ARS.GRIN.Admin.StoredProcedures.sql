USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestStatuses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestsByStatus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestsByStatus_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequests_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequests_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestLock_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestLock_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItems_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestItems_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItem_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestItem_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestEmailAddressList_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestEmailAddressList_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestEmailAddresses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestEmailAddresses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestCooperatorTotals_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestCooperatorTotals_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAddresses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestAddresses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestActions_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestActions_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAction_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestAction_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequest_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequest_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebCooperator_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_UserApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UserApplications_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_UserAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UserAggregate_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_User_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_User_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyTraitTypes_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyTraitTypes_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesSynonym_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesSynonym_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesRelatedSpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesRelatedSpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesProtologues_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesProtologues_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesProtologue_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesProtologue_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesNote_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesNote_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesNameAndSynonym_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesNameAndSynonym_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesName_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesName_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesList_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesList_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesFormaAuthority_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesFormaAuthority_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesAcceptedName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesAcceptedName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesAcceptedName_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesAcceptedName_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationsByWeek_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationsByWeek_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulations_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulations_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegions_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegions_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyNote_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyNote_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyMunicipalities_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyMunicipalities_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyLiterature_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyLiterature_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyLiterature_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyLiterature_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenus_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenus_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenus_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenus_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderSpeciesItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderSpeciesItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFoldersByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderLiteratureItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderLiteratureItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderGenusItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderGenusItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderFamilyItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderFamilyItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCWRMapItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCWRMapItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropMapItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCropMapItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCropForCWRItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCitationItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCitationItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFiscalYearTotals_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamily_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamily_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamily_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamily_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTraits_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTraits_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCropsBySite_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCropsBySite_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCreatedByCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCreatedByCooperators_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCountries_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCountries_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyContinents_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyContinents_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCommonNames_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationSpeciesClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationSpeciesClone_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsBySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsBySpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsBySpecies_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsBySpecies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByLiterature_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsByLiterature_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByGenus_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsByGenus_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByFamily_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsByFamily_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByCategory_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsByCategory_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByAccession_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationsByAccession_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitations_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitations_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationGenusClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationGenusClone_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationFamilyClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitationFamilyClone_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitation_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitation_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCitation_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyAuthority_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyAuthority_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyAccessionsBySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyAccessionsBySpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxnonomyGeniiSelect]
GO
/****** Object:  StoredProcedure [dbo].[usp_TableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TableFieldName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUserGroups_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUserGroups_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUser_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUser_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysGroup_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysGroup_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplates_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysEmailTemplates_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysEmailTemplate_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysEmailTemplate_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysEmailTemplate_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysEmailTemplate_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysApplicationCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysApplicationCooperators_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysApplicationByURL_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysApplicationByURL_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchOperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SearchOperators_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Regulations_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Regulations_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Regulation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Regulation_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPSearch]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPSearch]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPExpirationPeriods_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPExpirationPeriods_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPCommonNames_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationStatuses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByScientificName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsByScientificName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByExpiration_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsByExpiration_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsByCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByCommonName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsByCommonName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByApplicationStatus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsByApplicationStatus_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsAvailable_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplicationsAvailable_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplication_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_PVPApplication_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Owner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Owner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderRequestOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_OrderRequestOwner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_InventoryOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InventoryOwner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_GRINGlobalSites_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GRINGlobalSites_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSpeciesList]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetSpeciesList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCropsBySite]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCropsBySite]
GO
/****** Object:  StoredProcedure [dbo].[usp_GenesysExport_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GenesysExport_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtTableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtTableFieldName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtSysTables_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtSysTables_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCodeValuesByGroupName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCodeValues_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCodesByGroup_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCodeDetail_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCode_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCode_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCode_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DataMgmtCode_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_CropGermplasmCommitteeDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CropGermplasmCommitteeDocument_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_Crop_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Crop_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_CooperatorAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CooperatorAggregate_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_CooperatorAddress_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CooperatorAddress_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_Cooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Cooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeValuesByGroupName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeValues_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodesByGroup_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeDetail_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Code_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Code_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocuments_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCDocuments_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCDocument_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCDocument_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCDocument_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCDocument_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCCommittees_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CGCCommittees_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_RhizobiumHostPlants_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_RhizobiumHostPlants_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_Rhizobium_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_Rhizobium_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_Rhizobium_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_Rhizobium_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentlyExpired_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPRecentlyExpired_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentlyAvailable_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPRecentlyAvailable_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPRecentApplications_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPExpiring6Months_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPExpiring6Months_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPExpirationPeriods_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPExpirationPeriods_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPCommonNames_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPApplicationStatuses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplications_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPApplications_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplicationAvailableAccession_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPApplicationAvailableAccession_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplication_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_PVPApplication_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommittees_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommittees_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocumentsRecent_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocumentsRecent_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_SelectAll]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeCropDescriptors_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeCropDescriptors_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommitteeApplicationStatuses_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommittee_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ARS_CropGermplasmCommittee_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Applications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Applications_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActiveUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ActiveUsers_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtWebUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperatorFromCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtWebCooperatorFromCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtWebCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperator_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtWebCooperator_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUsers_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtUsers_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUserApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtUserApplications_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUserAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtUserAggregate_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtUser_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtTitles_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtTitles_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtTableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtTableFieldName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUsers_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUsers_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUsers_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUserGroups_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUserGroups_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUser_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUser_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysUser_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysGroup_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysGroup_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysApplicationCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysApplicationCooperators_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysApplicationByURL_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSysApplicationByURL_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSearchOperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtSearchOperators_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtOwner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtOrderRequestOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtOrderRequestOwner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtInventoryUser_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtInventoryUser_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtInventoryOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtInventoryOwner_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorWebCooperator_Synch]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperatorWebCooperator_Synch]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorFromWebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperatorFromWebCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperatorAggregate_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorAddress_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperatorAddress_Copy]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperator_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperator_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCodeValuesByGroupName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCodeValues_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCodesByGroup_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCodeDetail_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCode_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCode_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCode_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtCode_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtApplications_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtActiveUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AcctMgmtActiveUsers_Select]
GO
/****** Object:  StoredProcedure [dbo].[update_iv_owner]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[update_iv_owner]
GO
/****** Object:  StoredProcedure [dbo].[LP_SEARCH_RHYZOBIUM]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_SEARCH_RHYZOBIUM]
GO
/****** Object:  StoredProcedure [dbo].[LP_SEARCH_RHIZOBIUM]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_SEARCH_RHIZOBIUM]
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_SEARCH]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_RHIZOBIUM_SEARCH]
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_GET_HOST_PLANT_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_RHIZOBIUM_GET_HOST_PLANT_LIST]
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_RHIZOBIUM_GET_DETAIL]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_SEARCH_AVAILABLE]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_SEARCH_AVAILABLE]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_SEARCH]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_SEARCH]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_GRIN_GLOBAL_ACCESSION]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_GET_GRIN_GLOBAL_ACCESSION]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_GET_DETAIL]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_CROP_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_GET_CROP_LIST]
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_APPLICATION_STATUS_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_PVP_GET_APPLICATION_STATUS_LIST]
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_CGC_GET_LIST]
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_DOCUMENTS]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_CGC_GET_DOCUMENTS]
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_CGC_GET_DETAIL]
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_CROP_DESCRIPTORS]    Script Date: 9/14/2021 6:49:35 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[LP_CGC_GET_CROP_DESCRIPTORS]
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_CROP_DESCRIPTORS]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_CGC_GET_CROP_DESCRIPTORS] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		CD.crop_germplasm_committee_id,
		C.crop_id,
		C.name
	FROM
		dbo.crop_germplasm_committee_crop_descriptor CD
	JOIN
		dbo.crop C
	ON
		CD.crop_id = C.crop_id
	WHERE
		crop_germplasm_committee_id = @crop_germplasm_committee_id
END
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_CGC_GET_DETAIL] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[crop_germplasm_committee_id], 
		[crop_germplasm_committee_name],
		[roster_url],
		[created_date],
		[created_by],
		[modified_date],
		[modified_by]
	FROM
		crop_germplasm_committee CGC
	WHERE
		CGC.crop_germplasm_committee_id = @crop_germplasm_committee_id
END
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_DOCUMENTS]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[LP_CGC_GET_DOCUMENTS]

	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		crop_germplasm_committee_document_id,
		crop_germplasm_committee_id,
		url,
		created_date,
		created_by,
		modified_date,
		modified_by,
		title
	FROM 
		crop_germplasm_committee_document
	WHERE 
		crop_germplasm_committee_id = @crop_germplasm_committee_id
	ORDER BY
		title DESC
END
GO
/****** Object:  StoredProcedure [dbo].[LP_CGC_GET_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_CGC_GET_LIST] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		crop_germplasm_committee_id,
		crop_germplasm_committee_name,
		dbo.crop_germplasm_committee.roster_url
	FROM
		crop_germplasm_committee
	ORDER BY
		crop_germplasm_committee_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_APPLICATION_STATUS_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_PVP_GET_APPLICATION_STATUS_LIST] 
AS
BEGIN
	SELECT 
		status_id,
		description
	FROM 
		pvp_status
	ORDER BY
		description ASC
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_CROP_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_PVP_GET_CROP_LIST] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_crop_id,
		pvp_crop_desc
	FROM 
		pvp_crop
	ORDER BY 
		pvp_crop_desc ASC
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_PVP_GET_DETAIL]
	@crop_description NVARCHAR(60)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[pvpo_catalog_id] ,
		[PVNUMBER] ,
		[VARIETY],
		[EXPERMENTALNAMESYNONYMS] ,
		T.description AS TAXON,
		crop_id ,
		pc.pvp_crop_desc AS CROP,
		pa.name AS APPLICANTOWNER,
		[APPLICATIONDATE] ,
		[CERTIFIEDSEED],
		ps.status_id,
		ps.description AS STATUS,
		[STATUSDATE] ,
		[DATEISSUED],
		[YEARSPROTECTED] ,
		[PAGES],
		[REFILEDUNDER1994PVPA] ,
		[AMENDMENTS] 
	FROM 
		pvpo_catalog pt
	JOIN
		pvp_crop pc
	ON
		pt.crop_id  = pc.pvp_crop_id
	JOIN
		pvp_applicant pa
	ON
		pt.applicant_id = pa.applicant_id
	JOIN 
		pvp_status ps
	ON
		pt.status_id = ps.status_id
	JOIN
		pvp_taxonomy T
	ON
		pt.taxonomy_id = T.taxonomy_id
	WHERE
		pc.pvp_crop_desc = @crop_description
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_GET_GRIN_GLOBAL_ACCESSION]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_PVP_GET_GRIN_GLOBAL_ACCESSION] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		ipr.acid,
		acc.site 
	FROM 
		acc,ipr
	WHERE 
		acc.acid=ipr.acid 
	AND 
		iprtype='PVP' 
	--AND 
	--	iprid='PVP $pvpno'
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_SEARCH]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[LP_PVP_SEARCH] 
AS
BEGIN
	SELECT 
		[pvpo_catalog_id] ,
		[PVNUMBER] ,
		[EXPERMENTALNAMESYNONYMS] ,
		T.description AS TAXON,
		CR.pvp_crop_desc AS CROP,
		A.name AS APPLICANTOWNER,
		[APPLICATIONDATE] ,
		[CERTIFIEDSEED] ,
		s.status_id AS STATUS_ID,
		s.description AS STATUS,
		[STATUSDATE] ,
		[DATEISSUED],
		[YEARSPROTECTED] ,
		[PAGES],
		[REFILEDUNDER1994PVPA] ,
		[AMENDMENTS], 
		ISNULL(VARIETY, EXPERMENTALNAMESYNONYMS) AS VARIETY 
	FROM 
		pvpo_catalog C
	JOIN
		pvp_applicant A
	ON
		C.applicant_id = A.applicant_id
	JOIN
		pvp_status S
	ON
		C.status_id = S.status_id
	JOIN
		pvp_crop CR
	ON
		C.crop_id = CR.pvp_crop_id
	JOIN
	   pvp_taxonomy T
	ON
		C.taxonomy_id = T.taxonomy_id
END
GO
/****** Object:  StoredProcedure [dbo].[LP_PVP_SEARCH_AVAILABLE]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_PVP_SEARCH_AVAILABLE] 
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
	[pvpo_catalog_id] ,
	[PVNUMBER] ,
	[EXPERMENTALNAMESYNONYMS] ,
	[TAXON] ,
	crop_id ,
	applicant_id ,
	[APPLICATIONDATE] ,
	[CERTIFIEDSEED] ,
	status_id,
	[STATUSDATE] ,
	[DATEISSUED],
	[YEARSPROTECTED] ,
	[PAGES],
	[REFILEDUNDER1994PVPA] ,
	[AMENDMENTS], 
	ISNULL(VARIETY, EXPERMENTALNAMESYNONYMS) AS VARIETY,
	accession_id
FROM 
	pvpo_catalog c
JOIN	
	accession_ipr i
ON
	CAST(SUBSTRING(ipr_number,5,20) AS INT) = c.pvnumber
WHERE  
	i.type_code = 'PVP'  
and 
	ipr_number not like '%MP'
and 
	ipr_number not like '%FP'
and 
	ipr_number not like '%P1'
and 
	ipr_number not like '%P2'
and 
	ipr_number not like '%P3'
and 
	dbo.get_avstat(accession_id) = 'Y'
--and 
	--c.crop = '$crop'   
ORDER BY 
	cast(statusdate as date) desc 
END
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_GET_DETAIL]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_RHIZOBIUM_GET_DETAIL]
	@host_plant_name NVARCHAR(254)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[rhy_id]
		,COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier
		,[usda_acces]
		,[synonym_1]
		,[synonym_2]
		,[synonym_3]
		,[synonym_4]
		,[host_plant]
		,[common_nam]
		,[source]
		,[geo_source]
		,[serogroup]
		,[hosts_nodu]
		,[comments]
		,[genus_spp]
	FROM 
		rhy
	WHERE
		LTRIM(RTRIM(host_plant)) = LTRIM(RTRIM(@host_plant_name))
END
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_GET_HOST_PLANT_LIST]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_RHIZOBIUM_GET_HOST_PLANT_LIST] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT
		host_plant
    FROM 
		rhy
	WHERE
		LEN(LTRIM(RTRIM(host_plant))) > 0
	AND
		host_plant IS NOT NULL
	ORDER BY
		host_plant ASC
END
GO
/****** Object:  StoredProcedure [dbo].[LP_RHIZOBIUM_SEARCH]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ===============================================================================
-- Author		: Benjamin Haag
-- Create Date	: 5/17/2019
-- Description	: Returns all Rhyzobium records where one or more fields matches
--				  a specified search criterion.
--
-- Revision History
-- ================
-- Date			By				Description
-- ----		    --              -----------
-- ===============================================================================

CREATE PROCEDURE [dbo].[LP_RHIZOBIUM_SEARCH]
   @searchString VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		rhy_id,
		COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier,
		usda_acces,
		synonym_1,
		synonym_2,
		synonym_3,
		synonym_4 ,
		host_plant ,
		common_nam,
		source,
		geo_source,
		serogroup,
		hosts_nodu,
		comments,
		genus_spp 
	FROM 
		rhy
	WHERE
	LEN(COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp)) > 0
	AND
	(
		LTRIM(RTRIM(rhy.synonym_1)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_2)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_3)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_4)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.host_plant)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.common_nam)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.geo_source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.serogroup)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.hosts_nodu)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.comments)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.genus_spp)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%')
END
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_user]
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_search]
GO
/****** Object:  StoredProcedure [dbo].[LP_SEARCH_RHIZOBIUM]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ===============================================================================
-- Author		: Benjamin Haag
-- Create Date	: 5/17/2019
-- Description	: Returns all Rhyzobium records where one or more fields matches
--				  a specified search criterion.
--
-- Revision History
-- ================
-- Date			By				Description
-- ----		    --              -----------
-- ===============================================================================

CREATE PROCEDURE [dbo].[LP_SEARCH_RHIZOBIUM]
   @searchString VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		rhy_id,
		COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier,
		usda_acces,
		synonym_1,
		synonym_2,
		synonym_3,
		synonym_4 ,
		host_plant ,
		common_nam,
		source,
		geo_source,
		serogroup,
		hosts_nodu,
		comments,
		genus_spp 
	FROM 
		rhy
	WHERE
	LEN(COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp)) > 0
	AND
	(
		LTRIM(RTRIM(rhy.synonym_1)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_2)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_3)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_4)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.host_plant)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.common_nam)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.geo_source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.serogroup)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.hosts_nodu)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.comments)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.genus_spp)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%')
END
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_user]
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_search]
GO
/****** Object:  StoredProcedure [dbo].[LP_SEARCH_RHYZOBIUM]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ===============================================================================
-- Author		: Benjamin Haag
-- Create Date	: 5/17/2019
-- Description	: Returns all Rhyzobium records where one or more fields matches
--				  a specified search criterion.
--
-- Revision History
-- ================
-- Date			By				Description
-- ----		    --              -----------
-- ===============================================================================

CREATE PROCEDURE [dbo].[LP_SEARCH_RHYZOBIUM]
   @searchString VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		rhy_id,
		COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier,
		usda_acces,
		synonym_1,
		synonym_2,
		synonym_3,
		synonym_4 ,
		host_plant ,
		common_nam,
		source,
		geo_source,
		serogroup,
		hosts_nodu,
		comments,
		genus_spp 
	FROM 
		rhy
	WHERE
	LEN(COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp)) > 0
	AND
	(
		LTRIM(RTRIM(rhy.synonym_1)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_2)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_3)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_4)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.host_plant)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.common_nam)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.geo_source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.serogroup)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.hosts_nodu)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.comments)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.genus_spp)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%')
END
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_user]
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_search]
GO
/****** Object:  StoredProcedure [dbo].[update_iv_owner]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure update_iv_owner;

create  procedure [dbo].[update_iv_owner]
@oldcno int,
@newcno int as

-- iv area
update inventory set owned_by=@newcno where owned_by=@oldcno
update inventory_action set owned_by=@newcno where owned_by=@oldcno
update inventory_viability set owned_by=@newcno where owned_by=@oldcno
update inventory_quality_status set owned_by=@newcno where owned_by=@oldcno
update inventory_maint_policy set owned_by=@newcno where owned_by=@oldcno

-- acc_inv area
update accession_inv_annotation set owned_by=@newcno where owned_by=@oldcno
update accession_inv_attach set owned_by=@newcno where owned_by=@oldcno
update accession_inv_name set owned_by=@newcno where owned_by=@oldcno




GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtActiveUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtActiveUsers_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	sys_user_id,
	user_name,
	c.first_name,
	c.last_name,
	c.email,
	c.primary_phone,
	is_enabled,
	c.created_date,
	c.modified_date
FROM
	sys_user su
JOIN
	cooperator c
ON
	su.cooperator_id = c.cooperator_id
WHERE 
	c.status_code = 'ACTIVE'
AND
	su.is_enabled = 'Y'
ORDER BY
	first_name,
	last_name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtApplications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	JOIN	
		sys_group_user_map sgum
	ON
		sg.sys_group_id = sgum.sys_group_id
	WHERE
		sgum.sys_user_id = @sys_user_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCode_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCode_Insert]
	@group_name NVARCHAR(100),
	@code_value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY
	INSERT INTO
		code_value
		(
			group_name,
			value,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@group_name,
			@code_value,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @new_code_value_id = CAST(SCOPE_IDENTITY() AS INT)

		INSERT INTO 
			code_value_lang
			(
				code_value_id,
				sys_lang_id,
				title,
				description,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
			VALUES
			(
				@new_code_value_id,
				@CONST_SYS_LANG_ID,
				@title,
				@description,
				GETDATE(),
				@CONST_COOPERATOR_ID,
				GETDATE(),
				@CONST_COOPERATOR_ID
			)
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
			END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCode_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCode_Update]
	@code_value_id INT,
	@value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY

		UPDATE 
			code_value
		SET
			value = @value,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE code_value_id = @code_value_id

		UPDATE 
			code_value_lang
		SET
			title = @title,
			description = @description,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE 
			code_value_id = @code_value_id
		AND 
			sys_lang_id = 1
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCodeDetail_Select]
	@value NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		value = @value
	AND
		cvl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCodesByGroup_Select]
	@group_name nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date,
		cv.modified_date
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cv.group_name = @group_name
	AND
		cvl.sys_lang_id = 1
	ORDER BY cv.created_date DESC
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCodeValues_Select]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		(group_name LIKE '%' + @CONST_GROUP_NAME + '%'
	OR
		group_name LIKE '%CWR%')
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name, value
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCodeValuesByGroupName_Select]
	@group_name NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		group_name LIKE '%' + @group_name + '%'
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name ASC, value ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperator_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_cooperator_id INT = 0 OUTPUT,
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@site_id int,
	@organization nvarchar(100),
	@organization_abbrev nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@status_code nvarchar(20),
	@category_code nvarchar(20) = NULL,
	@organization_region_code nvarchar(20) = NULL,
	@discipline_code nvarchar(20) = NULL,
	@note nvarchar(max) = NULL,
	@web_cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
		INSERT INTO cooperator
		(
		 site_id
		 ,last_name
		 ,title
		,first_name
		,job
		,organization
		,organization_abbrev
		,address_line1
		,address_line2
		,address_line3
		,city
		,postal_index
		,geography_id
		,primary_phone
		,email
		,status_code
		,category_code
		,organization_region_code
		,discipline_code
		,note
		,sys_lang_id
		,web_cooperator_id
		,created_date
		,created_by
		,owned_date
		,owned_by
		  )
		  VALUES
		  (
			@site_id,
			@last_name,
			@title,
			@first_name,
			@job,
			@organization,
			@organization_abbrev,
			@address_line1,
			@address_line2,
			@address_line3,
			@city,
			@postal_index,
			@geography_id,
			@primary_phone,
			@email,
			'ACTIVE',
			@category_code,
			@organization_region_code,
			@discipline_code,
			@note,
			1,
			@web_cooperator_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
		SET @out_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperator_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperator_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	DECLARE @sql_statement NVARCHAR(MAX)
	
	SET NOCOUNT ON;
	BEGIN TRY
		SET @sql_statement = 'SELECT 
								sys_user_id,
								user_name,
								web_cooperator_id,
								cooperator_id,
								current_cooperator_id,
								site_id,
								site_short_name,
								last_name,
								title,
								first_name,
								job,
								organization,
								organization_abbrev,
								address_line1,
								address_line2,
								address_line3,
								city,
								postal_index,
								geography_id,
								secondary_organization,
								secondary_organization_abbrev,
								secondary_address_line1,
								secondary_address_line2,
								secondary_address_line3,
								secondary_city,
								secondary_postal_index,
								secondary_geography_id,
								primary_phone,
								secondary_phone,
								fax,
								email,
								secondary_email,
								status_code,
								category_code,
								organization_region_code,
								discipline_code,
								note,
								created_date,
								created_by,
								modified_date,
								modified_by,
								owned_date,
								owned_by,
							FROM 
								vw_gringlobal_cooperators '
		SET @sql_statement = @sql_statement + @sql_where_clause
		EXECUTE sp_executesql @sql_statement
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorAddress_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperatorAddress_Copy]
 @source_cooperator_id INT,
 @target_cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

DROP TABLE IF EXISTS ##temp_cooperator 
CREATE TABLE ##temp_cooperator 
(
	temp_cooperator_id [int],
	site_id [int] NULL,
	organization [nvarchar](100) NULL,
	organization_abbrev [nvarchar](10) NULL,
	address_line1 [nvarchar](100) NULL,
	address_line2 [nvarchar](100) NULL,
	address_line3 [nvarchar](100) NULL,
	city [nvarchar](100) NULL,
	postal_index [nvarchar](100) NULL,
	geography_id [int] NULL,
	category_code NVARCHAR(20) NULL,
	organization_region_code NVARCHAR(20) NULL,
	discipline_code NVARCHAR(20) NULL
);

SELECT * FROM ##temp_cooperator

INSERT INTO ##temp_cooperator
	(temp_cooperator_id,
	site_id ,
	organization ,
	organization_abbrev ,
	address_line1,
	address_line2,
	address_line3 ,
	city ,
	postal_index ,
	geography_id,
	category_code,
	organization_region_code,
	discipline_code)
SELECT
	cooperator_id ,
	site_id ,
	organization ,
	organization_abbrev ,
	address_line1,
	address_line2,
	address_line3 ,
	city ,
	postal_index ,
	geography_id,
	category_code,
	organization_region_code,
	discipline_code
FROM
	cooperator
WHERE
	cooperator_id = @source_cooperator_id

UPDATE 
	cooperator 
SET 
	address_line1 = tc.address_line1,
	address_line2 = tc.address_line2,
	address_line3 = tc.address_line3,
	site_id = tc.site_id,
	city = tc.city,
	postal_index = tc.postal_index,
	geography_id = tc.geography_id,
	category_code = tc.category_code,
	organization_region_code = tc.organization_region_code,
	discipline_code = tc.discipline_code,
	modified_by = 1,
	modified_date = GETDATE()
FROM 
	##temp_cooperator tc
WHERE
	cooperator.cooperator_id = @target_cooperator_id 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperatorAggregate_Search]
	@search_text NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		'PROD',
		c.status_code,
		c.cooperator_id,
		c.web_cooperator_id,
		c.last_name,
		c.first_name,
		c.email,
		c.site_id,
		c.address_line1,
		c.address_line2,
		c.address_line3,
		c.city,
		c.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS address_state,
		c.postal_index,
		c.primary_phone,
		c.created_date,
		c.modified_date
	FROM
		cooperator c
	WHERE
		first_name LIKE '%' + @search_text + '%'
	OR
	   last_name LIKE '%' + @search_text + '%'
	OR
		email LIKE '%' + @search_text + '%'
	UNION
	SELECT
		'TRAINING',
		c.status_code,
		c.cooperator_id,
		c.web_cooperator_id,
		c.last_name,
		c.first_name,
		c.email,
		c.site_id,
		c.address_line1,
		c.address_line2,
		c.address_line3,
		c.city,
		c.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS address_state,
		c.postal_index,
		c.primary_phone,
		c.created_date,
		c.modified_date
	FROM
		training.dbo.cooperator c
	WHERE
		first_name LIKE '%' + @search_text + '%'
	OR
	   last_name LIKE '%' + @search_text + '%'
	OR
		email LIKE '%' + @search_text + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorFromWebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperatorFromWebCooperator_Insert] 
	@web_cooperator_id INT
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @new_web_cooperator_id INT

	INSERT INTO 
		cooperator
		(
		last_name,
		title,
		first_name,
		job,
		organization,
		organization_abbrev ,
		address_line1 ,
		address_line2 ,
		address_line3 ,
		city ,
		postal_index ,
		geography_id ,
		primary_phone,
		email,
		status_code,
		category_code,
		organization_region_code,
		discipline_code,
		note,
		sys_lang_id,
		web_cooperator_id,
		created_date,
		created_by,
		owned_date,
		owned_by)
		SELECT
	last_name  ,
	title ,
	first_name,
	job,
	organization ,
	organization_code ,
	address_line1 ,
	address_line2 ,
	address_line3 ,
	city ,
	postal_index ,
	geography_id ,
	primary_phone,
	email,
	is_active,
	category_code,
	organization_region,
	discipline,
	note,
	1,
	@web_cooperator_id,
	created_date ,
	48 ,
	owned_date ,
	48

	FROM 
	web_cooperator
	WHERE
web_cooperator_id = @web_cooperator_id

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtCooperatorWebCooperator_Synch]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtCooperatorWebCooperator_Synch]
	@out_error_number INT = 0 OUTPUT,
	@out_web_cooperator_id INT = 0 OUTPUT,
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ADMIN_COOPERATOR_ID INT = 1

	BEGIN TRY
		INSERT INTO 
			web_cooperator
			(last_name,
			title,
			first_name,
			job,
			organization,
			organization_code,
			address_line1,
			address_line2,
			address_line3,
			city,
			postal_index,
			geography_id,
			primary_phone,
			secondary_phone,
			fax,
			email,
			is_active,
			category_code,
			organization_region,
			discipline,
			note,
			created_date,
			created_by,
			modified_date,
			modified_by,
			owned_date,
			owned_by)
		SELECT
			last_name,
			title,
			first_name,
			job,
			organization,
			organization_abbrev,
			address_line1,
			address_line2,
			address_line3,
			city,
			postal_index,
			geography_id,
			primary_phone,
			secondary_phone,
			fax,
			email,
			'ACTIVE',
			category_code,
			organization_region_code,
			discipline_code,
			note,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		FROM 
			cooperator
		WHERE
			cooperator_id = @cooperator_id
		SET @out_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtInventoryOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtInventoryOwner_Update]
	@inventory_id INT,
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE 
		inventory 
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_action
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_viability
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_quality_status
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_annotation
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_attach
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_name
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtInventoryUser_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure update_iv_owner;

create  procedure [dbo].[usp_AcctMgmtInventoryUser_Update]
@oldcno int,
@newcno int as

-- iv area
update inventory set owned_by=@newcno where owned_by=@oldcno
update inventory_action set owned_by=@newcno where owned_by=@oldcno
update inventory_viability set owned_by=@newcno where owned_by=@oldcno
update inventory_quality_status set owned_by=@newcno where owned_by=@oldcno
update inventory_maint_policy set owned_by=@newcno where owned_by=@oldcno

-- acc_inv area
update accession_inv_annotation set owned_by=@newcno where owned_by=@oldcno
update accession_inv_attach set owned_by=@newcno where owned_by=@oldcno
update accession_inv_name set owned_by=@newcno where owned_by=@oldcno




GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtOrderRequestOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_AcctMgmtOrderRequestOwner_Update]
	@out_error_number INT = 0 OUTPUT,
	@order_request_id INT,
	@modified_by INT,
	@owned_by INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE 
			order_request
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_item
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_action
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_attach
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtOwner_Update] 
	@out_error_number INT = 0 OUTPUT,
	@table_name NVARCHAR(50),
	@record_id INT,
	@owned_by INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(500)
	DECLARE @pk_column NVARCHAR(50)
	BEGIN TRY
		SELECT @pk_column = 
			stf.field_name
		FROM 
			sys_table st
		JOIN
			sys_table_field stf
		ON
			st.sys_table_id = stf.sys_table_id
		WHERE
			table_name = @table_name
		AND	
			stf.field_purpose = 'PRIMARY_KEY'

		SET @sql_statement = 'UPDATE ' + @table_name + ' SET owned_by=' + CONVERT(NVARCHAR(10), @owned_by) + ', owned_date = GETDATE(), modified_by = 48, modified_date = GETDATE() WHERE ' + @pk_column + '=' + CONVERT(NVARCHAR(10), @record_id)
		EXECUTE sp_executesql @sql_statement
		
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSearchOperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AcctMgmtSearchOperators_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_search_operator_id,
		title,
		syntax
	FROM 
		sys_search_operator
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysApplicationByURL_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysApplicationByURL_Select] 
	@url NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[sys_application_id]
		,[sys_group_id]
		,[group_tag]
		,[code]
		,[title]
		,[description]
		,[url]
		,[color_code]
		,[image_file_name]
	FROM 
		[vw_AcctMgmtSysApplication]
	WHERE
		url = @url
		END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysApplicationCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysApplicationCooperators_Select]
	@sys_group_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		c.cooperator_id,
		c.last_name,
		c.first_name,
		c.last_name + ', ' + c.first_name AS full_name,
		c.email
	FROM
		sys_group_user_map sgum
	JOIN
		sys_user su
	ON
		sgum.sys_user_id = su.sys_user_id
	JOIN
		cooperator c
	ON
		su.cooperator_id = c.cooperator_id
	WHERE
		sys_group_id = @sys_group_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysGroup_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysGroup_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_group_id INT = 0 OUTPUT,
	@group_tag NVARCHAR(20)
AS
BEGIN

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_IS_ENABLED NVARCHAR(1) = 'Y'

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO 
			sys_group
			(
				group_tag,
				is_enabled,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
		VALUES
		(
			@group_tag,
			@CONST_IS_ENABLED,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @out_group_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUser_Copy]
	@out_error_number INT = 0 OUTPUT,
	@out_sys_user_id INT = 0 OUTPUT,
	@user_name nvarchar(50),
	@password nvarchar(2000),
	@cooperator_id INT
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	SET @cooperator_id = 180787

	BEGIN TRY
		-- ========================================================================
		-- USER
		-- ========================================================================
		INSERT INTO training.dbo.sys_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 cooperator_id,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by
		)
		SELECT
		
		 user_name,
		 password,
		 is_enabled,
		 @cooperator_id,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID
		FROM
		sys_user
		WHERE 
			sys_user_id = 0




		-- ========================================================================
		-- DEFAULT GROUPS
		-- ========================================================================
		INSERT INTO 
			sys_group_user_map
			(
				sys_group_id,
				sys_user_id,
				created_date,
				created_by,
				owned_date,
				owned_by
  			)
			VALUES
			(
				2,
				@out_sys_user_id,
				GETDATE(),
				@ADMIN_COOPERATOR_ID,
				GETDATE(),
				@ADMIN_COOPERATOR_ID
			)

		INSERT INTO 
		sys_group_user_map
		(
			sys_group_id,
			sys_user_id,
			created_date,
			created_by,
			owned_date,
			owned_by
  		)
		VALUES
		(
			3,
			@out_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUser_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_sys_user_id INT = 0 OUTPUT,
	@user_name nvarchar(50),
	@password nvarchar(2000),
	@cooperator_id INT
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	BEGIN TRY
		-- ========================================================================
		-- USER
		-- ========================================================================
		INSERT INTO sys_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 cooperator_id,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @cooperator_id,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID
		)
		SET @out_sys_user_id = CAST(SCOPE_IDENTITY() AS INT)

		-- ========================================================================
		-- DEFAULT GROUPS
		-- ========================================================================
		INSERT INTO 
			sys_group_user_map
			(
				sys_group_id,
				sys_user_id,
				created_date,
				created_by,
				owned_date,
				owned_by
  			)
			VALUES
			(
				2,
				@out_sys_user_id,
				GETDATE(),
				@ADMIN_COOPERATOR_ID,
				GETDATE(),
				@ADMIN_COOPERATOR_ID
			)

		INSERT INTO 
		sys_group_user_map
		(
			sys_group_id,
			sys_user_id,
			created_date,
			created_by,
			owned_date,
			owned_by
  		)
		VALUES
		(
			3,
			@out_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUser_Search] 
	@search_text NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_select NVARCHAR(2000)
	DECLARE @sql_where NVARCHAR(500)

	SET @sql_select = 'SELECT  
		user_name,
		password,
		is_enabled,
		cooperator_id,
		created_date,
		created_by,
		owned_date,
		owned_by
	FROM
		sys_user'

	IF LEN(TRIM(@search_text)) > 0
		BEGIN
			SET @sql_where = ' WHERE user_name LIKE ''%' + @search_text + '%'''
			SET @sql_select = @sql_select + @sql_where
		END

	EXECUTE sp_executesql @sql_select
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUser_Select] 
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		su.sys_user_id,
		su.user_name,
		su.password,
		su.is_enabled,
		su.created_date,
		su.created_by,
		su.modified_date,
		su.modified_by,
		wu.web_user_id,
		wu.user_name AS web_user_name,
		c.cooperator_id,
		wc.web_cooperator_id,
		c.first_name,
		c.last_name,
		c.email,
		c.organization,
		c.organization_abbrev,
		c.organization_region_code,
		c.job,
		c.address_line1,
		c.address_line2,
		c.address_line3,
		c.city,
		c.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS state,
		c.postal_index
	FROM
		sys_user su
	JOIN
		cooperator c
	ON
		su.cooperator_id = c.cooperator_id
	LEFT JOIN
			web_cooperator wc
	ON
		c.web_cooperator_id = wc.web_cooperator_id
	LEFT JOIN
		web_user wu
	ON
		wc.web_cooperator_id = wu.web_cooperator_id
	WHERE
		sys_user_id = @sys_user_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUser_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUser_Update]
	@out_error_number INT = 0 OUTPUT,
	@sys_user_id INT,
	@user_name nvarchar(50),
	@password nvarchar(2000)
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	BEGIN TRY
		UPDATE
			sys_user
		SET
			password = @password,
			modified_by = @ADMIN_COOPERATOR_ID,
			modified_date = GETDATE()
		WHERE
			sys_user_id = @sys_user_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUserGroups_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUserGroups_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		sys_group_user_map_id,
		sg.sys_group_id,
		sg.group_tag
	FROM 
		sys_group_user_map sgum
	JOIN
		sys_group sg
	ON
		sgum.sys_group_id = sg.sys_group_id
	WHERE
		sys_user_id = @sys_user_id
	ORDER BY 
		group_tag
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUsers_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUsers_Search] 
	@sql_where_clause NVARCHAR(MAX) NULL 
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX)

	BEGIN TRY

		SET @sql = 'SELECT  
			su.sys_user_id,
			su.user_name,
			su.password,
			su.is_enabled,
			su.created_date,
			su.created_by,
			su.modified_date,
			su.modified_by,
			wu.web_user_id,
			wu.user_name AS web_user_name,
			c.cooperator_id,
			wc.web_cooperator_id,
			wc.email AS web_cooperator_email,
			wc.first_name AS web_cooperator_first_name,
			wc.last_name AS web_cooperator_last_name,
			c.first_name,
			c.last_name,
			c.email,
			c.organization,
			c.organization_abbrev,
			c.organization_region_code,
			c.job,
			c.address_line1,
			c.address_line2,
			c.address_line3,
			c.city,
			c.geography_id,
			(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS state,
			c.postal_index
		FROM
			sys_user su
		JOIN
			cooperator c
		ON
			su.cooperator_id = c.cooperator_id
		LEFT JOIN
				web_cooperator wc
		ON
			c.web_cooperator_id = wc.web_cooperator_id
		LEFT JOIN
			web_user wu
		ON
			wc.web_cooperator_id = wu.web_cooperator_id'

		IF (LEN(TRIM(@sql_where_clause)) > 0)
			BEGIN
				SET @sql = @sql + ' ' + @sql_where_clause
			END

		EXECUTE sp_executesql @sql

	END TRY
	BEGIN CATCH
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtSysUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtSysUsers_Select] 
	AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	SELECT  
		su.sys_user_id,
		c.cooperator_id,
		su.user_name,
		su.password,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		su.owned_date,
		su.owned_by
	FROM
		sys_user su
	JOIN
		cooperator c
	ON
		su.cooperator_id = c.cooperator_id
	ORDER BY
		user_name 
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtTableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtTableFieldName_Select]
	@title NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		field_name
	FROM 
		vw_AcctMgmtSysTableFields
	WHERE
	 	table_name = @title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtTitles_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtTitles_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		DISTINCT title
	FROM
		cooperator
	WHERE 
		title IS NOT NULL
	ORDER BY
		title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtUser_Search]
	@user_name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.web_cooperator_id,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		co.address_line1,
		co.address_line2,
		co.address_line3,
		co.city,
		co.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = co.geography_id) AS address_state,
		co.primary_phone,
		co.title,
		co.job,
		g.adm1 AS state,
		co.postal_index,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name,
		s.site_long_name
	FROM 
		sys_user su
	LEFT JOIN 
		cooperator co 
	ON 
		su.cooperator_id = co.cooperator_id
	LEFT JOIN 
		site s 
	ON 
		co.site_id = s.site_id
	LEFT JOIN
		geography g
    ON
		co.geography_id = g.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1

	WHERE 
		su.user_name LIKE '%' + @user_name + '%' 
	AND 
		su.is_enabled = 'Y'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtUser_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.web_cooperator_id,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		co.address_line1,
		co.address_line2,
		co.address_line3,
		co.city,
		co.geography_id,
		g.adm1 AS state,
		co.primary_phone,
		co.title,
		co.job,
		co.postal_index,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name,
		s.site_long_name
	FROM 
		sys_user su
	LEFT JOIN 
		cooperator co 
	ON 
		su.cooperator_id = co.cooperator_id
	LEFT JOIN 
		site s 
	ON 
		co.site_id = s.site_id
	LEFT JOIN
		geography g
    ON
		co.geography_id = g.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1
	WHERE 
		su.sys_user_id = @sys_user_id 
	AND 
		su.is_enabled = 'Y'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUserAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtUserAggregate_Search] 
	@search_text NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

SELECT 
	'SYS_USER',
	sys_user_id, 
	user_name, 
	password,
	is_enabled,
	created_date,
	modified_date
FROM 
	sys_user su
WHERE
	user_name LIKE '%' + @search_text + '%'
UNION
SELECT 
	'WEB_USER',
	web_user_id, 
	user_name, 
	password,
	is_enabled,
	created_date,
	modified_date
FROM 
	web_user wu
WHERE
	user_name LIKE '%' + @search_text + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUserApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtUserApplications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		sys_application_id,
		sys_group_id,
		group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name,
		(SELECT 
			COUNT(*) 
		 FROM 
			sys_group_user_map 
		 WHERE 
			sys_group_id = vsa.sys_group_id 
		 AND 
			sys_user_id = @sys_user_id) AS is_authorized
	FROM
		vw_AcctMgmtSysApplication vsa
	ORDER BY
		vsa.title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtUsers_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtUsers_Search]
	@sql_where_clause NVARCHAR(MAX) NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sql NVARCHAR(MAX)
	
	SET @sql = 'SELECT 
	su.sys_user_id,
	su.user_name,
	su.password,
	su.is_enabled,
	su.created_date AS sys_user_created_date,
	su.created_by AS sys_user_created_by,
	su.modified_date AS sys_user_modified_date,
	su.modified_by AS sys_user_modified_by,
	co.cooperator_id,
	co.web_cooperator_id,
	co.first_name,
	co.last_name,
	co.primary_phone,
	co.email,
	co.title,
	co.job,
	co.organization,
	co.organization_abbrev,
	co.address_line1,
	co.address_line2,
	co.address_line3,
	co.city,
	co.geography_id,
	(SELECT adm1 FROM geography WHERE geography_id = co.geography_id) AS address_state,
	co.postal_index,
	co.created_date AS sys_user_created_date,
	co.created_by AS sys_user_created_by,
	co.modified_date AS sys_user_modified_date,
	co.modified_by AS sys_user_modified_by,
	s.site_id,
	s.site_short_name,
	s.site_long_name
FROM 
	sys_user su
JOIN 
	cooperator co 
ON 
	su.cooperator_id = co.cooperator_id
JOIN 
	site s 
ON 
	co.site_id = s.site_id
JOIN
	geography g
ON
	co.geography_id = g.geography_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sql = @sql + ' ' +  @sql_where_clause 
		END

	EXECUTE sp_executesql @sql
END

GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperator_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtWebCooperator_Copy] 
	@cooperator_id INT
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @new_web_cooperator_id INT
	
	-- Web Cooperator
	INSERT INTO web_cooperator
	(
	[last_name]  ,
	[title] ,
	[first_name],
	[job],
	[organization] ,
	[organization_code] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	[is_active],
	[category_code],
	[organization_region],
	[discipline],
	[note],
	[created_date] ,
	[created_by] ,
	[owned_date] ,
	[owned_by]
	)
	SELECT
	last_name,
	title,
	first_name,
	job,
	organization,
	[organization_abbrev] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	CASE
		WHEN 
			status_code = 'ACTIVE'
		THEN
			'Y'
		ELSE 
			'N'
	END,
	[category_code],
	[organization_region_code],
	[discipline_code],
	[note],
	GETDATE(),
	1,
	GETDATE(),
	1
	FROM 
		cooperator
	WHERE
		cooperator_id = @cooperator_id

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtWebCooperator_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_web_cooperator_id INT = 0 OUTPUT,
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@organization nvarchar(100),
	@organization_code nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@is_active nvarchar(1),
	@category_code nvarchar(20) = NULL,
	@organization_region nvarchar(20) = NULL,
	@discipline nvarchar(20) = NULL,
	@note nvarchar(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
		INSERT INTO web_cooperator
			(
			[last_name]  ,
			[title] ,
			[first_name],
			[job],
			[organization] ,
			[organization_code] ,
			[address_line1] ,
			[address_line2] ,
			[address_line3] ,
			[city] ,
			[postal_index] ,
			[geography_id] ,
			[primary_phone],
			[email],
			[is_active],
			[category_code],
			[organization_region],
			[discipline],
			[note],
			[created_date] ,
			[created_by] ,
			[owned_date] ,
			[owned_by]
			)
		VALUES
			(
			@last_name,
			@title,
			@first_name,
			@job,
			@organization,
			@organization_code,
			@address_line1,
			@address_line2,
			@address_line3,
			@city,
			@postal_index,
			@geography_id,
			@primary_phone,
			@email,
			'Y',
			@category_code,
			@organization_region,
			@discipline,
			@note,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID
			)
		SET @out_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebCooperatorFromCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtWebCooperatorFromCooperator_Insert] 
	@cooperator_id INT
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @new_web_cooperator_id INT
	
	-- Web Cooperator
	INSERT INTO web_cooperator
	(
	[last_name]  ,
	[title] ,
	[first_name],
	[job],
	[organization] ,
	[organization_code] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	[is_active],
	[category_code],
	[organization_region],
	[discipline],
	[note],
	[created_date] ,
	[created_by] ,
	[owned_date] ,
	[owned_by]
	)
	SELECT
	last_name,
	title,
	first_name,
	job,
	organization,
	[organization_abbrev] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	CASE
		WHEN 
			status_code = 'ACTIVE'
		THEN
			'Y'
		ELSE 
			'N'
	END,
	[category_code],
	[organization_region_code],
	[discipline_code],
	[note],
	GETDATE(),
	1,
	GETDATE(),
	1
	FROM 
		cooperator
	WHERE
		cooperator_id = @cooperator_id

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AcctMgmtWebUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AcctMgmtWebUser_Insert]
	 @out_error_number INT = 0 OUTPUT,
	 @out_web_user_id INT = 0 OUTPUT,
	 @user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO web_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 web_cooperator_id,
		 sys_lang_id,
		 created_date
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @web_cooperator_id,
		 1,
		 GETDATE()
		)
		SET @out_web_user_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ActiveUsers_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActiveUsers_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	sys_user_id,
	user_name,
	c.first_name,
	c.last_name,
	c.email,
	c.primary_phone,
	is_enabled,
	c.created_date,
	c.modified_date
FROM
	sys_user su
JOIN
	cooperator c
ON
	su.cooperator_id = c.cooperator_id
WHERE 
	c.status_code = 'ACTIVE'
AND
	su.is_enabled = 'Y'
ORDER BY
	first_name,
	last_name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Applications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Applications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	JOIN	
		sys_group_user_map sgum
	ON
		sg.sys_group_id = sgum.sys_group_id
	WHERE
		sgum.sys_user_id = @sys_user_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommittee_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommittee_Select] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[crop_germplasm_committee_id], 
		[crop_germplasm_committee_name],
		[roster_url],
		[created_date],
		[created_by],
		[modified_date],
		[modified_by]
	FROM
		crop_germplasm_committee CGC
	WHERE
		CGC.crop_germplasm_committee_id = @crop_germplasm_committee_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeApplicationStatuses_Select] 
AS
BEGIN
	SELECT 
		status_id,
		description
	FROM 
		pvp_status
	ORDER BY
		description ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeCropDescriptors_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeCropDescriptors_Select] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		CD.crop_germplasm_committee_id,
		C.crop_id,
		C.name
	FROM
		dbo.crop_germplasm_committee_crop_descriptor CD
	JOIN
		dbo.crop C
	ON
		CD.crop_id = C.crop_id
	WHERE
		crop_germplasm_committee_id = @crop_germplasm_committee_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Delete]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM
			crop_germplasm_committee_document
		WHERE
			crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_crop_germplasm_committee_document_id INT = 0 OUTPUT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@document_year INT,
	@category_code NVARCHAR(4),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		INSERT INTO
			crop_germplasm_committee_document
			(crop_germplasm_committee_id,
			 document_title,
			 category_code,
			 document_year,
			 url,
			 created_by,
			 created_date)
		VALUES
			(
			@crop_germplasm_committee_id,
			@title,
			@category_code,
			@document_year,
			@url,
			48,
			GETDATE()
			)
			SELECT @out_crop_germplasm_committee_document_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Select]
	@crop_germplasm_committee_document_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		cgc.crop_germplasm_committee_name,
		cgcd.document_title,
		cgcd.category_code,
		vcldc.title AS category_title,
		cgcd.document_year,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	LEFT OUTER JOIN
		vw_cgc_lookup_document_categories vcldc
	ON
		cgcd.category_code = vcldc.value
	LEFT OUTER JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	WHERE
		crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocument_Update]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@document_year INT,
	@category_code NVARCHAR(4),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		UPDATE
			crop_germplasm_committee_document
		SET
			crop_germplasm_committee_id = @crop_germplasm_committee_id, 
			document_title = @title,
			document_year = @document_year,
			category_code = @category_code,
			url = @url,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE
			crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_Select]
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		document_title,
		category_code,
		document_year,
		(SELECT title FROM vw_cgc_lookup_document_categories WHERE value = cgcd.category_code) AS category,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	WHERE
		cgcd.crop_germplasm_committee_id = @crop_germplasm_committee_id
	ORDER BY
		created_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_SelectAll]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocuments_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		document_title,
		category_code,
		document_year,
		(SELECT title FROM vw_cgc_lookup_document_categories WHERE value = cgcd.category_code) AS category,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	ORDER BY
		created_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommitteeDocumentsRecent_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommitteeDocumentsRecent_Select]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		document_title,
		category_code,
		document_year,
		(SELECT title FROM vw_cgc_lookup_document_categories WHERE value = cgcd.category_code) AS category,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	WHERE
		cgcd.modified_date >= DATEADD(day,-120, GETDATE())
	ORDER BY
		created_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_CropGermplasmCommittees_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_CropGermplasmCommittees_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [crop_germplasm_committee_id]
		,[crop_germplasm_committee_name]
		,[roster_url]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
  FROM 
	crop_germplasm_committee
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplication_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPApplication_Select]
	@crop_description NVARCHAR(60)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[pvpo_catalog_id] ,
		[PVNUMBER] ,
		[VARIETY],
		[EXPERMENTALNAMESYNONYMS] ,
		T.description AS TAXON,
		crop_id ,
		pc.pvp_crop_desc AS CROP,
		pa.name AS APPLICANTOWNER,
		[APPLICATIONDATE] ,
		[CERTIFIEDSEED],
		ps.status_id,
		ps.description AS STATUS,
		[STATUSDATE] ,
		[DATEISSUED],
		[YEARSPROTECTED] ,
		[PAGES],
		[REFILEDUNDER1994PVPA] ,
		[AMENDMENTS] 
	FROM 
		pvpo_catalog pt
	JOIN
		pvp_crop pc
	ON
		pt.crop_id  = pc.pvp_crop_id
	JOIN
		pvp_applicant pa
	ON
		pt.applicant_id = pa.applicant_id
	JOIN 
		pvp_status ps
	ON
		pt.status_id = ps.status_id
	JOIN
		pvp_taxonomy T
	ON
		pt.taxonomy_id = T.taxonomy_id
	WHERE
		pc.pvp_crop_desc = @crop_description
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplicationAvailableAccession_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPApplicationAvailableAccession_Select] 
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
	[pvpo_catalog_id] ,
	[PVNUMBER] ,
	[EXPERMENTALNAMESYNONYMS] ,
	[TAXON] ,
	crop_id ,
	applicant_id ,
	[APPLICATIONDATE] ,
	[CERTIFIEDSEED] ,
	status_id,
	[STATUSDATE] ,
	[DATEISSUED],
	[YEARSPROTECTED] ,
	[PAGES],
	[REFILEDUNDER1994PVPA] ,
	[AMENDMENTS], 
	ISNULL(VARIETY, EXPERMENTALNAMESYNONYMS) AS VARIETY,
	accession_id
FROM 
	pvpo_catalog c
JOIN	
	accession_ipr i
ON
	CAST(SUBSTRING(ipr_number,5,20) AS INT) = c.pvnumber
WHERE  
	i.type_code = 'PVP'  
and 
	ipr_number not like '%MP'
and 
	ipr_number not like '%FP'
and 
	ipr_number not like '%P1'
and 
	ipr_number not like '%P2'
and 
	ipr_number not like '%P3'
and 
	dbo.get_avstat(accession_id) = 'Y'
--and 
	--c.crop = '$crop'   
ORDER BY 
	cast(statusdate as date) desc 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplications_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPApplications_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	--SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
	 pa.pvp_application_number
     ,cultivar_name
     ,experimental_name
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
	 ,pc.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name
     ,application_date
     ,is_certified_seed
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,status_date
     ,certificate_issued_date
     ,years_protected
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,paam.accession_id
	FROM 
		pvp_application pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		pvp_application_accession_map paam
	ON
		pa.pvp_application_number = paam.pvp_application_number'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	DECLARE @Results TABLE
	(pvp_application_number INT,
	 cultivar_name NVARCHAR(150),
     experimental_name NVARCHAR(150),
     pvp_crop_id INT,
	 scientific_name NVARCHAR(150),
	 common_name NVARCHAR(150),
     pvp_applicant_id INT,
	 applicant_name NVARCHAR(150),
     application_date DATETIME2(7),
     is_certified_seed BIT,
     pvp_application_status_id INT,
	 application_status NVARCHAR(120),
     status_date DATETIME2(7),
     certificate_issued_date DATETIME2(7),
     years_protected INT,
	 expiration_date DATETIME2(7),
	 months_remaining INT,
	 accession_id INT)

	INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	SELECT 
		pvp_application_number,
		cultivar_name,
		experimental_name,
		pvp_crop_id,
		scientific_name,
		common_name,
		pvp_applicant_id,
		applicant_name,
		application_date,
		is_certified_seed,
		pvp_application_status_id,
		application_status,
		status_date,
		certificate_issued_date,
		years_protected,
		expiration_date,
		months_remaining,
		accession_id
	FROM @Results
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPApplicationStatuses_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_application_status_id AS id,
		description AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_application_status_id = s.pvp_application_status_id) AS count
	FROM
		pvp_application_status s
	ORDER BY title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPCommonNames_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_common_name_id AS id,
		name AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_common_name_id = c.pvp_common_name_id) AS count
	FROM
		pvp_common_name c
	ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPExpirationPeriods_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPExpirationPeriods_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DISTINCT 
		sort_order, 
		category,
		(SELECT COUNT(*) FROM vw_pvp_applications_by_expiration WHERE sort_order = vpae.sort_order) AS count
	FROM 
		vw_pvp_applications_by_expiration vpae
	ORDER BY
		sort_order
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPExpiring6Months_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPExpiring6Months_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE 
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) < (DATEADD(month,6,GETDATE()))
	AND
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) > GETDATE()
	AND
		pas.pvp_application_status_id = 18
	ORDER BY
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPRecentApplications_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	
	WHERE
	 DATEDIFF(month,cast(application_date as date),GETDATE()) BETWEEN 1 AND 3
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentlyAvailable_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPRecentlyAvailable_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	  pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE
		vpam.accession_id IS NOT NULL
	AND
		DATEDIFF(month,status_date,GETDATE()) < 6
	AND 
		status_date < getdate()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_PVPRecentlyExpired_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_PVPRecentlyExpired_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) >= DATEADD(day, -30, GETDATE())
	AND (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) < GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_Rhizobium_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ===============================================================================
-- Author		: Benjamin Haag
-- Create Date	: 5/17/2019
-- Description	: Returns all Rhyzobium records where one or more fields matches
--				  a specified search criterion.
--
-- Revision History
-- ================
-- Date			By				Description
-- ----		    --              -----------
-- ===============================================================================

CREATE PROCEDURE [dbo].[usp_ARS_Rhizobium_Search]
   @searchString VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		rhy_id,
		COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier,
		usda_acces,
		synonym_1,
		synonym_2,
		synonym_3,
		synonym_4 ,
		host_plant ,
		common_nam,
		source,
		geo_source,
		serogroup,
		hosts_nodu,
		comments,
		genus_spp 
	FROM 
		rhy
	WHERE
	LEN(COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp)) > 0
	AND
	(
		LTRIM(RTRIM(rhy.synonym_1)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_2)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_3)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_4)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.host_plant)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.common_nam)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.geo_source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.serogroup)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.hosts_nodu)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.comments)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.genus_spp)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%')
END
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_user]
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_search]
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_Rhizobium_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_Rhizobium_Select]
	@host_plant_name NVARCHAR(254)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[rhy_id]
		,COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier
		,[usda_acces]
		,[synonym_1]
		,[synonym_2]
		,[synonym_3]
		,[synonym_4]
		,[host_plant]
		,[common_nam]
		,[source]
		,[geo_source]
		,[serogroup]
		,[hosts_nodu]
		,[comments]
		,[genus_spp]
	FROM 
		rhy
	WHERE
		LTRIM(RTRIM(host_plant)) = LTRIM(RTRIM(@host_plant_name))
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ARS_RhizobiumHostPlants_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ARS_RhizobiumHostPlants_Select] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT
		host_plant
    FROM 
		rhy
	WHERE
		LEN(LTRIM(RTRIM(host_plant))) > 0
	AND
		host_plant IS NOT NULL
	ORDER BY
		host_plant ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCCommittees_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CGCCommittees_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [crop_germplasm_committee_id]
		,[crop_germplasm_committee_name]
		,[roster_url]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
  FROM 
	crop_germplasm_committee
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CGCDocument_Delete]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM
			crop_germplasm_committee_document
		WHERE
			@crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CGCDocument_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_crop_germplasm_committee_document_id INT = 0 OUTPUT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@category_code NVARCHAR(4),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		INSERT INTO
			crop_germplasm_committee_document
			(crop_germplasm_committee_id,
			 title,
			 category_code,
			 url,
			 created_by,
			 created_date)
		VALUES
			(
			@crop_germplasm_committee_id,
			@title,
			@category_code,
			@url,
			48,
			GETDATE()
			)
			SELECT @out_crop_germplasm_committee_document_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_CGCDocument_Select]
	@crop_germplasm_committee_document_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		title,
		cgcd.category_code,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	LEFT OUTER JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	WHERE
		crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	ORDER BY
		title DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocument_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CGCDocument_Update]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@category_code NVARCHAR(4),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		UPDATE
			crop_germplasm_committee_document
		SET
			crop_germplasm_committee_id = @crop_germplasm_committee_id, 
			title = @title,
			category_code = @category_code,
			url = @url,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE
			crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CGCDocuments_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_CGCDocuments_Select]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		title,
		category_code,
		(SELECT title FROM vw_cgc_lookup_document_categories WHERE value = cgcd.category_code) AS category,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	ORDER BY
		created_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Code_Insert]
	@group_name NVARCHAR(100),
	@code_value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY
	INSERT INTO
		code_value
		(
			group_name,
			value,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@group_name,
			@code_value,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @new_code_value_id = CAST(SCOPE_IDENTITY() AS INT)

		INSERT INTO 
			code_value_lang
			(
				code_value_id,
				sys_lang_id,
				title,
				description,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
			VALUES
			(
				@new_code_value_id,
				@CONST_SYS_LANG_ID,
				@title,
				@description,
				GETDATE(),
				@CONST_COOPERATOR_ID,
				GETDATE(),
				@CONST_COOPERATOR_ID
			)
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
			END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Code_Update]
	@code_value_id INT,
	@value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY

		UPDATE 
			code_value
		SET
			value = @value,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE code_value_id = @code_value_id

		UPDATE 
			code_value_lang
		SET
			title = @title,
			description = @description,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE 
			code_value_id = @code_value_id
		AND 
			sys_lang_id = 1
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeDetail_Select]
	@value NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		value = @value
	AND
		cvl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodesByGroup_Select]
	@group_name nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date AS code_value_created,
		cv.modified_date AS code_value_modified,
		cvl.created_date AS code_value_lang_created,
		cvl.modified_date AS code_value_lang_modified
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cv.group_name = @group_name
	AND
		cvl.sys_lang_id = 1
	ORDER BY cv.value
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeValues_Select]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		(group_name LIKE '%' + @CONST_GROUP_NAME + '%'
	OR
		group_name LIKE '%CWR%')
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name, value
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeValuesByGroupName_Select]
	@group_name NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		group_name LIKE '%' + @group_name + '%'
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name ASC, value ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Cooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Cooperator_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_cooperator_id INT = 0 OUTPUT,
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@site_id int,
	@organization nvarchar(100),
	@organization_abbrev nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@status_code nvarchar(20),
	@category_code nvarchar(20) = NULL,
	@organization_region_code nvarchar(20) = NULL,
	@discipline_code nvarchar(20) = NULL,
	@note nvarchar(max) = NULL,
	@web_cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
		INSERT INTO cooperator
		(
		 site_id
		 ,last_name
		 ,title
		,first_name
		,job
		,organization
		,organization_abbrev
		,address_line1
		,address_line2
		,address_line3
		,city
		,postal_index
		,geography_id
		,primary_phone
		,email
		,status_code
		,category_code
		,organization_region_code
		,discipline_code
		,note
		,sys_lang_id
		,web_cooperator_id
		,created_date
		,created_by
		,owned_date
		,owned_by
		  )
		  VALUES
		  (
			@site_id,
			@last_name,
			@title,
			@first_name,
			@job,
			@organization,
			@organization_abbrev,
			@address_line1,
			@address_line2,
			@address_line3,
			@city,
			@postal_index,
			@geography_id,
			@primary_phone,
			@email,
			'ACTIVE',
			@category_code,
			@organization_region_code,
			@discipline_code,
			@note,
			1,
			@web_cooperator_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
		SET @out_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CooperatorAddress_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CooperatorAddress_Copy]
 @source_cooperator_id INT,
 @target_cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

DROP TABLE IF EXISTS ##temp_cooperator 
CREATE TABLE ##temp_cooperator 
(
	temp_cooperator_id [int],
	site_id [int] NULL,
	organization [nvarchar](100) NULL,
	organization_abbrev [nvarchar](10) NULL,
	address_line1 [nvarchar](100) NULL,
	address_line2 [nvarchar](100) NULL,
	address_line3 [nvarchar](100) NULL,
	city [nvarchar](100) NULL,
	postal_index [nvarchar](100) NULL,
	geography_id [int] NULL,
	category_code NVARCHAR(20) NULL,
	organization_region_code NVARCHAR(20) NULL,
	discipline_code NVARCHAR(20) NULL
);

SELECT * FROM ##temp_cooperator

INSERT INTO ##temp_cooperator
	(temp_cooperator_id,
	site_id ,
	organization ,
	organization_abbrev ,
	address_line1,
	address_line2,
	address_line3 ,
	city ,
	postal_index ,
	geography_id,
	category_code,
	organization_region_code,
	discipline_code)
SELECT
	cooperator_id ,
	site_id ,
	organization ,
	organization_abbrev ,
	address_line1,
	address_line2,
	address_line3 ,
	city ,
	postal_index ,
	geography_id,
	category_code,
	organization_region_code,
	discipline_code
FROM
	cooperator
WHERE
	cooperator_id = @source_cooperator_id

UPDATE 
	cooperator 
SET 
	address_line1 = tc.address_line1,
	address_line2 = tc.address_line2,
	address_line3 = tc.address_line3,
	site_id = tc.site_id,
	city = tc.city,
	postal_index = tc.postal_index,
	geography_id = tc.geography_id,
	category_code = tc.category_code,
	organization_region_code = tc.organization_region_code,
	discipline_code = tc.discipline_code,
	modified_by = 1,
	modified_date = GETDATE()
FROM 
	##temp_cooperator tc
WHERE
	cooperator.cooperator_id = @target_cooperator_id 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_CooperatorAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CooperatorAggregate_Search]
	@search_text NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		'PROD',
		c.status_code,
		c.cooperator_id,
		c.web_cooperator_id,
		c.last_name,
		c.first_name,
		c.email,
		c.site_id,
		c.address_line1,
		c.address_line2,
		c.address_line3,
		c.city,
		c.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS address_state,
		c.postal_index,
		c.primary_phone,
		c.created_date,
		c.modified_date
	FROM
		cooperator c
	WHERE
		first_name LIKE '%' + @search_text + '%'
	OR
	   last_name LIKE '%' + @search_text + '%'
	OR
		email LIKE '%' + @search_text + '%'
	UNION
	SELECT
		'TRAINING',
		c.status_code,
		c.cooperator_id,
		c.web_cooperator_id,
		c.last_name,
		c.first_name,
		c.email,
		c.site_id,
		c.address_line1,
		c.address_line2,
		c.address_line3,
		c.city,
		c.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS address_state,
		c.postal_index,
		c.primary_phone,
		c.created_date,
		c.modified_date
	FROM
		training.dbo.cooperator c
	WHERE
		first_name LIKE '%' + @search_text + '%'
	OR
	   last_name LIKE '%' + @search_text + '%'
	OR
		email LIKE '%' + @search_text + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Crop_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Crop_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@crop_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		
		
		

	

		

		DELETE FROM
			crop
		WHERE
			crop_id = @crop_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CropGermplasmCommitteeDocument_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CropGermplasmCommitteeDocument_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_crop_germplasm_committee_document_id INT = 0 OUTPUT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		INSERT INTO
			crop_germplasm_committee_document
			(crop_germplasm_committee_id,
			 title,
			 url,
			 created_by,
			 created_date)
		VALUES
			(
			@crop_germplasm_committee_id,
			@title,
			@url,
			48,
			GETDATE()
			)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCode_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCode_Insert]
	@group_name NVARCHAR(100),
	@code_value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY
	INSERT INTO
		code_value
		(
			group_name,
			value,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@group_name,
			@code_value,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @new_code_value_id = CAST(SCOPE_IDENTITY() AS INT)

		INSERT INTO 
			code_value_lang
			(
				code_value_id,
				sys_lang_id,
				title,
				description,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
			VALUES
			(
				@new_code_value_id,
				@CONST_SYS_LANG_ID,
				@title,
				@description,
				GETDATE(),
				@CONST_COOPERATOR_ID,
				GETDATE(),
				@CONST_COOPERATOR_ID
			)
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
			END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCode_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCode_Update]
	@code_value_id INT,
	@value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY

		UPDATE 
			code_value
		SET
			value = @value,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE code_value_id = @code_value_id

		UPDATE 
			code_value_lang
		SET
			title = @title,
			description = @description,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE 
			code_value_id = @code_value_id
		AND 
			sys_lang_id = 1
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeDetail_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCodeDetail_Select]
	@value NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		value = @value
	AND
		cvl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodesByGroup_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCodesByGroup_Select]
	@group_name nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date,
		cv.modified_date
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cv.group_name = @group_name
	AND
		cvl.sys_lang_id = 1
	ORDER BY cv.value 
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeValues_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCodeValues_Select]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		(group_name LIKE '%' + @CONST_GROUP_NAME + '%'
	OR
		group_name LIKE '%CWR%')
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name, value
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtCodeValuesByGroupName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtCodeValuesByGroupName_Select]
	@group_name NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		group_name LIKE '%' + @group_name + '%'
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name ASC, value ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtSysTables_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtSysTables_Select]
AS
BEGIN
	SET NOCOUNT ON;
	/****** Script for SelectTopNRows command from SSMS  ******/
	SELECT 
		st.sys_table_id,
		stl.sys_table_lang_id,
		st.table_name,
		stl.title
	FROM 
		sys_table st
	JOIN
		sys_table_lang stl
	ON
		st.sys_table_id = stl.sys_table_id
	AND
		stl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataMgmtTableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataMgmtTableFieldName_Select]
	@title NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		field_name
	FROM 
		vw_table_fields
	WHERE
		formatted_title = @title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GenesysExport_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GenesysExport_Select]
	@offset INT,
	@limit INT
AS
BEGIN
	SET NOCOUNT ON;

SELECT
	a.accession_id as INTERNAL_ID,
	a.created_date,
	LTRIM(RTRIM(s.fao_institute_number)) as INSTCODE,
	ISNULL(a.doi,'') as DOI,
	TRIM(CONCAT(a.accession_number_part1, ' ', a.accession_number_part2, ' ' + a.accession_number_part3)) as ACCENUMB,
	ts.name as SPECIES_FULL,
	trim(concat(tg.hybrid_code, tg.genus_name)) as GENUS,
	ts.species_name as SPECIES,
	ISNULL(ts.species_authority,'') as SPAUTHOR,
	TRIM(SUBSTRING(ts.name, LEN(trim(concat(tg.hybrid_code, tg.genus_name)))+LEN(ts.species_name)+3, 1000)) as SUBTAXA,
	ISNULL(ts.name_authority,'') as SUBTAUTHOR,
	CONCAT('https://npgsweb.ars-grin.gov/gringlobal/accessiondetail?id=', a.accession_id) as ACCEURL,

	--Biological status of the accession
	(CASE 
		a.improvement_status_code
		WHEN 'WILD' THEN '100'
		WHEN 'CULTIVAR' THEN '500'
		WHEN 'CULTIVATED' THEN '999'
		WHEN 'LANDRACE' THEN '500'
		WHEN 'UNCERTAIN' THEN '999'
		WHEN 'BREEDING' THEN '410'
		WHEN 'CLONE' THEN '416'
		WHEN 'GENETIC' THEN '420'
	ELSE 
		'999'
	END) AS SAMPSTAT,
	ISNULL(a.note, '') AS REMARKS,
	
		-- Acquisition data
		a.initial_received_date, -- for comparison only
	CASE
		when a.initial_received_date is not null then
			case a.initial_received_date_code
				when null then 
					format(a.initial_received_date, 'yyyyMMdd')
				when 'YYYY-MM' then 
					format(a.initial_received_date, 'yyyyMM--')
				when 'YYYY' then 
					format(a.initial_received_date, 'yyyy--')
				else 
					format(a.initial_received_date, 'yyyyMMdd')
			end
		else null -- keep null
	END as ACQDATE,
	
	-- status
	CASE a.status_code
		when 'INACTIVE' then 'Y' -- add codes that mean historical accessions
		when 'INACTIVE2' then 'Y' -- add codes that mean historical accessions
		else 'N' -- not historic
	END as HISTORIC,
	
	-- collecting source
	ISNULL(src.collector_verbatim_locality,'') as COLLSITE,
	ISNULL(src.georeference_datum,'') as GEOREFMETH,
	ISNULL(src.uncertainty,'') as COORDUNCERT,
	src.latitude as DECLATITUDE,
	src.longitude as DECLONGITUDE,
	ISNULL(src_geo.country_code,'') as ORIGCTY		
FROM 
	accession a
inner join 
	taxonomy_species ts on ts.taxonomy_species_id=a.taxonomy_species_id
inner join 
	taxonomy_genus tg on tg.taxonomy_genus_id=ts.taxonomy_genus_id
inner join 
	cooperator O on O.cooperator_id=a.owned_by
inner join 
	site s on s.site_id=O.site_id
left outer join 
	accession_source src on src.accession_id=a.accession_id and src.is_origin='Y' and src.is_web_visible='Y'
left outer join 
	geography src_geo on src_geo.geography_id=src.geography_id
where
	a.is_web_visible='Y'
AND
	s.is_internal = 'Y'
AND
	s.is_distribution_site = 'Y'
ORDER
  BY a.accession_id OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY;

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetCropsBySite]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCropsBySite] 
AS
BEGIN
	SET NOCOUNT ON;

SELECT 
	S.site_id,
	S.site_long_name,
	crop_id,
	(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS STATE,
	C.city,
	CR.name,
	CR.owned_by
FROM 
	[gringlobal].[dbo].[crop] CR
LEFT JOIN
	cooperator C
ON
	 C.cooperator_id  = CR.owned_by
LEFT OUTER JOIN
	site S
ON
	s.site_id = C.site_id
WHERE 
	C.site_id IN (1,2,3,4,5,6,7,8,9,13,15,16,17,19,22,24,26,28,29,31,37,38,40,42)
ORDER BY 
	S.site_id ASC, 
	CR.name ASC

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSpeciesList]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================
-- Author		: Benjamin Haag
-- Create Date	: 7/22/2019
-- Description	: Returns a list of all species in the taxonomy_species table.
-- Revision History
-- ================
-- Date			By			Description
-- ----			--			-----------
-- ===========================================================================================
CREATE PROCEDURE [dbo].[usp_GetSpeciesList] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	[taxonomy_species_id] ,
	[current_taxonomy_species_id] ,
	[nomen_number] ,
	[is_specific_hybrid] ,
	[species_name] ,
	[species_authority] ,
	[is_subspecific_hybrid] ,
	[subspecies_name] ,
	[subspecies_authority] ,
	[is_varietal_hybrid] ,
	[variety_name] ,
	[variety_authority] ,
	[is_subvarietal_hybrid] L,
	[subvariety_name] ,
	[subvariety_authority] ,
	[is_forma_hybrid] ,
	[forma_rank_type] ,
	[forma_name] ,
	[forma_authority] ,
	[taxonomy_genus_id] ,
	[priority1_site_id] ,
	[priority2_site_id] ,
	[curator1_cooperator_id] ,
	[curator2_cooperator_id] ,
	[restriction_code] ,
	[life_form_code] ,
	[common_fertilization_code] ,
	[is_name_pending] ,
	[synonym_code] ,
	[verifier_cooperator_id] ,
	[name_verified_date] ,
	[name] [,
	[name_authority] ,
	[protologue] ,
	[protologue_virtual_path] ,
	[note] ,
	[site_note] ,
	[alternate_name] ,
	[created_date],
	[created_by] ,
	[modified_date] ,
	[modified_by] ,
	[owned_date] ,
	[owned_by] 
	FROM
		taxonomy_species
	WHERE
		species_name LIKE 'AA%'
	ORDER BY
		species_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GRINGlobalSites_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GRINGlobalSites_Select]
AS
SELECT
	site_id,
	site_short_name,
	site_long_name,
	'(' + site_short_name + ') ' + site_long_name AS name 
FROM site 
ORDER BY site_short_name
GO
/****** Object:  StoredProcedure [dbo].[usp_InventoryOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_InventoryOwner_Update]
	@inventory_id INT,
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE 
		inventory 
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_action
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_viability
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_quality_status
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_annotation
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_attach
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_name
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderRequestOwner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_OrderRequestOwner_Update]
	@out_error_number INT = 0 OUTPUT,
	@order_request_id INT,
	@modified_by INT,
	@owned_by INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE 
			order_request
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_item
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_action
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id

		UPDATE 
			order_request_attach
		SET
			owned_by = @owned_by,
			owned_date = GETDATE(),
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			order_request_id = @order_request_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Owner_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Owner_Update] 
	@out_error_number INT = 0 OUTPUT,
	@table_name NVARCHAR(50),
	@record_id INT,
	@owned_by INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(500)
	DECLARE @pk_column NVARCHAR(50)
	BEGIN TRY
		SELECT @pk_column = 
			stf.field_name
		FROM 
			sys_table st
		JOIN
			sys_table_field stf
		ON
			st.sys_table_id = stf.sys_table_id
		WHERE
			table_name = @table_name
		AND	
			stf.field_purpose = 'PRIMARY_KEY'

		SET @sql_statement = 'UPDATE ' + @table_name + ' SET owned_by=' + CONVERT(NVARCHAR(10), @owned_by) + ', owned_date = GETDATE(), modified_by = 48, modified_date = GETDATE() WHERE ' + @pk_column + '=' + CONVERT(NVARCHAR(10), @record_id)
		EXECUTE sp_executesql @sql_statement
		
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplication_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplication_Select]
	@pvp_application_number INT
AS
BEGIN
	SELECT 
		pa.pvp_application_number
		,[cultivar_name]
		,[experimental_name]
		,pa.pvp_common_name_id
		,pa.scientific_name
		,pc.name AS common_name
		,pa.pvp_applicant_id
		,papp.name AS applicant_name
		,[application_date]
		,[is_certified_seed]
		,pas.pvp_application_status_id
		,pas.description AS application_status
		,[status_date]
		,[certificate_issued_date]
		,[years_protected]
		 ,CONVERT(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
		,vi.accession_id
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_accession_ipr vi
	ON
		pa.pvp_application_number = vi.pv_number
WHERE
	 pa.pvp_application_number = @pvp_application_number
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsAvailable_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplicationsAvailable_Select]
AS
BEGIN
	SELECT *
	FROM
		vw_ars_grin_pvp_available
	ORDER BY
		expiration_date ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByApplicationStatus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PVPApplicationsByApplicationStatus_Select]
	@pvp_application_status_id INT
AS
BEGIN

SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
WHERE
	 pa.pvp_application_status_id = @pvp_application_status_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByCommonName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplicationsByCommonName_Select]
	@pvp_common_name_id INT
AS
BEGIN

SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
	 ,pc.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,vi.accession_id
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_accession_ipr vi
	ON
		pa.pvp_application_number = vi.pv_number
WHERE
	 pa.pvp_common_name_id = @pvp_common_name_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplicationsByCrop_Select]
	@pvp_common_name_id INT
AS
BEGIN

SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
	 ,pc.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,vi.accession_id
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_accession_ipr vi
	ON
		pa.pvp_application_number = vi.pv_number
WHERE
	 pa.pvp_common_name_id = @pvp_common_name_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByExpiration_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplicationsByExpiration_Select]
	@expiration_period_id INT
AS
BEGIN

SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,vpam.accession_id
	FROM 
		vw_pvp_applications_by_expiration pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
WHERE
	 pa.sort_order = @expiration_period_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationsByScientificName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PVPApplicationsByScientificName_Select]
	@pvp_common_name_id INT
AS
BEGIN

SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
     ,PC.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,vpam.accession_id
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
WHERE
	 pa.pvp_common_name_id = @pvp_common_name_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPApplicationStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPApplicationStatuses_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_application_status_id AS id,
		description AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_application_status_id = s.pvp_application_status_id) AS count
	FROM
		pvp_application_status s
	ORDER BY title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPCommonNames_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_common_name_id AS id,
		name AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_common_name_id = c.pvp_common_name_id) AS count
	FROM
		pvp_common_name c
	ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPExpirationPeriods_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPExpirationPeriods_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DISTINCT 
		sort_order, 
		category,
		(SELECT COUNT(*) FROM vw_pvp_applications_by_expiration WHERE sort_order = vpae.sort_order) AS count
	FROM 
		vw_pvp_applications_by_expiration vpae
	ORDER BY
		sort_order
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PVPSearch]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPSearch] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
	 pa.pvp_application_number
     ,cultivar_name
     ,experimental_name
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
	 ,pc.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name
     ,application_date
     ,is_certified_seed
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,status_date
     ,certificate_issued_date
     ,years_protected
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,paam.accession_id
	FROM 
		pvp_application pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		pvp_application_accession_map paam
	ON
		pa.pvp_application_number = paam.pvp_application_number'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	DECLARE @Results TABLE
	(pvp_application_number INT,
	 cultivar_name NVARCHAR(150),
     experimental_name NVARCHAR(150),
     pvp_crop_id INT,
	 scientific_name NVARCHAR(150),
	 common_name NVARCHAR(150),
     pvp_applicant_id INT,
	 applicant_name NVARCHAR(150),
     application_date DATETIME2(7),
     is_certified_seed BIT,
     pvp_application_status_id INT,
	 application_status NVARCHAR(120),
     status_date DATETIME2(7),
     certificate_issued_date DATETIME2(7),
     years_protected INT,
	 expiration_date DATETIME2(7),
	 months_remaining INT,
	 accession_id INT)

	INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	SELECT *
	FROM @Results
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Regulation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Regulation_Select] 
	@taxonomy_regulation_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		taxonomy_regulation_id = @taxonomy_regulation_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Regulations_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Regulations_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchOperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SearchOperators_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_search_operator_id,
		title,
		syntax
	FROM 
		sys_search_operator
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysApplicationByURL_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysApplicationByURL_Select] 
	@url NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[sys_application_id]
		,[sys_group_id]
		,[group_tag]
		,[code]
		,[title]
		,[description]
		,[url]
		,[color_code]
		,[image_file_name]
	FROM 
		[gringlobal].[dbo].[vw_sys_application]
	WHERE
		url = @url
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysApplicationCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysApplicationCooperators_Select]
	@sys_group_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		c.cooperator_id,
		c.last_name,
		c.first_name,
		c.last_name + ', ' + c.first_name AS full_name,
		c.email
	FROM
		sys_group_user_map sgum
	JOIN
		sys_user su
	ON
		sgum.sys_user_id = su.sys_user_id
	JOIN
		cooperator c
	ON
		su.cooperator_id = c.cooperator_id
	WHERE
		sys_group_id = @sys_group_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author		: Benjamin Haag
-- Create Date  : 6/17/2021
-- Description  : Returns a list of all existing email templates.
-- Parameters    
--                Name          Description
--                ====          ===========
--
-- Remarks      :
-- ========================================================================
CREATE PROCEDURE [dbo].[usp_SysEmailTemplate_Insert]
	@title nvarchar(120),
	@category_code nvarchar(3),
	@email_from nvarchar(200),
	@email_to nvarchar(1000),
	@email_cc nvarchar(1000),
	@email_bcc nvarchar(1000),
	@email_reply_to nvarchar(200),
	@subject nvarchar(500),
	@body nvarchar(max),
	@is_html nvarchar(1),
	@created_date datetime2(7),
	@created_by int,
	@modified_date datetime2(7),
	@modified_by int,
	@owned_date datetime2(7),
	@owned_by int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ADMIN_COOPERATOR_ID INT = 48
	BEGIN TRY
		INSERT INTO
			email_template 
			(title,
			category_code,
			email_from,
			email_to,
			email_cc,
			email_bcc,
			email_reply_to,
			subject,
			body,
			is_html,
			created_date,
			created_by,
			owned_date,
			owned_by)
		VALUES
			(@title,
			@category_code,
			@email_from,
			@email_to,
			@email_cc,
			@email_bcc,
			@email_reply_to,
			@subject,
			@body,
			@is_html,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID)
	END TRY
	BEGIN CATCH
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author		: Benjamin Haag
-- Create Date  : 6/17/2021
-- Description  : Returns a list of all existing email templates.
-- Parameters    
--                Name          Description
--                ====          ===========
--
-- Remarks      :
CREATE PROCEDURE [dbo].[usp_SysEmailTemplate_Search]
	@category_code NVARCHAR(3)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			email_template_id,
			title,
			category_code,
			email_from,
			email_to,
			email_cc,
			email_bcc,
			email_reply_to,
			subject,
			body,
			is_html,
			created_date,
			created_by,
			(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = et.created_by) AS created_by_name,
			modified_date,
			modified_by,
			(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = et.modified_by) AS modified_by_name,
			owned_date,
			owned_by
		FROM 
			email_template et
		WHERE
			category_code = @category_code
	END TRY
	BEGIN CATCH
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author		: Benjamin Haag
-- Create Date  : 6/17/2021
-- Description  : Returns a list of all existing email templates.
-- Parameters    
--                Name          Description
--                ====          ===========
--
-- Remarks      :
-- ========================================================================
CREATE PROCEDURE [dbo].[usp_SysEmailTemplate_Select]
	@email_template_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			email_template_id,
			title,
			category_code,
			email_from,
			email_to,
			email_cc,
			email_bcc,
			email_reply_to,
			subject,
			body,
			is_html,
			created_date,
			created_by,
			(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = et.created_by) AS created_by_name,
			modified_date,
			modified_by,
			(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = et.modified_by) AS modified_by_name,
			owned_date,
			owned_by
		FROM 
			email_template et
		WHERE
			email_template_id = @email_template_id
	END TRY
	BEGIN CATCH
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplate_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author		: Benjamin Haag
-- Create Date  : 6/17/2021
-- Description  : Returns a list of all existing email templates.
-- Parameters    
--                Name          Description
--                ====          ===========
--
-- Remarks      :
-- ========================================================================
CREATE PROCEDURE [dbo].[usp_SysEmailTemplate_Update]
    @out_error_number INT = 0 OUTPUT,
	@email_template_id INT,
	--@title nvarchar(120),
	--@category_code nvarchar(3),
	@email_from nvarchar(200),
	--@email_to nvarchar(1000),
	--@email_cc nvarchar(1000),
	--@email_bcc nvarchar(1000),
	--@email_reply_to nvarchar(200),
	@subject nvarchar(500),
	@body nvarchar(max),
	@is_html nvarchar(1)
	--@created_date datetime2(7),
	--@created_by int,
	--@modified_date datetime2(7),
	--@modified_by int
	--@owned_date datetime2(7),
	--@owned_by int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ADMIN_COOPERATOR_ID INT = 48
	BEGIN TRY
		UPDATE
			email_template 
		SET
			--title = @title,
			--category_code = @category_code,
			email_from = @email_from,
			--email_to = @email_to,
			--email_cc = @email_cc,
			--email_bcc = @email_bcc,
			--email_reply_to = @email_reply_to,
			subject = @subject,
			body = @body,
			is_html = @is_html,
			modified_date = GETDATE(),
			modified_by = @ADMIN_COOPERATOR_ID
		WHERE
			email_template_id = @email_template_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysEmailTemplates_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author		: Benjamin Haag
-- Create Date  : 6/17/2021
-- Description  : Returns a list of all existing email templates.
-- Parameters    
--                Name          Description
--                ====          ===========
--
-- Remarks      :
-- ========================================================================
CREATE PROCEDURE [dbo].[usp_SysEmailTemplates_Select]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			email_template_id,
			title,
			category_code,
			email_from,
			email_to,
			email_cc,
			email_bcc,
			email_reply_to,
			subject,
			body,
			is_html,
			created_date,
			created_by,
			modified_date,
			modified_by,
			owned_date,
			owned_by
		FROM 
			email_template
	END TRY
	BEGIN CATCH
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysGroup_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysGroup_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_group_id INT = 0 OUTPUT,
	@group_tag NVARCHAR(20)
AS
BEGIN

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_IS_ENABLED NVARCHAR(1) = 'Y'

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO 
			sys_group
			(
				group_tag,
				is_enabled,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
		VALUES
		(
			@group_tag,
			@CONST_IS_ENABLED,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @out_group_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Copy]
	@out_error_number INT = 0 OUTPUT,
	@out_sys_user_id INT = 0 OUTPUT,
	@user_name nvarchar(50),
	@password nvarchar(2000),
	@cooperator_id INT
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	SET @cooperator_id = 180787

	BEGIN TRY
		-- ========================================================================
		-- USER
		-- ========================================================================
		INSERT INTO training.dbo.sys_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 cooperator_id,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by
		)
		SELECT
		
		 user_name,
		 password,
		 is_enabled,
		 @cooperator_id,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID
		FROM
		sys_user
		WHERE 
			sys_user_id = 0




		-- ========================================================================
		-- DEFAULT GROUPS
		-- ========================================================================
		INSERT INTO 
			sys_group_user_map
			(
				sys_group_id,
				sys_user_id,
				created_date,
				created_by,
				owned_date,
				owned_by
  			)
			VALUES
			(
				2,
				@out_sys_user_id,
				GETDATE(),
				@ADMIN_COOPERATOR_ID,
				GETDATE(),
				@ADMIN_COOPERATOR_ID
			)

		INSERT INTO 
		sys_group_user_map
		(
			sys_group_id,
			sys_user_id,
			created_date,
			created_by,
			owned_date,
			owned_by
  		)
		VALUES
		(
			3,
			@out_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_sys_user_id INT = 0 OUTPUT,
	@user_name nvarchar(50),
	@password nvarchar(2000),
	@cooperator_id INT
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	BEGIN TRY
		-- ========================================================================
		-- USER
		-- ========================================================================
		INSERT INTO sys_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 cooperator_id,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @cooperator_id,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID
		)
		SET @out_sys_user_id = CAST(SCOPE_IDENTITY() AS INT)

		-- ========================================================================
		-- DEFAULT GROUPS
		-- ========================================================================
		INSERT INTO 
			sys_group_user_map
			(
				sys_group_id,
				sys_user_id,
				created_date,
				created_by,
				owned_date,
				owned_by
  			)
			VALUES
			(
				2,
				@out_sys_user_id,
				GETDATE(),
				@ADMIN_COOPERATOR_ID,
				GETDATE(),
				@ADMIN_COOPERATOR_ID
			)

		INSERT INTO 
		sys_group_user_map
		(
			sys_group_id,
			sys_user_id,
			created_date,
			created_by,
			owned_date,
			owned_by
  		)
		VALUES
		(
			3,
			@out_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Search] 
	@search_text NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_select NVARCHAR(2000)
	DECLARE @sql_where NVARCHAR(500)

	SET @sql_select = 'SELECT  
		user_name,
		password,
		is_enabled,
		cooperator_id,
		created_date,
		created_by,
		owned_date,
		owned_by
	FROM
		sys_user'

	IF LEN(TRIM(@search_text)) > 0
		BEGIN
			SET @sql_where = ' WHERE user_name LIKE ''%' + @search_text + '%'''
			SET @sql_select = @sql_select + @sql_where
		END

	EXECUTE sp_executesql @sql_select
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Select] 
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		user_name,
		password,
		is_enabled,
		cooperator_id,
		created_date,
		created_by,
		owned_date,
		owned_by
	FROM
		sys_user
	WHERE
		sys_user_id = @sys_user_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUserGroups_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUserGroups_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		sys_group_user_map_id,
		sg.sys_group_id,
		sg.group_tag
	FROM 
		sys_group_user_map sgum
	JOIN
		sys_group sg
	ON
		sgum.sys_group_id = sg.sys_group_id
	WHERE
		sys_user_id = @sys_user_id
	ORDER BY 
		group_tag
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TableFieldName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TableFieldName_Select]
	@title NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		field_name
	FROM 
		vw_table_fields
	WHERE
		formatted_title = @title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxnonomyGeniiSelect]
	@taxonomy_family_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		*
	FROM
		taxonomy_genus tg
	WHERE
		tg.taxonomy_family_id = @taxonomy_family_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyAccessionsBySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyAccessionsBySpecies_Select]
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT  [accession_id]
      ,[doi]
	  ,accession_id
	,LTRIM(RTRIM(LTRIM(COALESCE(accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, accession_number_part2), '') + ' ') + COALESCE(accession_number_part3, ''))) AS accession_text

      ,[accession_number_part1]
      ,[accession_number_part2]
      ,[accession_number_part3]
      ,[is_core]
      ,[is_backed_up]
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code]
      ,[life_form_code]
      ,[improvement_status_code]
      ,[reproductive_uniformity_code]
      ,[initial_received_form_code]
      ,[initial_received_date]
      ,[initial_received_date_code]
      ,[taxonomy_species_id]
      ,[is_web_visible]
      ,[note]
      ,[created_date]
      ,[created_by]
      ,[modified_date]
      ,[modified_by]
      ,[owned_date]
      ,[owned_by]
FROM 
	[gringlobal].[dbo].[accession]
WHERE
	accession.status_code = 'ACTIVE'
AND
	accession.taxonomy_species_id = @taxonomy_species_id
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyAuthority_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[usp_TaxonomyAuthority_Search]
	@search_text NVARCHAR(120)
AS
SELECT 
    authority
FROM 
	vw_taxonomy_authority_2
WHERE
	authority_text LIKE '%' + @search_text + '%'
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitation_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_citation_id INT = 0 OUTPUT,
	@literature_id int NULL,
	@citation_title nvarchar(400) NULL,
	@author_name nvarchar(2000) NULL,
	@citation_year int NULL,
	@reference nvarchar(200) NULL,
	@doi_reference nvarchar(500) NULL,
	@url nvarchar(500) NULL,
	@title nvarchar(500) NULL,
	@description nvarchar(500) NULL,
	@accession_id int NULL,
	@method_id int NULL,
	@taxonomy_species_id int NULL,
	@taxonomy_genus_id int NULL,
	@taxonomy_family_id int NULL,
	@accession_ipr_id int NULL,
	@accession_pedigree_id int NULL,
	@genetic_marker_id int NULL,
	@type_code nvarchar(20) NULL,
	@unique_key int NULL,
	@is_accepted_name nvarchar(1) NULL,
	@note nvarchar(max) NULL,
	@created_by int NULL
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	INSERT INTO  
		citation
		(
			literature_id,
			citation_title,
			author_name,
			citation_year,
			reference,
			doi_reference,
			url,
			title,
			description,
			accession_id,
			method_id,
			taxonomy_species_id,
			taxonomy_genus_id,
			taxonomy_family_id,
			accession_ipr_id,
			accession_pedigree_id,
			genetic_marker_id,
			type_code,
			unique_key,
			is_accepted_name,
			note,
			created_by,
			created_date,
			owned_by,
			owned_date
		)
	VALUES
		(
		@literature_id,
		@citation_title,
		@author_name,
		@citation_year,
		@reference,
		@doi_reference,
		@url,
		@title,
		@description,
		@accession_id,
		@method_id,
		@taxonomy_species_id,
		@taxonomy_genus_id,
		@taxonomy_family_id,
		@accession_ipr_id,
		@accession_pedigree_id,
		@genetic_marker_id,
		@type_code,
		@unique_key,
		@is_accepted_name,
		@note,
		@created_by,
		GETDATE(),
		@created_by,
		GETDATE())

		SET @out_citation_id = CAST(SCOPE_IDENTITY() AS INT)
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitation_Select] 
	@citation_id INT
AS

BEGIN
	SET NOCOUNT ON;
	SELECT 
		[citation_id]
	  ,c.literature_id
	  ,l.reference_title
	  ,l.editor_author_name
	  ,l.publication_year
      ,[citation_title]
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,c.url
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,[taxonomy_species_id]
      ,[taxonomy_genus_id]
      ,[taxonomy_family_id]
      ,[type_code]
      ,[is_accepted_name]
      ,c.note
	   ,c.created_date,
		c.created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = c.created_by) AS created_by_name,
		c.modified_date,
		c.modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = c.modified_by) AS modified_by_name
	FROM
		citation c
	JOIN
		literature l
	ON
		c.literature_id = l.literature_id
	WHERE
		c.citation_id = @citation_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitation_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitation_Update] 
	@out_error_number INT = 0 OUTPUT,
	@citation_id int, 
	@literature_id int NULL,
	@citation_title nvarchar(400) NULL,
	@author_name nvarchar(2000) NULL,
	@citation_year int NULL,
	@reference nvarchar(200) NULL,
	@doi_reference nvarchar(500) NULL,
	@url nvarchar(500) NULL,
	@title nvarchar(500) NULL,
	@description nvarchar(500) NULL,
	@accession_id int NULL,
	@method_id int NULL,
	@taxonomy_species_id int NULL,
	@taxonomy_genus_id int NULL,
	@taxonomy_family_id int NULL,
	@type_code nvarchar(20) NULL,
	@is_accepted_name nvarchar(1) NULL,
	@note nvarchar(max) NULL,
	@modified_by int NULL
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	UPDATE 
		citation
	SET
		literature_id = @literature_id,
		citation_title = @citation_title,
		author_name = @author_name,
		citation_year = @citation_year,
		reference = @reference,
		--doi_reference = @doi_reference,
		url = @url,
		--title = @title,
		--description = @description,
		--accession_id = @accession_id,
		--method_id = @method_id,
		taxonomy_species_id = @taxonomy_species_id,
		taxonomy_genus_id = @taxonomy_genus_id,
		taxonomy_family_id = @taxonomy_family_id,
		--accession_ipr_id = @accession_ipr_id,
		--accession_pedigree_id = @accession_pedigree_id,
		--genetic_marker_id = @genetic_marker_id,
		type_code = @type_code,
		--unique_key = @unique_key,
		is_accepted_name = @is_accepted_name,
		note = @note,
		modified_by = @modified_by,
		modified_date = GETDATE()
	WHERE
		citation_id = @citation_id
	END TRY
	BEGIN CATCH
		--ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationFamilyClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationFamilyClone_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_citation_id INT = 0 OUTPUT,
	@citation_id int, 
	@taxonomy_family_id INT
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	INSERT INTO  
		citation
		(
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		taxonomy_family_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		created_by,
		created_date,
		owned_by,
		owned_date
		)
	SELECT
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		@taxonomy_family_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		48,
		GETDATE(),
		48,
		GETDATE()
	FROM
		citation
	WHERE
		citation_id = @citation_id
	
	SET @out_citation_id = CAST(SCOPE_IDENTITY() AS INT)
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationGenusClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationGenusClone_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_citation_id INT = 0 OUTPUT,
	@citation_id int, 
	@taxonomy_genus_id INT
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	INSERT INTO  
		citation
		(
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		taxonomy_genus_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		created_by,
		created_date,
		owned_by,
		owned_date
		)
	SELECT
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		@taxonomy_genus_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		48,
		GETDATE(),
		48,
		GETDATE()
	FROM
		citation
	WHERE
		citation_id = @citation_id
	
	SET @out_citation_id = CAST(SCOPE_IDENTITY() AS INT)
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitations_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitations_Search]
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	DECLARE @sql_where_root NVARCHAR(MAX)

	SET @sqlStatement = 'SELECT 
	citation_id,
      taxonomy_family_id,
      taxonomy_genus_id,
      taxonomy_species_id,
      citation_text,
      url,
      literature_id,
      reference_title,
      editor_author_name,
      publication_year,
      citation_title,
      author_name,
      citation_year,
      reference,
      doi_reference,
      title,
      description,
      accession_id,
      method_id,
      type_code,
      is_accepted_name,
      note,
      created_date,
      created_by,
      created_by_name,
      modified_date,
      modified_by,
      modified_by_name
  FROM vw_taxonomy_citation'
	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sqlStatement = @sqlStatement + ' ' +  @sql_where_clause 
		END
	EXECUTE sp_executesql @sqlStatement
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByAccession_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsByAccession_Search]
	@sql_where_clause NVARCHAR(MAX) NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sql NVARCHAR(MAX)
	
	SET @sql = 'SELECT
		cit.citation_id,
		cit.citation_title,
		cit.title,
		cit.type_code,
		cit.citation_year,
		l.abbreviation,
		cit.taxonomy_family_id,
		cit.note,
		cit.url,
		cit.created_by,
		cit.created_date,
		cit.modified_by,
		cit.modified_date
	FROM
		citation cit
	JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	JOIN
		accession a
	ON
		cit.accession_id = a.accession_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sql = @sql + ' ' +  @sql_where_clause 
		END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	
	EXECUTE sp_executesql @sql

	--SELECT *
	--FROM @Results
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByCategory_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsByCategory_Select]
	@source NVARCHAR(50),
	@id INT
AS
BEGIN
	SET NOCOUNT ON;
	IF @source = 'species'
		BEGIN
			SELECT  
				[citation_id]
			  ,[literature_id]
			  ,abbreviation
			  ,type_code
			  ,reference_title
			  ,[citation_title]
			  ,taxon_name
			  ,[author_name]
			  ,[citation_year]
			  ,[reference]
			  ,[doi_reference]
			  ,[url]
			  ,[title]
			  ,[description]
			  ,[accession_id]
			  ,[method_id]
			  ,[taxonomy_species_id]
			  ,[accession_ipr_id]
			  ,[accession_pedigree_id]
			  ,[genetic_marker_id]
			  ,[type_code]
			  ,[unique_key]
			  ,[is_accepted_name]
			FROM 
				vw_taxonomy_citations_species
			WHERE 
				taxonomy_species_id = @id
		END
	ELSE
		BEGIN
			IF @source = 'genus'
				BEGIN
					SELECT  
						[citation_id]
						,[literature_id]
						,abbreviation
						,type_code
						,reference_title
						,taxon_name
						,[citation_title]
						,[author_name]
						,[citation_year]
						,[reference]
						,[doi_reference]
						,[url]
						,[title]
						,[description]
						,[accession_id]
						,[method_id]
						,[accession_ipr_id]
						,[accession_pedigree_id]
						,[genetic_marker_id]
						,[type_code]
						,[unique_key]
						,[is_accepted_name]
					FROM 
						vw_taxonomy_citations_genus
					WHERE 
						taxonomy_genus_id = @id
				END
			ELSE
				BEGIN
					SELECT  
						[citation_id]
					  ,[literature_id]
					  ,abbreviation
					  ,type_code
					  ,reference_title
					  ,[citation_title]
					  ,taxon_name
					  ,[author_name]
					  ,[citation_year]
					  ,[reference]
					  ,[doi_reference]
					  ,[url]
					  ,[title]
					  ,[description]
					  ,[accession_id]
					  ,[method_id]
					  ,[accession_ipr_id]
					  ,[accession_pedigree_id]
					  ,[genetic_marker_id]
					  ,[type_code]
					  ,[unique_key]
					  ,[is_accepted_name]
					FROM 
						vw_taxonomy_citations_family
					WHERE 
						taxonomy_family_id = @id
				END
			END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByFamily_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsByFamily_Search]
	@sql_where_clause NVARCHAR(MAX) NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sql NVARCHAR(MAX)
	
	SET @sql = 'SELECT
		cit.citation_id,
		cit.citation_title,
		cit.title,
		cit.type_code,
		cit.citation_year,
		l.abbreviation,
		cit.taxonomy_family_id,
		cit.note,
		cit.url,
		cit.created_by,
		cit.created_date,
		cit.modified_by,
		cit.modified_date
	FROM
		citation cit
	JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	JOIN
		taxonomy_family tf
	ON
		cit.taxonomy_family_id = tf.taxonomy_family_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sql = @sql + ' ' +  @sql_where_clause 
		END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	
	EXECUTE sp_executesql @sql

	--SELECT *
	--FROM @Results
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByGenus_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsByGenus_Search]
	@sql_where_clause NVARCHAR(MAX) NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sql NVARCHAR(MAX)
	
	SET @sql = 'SELECT
		cit.citation_id,
		cit.citation_title,
		cit.title,
		cit.type_code,
		cit.citation_year,
		l.abbreviation,
		cit.taxonomy_family_id,
		cit.note,
		cit.url,
		cit.created_by,
		cit.created_date,
		cit.modified_by,
		cit.modified_date
	FROM
		citation cit
	JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	JOIN
		taxonomy_genus tg
	ON
		cit.taxonomy_genus_id = tg.taxonomy_genus_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sql = @sql + ' ' +  @sql_where_clause 
		END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	
	EXECUTE sp_executesql @sql

	--SELECT *
	--FROM @Results
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsByLiterature_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsByLiterature_Select]
	@literature_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cit.citation_id,
		cit.citation_title,
		cit.title,
		cit.type_code,
		cit.citation_year,
		cit.doi_reference,
		ts.taxonomy_species_id,
		ts.name AS species_name,
		l.editor_author_name,
		l.reference_title,
		l.abbreviation,
		cit.taxonomy_family_id,
		cit.note,
		cit.url,
		cit.created_by,
		cit.created_date,
		cit.modified_by,
		cit.modified_date
	FROM
		citation cit
	JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	JOIN
		taxonomy_species ts
	ON
		cit.taxonomy_species_id = ts.taxonomy_species_id
	WHERE
		cit.literature_id = @literature_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsBySpecies_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsBySpecies_Search]
	@sql_where_clause NVARCHAR(MAX) NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sql NVARCHAR(MAX)
	
	SET @sql = 'SELECT
		cit.citation_id,
		cit.citation_title,
		cit.title,
		cit.type_code,
		cit.citation_year,
		cit.doi_reference,
		ts.taxonomy_species_id,
		ts.name AS species_name,
		l.editor_author_name,
		l.reference_title,
		l.abbreviation,
		cit.taxonomy_family_id,
		cit.note,
		cit.url,
		cit.created_by,
		cit.created_date,
		cit.modified_by,
		cit.modified_date
	FROM
		citation cit
	JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	JOIN
		taxonomy_species ts
	ON
		cit.taxonomy_species_id = ts.taxonomy_species_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sql = @sql + ' ' +  @sql_where_clause 
		END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	
	EXECUTE sp_executesql @sql

	--SELECT *
	--FROM @Results
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationsBySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationsBySpecies_Select]
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cit.citation_id,
		COALESCE(l.abbreviation, '')
			+ CASE WHEN l.abbreviation IS NOT NULL AND cit.type_code IS NOT NULL THEN '. ' ELSE '' END
			+ CASE cit.type_code
				WHEN 'MEDICINE' THEN 'MED'
				WHEN 'RELATIVE' THEN 'CWR'
				WHEN 'NODULATION' THEN 'NOD'
				ELSE '' END
			+ COALESCE(CASE WHEN l.abbreviation IS NULL AND cit.type_code IS NULL THEN '' ELSE '. ' END
			+ CONVERT(NVARCHAR, cit.citation_year), '')
			+ COALESCE(CASE WHEN l.abbreviation IS NULL AND cit.type_code IS NULL AND cit.citation_year IS NULL THEN '' ELSE '. ' END 
			+ COALESCE(cit.citation_title, cit.title), '')
			+ COALESCE('. ' + cit.author_name, '')
			+ COALESCE( '; ' + cit.reference, '')
		AS citation_text,
		cit.taxonomy_species_id,
		ts.current_taxonomy_species_id
	FROM
		citation cit
	LEFT JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	INNER JOIN 
		taxonomy_species ts 
	ON 
		cit.taxonomy_species_id = ts.taxonomy_species_id
	WHERE
		cit.taxonomy_species_id = @taxonomy_species_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCitationSpeciesClone_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCitationSpeciesClone_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_citation_id INT = 0 OUTPUT,
	@citation_id int, 
	@taxonomy_species_id INT
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	INSERT INTO  
		citation
		(
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		taxonomy_species_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		created_by,
		created_date,
		owned_by,
		owned_date
		)
	SELECT
		literature_id,
		citation_title,
		author_name,
		citation_year,
		reference,
		doi_reference,
		url,
		title,
		description,
		accession_id,
		method_id,
		@taxonomy_species_id,
		accession_ipr_id,
		accession_pedigree_id,
		genetic_marker_id,
		type_code,
		unique_key,
		is_accepted_name,
		note,
		48,
		GETDATE(),
		48,
		GETDATE()
	FROM
		citation
	WHERE
		citation_id = @citation_id
	
	SET @out_citation_id = CAST(SCOPE_IDENTITY() AS INT)
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCommonNames_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_common_name_id]
		,[taxonomy_genus_id]
		,[taxonomy_species_id]
		,[language_description]
		,[name]
		,[simplified_name]
		,[alternate_transcription]
		,[citation_id]
		,[note]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
		,[owned_date]
		,[owned_by]
	FROM [gringlobal].[dbo].[taxonomy_common_name]
	WHERE taxonomy_species_id = @taxonomy_species_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyContinents_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyContinents_Select]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			region_id AS continent_id, 
			continent AS name
		FROM 
			region 
		WHERE 
			subcontinent IS NULL 
		ORDER BY 
			continent_id 
	END TRY
	BEGIN CATCH
		--TODO
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCountries_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCountries_Select]
	@region_id_list NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql_statement NVARCHAR(2000)
	
	BEGIN TRY
		SET @sql_statement = 'select distinct 
		   
			g.country_code, 
			cvl.title 
		from 
			geography g 
		join 
			code_value cv 
		on 
			g.country_code = cv.value
		join 
			code_value_lang cvl 
		on 
			cv.code_value_id = cvl.code_value_id 
		JOIN
			geography_region_map grm
		ON
			grm.geography_id = g.geography_id
		where 
			cv.group_name = ''GEOGRAPHY_COUNTRY_CODE''
			and cvl.sys_lang_id = 1
			and g.country_code >= ''A''
		AND grm.region_id IN (' + @region_id_list + ')' 
		EXECUTE sp_executesql @sql_statement

	END TRY
	BEGIN CATCH
		--TODO
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCreatedByCooperators_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCreatedByCooperators_Select] 
		@table_name NVARCHAR(120)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(MAX)
	BEGIN TRY
		SET @sql_statement = 'SELECT DISTINCT
						tab.created_by AS cooperator_id,
						c.last_name + '', '' + c.first_name AS cooperator_full_name
					FROM ' + @table_name + ' tab JOIN
						cooperator c
					ON
						tab.created_by = c.cooperator_id
					ORDER BY cooperator_full_name'		
		EXECUTE sp_executesql @sql_statement
	END TRY
	BEGIN CATCH
	
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCropsBySite_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCropsBySite_Select] 
AS
BEGIN
	SET NOCOUNT ON;

SELECT 
	S.site_id,
	S.site_long_name,
	crop_id,
	(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS STATE,
	C.city,
	CR.name,
	CR.owned_by
FROM 
	[gringlobal].[dbo].[crop] CR
LEFT JOIN
	cooperator C
ON
	 C.cooperator_id  = CR.owned_by
LEFT OUTER JOIN
	site S
ON
	s.site_id = C.site_id
WHERE 
	C.site_id IN (1,2,3,4,5,6,7,8,9,13,15,16,17,19,22,24,26,28,29,31,37,38,40,42)
ORDER BY 
	S.site_id ASC, 
	CR.name ASC

END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Delete] 
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_crop_id INT = 0 OUTPUT,
	@crop_name nvarchar(150),
	@note nvarchar(max),
	@created_by int
AS
	BEGIN
	BEGIN TRY
		Insert into taxonomy_cwr_crop (crop_name,note,created_date,created_by,owned_date,owned_by)
		values(@crop_name,@note, GETDATE(),@created_by, GETDATE(),@created_by)
		SET @out_taxonomy_cwr_crop_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_cwr_crop_id,
		crop_name,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_crop tcc
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Update]
@out_error_number INT = 0 OUTPUT,
@crop_name nvarchar(150),
@note nvarchar (MAX),
@modified_by int,
@taxonomy_cwr_crop_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_cwr_crop SET crop_name=@crop_name,note=@note,modified_date=GETDATE(),modified_by=@modified_by,owned_date=GETDATE(),owned_by=@modified_by 
	WHERE taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Delete] 
	@taxonomy_cwr_crop_id_list NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id IN (@taxonomy_cwr_crop_id_list)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT
		taxonomy_cwr_crop_id,
		crop_name,
		note,
		cwr_count,
		created_date,
		created_by,
		created_by_name,
		modified_date,
		modified_by,
		modified_by_name
	FROM 
		vw_taxonomy_cwr_crop '
	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause + ' ORDER BY tcc.modified_date DESC'
	END
	EXECUTE sp_executesql @sqlStatement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(MONTH, -1, GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByUser_Select]
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		owned_by = @cooperator_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(DAY, -7, GETDATE()) 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id = @taxonomy_cwr_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_map_id INT = 0 OUTPUT,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@created_by int
AS
BEGIN
--BEGIN TRY
	Insert into taxonomy_cwr_map 
		(taxonomy_species_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		owned_date,
		owned_by)
	VALUES
		(
		 @taxonomy_species_id,
		 @taxonomy_cwr_crop_id,
		 @crop_common_name,
		 @is_crop,
		 @genepool_code,
		 @is_graftstock,
		 @is_potential,
		 @citation_id,
		 @note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_map_id = CAST(SCOPE_IDENTITY() AS INT)
--END TRY
--BEGIN CATCH
--	SELECT @out_error_number=ERROR_NUMBER()
--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		(SELECT crop_name 
		FROM taxonomy_cwr_crop
		WHERE taxonomy_cwr_crop_id = tcm.taxonomy_cwr_crop_id) AS cwr_crop_name,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id int,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
BEGIN TRY
	UPDATE 
		[dbo].taxonomy_cwr_map 
	SET 
		taxonomy_species_id=@taxonomy_species_id,
		taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id,
		crop_common_name=@crop_common_name,
		is_crop=@is_crop,
		genepool_code=@genepool_code,
		is_graftstock=@is_graftstock,
		is_potential=@is_potential,
		citation_id=@citation_id,
		note=@note,
		modified_date= GETDATE(),
		modified_by=@modified_by,
		owned_date=GETDATE(),
		owned_by=@modified_by 
	WHERE 
		taxonomy_cwr_map_id=@taxonomy_cwr_map_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id_list INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id IN (@taxonomy_cwr_map_id_list)	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT 
		[taxonomy_cwr_map_id]
		[taxonomy_species_id]
		[species_name]
		[taxonomy_cwr_crop_id]
		[crop_name]
		[crop_common_name]
		[is_crop]
		[genepool_code]
		[is_graftstock]
		[is_potential]
		[citation_id]
		[note]
		[created_date]
		[created_by]
		[created_by_name]
		[modified_date]
		[modified_by]
		[modified_by_name]
	FROM 
		[vw_taxonomy_cwr_map] '

	SET @sql_statement = @sql_statement + @sql_where_clause
	EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT 
			name
		 FROM
			taxonomy_species
		 WHERE
			taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_crop_id,
		taxonomy_cwr_map_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name,
		(SELECT COUNT(*) FROM taxonomy_cwr_trait where taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id) AS taxonomy_cwr_trait_count
	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	ORDER BY
		crop_common_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_trait
		WHERE
			taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Insert]
@out_error_number INT = 0 OUTPUT,
@out_taxonomy_cwr_trait_id INT = 0 OUTPUT,
@taxonomy_cwr_map_id int,
@trait_class_code nvarchar(20),
@is_potential nvarchar(1),
@breeding_type_code nvarchar(20),
@breeding_usage_note nvarchar(1000),
@ontology_trait_identifier nvarchar(20),
@citation_id int,
@note nvarchar(MAX),
@created_by int
AS
BEGIN
BEGIN TRY
	Insert into 
		taxonomy_cwr_trait 
		(taxonomy_cwr_map_id,
		 trait_class_code,
		 is_potential,
		 breeding_type_code,
		 breeding_usage_note,
		 ontology_trait_identifier,
		 citation_id,note,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by)
	values
		(@taxonomy_cwr_map_id,
		 @trait_class_code,
		 @is_potential, 
		 @breeding_type_code,
		 @breeding_usage_note,
		 @ontology_trait_identifier,
		 @citation_id,@note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_trait_id = CAST(SCOPE_IDENTITY() AS INT)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Select]
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_trait_id,
		tct.taxonomy_cwr_map_id,
		tcm.taxonomy_cwr_crop_id,
		(SELECT crop_name 
		FROM taxonomy_cwr_crop
		WHERE taxonomy_cwr_crop_id = tcm.taxonomy_cwr_crop_id) AS cwr_crop_name,
		tcm.taxonomy_species_id,
		(SELECT name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		trait_class_code,
		tct.is_potential,
		breeding_type_code,
		breeding_usage_note,
		ontology_trait_identifier,
		tct.citation_id,
		tct.note,
		tct.created_date,
		tct.created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name,
		tct.modified_date,
		tct.modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	WHERE
		tct.taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id int,
	@taxonomy_cwr_map_id int,
	@trait_class_code nvarchar(20),
	@is_potential nvarchar(1),
	@breeding_type_code nvarchar(20),
	@breeding_usage_note nvarchar(1000),
	@ontology_trait_identifier nvarchar(20),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
	BEGIN TRY
		UPDATE 
			[dbo].taxonomy_cwr_trait 
		SET 
			taxonomy_cwr_map_id=@taxonomy_cwr_map_id,
			trait_class_code=@trait_class_code,
			is_potential=@is_potential,
			breeding_type_code=@breeding_type_code,
			breeding_usage_note=@breeding_usage_note,
			ontology_trait_identifier=@ontology_trait_identifier,
			citation_id=@citation_id,
			note=@note,
			modified_date=GETDATE(),
			modified_by=@modified_by,
			owned_date=GETDATE(),
			owned_by=@modified_by 
		WHERE 
			taxonomy_cwr_trait_id=@taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTraits_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
		 [taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,(SELECT crop_name FROM taxonomy_cwr_crop WHERE taxonomy_cwr_crop_id = tcm.taxonomy_cwr_crop_id) AS crop_for_cwr_name
		,tcm.taxonomy_species_id
		,(SELECT name FROM taxonomy_species WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name
		,[trait_class_code]
		,vtctcl.title AS trait_class_title
		,tct.is_potential
		,[breeding_type_code]
		,vtbtl.title AS breeding_type_title
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name
		,tct.modified_date
		,tct.modified_by
		,(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	JOIN
		vw_taxonomy_cwr_breeding_type_lookup vtbtl
	ON
		tct.breeding_type_code = vtbtl.value
	JOIN
		vw_taxonomy_cwr_trait_class_lookup vtctcl
	ON
		tct.trait_class_code = vtctcl.value'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause + ' ORDER BY tct.modified_date DESC'
		END

   EXECUTE sp_executesql @sqlStatement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTraits_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,vtctcl.title AS trait_class_title
		,tct.is_potential
		,[breeding_type_code]
		,vtbtl.title AS breeding_type_title
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name
		,tct.modified_date
		,tct.modified_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	JOIN
		vw_taxonomy_cwr_breeding_type_lookup vtbtl
	ON
		tct.breeding_type_code = vtbtl.value
	JOIN
		vw_taxonomy_cwr_trait_class_lookup vtctcl
	ON
		tct.trait_class_code = vtctcl.value
	WHERE
		tct.taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END


GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyFamily_Insert]
(
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_family_id INT = 0 OUTPUT,
	@current_taxonomy_family_id int ,
	@type_taxonomy_genus_id int ,
	@suprafamily_rank_code nvarchar(20) ,
	@suprafamily_rank_name nvarchar(100) ,
	@family_name nvarchar(25)  ,
	@family_authority nvarchar(100) ,
	@alternate_name nvarchar(25) ,
	@subfamily_name nvarchar(25) ,
	@tribe_name nvarchar(25) ,
	@subtribe_name nvarchar(25) ,
	@note nvarchar(max) ,
	@created_by int  
)
AS
BEGIN
	BEGIN TRY
		INSERT INTO taxonomy_family
		(
		current_taxonomy_family_id,
		type_taxonomy_genus_id,
		suprafamily_rank_code,
		suprafamily_rank_name,
		family_name,
		family_authority,
		alternate_name,
		subfamily_name,
		tribe_name,
		subtribe_name,
		note,
		created_date,
		created_by,
		owned_date,
		owned_by
	)
	VALUES
	(
		@current_taxonomy_family_id,
		@type_taxonomy_genus_id,
		@suprafamily_rank_code,
		@suprafamily_rank_name,
		@family_name,
		@family_authority,
		@alternate_name,
		@subfamily_name,
		@tribe_name,
		@subtribe_name,
		@note,
		GETDATE(),
		@created_by,
		GETDATE(),
		@created_by
	)

	SET @out_taxonomy_family_id = CAST(SCOPE_IDENTITY() AS INT)

	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFamily_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	BEGIN TRY
	SET @sql_statement = 'SELECT
		taxonomy_family_id,
		current_taxonomy_family_id,
		type_taxonomy_genus_id,
		suprafamily_rank_code,
		suprafamily_rank_name,
        name,
		full_name,
		family_authority,
		alternate_name,
		subfamily_name,
		tribe_name,
		subtribe_name,
		note,
		created_date,
		created_by,
        created_by_name,
		modified_date,
		modified_by,
		modified_by_name
	FROM
		vw_taxonomy_family'
		SET @sql_statement = @sql_statement + @sql_where_clause
		EXECUTE sp_executesql @sql_statement
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyFamily_Select]
(
	@taxonomy_family_id INT = 0
)
AS
BEGIN
	BEGIN TRY
		SELECT
			taxonomy_family_id,
			current_taxonomy_family_id,
			type_taxonomy_genus_id,
			suprafamily_rank_code,
			suprafamily_rank_name,
			name,
			full_name,
			family_authority,
			alternate_name,
			subfamily_name,
			tribe_name,
			subtribe_name,
			note,
			created_date,
			created_by,
			created_by_name,
			modified_date,
			modified_by,
			modified_by_name
		FROM
			vw_taxonomy_family 
		WHERE
			taxonomy_family_id = @taxonomy_family_id
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamily_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyFamily_Update]
(
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_family_id INT = 0,
	@current_taxonomy_family_id int ,
	@type_taxonomy_genus_id int ,
	@suprafamily_rank_code nvarchar(20) ,
	@suprafamily_rank_name nvarchar(100) ,
	@family_name nvarchar(25)  ,
	@family_authority nvarchar(100) ,
	@alternate_name nvarchar(25) ,
	@subfamily_name nvarchar(25) ,
	@tribe_name nvarchar(25) ,
	@subtribe_name nvarchar(25) ,
	@note nvarchar(max) ,
	@modified_by int
)
AS
BEGIN
	BEGIN TRY
		UPDATE taxonomy_family
		SET
			current_taxonomy_family_id = @current_taxonomy_family_id,
			type_taxonomy_genus_id = @type_taxonomy_genus_id,
			suprafamily_rank_code = @suprafamily_rank_code,
			suprafamily_rank_name = @suprafamily_rank_name,
			family_name = @family_name,
			family_authority = @family_authority,
			alternate_name = @alternate_name,
			subfamily_name = @subfamily_name,
			tribe_name = @tribe_name,
			subtribe_name = @subtribe_name,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_family_id = @taxonomy_family_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFiscalYearTotals_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @cooperator_id INT
DECLARE @start_date DATETIME2(7)
DECLARE @end_date DATETIME2(7)

SET @cooperator_id = 165283
SET @start_date = '9/30/2019'
SET @end_date = '10/1/2020'

select
	'Species Added' AS category,
	count(*) AS fiscal_year_total
from 
	taxonomy_species t
join 
	cooperator c 
on 
	t.created_by = c.cooperator_id
where 
	t.created_date > @start_date
and 
	t.created_date < @end_date
and 
	t.created_by = @cooperator_id
UNION
select 
	'Species Modified',
	count(*) modspcnt 
from 
	taxonomy_species t
join 
	cooperator c on t.modified_by = c.cooperator_id
where 
	t.modified_date > @start_date
and 
	t.modified_date < @end_date
and 
	t.modified_by = @cooperator_id
UNION
select
	'Species Verified',
	count(*) verspcnt from taxonomy_species t
join cooperator c on t.verifier_cooperator_id = c.cooperator_id
where t.name_verified_date > @start_date
and t.name_verified_date < @end_date
and t.verifier_cooperator_id = @cooperator_id
UNION 
select
	'Species Citations Added',
	count(*) newspcitcnt 
	from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_species_id is not null
UNION
select
	'Species Citations Edited',
	count(*) AS	modspcitcnt 
from citation ct
join cooperator c 
on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_species_id is not null

UNION
select 'Genus Citations Added', 
count(*) newgncitcnt from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION
select
	'Genus Citations Edited',
	count(*) modgncitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION

select
	'Families Added',
	count(*) newfamcitcnt 
	from citation ct
join 
	cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select 'Families Edited', count(*) modfamcitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select
	'Common Names Added',
	count(*) newcncnt 
from taxonomy_common_name cn
join cooperator c on cn.created_by = c.cooperator_id
where cn.created_date > @start_date
and cn.created_date < @end_date
and cn.created_by = @cooperator_id

UNION

select 
	'Common Names Edited', 
	count(*) modcncnt 
from taxonomy_common_name t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
	'Genera Added',
	count(*) newgncnt 
	from taxonomy_genus t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Genera Edited',
count(*) modgncnt 
from taxonomy_genus t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
'Distributions Added',
	count(*) newdistcnt 
	from taxonomy_geography_map t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Distributions Edited',
count(*) moddistcnt 
from taxonomy_geography_map t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select
	'Uses Added',
	count(*) newusecnt from taxonomy_use t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Uses Modified', count(*) 
modusecnt from taxonomy_use t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

--select created_by, count(*) newspcnt from taxonomy_species
--where created_date > '2016-09-30'
--and created_date < '2017-10-01'
--group by created_by





END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_id INT = 0 OUTPUT,
	@title NVARCHAR(250),
	@category NVARCHAR(120),
    @description NVARCHAR(MAX),
	@is_shared BIT,
    @data_source_name NVARCHAR(150),
	@created_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	taxonomy_folder
			(
				title, 
				category,
				description, 
				is_shared,
				data_source_name,
				created_by, 
				created_date
			)
		VALUES 
			(
				@title, 
				@category,
				@description, 
				@is_shared,
				@data_source_name,
				@created_by, 
				GETDATE()
			)
		SELECT @out_taxonomy_folder_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		category,
		description,
		note,
		is_shared,
		is_favorite,
		data_source_name,
		data_source_title,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.modified_by) AS modified_by_name
	FROM 
		taxonomy_folder tf
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@title NVARCHAR(250),
	@category NVARCHAR(120),
	@description NVARCHAR(MAX),
	@note NVARCHAR(2000),
	@is_shared BIT,
	@is_favorite BIT,
	@modified_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		UPDATE
			taxonomy_folder
		SET 
			title = @title, 
			category = @category,
			description = @description,
			note = @note,
			is_shared = @is_shared,
			is_favorite = @is_favorite,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END


UPDATE taxonomy_folder SET modified_by = 48, modified_date = GETDATE()
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCitationItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCitationItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		vtc.*
	FROM 
		vw_taxonomy_citation vtc
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = vtc.citation_id
WHERE
	tfim.data_source_name = 'citation'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCropForCWRItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		vtc.*
	FROM 
		vw_taxonomy_crop_for_cwr vtc
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = vtc.taxonomy_cwr_crop_id
WHERE
	tfim.data_source_name = 'taxonomy_cwr_crop'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropMapItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCropMapItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		taxonomy_folder_item_id
		,taxonomy_folder_id
		,item_id
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		 FROM taxonomy_cwr_map 
		 WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT 
		 first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, 
		tcc.modified_by, 
		(SELECT first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.modified_by) AS modified_by_name 
	  FROM 
		taxonomy_folder_item_map tfim
	  JOIN
		taxonomy_cwr_crop tcc
ON
	tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCWRMapItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCWRMapItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		taxonomy_species_id,
		(SELECT name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		(SELECT crop_name FROM taxonomy_cwr_crop
		WHERE taxonomy_cwr_crop_id = tcm.taxonomy_cwr_crop_id) AS crop_name,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		tfim.created_date,
		tfim.created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tfim.created_by) AS created_by_name,
		(SELECT COUNT(*) FROM taxonomy_cwr_trait where taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id) AS taxonomy_cwr_trait_count
	FROM
		taxonomy_cwr_map tcm
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = tcm.taxonomy_cwr_map_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderFamilyItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderFamilyItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		vtf.*
	FROM 
		vw_taxonomy_family vtf
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = vtf.taxonomy_family_id
WHERE
	tfim.data_source_name = 'taxonomy_family'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderGenusItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderGenusItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,		
		vtg.*
	FROM 
		vw_taxonomy_genus vtg
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = vtg.taxonomy_genus_id
WHERE
	tfim.data_source_name = 'taxonomy_genus'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_item_map_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_item_id = @taxonomy_folder_item_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_item_map_id INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@data_source_name NVARCHAR(150),
	@item_id INT,
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	
			taxonomy_folder_item_map
			(taxonomy_folder_id,
			 data_source_name,
			 item_id,
			 created_by,
			 created_date)
		VALUES 
			(@taxonomy_folder_id,
			 @data_source_name,
			 @item_id,
			 @created_by,
			 GETDATE())
		SELECT @out_taxonomy_folder_item_map_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMaps_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_item_id,
		taxonomy_folder_id,
		item_id,
		data_source_name,
		created_by
		created_date
	FROM 
		taxonomy_folder_item_map
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderLiteratureItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderLiteratureItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_item_id,
		literature_id,
		abbreviation,
		standard_abbreviation,
		reference_title,
		editor_author_name,
		literature_type_code,
		publication_year,
		publisher_name,
		publisher_location,
		url,
		note,
		tfim.created_date,
		tfim.created_by,
		(SELECT COUNT(citation_id) FROM citation WHERE literature_id = l.literature_id) As citation_count
	FROM 
		literature l
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = l.literature_id
WHERE
	tfim.data_source_name = 'literature'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFoldersByUser_Select] 
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		category,
		description,
		note,
		is_shared,
		is_favorite,
		data_source_name,
		data_source_title,
		created_date,
		modified_date,
		(SELECT 
			COUNT(*) 
		FROM 
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_id = tf.taxonomy_folder_id) AS item_count
	FROM 
		taxonomy_folder tf
	WHERE
		created_by = @cooperator_id
	ORDER BY
		is_favorite DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderSpeciesItemMaps_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderSpeciesItemMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		vts.*
	FROM 
		vw_taxonomy_species vts
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = vts.taxonomy_species_id
WHERE
	tfim.data_source_name = 'taxonomy_species'
AND
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyGenus_Insert]
(
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_genus_id INT = 0 OUTPUT,
	@current_taxonomy_genus_id int,
	@taxonomy_family_id int,
	@qualifying_code nvarchar(20) ,
	@hybrid_code nvarchar(20) ,
	@genus_name nvarchar(30) ,
	@genus_authority nvarchar(100) ,
	@subgenus_name nvarchar(30) ,
	@section_name nvarchar(30) ,
	@subsection_name nvarchar(30) ,
	@series_name nvarchar(30) ,
	@subseries_name nvarchar(30) ,
	@note nvarchar(max) ,
	@created_by int 
)
AS
BEGIN
	BEGIN TRY
		INSERT INTO taxonomy_genus
		(
			current_taxonomy_genus_id,
			taxonomy_family_id,
			qualifying_code,
			hybrid_code,
			genus_name,
			genus_authority,
			subgenus_name,
			section_name,
			subsection_name,
			series_name,
			subseries_name,
			note,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@current_taxonomy_genus_id,
			@taxonomy_family_id,
			@qualifying_code,
			@hybrid_code,
			@genus_name,
			@genus_authority,
			@subgenus_name,
			@section_name,
			@subsection_name,
			@series_name,
			@subseries_name,
			@note,
			GETDATE(),
			@created_by,
			GETDATE(),
			@created_by
		)
		SET @out_taxonomy_genus_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyGenus_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	BEGIN TRY
		SET @sql_statement = 'SELECT [taxonomy_genus_id]
		  ,[current_taxonomy_genus_id]
		  ,[taxonomy_family_id]
		  ,[qualifying_code]
		  ,[hybrid_code]
		  ,[name]
		  ,[full_name]
		  ,[genus_authority]
		  ,[subgenus_name]
		  ,[section_name]
		  ,[subsection_name]
		  ,[series_name]
		  ,[subseries_name]
		  ,[note]
		  ,[created_date]
		  ,[created_by]
		  ,[created_by_name]
		  ,[modified_date]
		  ,[modified_by]
		  ,[modified_by_name]
		  FROM vw_taxonomy_genus '
		SET @sql_statement = @sql_statement + @sql_where_clause
		EXECUTE sp_executesql @sql_statement
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyGenus_Select]
(
	@taxonomy_genus_id INT = 0
)
AS
BEGIN
	BEGIN TRY
		SELECT
			taxonomy_genus_id,
			current_taxonomy_genus_id,
			taxonomy_family_id,
			family_name,
			family_full_name,
			qualifying_code,
			hybrid_code,
			name,
			full_name,
			genus_authority,
			subgenus_name,
			section_name,
			subsection_name,
			series_name,
			subseries_name,
			note,
			created_date,
			created_by,
			created_by_name,
			modified_date,
			modified_by,
			modified_by_name
		FROM
			vw_taxonomy_genus 
		WHERE
			taxonomy_genus_id = @taxonomy_genus_id
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenus_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TaxonomyGenus_Update]
(
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_genus_id INT = 0,
	@current_taxonomy_genus_id int,
	@taxonomy_family_id int,
	@qualifying_code nvarchar(20) ,
	@hybrid_code nvarchar(20) ,
	@genus_name nvarchar(30) ,
	@genus_authority nvarchar(100) ,
	@subgenus_name nvarchar(30) ,
	@section_name nvarchar(30) ,
	@subsection_name nvarchar(30) ,
	@series_name nvarchar(30) ,
	@subseries_name nvarchar(30) ,
	@note nvarchar(max) ,
	@modified_by int
)
AS
BEGIN
	BEGIN TRY
		UPDATE taxonomy_genus
		SET
			current_taxonomy_genus_id = @current_taxonomy_genus_id,
			taxonomy_family_id = @taxonomy_family_id,
			qualifying_code = @qualifying_code,
			hybrid_code = @hybrid_code,
			genus_name = @genus_name,
			genus_authority = @genus_authority,
			subgenus_name = @subgenus_name,
			section_name = @section_name,
			subsection_name = @subsection_name,
			series_name = @series_name,
			subseries_name = @subseries_name,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_genus_id = @taxonomy_genus_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyLiterature_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyLiterature_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	DECLARE @sql_where_root NVARCHAR(MAX)

	SET @sqlStatement = 'SELECT 
		literature_id,
		abbreviation,
		standard_abbreviation,
		reference_title,
		editor_author_name,
		literature_type_code,
		publication_year,
		publisher_name,
		publisher_location,
		url,
		note,
		created_date,
		created_by,
		modified_date,
		modified_by,
		owned_date,
		owned_by,
		(SELECT COUNT(citation_id) FROM citation WHERE literature_id = l.literature_id) As citation_count
	FROM 
		literature l'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
		BEGIN
			SET @sqlStatement = @sqlStatement + ' ' +  @sql_where_clause 
		END

	EXECUTE sp_executesql @sqlStatement

END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyLiterature_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyLiterature_Select] 
	@literature_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		literature_id,
		abbreviation,
		standard_abbreviation,
		reference_title,
		editor_author_name,
		literature_type_code,
		publication_year,
		publisher_name,
		publisher_location,
		url,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = l.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = l.modified_by) AS modified_by_name
	FROM 
		literature l
	WHERE
		literature_id = @literature_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyMunicipalities_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyMunicipalities_Select]
	@country_code_list NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql_statement NVARCHAR(2000)
	
	BEGIN TRY
		SET @sql_statement = 'SELECT 
	geography_id,
	adm1,
	adm1_type_code,
	cvl.title
FROM 
	geography g
JOIN
	code_value cv
ON
	g.adm1_type_code = cv.value
JOIN
	code_value_lang cvl
ON
	cv.code_value_id= cvl.code_value_id
WHERE
	cv.group_name = ''GEOGRAPHY_ADMIN1_TYPE''
AND
	cvl.sys_lang_id = 1
AND 
   adm1_type_code = 23
AND 
   adm2 IS NULL
AND
	country_code IN (' + @country_code_list + ')' 
		EXECUTE sp_executesql @sql_statement

	END TRY
	BEGIN CATCH
		--TODO
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyNote_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyNote_Search] 
	@sys_table_name NVARCHAR(120),
	@search_string NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT DISTINCT note AS note_text FROM ' 
	+ @sys_table_name + ' WHERE note LIKE ' + '''%' + @search_string + '%''' + ' AND note IS NOT NULL ORDER BY note ASC' 
	EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegions_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegions_Select]
	@continent_id_list NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql_statement NVARCHAR(2000)
	
	BEGIN TRY
		SET @sql_statement = 'select 
			region_id, 
			subcontinent 
		from 
			region 
		where 
			continent in 
			(select continent from region where region_id IN (' + @continent_id_list + ')) 
			and subcontinent is not null
		order by 
			subcontinent' 
				
		EXECUTE sp_executesql @sql_statement

	END TRY
	BEGIN CATCH
		--TODO
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Insert]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation (geography_id,regulation_type_code,regulation_level_code,description,url_1,url_2,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@geography_id,@regulation_type_code,@regulation_level_code,@description,@url_1,@url_2,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Select] 
	@taxonomy_regulation_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		taxonomy_regulation_id = @taxonomy_regulation_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Update]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation SET geography_id=@geography_id,regulation_type_code=@regulation_type_code,regulation_level_code=@regulation_level_code,description=@description,url_1=@url_1,url_2=@url_2,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_id=@taxonomy_regulation_id AND geography_id=@geography_id AND regulation_type_code=@regulation_type_code AND regulation_level_code=@regulation_level_code AND description=@description AND url_1=@url_1 AND url_2=@url_2 AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Insert]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation_map (taxonomy_family_id,taxonomy_genus_id,taxonomy_species_id,taxonomy_regulation_id,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@taxonomy_family_id,@taxonomy_genus_id,@taxonomy_species_id,@taxonomy_regulation_id,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Update]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_map_id int

AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation_map SET taxonomy_family_id=@taxonomy_family_id,taxonomy_genus_id=@taxonomy_genus_id,taxonomy_species_id=@taxonomy_species_id,taxonomy_regulation_id=@taxonomy_regulation_id,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_map_id=@taxonomy_regulation_map_id AND taxonomy_family_id=@taxonomy_family_id AND taxonomy_genus_id=@taxonomy_genus_id AND taxonomy_species_id=@taxonomy_species_id AND taxonomy_regulation_id=@taxonomy_regulation_id AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulations_Search]
	@search_text NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id'

	SET @sql_statement = @sql_statement + ' ' + @search_text

   EXECUTE sp_executesql @sql_statement


	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulations_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationsByWeek_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationsByWeek_Select]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		tr.created_date > DATEADD(DAY, -7, GETDATE()) 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_species_id INT = 0 OUTPUT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@forma_rank_type NVARCHAR(30),
	@forma_name NVARCHAR(30),
	@forma_authority NVARCHAR(100),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	--BEGIN TRY
		INSERT INTO	
			taxonomy_species
			(
				current_taxonomy_species_id,
				is_specific_hybrid,
				species_name,
				species_authority,
				is_subspecific_hybrid,
				is_varietal_hybrid,
				variety_name,
				variety_authority,
				is_subvarietal_hybrid,
				subvariety_name,
				subvariety_authority,
				is_forma_hybrid,
				forma_rank_type,
				forma_name,
				forma_authority,
				taxonomy_genus_id,
				life_form_code,
				is_name_pending,
				synonym_code,
				name_verified_date,
				name,
				name_authority,
				protologue,
				protologue_virtual_path,
				note,
				created_by,
				created_date,
				owned_by,
				owned_date
			)
			VALUES
			(
				@current_taxonomy_species_id,
				@is_specific_hybrid,
				@species_name,
				@species_authority,
				@is_subspecific_hybrid,
				@is_varietal_hybrid,
				@variety_name,
				@variety_authority,
				@is_subvarietal_hybrid,
				@subvariety_name,
				@subvariety_authority,
				@is_forma_hybrid,
				@forma_rank_type,
				@forma_name,
				@forma_authority,
				@taxonomy_genus_id,
				@life_form_code,
				@is_name_pending,
				@synonym_code,
				@name_verified_date,
				@name,
				@name_authority,
				@protologue,
				@protologue_virtual_path,
				@note,
				@created_by,
				GETDATE(),
				@created_by,
				GETDATE()
			)
		SET @out_taxonomy_species_id = CAST(SCOPE_IDENTITY() AS INT)
	--END TRY
	--BEGIN CATCH
	--	SELECT @out_error_number=ERROR_NUMBER()
	--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Search] 
	@sql_where_clause NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(MAX)
	SET @sql_statement = 'SELECT [taxonomy_species_id]
      ,[current_taxonomy_species_id]
      ,[nomen_number]
      ,[is_specific_hybrid]
      ,[genus_name]
      ,[subgenus_name]
      ,[species_name]
      ,[name]
	  ,[full_name]
      ,[subspecies_name]
      ,[subspecies_authority]
      ,[is_accepted_name]
      ,[species_authority]
      ,[is_subspecific_hybrid]
      ,[is_varietal_hybrid]
      ,[variety_name]
      ,[variety_authority]
      ,[is_subvarietal_hybrid]
      ,[subvariety_name]
      ,[subvariety_authority]
      ,[is_forma_hybrid]
      ,[forma_rank_type]
      ,[forma_name]
      ,[forma_authority]
      ,[taxonomy_genus_id]
      ,[restriction_code]
      ,[life_form_code]
      ,[common_fertilization_code]
      ,[is_name_pending]
      ,[synonym_code]
      ,[verifier_cooperator_id]
	  ,[verified_by_name]
      ,[name_verified_date]
      ,[name_authority]
      ,[protologue]
      ,[protologue_virtual_path]
      ,[note]
      ,[site_note]
      ,[alternate_name]
      ,[created_date]
      ,[created_by]
      ,[created_by_name]
      ,[modified_date]
      ,[modified_by]
      ,[modified_by_name]
      ,[owned_date]
      ,[owned_by]
      ,[owned_by_name]
  FROM [dbo].[vw_taxonomy_species]' 
	SET @sql_statement = @sql_statement + @sql_where_clause
    
	--DEBUG
	--SELECT @sql_statement
	
	EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	SELECT 
		[taxonomy_species_id]
      ,[current_taxonomy_species_id]
      ,[nomen_number]
      ,[is_specific_hybrid]
      ,[genus_name]
      ,[subgenus_name]
      ,[full_name]
      ,[name]
      ,[species_name]
      ,[subspecies_name]
      ,[subspecies_authority]
      ,[is_accepted_name]
      ,[species_authority]
      ,[is_subspecific_hybrid]
      ,[is_varietal_hybrid]
      ,[variety_name]
      ,[variety_authority]
      ,[is_subvarietal_hybrid]
      ,[subvariety_name]
      ,[subvariety_authority]
      ,[is_forma_hybrid]
      ,[forma_rank_type]
      ,[forma_name]
      ,[forma_authority]
      ,[taxonomy_genus_id]
      ,[restriction_code]
      ,[life_form_code]
      ,[common_fertilization_code]
      ,[is_name_pending]
      ,[synonym_code]
      ,[verifier_cooperator_id]
	  ,verified_by_name
      ,[name_verified_date]
      ,[name_authority]
      ,[protologue]
      ,[protologue_virtual_path]
      ,[note]
      ,[site_note]
      ,[alternate_name]
      ,[created_date]
      ,[created_by]
      ,[created_by_name]
      ,[modified_date]
      ,[modified_by]
      ,[modified_by_name]
      ,[owned_date]
      ,[owned_by]
      ,[owned_by_name]
	FROM 
		[vw_taxonomy_species]
	WHERE
		taxonomy_species_id = @taxonomy_species_id
	END TRY
	BEGIN CATCH
		INSERT INTO 
			sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_species_id INT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@forma_rank_type NVARCHAR(30),
	@forma_name NVARCHAR(30),
	@forma_authority NVARCHAR(100),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@verifier_cooperator_id INT,
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@modified_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE	
			taxonomy_species
		SET
			current_taxonomy_species_id = @current_taxonomy_species_id,
			is_specific_hybrid = @is_specific_hybrid,
			species_name = @species_name,
			species_authority = @species_authority,
			is_subspecific_hybrid = @is_subspecific_hybrid,
			is_varietal_hybrid = @is_varietal_hybrid,
			variety_name = @variety_name,
			variety_authority = @variety_authority,
			is_subvarietal_hybrid = @is_subvarietal_hybrid,
			subvariety_name = @subvariety_name,
			subvariety_authority = @subvariety_authority,
			is_forma_hybrid = @is_forma_hybrid,
			forma_rank_type = @forma_rank_type,
			forma_name = @forma_name,
			forma_authority = @forma_authority,
			taxonomy_genus_id = @taxonomy_genus_id,
			life_form_code = @life_form_code,
			is_name_pending = @is_name_pending,
			synonym_code = @synonym_code,
			name_verified_date = @name_verified_date,
			verifier_cooperator_id = @verifier_cooperator_id,
			name = @name,
			name_authority = @name_authority,
			protologue = @protologue,
			protologue_virtual_path = @protologue_virtual_path,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_species_id = @taxonomy_species_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesAcceptedName_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesAcceptedName_Search] 
	@search_text NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ts.taxonomy_species_id,
		ts.name AS species_name,
		ts.species_authority,
		--CASE
		--	WHEN EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
		--	THEN CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
		--	ELSE ts.name
		--END AS species_text,
		CASE
			WHEN taxonomy_species_id = current_taxonomy_species_id THEN 'Y'
			ELSE 'N'
		END AS is_accepted_name,
		ts.note
	FROM
		taxonomy_species ts
	WHERE
		ts.taxonomy_species_id = ts.current_taxonomy_species_id
	AND
		name LIKE '%' + @search_text + '%'
	OR
		species_name LIKE '%' + @search_text + '%'
	OR
		alternate_name LIKE '%' + @search_text + '%'
	OR
		species_authority LIKE '%' + @search_text + '%'
	OR
		note LIKE '%' + @search_text + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesAcceptedName_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesAcceptedName_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		ts.taxonomy_species_id, 
		ts.current_taxonomy_species_id, 
		ts.synonym_code,
		ts.name
	FROM
		taxonomy_species ts
	WHERE 
		ts.taxonomy_species_id = ts.current_taxonomy_species_id
	ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesFormaAuthority_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesFormaAuthority_Search] 
	@search_text NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		DISTINCT forma_authority
	FROM 
		taxonomy_species
	WHERE 
		forma_authority LIKE '%' + @search_text + '%' 
	ORDER BY 
		forma_authority
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesList_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================
-- Author		: Benjamin Haag
-- Create Date	: 7/22/2019
-- Description	: Returns a list of all species in the taxonomy_species table.
-- Revision History
-- ================
-- Date			By			Description
-- ----			--			-----------
-- ===========================================================================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesList_Select] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	[taxonomy_species_id] ,
	[current_taxonomy_species_id] ,
	[nomen_number] ,
	[is_specific_hybrid] ,
	[species_name] ,
	[species_authority] ,
	[is_subspecific_hybrid] ,
	[subspecies_name] ,
	[subspecies_authority] ,
	[is_varietal_hybrid] ,
	[variety_name] ,
	[variety_authority] ,
	[is_subvarietal_hybrid] L,
	[subvariety_name] ,
	[subvariety_authority] ,
	[is_forma_hybrid] ,
	[forma_rank_type] ,
	[forma_name] ,
	[forma_authority] ,
	[taxonomy_genus_id] ,
	[priority1_site_id] ,
	[priority2_site_id] ,
	[curator1_cooperator_id] ,
	[curator2_cooperator_id] ,
	[restriction_code] ,
	[life_form_code] ,
	[common_fertilization_code] ,
	[is_name_pending] ,
	[synonym_code] ,
	[verifier_cooperator_id] ,
	[name_verified_date] ,
	[name] [,
	[name_authority] ,
	[protologue] ,
	[protologue_virtual_path] ,
	[note] ,
	[site_note] ,
	[alternate_name] ,
	[created_date],
	[created_by] ,
	[modified_date] ,
	[modified_by] ,
	[owned_date] ,
	[owned_by] 
	FROM
		taxonomy_species
	WHERE
		species_name LIKE 'AA%'
	ORDER BY
		species_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesName_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesName_Search] 
	@search_text NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_species_id,
		current_taxonomy_species_id,
		nomen_number,
		is_specific_hybrid,
		CASE
			WHEN
				EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN 
				CONCAT(ts.name, CONCAT('', COALESCE(ts.name_authority, '')))
			ELSE 
				ts.name
		END AS species_name,
		CASE
			WHEN 
				taxonomy_species_id = current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name
		--species_authority,
		--is_subspecific_hybrid,
		--subspecies_name,
		--subspecies_authority,
		--is_varietal_hybrid,
		--variety_name,
		--variety_authority,
		--is_subvarietal_hybrid,
		--subvariety_name,
		--subvariety_authority,
		--is_forma_hybrid,
		--forma_rank_type,
		--forma_name,
		--forma_authority,
		--taxonomy_genus_id,
		--priority1_site_id,
		--priority2_site_id,
		--curator1_cooperator_id,
		--curator2_cooperator_id,
		--restriction_code,
		--life_form_code,
		--common_fertilization_code,
		--is_name_pending,
		--synonym_code,
		--verifier_cooperator_id,
		--name_verified_date,
		--name,
		--name_authority,
		--protologue,
		--protologue_virtual_path,
		--note,
		--site_note,
		--alternate_name,
		--(SELECT 
		--	COUNT(*) 
		-- FROM 
		--	accession
		-- WHERE 
		--	taxonomy_species_id = ts.taxonomy_species_id) AS accession_count,
		--created_date,
		--created_by,
		--(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
		--modified_date,
		--modified_by,
		--(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
		--owned_date,
		--owned_by,
		--(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
	FROM 
		taxonomy_species ts
	WHERE
		taxonomy_species_id = current_taxonomy_species_id 
	AND	
		(ts.name LIKE '%' + @search_text + '%'
	OR
		ts.species_name LIKE '%' + @search_text + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesNameAndSynonym_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesNameAndSynonym_Search] 
	@search_text NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		ts.taxonomy_species_id, 
		ts.current_taxonomy_species_id, 
		ts.synonym_code,
		CASE
			WHEN 
				ts.taxonomy_species_id = ts.current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name,
		ts.name,
		COALESCE (ts.forma_authority, ts.subvariety_authority, ts.variety_authority, ts.subspecies_authority, ts.species_authority, '') 
		as authority
	FROM
		taxonomy_species ts
	WHERE 
		--	t.current_taxonomy_species_id = :taxonomyid 
		--and 
		ts.synonym_code = 'S'
		--and t.taxonomy_species_id != :taxonomyid
	AND	
		(ts.name LIKE '%' + @search_text + '%'
	OR
		ts.species_name LIKE '%' + @search_text + '%')
	UNION
	SELECT 
		ts2.taxonomy_species_id, 
		ts2.current_taxonomy_species_id, 
		ts2.synonym_code,
		CASE
			WHEN 
				ts2.taxonomy_species_id = ts2.current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name,
		ts2.name,
		COALESCE (ts2.forma_authority, ts2.subvariety_authority, ts2.variety_authority, ts2.subspecies_authority, ts2.species_authority, '') AS authority
	FROM 
		taxonomy_species ts2
	WHERE 
		ts2.synonym_code IS NULL
	AND	
		(ts2.name LIKE '%' + @search_text + '%'
	OR
		ts2.species_name LIKE '%' + @search_text + '%')
	ORDER BY name
	
	
	
	
	
	
	--SELECT 
	--	taxonomy_species_id,
	--	current_taxonomy_species_id,
	--	nomen_number,
	--	is_specific_hybrid,
	--	CASE
	--		WHEN
	--			EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
	--		THEN 
	--			CONCAT(ts.name, CONCAT('', COALESCE(ts.name_authority, '')))
	--		ELSE 
	--			ts.name
	--	END AS species_name,
	--	CASE
	--		WHEN 
	--			taxonomy_species_id = current_taxonomy_species_id 
	--		THEN
	--			'Y'
	--		ELSE 
	--			'N'
	--	END AS is_accepted_name
	--FROM 
	--	taxonomy_species ts
	--WHERE
	--	taxonomy_species_id = current_taxonomy_species_id 
	--AND	
	--	(ts.name LIKE '%' + @search_text + '%'
	--OR
	--	ts.species_name LIKE '%' + @search_text + '%')





END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesNote_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesNote_Search] 
	@search_text NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		DISTINCT note
	FROM 
		taxonomy_species
	WHERE 
		note LIKE '%' + @search_text + '%' 
	ORDER BY 
		note
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesProtologue_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesProtologue_Search] 
	@search_text NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		DISTINCT TOP 10 
			protologue,
			protologue_virtual_path
	FROM 
		taxonomy_species
	WHERE 
		protologue LIKE '%' + @search_text + '%' 
	ORDER BY 
		protologue
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesProtologues_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesProtologues_Search]
	@search_string NVARCHAR(500) 
AS
SELECT DISTINCT
      protologue,
      protologue_virtual_path
FROM 
	[gringlobal].[dbo].[vw_taxonomy_species]
ORDER BY
	protologue
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesRelatedSpecies_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesRelatedSpecies_Select]
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	synonym_code,
	taxonomy_species_id,
	name
FROM taxonomy_species
WHERE 
	--taxonomy_species_id = @taxonomy_species_id
--AND 
	synonym_code = 'S'
UNION
SELECT 
	synonym_code,
	taxonomy_species_id,
	name
FROM taxonomy_species
WHERE 
	--taxonomy_species_id = @taxonomy_species_id
--AND 
	synonym_code = 'B'
ORDER BY
	synonym_code, name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesSynonym_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesSynonym_Search] 
	@search_text NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		ts.taxonomy_species_id, 
		ts.current_taxonomy_species_id, 
		ts.synonym_code,
		CASE
			WHEN 
				ts.taxonomy_species_id = ts.current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name,
		ts.name,
		COALESCE (ts.forma_authority, ts.subvariety_authority, ts.variety_authority, ts.subspecies_authority, ts.species_authority, '') 
		as authority
	FROM
		taxonomy_species ts
	WHERE 
		--	t.current_taxonomy_species_id = :taxonomyid 
		--and 
		ts.synonym_code = 'S'
		--and t.taxonomy_species_id != :taxonomyid
	AND	
		(ts.name LIKE '%' + @search_text + '%'
	OR
		ts.species_name LIKE '%' + @search_text + '%')
	UNION
	SELECT 
		ts2.taxonomy_species_id, 
		ts2.current_taxonomy_species_id, 
		ts2.synonym_code,
		CASE
			WHEN 
				ts2.taxonomy_species_id = ts2.current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name,
		ts2.name,
		COALESCE (ts2.forma_authority, ts2.subvariety_authority, ts2.variety_authority, ts2.subspecies_authority, ts2.species_authority, '') AS authority
	FROM 
		taxonomy_species ts2
	WHERE 
		ts2.synonym_code IS NULL
	AND	
		(ts2.name LIKE '%' + @search_text + '%'
	OR
		ts2.species_name LIKE '%' + @search_text + '%')
	ORDER BY name
	
	
	
	
	
	
	--SELECT 
	--	taxonomy_species_id,
	--	current_taxonomy_species_id,
	--	nomen_number,
	--	is_specific_hybrid,
	--	CASE
	--		WHEN
	--			EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
	--		THEN 
	--			CONCAT(ts.name, CONCAT('', COALESCE(ts.name_authority, '')))
	--		ELSE 
	--			ts.name
	--	END AS species_name,
	--	CASE
	--		WHEN 
	--			taxonomy_species_id = current_taxonomy_species_id 
	--		THEN
	--			'Y'
	--		ELSE 
	--			'N'
	--	END AS is_accepted_name
	--FROM 
	--	taxonomy_species ts
	--WHERE
	--	taxonomy_species_id = current_taxonomy_species_id 
	--AND	
	--	(ts.name LIKE '%' + @search_text + '%'
	--OR
	--	ts.species_name LIKE '%' + @search_text + '%')





END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyTraitTypes_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyTraitTypes_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		DISTINCT 
			trait_class_code, 
			breeding_type_code,
			vtbt.title AS breeding_type_title
	FROM 
		[gringlobal].[dbo].[taxonomy_cwr_trait] tct
	JOIN
		vw_taxonomy_breeding_types vtbt
	ON
		tct.breeding_type_code = vtbt.value
	JOIN
		code_value cv
	ON
		tct.trait_class_code = cv.value
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cvl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Search]
	@user_name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.web_cooperator_id,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		co.address_line1,
		co.address_line2,
		co.address_line3,
		co.city,
		co.geography_id,
		(SELECT adm1 FROM geography WHERE geography_id = co.geography_id) AS address_state,
		co.primary_phone,
		co.title,
		co.job,
		g.adm1 AS state,
		co.postal_index,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name,
		s.site_long_name
	FROM 
		sys_user su
	LEFT JOIN 
		cooperator co 
	ON 
		su.cooperator_id = co.cooperator_id
	LEFT JOIN 
		site s 
	ON 
		co.site_id = s.site_id
	LEFT JOIN
		geography g
    ON
		co.geography_id = g.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1

	WHERE 
		su.user_name LIKE '%' + @user_name + '%' 
	AND 
		su.is_enabled = 'Y'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.web_cooperator_id,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		co.address_line1,
		co.address_line2,
		co.address_line3,
		co.city,
		co.geography_id,
		g.adm1 AS state,
		co.primary_phone,
		co.title,
		co.job,
		co.postal_index,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name,
		s.site_long_name
	FROM 
		sys_user su
	LEFT JOIN 
		cooperator co 
	ON 
		su.cooperator_id = co.cooperator_id
	LEFT JOIN 
		site s 
	ON 
		co.site_id = s.site_id
	LEFT JOIN
		geography g
    ON
		co.geography_id = g.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1
	WHERE 
		su.sys_user_id = @sys_user_id 
	AND 
		su.is_enabled = 'Y'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserAggregate_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserAggregate_Search] 
	@search_text NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

SELECT 
	'SYS_USER',
	sys_user_id, 
	user_name, 
	password,
	is_enabled,
	created_date,
	modified_date
FROM 
	sys_user su
WHERE
	user_name LIKE '%' + @search_text + '%'
UNION
SELECT 
	'WEB_USER',
	web_user_id, 
	user_name, 
	password,
	is_enabled,
	created_date,
	modified_date
FROM 
	web_user wu
WHERE
	user_name LIKE '%' + @search_text + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserApplications_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserApplications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		sys_application_id,
		sys_group_id,
		group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name,
		(SELECT 
			COUNT(*) 
		 FROM 
			sys_group_user_map 
		 WHERE 
			sys_group_id = vsa.sys_group_id 
		 AND 
			sys_user_id = @sys_user_id) AS is_authorized
	FROM
		vw_sys_application vsa
	ORDER BY
		vsa.title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Copy]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebCooperator_Copy] 
	@cooperator_id INT
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @new_web_cooperator_id INT
	
	-- Web Cooperator
	INSERT INTO web_cooperator
	(
	[last_name]  ,
	[title] ,
	[first_name],
	[job],
	[organization] ,
	[organization_code] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	[is_active],
	[category_code],
	[organization_region],
	[discipline],
	[note],
	[created_date] ,
	[created_by] ,
	[owned_date] ,
	[owned_by]
	)
	SELECT
	last_name,
	title,
	first_name,
	job,
	organization,
	[organization_abbrev] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	CASE
		WHEN 
			status_code = 'ACTIVE'
		THEN
			'Y'
		ELSE 
			'N'
	END,
	[category_code],
	[organization_region_code],
	[discipline_code],
	[note],
	GETDATE(),
	1,
	GETDATE(),
	1
	FROM 
		cooperator
	WHERE
		cooperator_id = @cooperator_id

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebCooperator_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_web_cooperator_id INT = 0 OUTPUT,
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@organization nvarchar(100),
	@organization_code nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@is_active nvarchar(1),
	@category_code nvarchar(20) = NULL,
	@organization_region nvarchar(20) = NULL,
	@discipline nvarchar(20) = NULL,
	@note nvarchar(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
		INSERT INTO web_cooperator
			(
			[last_name]  ,
			[title] ,
			[first_name],
			[job],
			[organization] ,
			[organization_code] ,
			[address_line1] ,
			[address_line2] ,
			[address_line3] ,
			[city] ,
			[postal_index] ,
			[geography_id] ,
			[primary_phone],
			[email],
			[is_active],
			[category_code],
			[organization_region],
			[discipline],
			[note],
			[created_date] ,
			[created_by] ,
			[owned_date] ,
			[owned_by]
			)
		VALUES
			(
			@last_name,
			@title,
			@first_name,
			@job,
			@organization,
			@organization_code,
			@address_line1,
			@address_line2,
			@address_line3,
			@city,
			@postal_index,
			@geography_id,
			@primary_phone,
			@email,
			'Y',
			@category_code,
			@organization_region,
			@discipline,
			@note,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID
			)
		SET @out_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequest_Select] 
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		wor.web_order_request_id
		-- WEB COOPERATOR
		,wor.web_cooperator_id
		,wu.user_name
		,wc.title AS web_cooperator_title
		,wc.last_name AS web_cooperator_last_name
		,wc.first_name AS web_cooperator_first_name
		,(wc.first_name + ' ' + wc.last_name) AS web_cooperator_full_name
		,wc.organization AS web_cooperator_organization
		,wc.job AS web_cooperator_job
		,wc.address_line1 AS web_cooperator_address_line_1
		,wc.address_line2 AS web_cooperator_address_line_2
		,wc.address_line3 AS web_cooperator_address_line_3
		,wc.city AS web_cooperator_address_city
		,wc.postal_index AS web_cooperator_address_postal_index
		,wc.geography_id
		,(SELECT adm1 FROM geography WHERE geography_id = wc.geography_id) AS web_cooperator_address_state
		,wc.primary_phone AS web_cooperator_primary_phone
		,wc.email AS web_cooperator_email
		,wc.created_date AS web_cooperator_created_date
		,wc.modified_date AS web_cooperator_modified_date
		,wc.status_code AS web_cooperator_status_code
		,wc.note As web_cooperator_note
		,wora.address_line1 AS web_order_request_address_line_1
		,wora.address_line2 AS web_order_request_address_line_2
		,wora.address_line3 AS web_order_request_address_line_3
		,wora.city AS web_order_request_city
		,wora.postal_index AS web_order_request_postal_index
		,wora.geography_id AS web_order_request_geography_id
		,(SELECT adm1 FROM geography WHERE geography_id = wora.geography_id) AS web_order_request_state
		,wor.ordered_date
		,wor.intended_use_code
		,wor.intended_use_note
		,wor.status_code
		,wor.note
		,wor.special_instruction
		,wor.created_date
		,wor.created_by
		,(SELECT first_name + ' ' + last_name FROM web_cooperator where web_cooperator_id = wor.created_by) AS created_by_name
		,wor.modified_date
		,wor.modified_by
		,(SELECT first_name + ' ' + last_name FROM web_cooperator where web_cooperator_id = wor.modified_by) AS modified_by_name
		,wor.owned_date
		,wor.owned_by
		,(SELECT first_name + ' ' + last_name FROM web_cooperator where web_cooperator_id = wor.owned_by) AS owned_by_name
		,wor.is_locked
	FROM
		web_order_request wor
	LEFT JOIN 
		web_cooperator wc 
	ON 
		wc.web_cooperator_id = wor.web_cooperator_id
	LEFT JOIN
		web_user wu
	ON
		wc.web_cooperator_id = wu.web_cooperator_id
	LEFT JOIN 
		web_order_request_address wora 
	ON 
		wora.web_order_request_id = wor.web_order_request_id
	WHERE
		wor.web_order_request_id = @web_order_request_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequest_Update] 
	@out_error_number INT = 0 OUTPUT,
	@web_order_request_id INT,
	@web_cooperator_id INT,
	@status_code NVARCHAR(20),
	@note NVARCHAR(2000)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @web_order_request_status_code NVARCHAR(20)
	DECLARE @web_order_request_item_status_code NVARCHAR(20)
	DECLARE @web_order_request_action_id INT
	DECLARE @error_code INT

	BEGIN TRY

		-- If order has been approved following an NRR review, reset the statuses
		-- of the order and its items to their original values, and undo any existing lock.
		IF (@status_code = 'NRR_APPROVE')
		BEGIN
			SET @web_order_request_status_code = 'SUBMITTED'
			SET @web_order_request_item_status_code = 'NEW'
		END
		ELSE
		BEGIN
			IF (@status_code = 'NRR_REJECT')
				BEGIN
					SET @web_order_request_status_code = 'CANCELED'
					SET @web_order_request_item_status_code = 'CANCEL'
				END
		END

		UPDATE
			web_order_request 
		SET
			status_code = @web_order_request_status_code,
			note = @note,
			modified_by = 1,
			modified_date = GETDATE(),
			is_locked = 0,
			owned_by = 1,
			owned_date = GETDATE()
		WHERE
			web_order_request_id = @web_order_request_id

		UPDATE
			web_order_request_item 
		SET
			status_code = @web_order_request_item_status_code,
			modified_by = 1,
			modified_date = GETDATE()
		WHERE
			web_order_request_id = @web_order_request_id
	
		--EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, @status_code, @note, 1

	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAction_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestAction_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_web_order_request_action_id INT = 0 OUTPUT,
	@web_order_request_id INT,
	@action_code NVARCHAR(20),
	@note NVARCHAR(MAX) = '',
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF NOT EXISTS (SELECT 
							web_order_request_action_id 
					   FROM 
							web_order_request_action 
					   WHERE 
							web_order_request_id = @web_order_request_id
					   AND
							action_code != 'NRR_NOTE'
					   AND 
							action_code = @action_code)
		BEGIN
			INSERT INTO 
				web_order_request_action
				(web_order_request_id,
				action_code,
				acted_date,
				note,
				web_cooperator_id,
				created_date,
				created_by,
				owned_date,
				owned_by)
			VALUES
				(@web_order_request_id,
				@action_code,
				GETDATE(),
				@note,
				@created_by,
				GETDATE(),
				@created_by,
				GETDATE(),
				@created_by)
		END
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestActions_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestActions_Select]
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		web_order_request_action_id,
		web_order_request_id,
		action_code,
		cvl.title AS action_title,
		cvl.description AS action_description,
		COALESCE(acted_date, wora.created_date, wora.modified_date) AS action_date,
		CONVERT(date, acted_date) AS action_date_converted,
		note,
		COALESCE(web_cooperator_id, wora.created_by, wora.modified_by) AS cooperator_id,
		wora.created_by,
		(SELECT first_name + '  ' + last_name FROM web_cooperator WHERE web_cooperator_id = wora.created_by) AS created_by_name,
		wora.created_date
FROM 
	web_order_request_action wora
JOIN
	code_value cv
ON
	wora.action_code = cv.value
JOIN
	code_value_lang cvl
ON
	cv.code_value_id = cvl.code_value_id
WHERE
	cv.group_name = 'WEB_ORDER_REQUEST_ACTION'
AND
	cvl.sys_lang_id = 1
AND
	web_order_request_id = @web_order_request_id
ORDER BY
	acted_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAddresses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestAddresses_Select]
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		wora.web_order_request_address_id,
		wora.address_line1,
		wora.address_line2,
		wora.address_line3,
		wora.city,
		wora.geography_id,
		g.adm1,
		g.adm2,
		g.adm3,
		wora.postal_index,
		wora.carrier,
		wora.carrier_account
FROM 
	web_order_request_address wora
JOIN
	geography g
ON
	wora.geography_id = g.geography_id
WHERE
	web_order_request_id = @web_order_request_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestCooperatorTotals_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_WebOrderRequestCooperatorTotals_Select]
	@web_cooperator_id INT 
AS
SELECT
	1 AS sort_order,
	'Total Orders' AS category,
	COUNT(*) AS total,
	'pull-right badge bg-blue' AS display_css_class
FROM 
	web_order_request wor
JOIN
	web_cooperator wc
ON
	wor.web_cooperator_id = wc.web_cooperator_id
WHERE 
	wc.web_cooperator_id = @web_cooperator_id
UNION
SELECT 
	2 AS sort_order,
	'Total Orders Canceled as NRRs' AS category,
	COUNT(DISTINCT wor.web_order_request_id) AS total,
	CASE 
		WHEN COUNT(DISTINCT wor.web_order_request_id) > 0 THEN 'pull-right badge bg-red'
		ELSE 'pull-right badge bg-gray'
	END AS display_css_class
FROM 
	web_order_request wor
JOIN
	web_order_request_action wora
ON
	wor.web_order_request_id = wora.web_order_request_id
WHERE 
	wor.status_code = 'CANCELED'
AND
	wora.action_code = 'NRR_REJECT'
AND
	wor.web_cooperator_id = @web_cooperator_id
UNION
SELECT
	3 AS sort_order,
	'Total Orders Canceled' AS category,
	COUNT(DISTINCT wor.web_order_request_id) AS total,
	CASE 
		WHEN COUNT(DISTINCT wor.web_order_request_id) > 0 THEN 'pull-right badge bg-red'
		ELSE 'pull-right badge bg-gray'
	END AS display_css_class
FROM 
	web_order_request wor
JOIN
	web_order_request_action wora
ON
	wor.web_order_request_id = wora.web_order_request_id
WHERE 
	wor.status_code = 'CANCELED'
AND
	wor.web_cooperator_id = @web_cooperator_id
ORDER BY sort_order
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestEmailAddresses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestEmailAddresses_Select] 
	@web_order_request_id INT
	AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		--cg.name,
		--cg.group_tag,
		DISTINCT c.email
	FROM 
		cooperator_group cg
	JOIN
		cooperator_map cm
	ON
		cg.cooperator_group_id = cm.cooperator_group_id
	JOIN
		cooperator c
	ON
		cm.cooperator_id = c.cooperator_id
	WHERE
		cg.site_id IN
	(SELECT DISTINCT
		s.site_id
	FROM
		web_order_request_item wori
	JOIN
		accession a
	ON
		wori.accession_id = a.accession_id
	JOIN
		cooperator c
	ON
		a.owned_by = c.cooperator_id
	JOIN
		site s
	ON
		c.site_id = s.site_id
	WHERE
		web_order_request_id = @web_order_request_id)
	AND
		cg.group_tag LIKE '%ORD'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestEmailAddressList_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestEmailAddressList_Select] 
	@web_order_request_id INT,
	@email_recipients NVARCHAR(2000) OUTPUT
	AS
BEGIN
	SET NOCOUNT ON;

	WITH cte_orders (site_short_name, email) AS (
	SELECT DISTINCT
		--wori.web_order_request_id,
		--wori.web_order_request_item_id,
		--wori.accession_id,
		--c.email
		--s.site_id
		s.site_short_name,
		CASE s.site_short_name 
		WHEN 'BRW' then 'lj.grauke@ars.usda.gov'
		when 'COR' then 'Missy.Fix@ars.usda.gov'
		when 'COT' then 'james.frelichowski@ars.usda.gov;janna.love@ars.usda.gov'  
		when 'DAV' then 'ordersNCGR.davis@ars.usda.gov'
		when 'DBMU' then 'benjamin.haag@usda.gov'
		when 'DLEG' then 'mjohnson@ag.arizona.edu'
		when 'GEN' then 'dawn.dellefave@ars.usda.gov;ben.gutierrez@ars.usda.gov'
		when 'GSOR' then 'lorie.bernhardt@ars.usda.gov'
		when 'GSPI' then 'barbara.hellier@ars.usda.gov;alec.mccall@wsu.edu;stoutd@wsu.edu;lisa.taylor@usda.gov;david.vanklaveren@wsu.edu'
		when 'GSZE' then 'maize@uiuc.edu'
		when 'HILO' then 'Carol.MayoRiley@ars.usda.gov;Tracie.Matsumoto@ars.usda.gov'
		when 'MAY' then 'tomas.ayala-silva@usda.gov;ricardo.goenaga@usda.gov'
		when 'MIA' then 'Mike.Winterstein@usda.gov;Ricardo.Goenaga@usda.gov'
		when 'NA' then 'todd.rounsaville@usda.gov'
		when 'NC7' then 'nc7orders@ars.usda.gov;lisa.burke@ars.usda.gov'
		when 'NE9' then 'Joanne.Labate@ARS.USDA.GOV;sherri.tennies@ars.usda.gov;zachary.stansell@usda.gov'
		when 'NR6' then 'jesse.schartner@ars.usda.gov;mwmarti1@wisc.edu'
		when 'NSGC' then 'harold.bockelman@ars.usda.gov'
		when 'NSSL' then 'renee.white@ars.usda.gov'
		when 'OPGC' then 'stieve.1@osu.edu'
		when 'PARL' then 'Claire.Heinitz@ars.usda.gov'
		when 'PEO' then 'karen.williams@ars.usda.gov'
	    when 'RIV' then 'Robert.krueger@ars.usda.gov'
		when 'SBML' then 'melanie.schori@ars.usda.gov'
		when 'SOY' then 'Todd.Bedford@ars.usda.gov;esther.peregrine@ars.usda.gov'
		when 'S9' then 'tiffany.fields@ars.usda.gov;ARS-S9Orders@ars.usda.gov'
		when 'TGRC' then 'trchetelat@ucdavis.edu'
		when 'TOB' then 'jessica_nifong@ncsu.edu'
		when 'W6' then 'barbara.hellier@ars.usda.gov;lisa.taylor@usda.gov;david.vanklaveren@wsu.edu;alec.mccall@wsu.edu;'      
		else 'marty.reisinger@usda.gov'
   END AS email
FROM
	web_order_request_item wori
JOIN
	accession a
ON
	wori.accession_id = a.accession_id
JOIN
	cooperator c
ON
	a.owned_by = c.cooperator_id
JOIN
	site s
ON
	c.site_id = s.site_id
WHERE
	web_order_request_id = @web_order_request_id)

SELECT 
	@email_recipients = STRING_AGG (email,';')
FROM 
	cte_orders

SELECT 
	@email_recipients

SELECT
	wori.web_order_request_id,
	wori.web_order_request_item_id,
	a.accession_number_part1,
	a.accession_number_part2,
	a.accession_number_part3,
	wori.accession_id,
	s.site_id,
	s.site_short_name
FROM
	web_order_request_item wori
JOIN
	accession a
ON
	wori.accession_id = a.accession_id
JOIN
	cooperator c
ON
	a.owned_by = c.cooperator_id
JOIN
	site s
ON
	c.site_id = s.site_id
WHERE
	web_order_request_id = @web_order_request_id


	
	--IF (@email_recipients IS NULL)
	--BEGIN
	--	SET @email_recipients = 'marty.reisinger@usda.gov;benjamin.haag@usda.gov'
	--END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItem_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestItem_Select] 
	@web_order_request_item_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	web_cooperator_id,
	web_order_request_id,
	sequence_number,
	accession_id,
	status_code,
	(SELECT c.site_id FROM cooperator c JOIN accession a ON a.owned_by = c.cooperator_id AND a.accession_id = wori.accession_id) AS site_id,
	name,
	quantity_shipped,
	unit_of_shipped_code,
	distribution_form_code,
	curator_note,
	user_note,
	(SELECT taxonomy_species_id FROM accession WHERE accession_id = wori.accession_id) AS taxonomy_species_id,
	created_date,
	created_by,
	modified_date,
	modified_by,
	owned_date,
	owned_by
FROM
    web_order_request_item wori
WHERE
	web_order_request_item_id = @web_order_request_item_id
  

END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItems_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestItems_Select] 
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	wori.web_cooperator_id,
	web_order_request_id,
	sequence_number,
	a.accession_id,
	LTRIM(RTRIM(LTRIM(COALESCE(accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, accession_number_part2), '') + ' ') + COALESCE(accession_number_part3, ''))) AS accession_text,
	wori.status_code,
	c.site_id,
	s.site_long_name,
	s.site_short_name,
	CASE s.site_short_name 
		WHEN 'BRW' THEN 'lj.grauke@ars.usda.gov'
		WHEN 'COR' THEN 'Missy.Fix@ars.usda.gov'
		WHEN 'COT' THEN 'james.frelichowski@ars.usda.gov;janna.love@ars.usda.gov'  
		WHEN 'DAV' THEN 'ordersNCGR.davis@ars.usda.gov'
		WHEN 'DBMU' THEN 'benjamin.haag@usda.gov'
		WHEN 'DLEG' THEN 'mjohnson@ag.arizona.edu'
		WHEN 'GEN' THEN 'dawn.dellefave@ars.usda.gov;ben.gutierrez@ars.usda.gov'
		WHEN 'GSOR' THEN 'lorie.bernhardt@ars.usda.gov'
		WHEN 'GSPI' THEN 'barbara.hellier@ars.usda.gov;alec.mccall@wsu.edu;stoutd@wsu.edu;lisa.taylor@usda.gov'
		WHEN 'GSZE' THEN 'maize@uiuc.edu'
		WHEN 'HILO' THEN 'Carol.MayoRiley@ars.usda.gov;Tracie.Matsumoto@ars.usda.gov'
		WHEN 'MAY' THEN 'tomas.ayala-silva@usda.gov;ricardo.goenaga@usda.gov'
		WHEN 'MIA' THEN 'Mike.Winterstein@usda.gov;Ricardo.Goenaga@usda.gov'
		WHEN 'NA' THEN 'kevin.conrad@ars.usda.gov'
		WHEN 'NC7' THEN 'nc7orders@ars.usda.gov;lisa.burke@ars.usda.gov'
		WHEN 'NE9' THEN 'Joanne.Labate@ARS.USDA.GOV;sherri.tennies@ars.usda.gov'
		WHEN 'NR6' THEN 'jesse.schartner@ars.usda.gov;mwmarti1@wisc.edu'
		WHEN 'NSGC' THEN 'harold.bockelman@ars.usda.gov'
		WHEN 'NSSL' THEN 'renee.white@ars.usda.gov'
		WHEN 'OPGC' THEN 'stieve.1@osu.edu'
		WHEN 'PARL' THEN 'Claire.Heinitz@ars.usda.gov'
		WHEN 'PEO' THEN 'karen.williams@ars.usda.gov'
		WHEN 'RIV' THEN 'Robert.krueger@ars.usda.gov'
		WHEN 'SBML' THEN 'melanie.schori@ars.usda.gov'
		WHEN 'SOY' THEN 'Todd.Bedford@ars.usda.gov;esther.peregrine@ars.usda.gov'
		WHEN 'S9' THEN 'tiffany.fields@ars.usda.gov;ARS-S9Orders@ars.usda.gov'
		WHEN 'TGRC' THEN 'trchetelat@ucdavis.edu'
		WHEN 'TOB' THEN 'jessica_nifong@ncsu.edu'
		WHEN 'W6' THEN 'stoutd@wsu.edu;barbara.hellier@ars.usda.gov;lisa.taylor@usda.gov;david.vanklaveren@wsu.edu;alec.mccall@wsu.edu;'      
		ELSE 'benjamin.haag@usda.gov'
	END AS email,
	wori.name,
	ISNULL(quantity_shipped,0) AS quantity_shipped,
	unit_of_shipped_code,
	(SELECT TOP 1
		title 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = unit_of_shipped_code 
	 AND 
		cvl.sys_lang_id = 1 
	 AND 
		group_name = 'UNIT_OF_QUANTITY') AS unit_of_shipped,
	distribution_form_code,
	(SELECT TOP 1
		description 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = distribution_form_code 
	 AND cvl.sys_lang_id = 1) AS distribution_form,
	curator_note,
	user_note,
	ts.taxonomy_species_id,
	ts.name AS species_name
FROM
    web_order_request_item wori
JOIN
	accession a
ON
	wori.accession_id = a.accession_id
JOIN
	cooperator c
ON
	a.owned_by = c.cooperator_id
JOIN
	site s
ON
	c.site_id = s.site_id
JOIN
	taxonomy_species ts
ON
	a.taxonomy_species_id = ts.taxonomy_species_id
WHERE
	web_order_request_id = @web_order_request_id
  

END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestLock_Update]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestLock_Update] 
	@out_error_number INT = 0 OUTPUT,
	@web_order_request_id INT,
	@web_cooperator_id INT,
	@is_locked BIT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		DECLARE @owned_by INT
		DECLARE @owned_date DATETIME2(7)

		IF (@is_locked = 0)
		BEGIN
			SET @owned_by = 1
			SET @owned_date = GETDATE()
		END
		ELSE
			BEGIN
				SET @owned_by = @web_cooperator_id
				SET @owned_date = GETDATE()
			END

		UPDATE
			web_order_request 
		SET
			is_locked = @is_locked,
			owned_by = @owned_by,
			owned_date = @owned_date
		WHERE
			web_order_request_id = @web_order_request_id
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Search]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequests_Search]
	@sql_where_clause NVARCHAR(2000)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_select NVARCHAR(MAX)

	SET @sql_select = 
	'SELECT [web_order_request_id]
      ,[is_locked]
      ,[web_cooperator_id]
      ,[last_name]
      ,[title]
      ,[first_name]
      ,[full_name]
      ,[web_cooperator_title]
      ,[web_cooperator_last_name]
      ,[web_cooperator_first_name]
      ,[web_cooperator_full_name]
      ,[web_cooperator_organization]
      ,[web_cooperator_address_line_1]
      ,[web_cooperator_address_line_2]
      ,[web_cooperator_address_line_3]
      ,[web_cooperator_address_city]
      ,[web_cooperator_address_postal_index]
      ,[web_cooperator_address_state]
      ,[web_cooperator_primary_phone]
      ,[web_cooperator_email]
      ,[web_cooperator_created_date]
      ,[web_cooperator_modified_date]
      ,[address_line1]
      ,[address_line2]
      ,[address_line3]
      ,[city]
      ,[postal_index]
      ,[geography_id]
      ,[primary_phone]
      ,[email]
      ,[ordered_date]
      ,[intended_use_code]
      ,[intended_use_note]
      ,[status_code]
      ,[note]
      ,[special_instruction]
      ,[created_date]
      ,[created_by]
      ,[created_by_name]
      ,[modified_date]
      ,[modified_by]
      ,[modified_by_name]
      ,[owned_date]
      ,[owned_by]
      ,[owned_by_name]
	  FROM vw_gringlobal_weborders'
	SET @sql_select = @sql_select + @sql_where_clause 

	--SELECT @sql_select
	EXECUTE sp_executesql @sql_select
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequests_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT wor.web_order_request_id
      ,wor.web_cooperator_id
      ,wc.last_name
      ,wc.title
      ,wc.first_name
	  ,(wc.first_name + ' ' + wc.last_name) AS full_name
      ,wc.organization
      ,wora.address_line1
      ,wora.address_line2
      ,wora.address_line3
      ,wora.city
      ,wora.postal_index
      ,wora.geography_id
      ,wc.primary_phone
      ,wc.email
      ,wor.ordered_date
      ,wor.intended_use_code
      ,wor.intended_use_note
      ,wor.status_code
      ,wor.note
      ,wor.special_instruction
      ,wor.created_date
      ,wor.created_by
      ,wor.modified_date
      ,wor.modified_by
      ,wor.owned_date
      ,wor.owned_by
FROM
    web_order_request wor
LEFT JOIN 
	web_cooperator wc 
ON 
	wc.web_cooperator_id = wor.web_cooperator_id
LEFT JOIN 
	web_order_request_address wora 
ON 
	wora.web_order_request_id = wor.web_order_request_id
WHERE
	wor.status_code = 'CANCELED'
AND 
	wor.ordered_date > '8/1/2020'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestsByStatus_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestsByStatus_Select]
	@status_code NVARCHAR(20),
	@time_frame_code INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_select NVARCHAR(MAX)
	DECLARE @sql_where NVARCHAR(2000) = ''

	SET @sql_select = 
	'SELECT 
		wor.web_order_request_id,
		wor.is_locked,
		wor.web_cooperator_id
		,wc.last_name
		,wc.title
		,wc.first_name
		,(wc.first_name + '' '' + wc.last_name) AS full_name
		,wc.title AS web_cooperator_title
		,wc.last_name AS web_cooperator_last_name
		,wc.first_name AS web_cooperator_first_name
		,(wc.first_name + '' '' + wc.last_name) AS web_cooperator_full_name
		,wc.organization AS web_cooperator_organization
		,wc.address_line1 AS web_cooperator_address_line_1
		,wc.address_line2 AS web_cooperator_address_line_2
		,wc.address_line3 AS web_cooperator_address_line_3
		,wc.city AS web_cooperator_address_city
		,wc.postal_index AS web_cooperator_address_postal_index
		,wc.geography_id
		,g.adm1 AS web_cooperator_address_state
		,wc.primary_phone AS web_cooperator_primary_phone
		,wc.email AS web_cooperator_email
		,wc.created_date AS web_cooperator_created_date
		,wc.modified_date AS web_cooperator_modified_date
		,wora.address_line1
		,wora.address_line2
		,wora.address_line3
		,wora.city
		,wora.postal_index
		,wora.geography_id
		,wc.primary_phone
		,wc.email
		,wor.ordered_date
		,wor.intended_use_code
		,wor.intended_use_note
		,wor.status_code
		,wor.note
		,wor.special_instruction
		,wor.created_date,
		wor.created_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = wor.created_by) AS created_by_name,
		wor.modified_date,
		wor.modified_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = wor.modified_by) AS modified_by_name,
		wor.owned_date,
		wor.owned_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = wor.owned_by) AS owned_by_name
	FROM
		web_order_request wor
	JOIN 
		web_cooperator wc 
	ON 
		wc.web_cooperator_id = wor.web_cooperator_id
	LEFT OUTER JOIN 
		web_order_request_address wora 
	ON 
		wora.web_order_request_id = wor.web_order_request_id
	JOIN
		geography g
	ON
		wc.geography_id = g.geography_id'

	IF (@status_code != 'ALL_STATUSES') OR (@time_frame_code > 0)
		BEGIN
			IF (@status_code != 'ALL_STATUSES')
				BEGIN
					SET @sql_where = @sql_where + ' WHERE wor.status_code = ''' + @status_code + ''''
				END

			IF (@time_frame_code > 0)
				BEGIN
					IF LEN(@sql_where) > 0
						BEGIN
							SET @sql_where = @sql_where + ' AND '
						END
					ELSE
						BEGIN
							SET @sql_where = @sql_where + ' WHERE '
						END
				END

			IF (@time_frame_code = 1)
				BEGIN
					SET @sql_where = @sql_where + ' wor.created_date >= DATEADD(day,-1, GETDATE())'
				END
		ELSE
			BEGIN
				IF (@time_frame_code = 2)
					BEGIN
						SET @sql_where = @sql_where +  ' wor.created_date >= DATEADD(day,-7, GETDATE())'
					END
				ELSE
					BEGIN
						IF (@time_frame_code = 3)
							BEGIN
								SET @sql_where = @sql_where +  ' wor.created_date >= DATEADD(day,-30, GETDATE())'
							END
						ELSE
							BEGIN
								IF (@time_frame_code = 4)
									BEGIN
										SET @sql_where = @sql_where +  ' wor.created_date >= DATEADD(day,-60, GETDATE())'
									END
							END
					END
			END
			SET @sql_select = @sql_select + @sql_where + ' ORDER BY wor.ordered_date DESC'
		END
	--SELECT @sql_select
	EXECUTE sp_executesql @sql_select
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestStatuses_Select]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestStatuses_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		status_code,
		vgc.title,
		COUNT(web_order_request_id) AS web_order_request_count
	FROM 
		web_order_request wor
	JOIN
		vw_gringlobal_codevalues vgc
	ON
		wor.status_code = vgc.value
	WHERE
		status_code IS NOT NULL
	AND
		group_name = 'WEB_ORDER_REQUEST_STATUS'
	GROUP BY 
		status_code,
		title
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 9/14/2021 6:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebUser_Insert]
	 @out_error_number INT = 0 OUTPUT,
	 @out_web_user_id INT = 0 OUTPUT,
	 @user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO web_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 web_cooperator_id,
		 sys_lang_id,
		 created_date
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @web_cooperator_id,
		 1,
		 GETDATE()
		)
		SET @out_web_user_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
