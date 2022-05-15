
import Foundation

struct Season: Codable {

  var strSeason : String? = nil

  enum CodingKeys: String, CodingKey {

    case strSeason = "strSeason"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    strSeason = try values.decodeIfPresent(String.self , forKey: .strSeason )
 
  }

  init() {

  }

}