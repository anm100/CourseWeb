using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for Utils
/// </summary>
public class Utils
{
	public Utils()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetData(String sql)
    {
        using (var db = new courseExampleEntities())
        {
            var data = GetDataSet(sql);
            data.Tables[0].TableName = "Users";
            return JsonConvert.SerializeObject(data, new CustomDateTimeConverter());
        }


    }
    // utils 
    public static DataSet GetDataSet(string sql)
    {
        // creates resulting dataset
        var result = new DataSet();

        // creates a data access context (DbContext descendant)
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = sql;
            try {
             context.Database.Connection.Open();
            var reader = cmd.ExecuteReader();
            // loop through all resultsets (considering that it's possible to have more than one)
            do
            {
                // loads the DataTable (schema will be fetch automatically)
                var tb = new DataTable();
                tb.Load(reader);
                result.Tables.Add(tb);

            } while (!reader.IsClosed);
        }
            finally
            {
                // closes the connection
                context.Database.Connection.Close();
            }
        }

        // returns the DataSet
        return result;
    }

}

class CustomDateTimeConverter : IsoDateTimeConverter
{
    public CustomDateTimeConverter()
    {
        base.DateTimeFormat = "dd-MM-yyyy HH:mm";
    }
}