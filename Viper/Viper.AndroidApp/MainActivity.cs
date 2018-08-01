using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Text;
using System;
using Viper.WebAPI.Models;
using System.Net;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Threading.Tasks;

namespace Viper.AndroidApp
{
    [Activity(Label = "Viper.AndroidApp", MainLauncher = true)]
    public class MainActivity : Activity
    {
        private EditText edtId, edtUser, edtPsw;

        protected override void OnCreate(Bundle savedInstanceState)
        {


            base.OnCreate(savedInstanceState);

          

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            edtId = FindViewById<EditText>(Resource.Id.id);
            edtUser = FindViewById<EditText>(Resource.Id.user);
            edtPsw = FindViewById<EditText>(Resource.Id.psw);

            var ingresar = FindViewById<Button>(Resource.Id.bntIngresar);

            ingresar.Click += delegate
                {
                    CompanyData data = new CompanyData();
                    bool isLogIn = data.GetByLogin("211997", "211997", "123");
                    Toast.MakeText(ApplicationContext, "Valor=" + isLogIn, ToastLength.Long).Show();
                };


        }

    }
}


