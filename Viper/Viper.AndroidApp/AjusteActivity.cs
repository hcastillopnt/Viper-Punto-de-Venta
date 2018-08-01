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
using System.Net.Http;
using Newtonsoft.Json;
using Viper.WebAPI.Models;

namespace Viper.AndroidApp
{
    [Activity(Label = "AjusteActivity")]
    public class AjusteActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
            SetContentView(Resource.Layout.Ajuste);



            var list = FindViewById<ListView>(Resource.Id.listView);

           

        }
    }
}
    
