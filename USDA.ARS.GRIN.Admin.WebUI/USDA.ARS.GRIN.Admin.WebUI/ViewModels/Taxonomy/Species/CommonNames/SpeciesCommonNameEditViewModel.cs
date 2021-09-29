using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesCommonNameEditViewModel:BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int LanguageID { get; set; }
        public string LanguageDescription { get; set; }
        public string Name { get; set; }
        public string SimplifiedName { get; set; }
        public string AlternateTranscription { get; set; }

        public SpeciesCommonNameEditViewModel()
        { }

        public SpeciesCommonNameEditViewModel(CommonName commonName)
        {
            ID = commonName.ID;
            SpeciesID = commonName.SpeciesID;
            SpeciesName = commonName.SpeciesName;
            GenusID = commonName.GenusID;
            GenusName = commonName.GenusName;
            LanguageID = commonName.LanguageID;
            LanguageDescription = commonName.LanguageDescription;
            Name = commonName.Name;
            SimplifiedName = commonName.SimplifiedName;
            AlternateTranscription = commonName.AlternateTranscription;
            CreatedByCooperatorID = commonName.CreatedByCooperatorID;
            CreatedByCooperatorName = commonName.CreatedByCooperatorName;
            CreatedDate = commonName.CreatedDate;
            ModifiedByCooperatorID = commonName.ModifiedByCooperatorID;
            ModifiedByCooperatorName = commonName.ModifiedByCooperatorName;
            ModifiedDate = commonName.ModifiedDate;
        }
        public CommonName GetData()
        {
            return new CommonName
            {
                ID = this.ID,
                SpeciesID = this.SpeciesID,
                GenusID = this.GenusID,
                LanguageID = this.LanguageID,
                LanguageDescription = this.LanguageDescription,
                Name = this.Name,
                SimplifiedName = this.SimplifiedName,
                AlternateTranscription = this.AlternateTranscription,
                CreatedByCooperatorID = this.CreatedByCooperatorID,
                CreatedByCooperatorName = this.CreatedByCooperatorName,
                CreatedDate = this.CreatedDate,
                ModifiedByCooperatorID = this.ModifiedByCooperatorID,
                ModifiedByCooperatorName = this.ModifiedByCooperatorName,
                ModifiedDate = this.ModifiedDate
            };
        }

        public string GetSimplifiedName(string name)
        {
            var cname = name.ToUpper();
            string cname2 = cname.Replace("-", "").Replace("'", "").Replace(" ", "");
            cname2 = cname2.Replace("&Aacute;", "A");
            cname2 = cname2.Replace("&aacute;", "a");
            cname2 = cname2.Replace("&Eacute;", "E");
            cname2 = cname2.Replace("&eacute;", "e");
            cname2 = cname2.Replace("&Iacute;", "I");
            cname2 = cname2.Replace("&iacute;", "i");
            cname2 = cname2.Replace("&Oacute;", "O");
            cname2 = cname2.Replace("&oacute;", "o");
            cname2 = cname2.Replace("&Uacute;", "U");
            cname2 = cname2.Replace("&uacute;", "u");
            cname2 = cname2.Replace("&yacute;", "y");
            cname2 = cname2.Replace("&abreve;", "a");
            cname2 = cname2.Replace("&gbreve;", "g");
            cname2 = cname2.Replace("&#301;", "i");
            cname2 = cname2.Replace("&Ccaron;", "C");
            cname2 = cname2.Replace("&ccaron;", "c");
            cname2 = cname2.Replace("&Ecaron;", "E");
            cname2 = cname2.Replace("&ecaron;", "e");
            cname2 = cname2.Replace("&Rcaron;", "R");
            cname2 = cname2.Replace("&rcaron;", "r");
            cname2 = cname2.Replace("&Scaron;", "S");
            cname2 = cname2.Replace("&scaron;", "s");
            cname2 = cname2.Replace("&Zcaron;", "Z");
            cname2 = cname2.Replace("&zcaron;", "z");
            cname2 = cname2.Replace("&Ccedil;", "C");
            cname2 = cname2.Replace("&ccedil;", "c");
            cname2 = cname2.Replace("&Scedil;", "S");
            cname2 = cname2.Replace("&scedil;", "s");
            cname2 = cname2.Replace("&acirc;", "a");
            cname2 = cname2.Replace("&ecirc;", "e");
            cname2 = cname2.Replace("&Icirc;", "I");
            cname2 = cname2.Replace("&icirc;", "i");
            cname2 = cname2.Replace("&ocirc;", "o");
            cname2 = cname2.Replace("&scirc;", "s");
            cname2 = cname2.Replace("&ucirc;", "u");
            cname2 = cname2.Replace("&agrave;", "a");
            cname2 = cname2.Replace("&egrave;", "e");
            cname2 = cname2.Replace("&igrave;", "i");
            cname2 = cname2.Replace("&ograve;", "o");
            cname2 = cname2.Replace("&Aring;", "A");
            cname2 = cname2.Replace("&aring;", "a");
            cname2 = cname2.Replace("&Oslash;", "O");
            cname2 = cname2.Replace("&oslash;", "o");
            cname2 = cname2.Replace("&aelig;", "ae");
            cname2 = cname2.Replace("&oelig;", "oe");
            cname2 = cname2.Replace("&szlig;", "ss");
            cname2 = cname2.Replace("&atilde;", "a");
            cname2 = cname2.Replace("&Ntilde;", "N");
            cname2 = cname2.Replace("&ntilde;", "n");
            cname2 = cname2.Replace("&otilde;", "o");
            cname2 = cname2.Replace("&Auml;", "A");
            cname2 = cname2.Replace("&auml;", "a");
            cname2 = cname2.Replace("&euml;", "e");
            cname2 = cname2.Replace("&iuml;", "i");
            cname2 = cname2.Replace("&Ouml;", "O");
            cname2 = cname2.Replace("&ouml;", "o");
            cname2 = cname2.Replace("&Uuml;", "U");
            cname2 = cname2.Replace("&uuml;", "u");
            return cname2;
        }
    }
}