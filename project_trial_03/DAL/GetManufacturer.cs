using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using project_trial_03.Models;

namespace project_trial_03.DAL
{
    public class GetManufacturer
    {
        SqlConnection connection = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<Manufacturer> GetManufacturers()
        {
            DataTable dataTable = new DataTable();
            string sqlCommand = "SELECT * FROM tbl_Manufacturer";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand, connection);
            dataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(mf => new Manufacturer
                {
                    mfId = mf.Field<int>("mfId"),
                    mfName = mf.Field<string>("mfName")
                })
                .AsQueryable();
        }
        public void Insert(Manufacturer manufacturer)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_Manufacturer VALUES(@mn)", connection);
            command.Parameters.AddWithValue("@mn", manufacturer.mfName);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}