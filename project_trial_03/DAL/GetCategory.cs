using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using project_trial_03.Models;

namespace project_trial_03.DAL
{
    public class GetCategory
    {
        SqlConnection connection = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<Category> GetCategories()
        {
            DataTable dataTable = new DataTable();
            string sqlCommand = "SELECT * FROM tbl_Category";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand,connection);
            dataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(c => new Category
                {
                    categoryId=c.Field<int>("categoryId"),
                    categoryName=c.Field<string>("categoryName")
                })
                .AsQueryable();
        }
        public void Insert(Category category)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_Category VALUES(@cn)",connection);
            command.Parameters.AddWithValue("@cn",category.categoryName);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void Update(Category category)
        {
            SqlCommand command = new SqlCommand(@"UPDATE tbl_Category SET categoryName=@cn WHERE categoryId=@id",connection);
            command.Parameters.AddWithValue("@cn", category.categoryName);
            command.Parameters.AddWithValue("@id",category.categoryId);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void Delete(Category category)
        {
            SqlCommand command = new SqlCommand(@"DELETE FROM tbl_Category WHERE categoryId=@id",connection);
            command.Parameters.AddWithValue("@id",category.categoryId);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}