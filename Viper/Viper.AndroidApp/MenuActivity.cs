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
    [Activity(Label = "MenuActivity")]
    public class MenuActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
            SetContentView(Resource.Layout.Menu);

            var agregar = FindViewById<ImageButton>(Resource.Id.btnCarrito);
            var estadistica = FindViewById<ImageButton>(Resource.Id.btnEstadistica);
            var inventario = FindViewById<ImageButton>(Resource.Id.btnInventario);
            var reporte = FindViewById<ImageButton>(Resource.Id.btnReporte);


            inventario.Click += delegate
            {

                Intent intent = new Intent(this, typeof(AjusteActivity));
                StartActivity(intent);

            };

            
        }
    }
    }
