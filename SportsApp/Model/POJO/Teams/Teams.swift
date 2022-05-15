
import Foundation

struct Teams: Codable {

  var teams : [Team]? = []

  enum CodingKeys: String, CodingKey {

    case teams = "teams"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    teams = try values.decodeIfPresent([Team].self , forKey: .teams )
 
  }

  init() {

  }

}
