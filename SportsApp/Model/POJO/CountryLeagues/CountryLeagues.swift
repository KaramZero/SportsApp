
import Foundation

struct CountryLeagues: Codable {

  var countryLeagues : [CountryLeague]? = []

  enum CodingKeys: String, CodingKey {

    case countryLeagues = "countries"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    countryLeagues = try values.decodeIfPresent([CountryLeague].self , forKey: .countryLeagues )
 
  }

  init() {

  }

}
