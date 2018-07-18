using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace Viper.AndroidApp
{
    public abstract class ConnectionApiREST<T>
    {
        public string BaseAddress
        {
            get { return "http://localhost:8112"; }
        }

        public abstract string BaseCatalog
        {
            get;
        }

        private void InitializeHttpClient(HttpClient client)
        {
            client.BaseAddress = new Uri(BaseAddress);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<List<T>> Get(string action, string parameters)
        {
            try
            {
                var client = new HttpClient();

                InitializeHttpClient(client);

                List<T> result = new List<T>();

                HttpResponseMessage response = await client.GetAsync(BaseCatalog + action + parameters).ConfigureAwait(continueOnCapturedContext: false);

                if (response.IsSuccessStatusCode)
                {
                    result = await response.Content.ReadAsAsync<List<T>>();
                }

                return result;
            }
            catch (Exception ex)
            {
                Toast.MakeText(Application.Context, ex.Message, ToastLength.Long).Show();
                throw new ApplicationException(ex.Message);
            }
        }
    }

}

