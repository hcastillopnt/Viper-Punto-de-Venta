using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace Viper.AndroidApp
{
    public class CompanyData:ConnectionApiREST<Company>
    {
        public override string BaseCatalog
        {
            get { return "/api/account/"; }
        }

        public bool GetByLogin(string usr, string pwd, string compk)
        {
            return Get("GetByLogin", "?usr=" + usr + "&pwd=" + pwd + "&compk=" + compk).Result.Count() > 0;
        }
    }
}