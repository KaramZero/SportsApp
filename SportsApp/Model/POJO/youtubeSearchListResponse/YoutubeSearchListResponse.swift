
import Foundation

struct YoutubeSearchListResponse: Codable {

  var kind          : String?   = nil
  var etag          : String?   = nil
  var nextPageToken : String?   = nil
  var regionCode    : String?   = nil
  var pageInfo      : PageInfo? = PageInfo()
  var items         : [Items]?  = []

  enum CodingKeys: String, CodingKey {

    case kind          = "kind"
    case etag          = "etag"
    case nextPageToken = "nextPageToken"
    case regionCode    = "regionCode"
    case pageInfo      = "pageInfo"
    case items         = "items"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    kind          = try values.decodeIfPresent(String.self   , forKey: .kind          )
    etag          = try values.decodeIfPresent(String.self   , forKey: .etag          )
    nextPageToken = try values.decodeIfPresent(String.self   , forKey: .nextPageToken )
    regionCode    = try values.decodeIfPresent(String.self   , forKey: .regionCode    )
    pageInfo      = try values.decodeIfPresent(PageInfo.self , forKey: .pageInfo      )
    items         = try values.decodeIfPresent([Items].self  , forKey: .items         )
 
  }

  init() {

  }

}