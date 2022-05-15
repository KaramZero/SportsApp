
import Foundation

struct Leagues: Codable {

  var leagues : [League]? = []

  enum CodingKeys: String, CodingKey {

    case leagues = "leagues"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    leagues = try values.decodeIfPresent([League].self , forKey: .leagues )
 
  }

  init() {

  }

}
