
import Foundation

struct Sport: Codable {

  var idSport             : String? = nil
  var strSport            : String? = nil
  var strFormat           : String? = nil
  var strSportThumb       : String? = nil
  var strSportIconGreen   : String? = nil
  var strSportDescription : String? = nil

  enum CodingKeys: String, CodingKey {

    case idSport             = "idSport"
    case strSport            = "strSport"
    case strFormat           = "strFormat"
    case strSportThumb       = "strSportThumb"
    case strSportIconGreen   = "strSportIconGreen"
    case strSportDescription = "strSportDescription"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    idSport             = try values.decodeIfPresent(String.self , forKey: .idSport             )
    strSport            = try values.decodeIfPresent(String.self , forKey: .strSport            )
    strFormat           = try values.decodeIfPresent(String.self , forKey: .strFormat           )
    strSportThumb       = try values.decodeIfPresent(String.self , forKey: .strSportThumb       )
    strSportIconGreen   = try values.decodeIfPresent(String.self , forKey: .strSportIconGreen   )
    strSportDescription = try values.decodeIfPresent(String.self , forKey: .strSportDescription )
 
  }

  init() {

  }

}