using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;
using System.Linq;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class BaseTaxonomyDAO : BaseDAO
    {
        protected ResultContainer ValidateAuthority(string authorities)
        {
            ResultContainer resultContainer = new ResultContainer();
            try
            {
                //convert all author construction syntax to &
                authorities = Regex.Replace(authorities, @"\(|\)|,|\?| ex | non |sensu | et al\.", "&");
                string[] authList = authorities.Split('&');
                foreach (string auth in authList)
                {
                    string authClean = auth.Trim();
                    if (!String.IsNullOrEmpty(authClean))
                    {
                        //var dtAuth = args.ReadData(@"SELECT * FROM taxonomy_author WHERE short_name = :auth", ":auth", authClean, DbType.String);
                        //if (dtAuth.Rows.Count < 1)
                        //{
                            //args.Cancel("Family author " + authClean + " could not be validated.");
                        //}
                    }
                }
            }
            catch (Exception ex)
            { }
            return resultContainer;
        }

        protected List<Author> GetAuthorMatches(string searchText)
        {
            List<Author> authors = new List<Author>();
            return null;
        }
    }
}
