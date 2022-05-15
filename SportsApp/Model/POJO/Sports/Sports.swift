
import Foundation

struct Sports: Codable {

  var sports : [Sport]? = []

  enum CodingKeys: String, CodingKey {

    case sports = "sports"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sports = try values.decodeIfPresent([Sport].self , forKey: .sports )
 
  }

  init() {

  }

}
