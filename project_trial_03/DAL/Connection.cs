using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace project_trial_03.DAL
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            string connectionString = "Data Source=.;Initial Catalog=AircraftDB;Integrated Security=True";
            return connectionString;
        }
    }
}