
import Foundation

struct Events: Codable {

  var events : [Event]? = []

  enum CodingKeys: String, CodingKey {

    case events = "results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    events = try values.decodeIfPresent([Event].self , forKey: .events )
 
  }

  init() {

  }

}
