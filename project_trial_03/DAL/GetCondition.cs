using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using project_trial_03.Models;

namespace project_trial_03.DAL
{
    public class GetCondition
    {
        SqlConnection connection = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<AircraftCondition> GetTypes()
        {
            DataTable dataTable = new DataTable();
            string sqlCommand = "SELECT * FROM tbl_AircraftCondition";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand, connection);
            dataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(at => new AircraftCondition
                {
                    conditionId = at.Field<int>("conditionId"),
                    condition = at.Field<string>("condition")
                })
                .AsQueryable();
        }
        public void Insert(AircraftCondition cond)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_AircraftCondition VALUES(@cn)", connection);
            command.Parameters.AddWithValue("@cn", cond.condition);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}