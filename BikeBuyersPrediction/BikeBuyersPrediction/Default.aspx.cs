using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;

namespace BikeBuyersPrediction
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void lbPredict_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtId.Text) || string.IsNullOrEmpty(rblMaritalStatus.SelectedValue) || string.IsNullOrEmpty(rblGender.SelectedValue) || string.IsNullOrEmpty(txtIncome.Text) || string.IsNullOrEmpty(ddlChildren.SelectedValue) || string.IsNullOrEmpty(rblEducation.SelectedValue) || string.IsNullOrEmpty(rblOccupation.SelectedValue) || string.IsNullOrEmpty(rblHomeOwner.SelectedValue) || string.IsNullOrEmpty(txtCars.Text) || string.IsNullOrEmpty(rblCommute.SelectedValue) || string.IsNullOrEmpty(rblRegion.SelectedValue) || string.IsNullOrEmpty(txtAge.Text) || string.IsNullOrEmpty(rblPurchased.SelectedValue))
            {
                lblResults.Text = "You must enter all values";
                return;
            }
            else
            {
                var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/fa700d0208b145c39a558489f25ab4d5/services/4db418ec78214a14860592ec1bb3aa6a/execute?api-version=2.0&details=true&");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer uQy1RXyTGChueF7wgVsTmOTXYxBRHeKh2pMZF6zEIkt21fPR6GoRSlfSuai4jA4Vmp/2xepv+vB4+AMCXmTb7g==");
                request.AddHeader("Content-Type", "application/json");

                string id = txtId.Text;
                string maritalStatus = rblMaritalStatus.SelectedItem.Text;
                string gender = rblGender.SelectedItem.Text;
                string yearlyIncome = txtIncome.Text;
                string children = ddlChildren.SelectedValue;
                string education = rblEducation.SelectedItem.Text;
                string occupation = rblOccupation.SelectedItem.Text;
                string homeOwner = rblHomeOwner.SelectedItem.Text;
                string cars = txtCars.Text;
                string commuteDistance = rblCommute.SelectedItem.Text;
                string region = rblRegion.SelectedItem.Text;
                string age = txtAge.Text;
                string bikeBuyer = rblPurchased.SelectedItem.Text;

                var body = $@"{{
                  ""Inputs"": {{
                    ""input1"": {{
                      ""ColumnNames"": [
                        ""id"",
                        ""Marital Status"",
                        ""Gender"",
                        ""Yearly Income"",
                        ""Children"",
                        ""Education"",
                        ""Occupation"",
                        ""Home Owner"",
                        ""Cars"",
                        ""Commute Distance"",
                        ""Region"",
                        ""Age"",
                        ""BikeBuyer""
                      ],
                      ""Values"": [
                        [
                          ""{id}"",
                          ""{maritalStatus}"",
                          ""{gender}"",
                          ""{yearlyIncome}"",
                          ""{children}"",
                          ""{education}"",
                          ""{occupation}"",
                          ""{homeOwner}"",
                          ""{cars}"",
                          ""{commuteDistance}"",
                          ""{region}"",
                          ""{age}"",
                          ""{bikeBuyer}""
                        ]
                      ]
                    }}
                  }},
                  ""GlobalParameters"": {{}}
                }}";

                request.AddParameter("application/json", body, ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                //lblResults.Text = response.Content.ToString();

                Console.WriteLine(response);
                JObject obj = JObject.Parse(response.Content);
                var values = obj["Results"]["output1"]["value"]["Values"][0];
                string scoredLabels = (string)values[12];
                double scoredProbabilities = (double)values[13];

                //Console.WriteLine("Scored Labels: " + scoredLabels);
                //Console.WriteLine("Scored Probabilities: " + scoredProbabilities);

                lblResults.Text = scoredProbabilities.ToString("#0.##%");
            }
        }
    }
}