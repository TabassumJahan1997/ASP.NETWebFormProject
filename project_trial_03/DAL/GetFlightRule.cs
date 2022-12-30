using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using project_trial_03.Models;

namespace project_trial_03.DAL
{
    public class GetFlightRule
    {
        SqlConnection connection = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<FlightRule> GetFlightRules()
        {
            DataTable dataTable = new DataTable();
            string sqlCommand = "SELECT * FROM tbl_FlightRule";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand,connection);
            dataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(fr => new FlightRule
                {
                    ruleId=fr.Field<int>("ruleId"),
                    flightRule = fr.Field<string>("flightRule")
                }).AsQueryable();            
        }

        public void Insert(FlightRule rule)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_FlightRule VALUES(@r)",connection);
            command.Parameters.AddWithValue("@r",rule.flightRule);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}