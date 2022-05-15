
import Foundation

struct Tables: Codable {

  var tables : [Table]? = []

  enum CodingKeys: String, CodingKey {

    case tables = "table"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    tables = try values.decodeIfPresent([Table].self , forKey: .tables )
 
  }

  init() {

  }

}
