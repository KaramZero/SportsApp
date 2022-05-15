
import Foundation

struct Countries: Codable {

  var countries : [Country]? = []

  enum CodingKeys: String, CodingKey {

    case countries = "countries"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    countries = try values.decodeIfPresent([Country].self , forKey: .countries )
 
  }

  init() {

  }

}
