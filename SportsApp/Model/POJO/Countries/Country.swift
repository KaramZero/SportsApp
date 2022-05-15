
import Foundation

struct Country: Codable {

  var name : String? = nil

  enum CodingKeys: String, CodingKey {

    case name = "nameEn"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self , forKey: .name )
 
  }

  init() {

  }

}
