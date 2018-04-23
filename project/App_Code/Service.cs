using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;


public class Service : IService
{
    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "")]

    public List<CDData> GetData()
    {
        List<CDData> objAlbums = new List<CDData>();
        CDListDataContext CDListDataContext = new CDListDataContext();
        var records = (from row in CDListDataContext.CDs orderby row.DiskID, row.Artist select row);
        foreach (var record in records)
        {
            objAlbums.Add(new CDData
            {
                AlbumName = record.AlbumName.ToString(),
                Artist = record.Artist.ToString(),
                TrackCount = record.TrackCount.ToString(),
                RecordLabel = record.RecordLabel.ToString(),
                ReleaseDate = record.ReleaseDate.ToString(),
            });
        }
        return objAlbums;
    }

}

public class CDData
{
    public string AlbumName { get; set; }
    public string Artist { get; set; }
    public string TrackCount { get; set; }
    public string RecordLabel { get; set; }
    public string ReleaseDate { get; set; }
}
