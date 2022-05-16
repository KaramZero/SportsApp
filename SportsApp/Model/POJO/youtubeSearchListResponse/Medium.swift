
import Foundation

struct Medium: Codable {

  var url    : String? = nil
  var width  : Int?    = nil
  var height : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case url    = "url"
    case width  = "width"
    case height = "height"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    url    = try values.decodeIfPresent(String.self , forKey: .url    )
    width  = try values.decodeIfPresent(Int.self    , forKey: .width  )
    height = try values.decodeIfPresent(Int.self    , forKey: .height )
 
  }

  init() {

  }

}