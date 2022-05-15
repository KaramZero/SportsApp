
import Foundation

struct Seasons: Codable {

  var seasons : [Season]? = []

  enum CodingKeys: String, CodingKey {

    case seasons = "seasons"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    seasons = try values.decodeIfPresent([Season].self , forKey: .seasons )
 
  }

  init() {

  }

}
