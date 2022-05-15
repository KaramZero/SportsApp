
import Foundation

struct League: Codable {

  var idLeague           : String? = nil
  var strLeague          : String? = nil
  var strSport           : String? = nil
  var strLeagueAlternate : String? = nil

  enum CodingKeys: String, CodingKey {

    case idLeague           = "idLeague"
    case strLeague          = "strLeague"
    case strSport           = "strSport"
    case strLeagueAlternate = "strLeagueAlternate"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    idLeague           = try values.decodeIfPresent(String.self , forKey: .idLeague           )
    strLeague          = try values.decodeIfPresent(String.self , forKey: .strLeague          )
    strSport           = try values.decodeIfPresent(String.self , forKey: .strSport           )
    strLeagueAlternate = try values.decodeIfPresent(String.self , forKey: .strLeagueAlternate )
 
  }

  init() {

  }

}