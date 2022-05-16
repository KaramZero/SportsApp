
import Foundation

struct Thumbnails: Codable {

  var defaultt : Default? = Default()
  var medium  : Medium?  = Medium()
  var high    : High?    = High()

  enum CodingKeys: String, CodingKey {

    case defaultt = "default"
    case medium  = "medium"
    case high    = "high"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    defaultt = try values.decodeIfPresent(Default.self , forKey: .defaultt )
    medium  = try values.decodeIfPresent(Medium.self  , forKey: .medium  )
    high    = try values.decodeIfPresent(High.self    , forKey: .high    )
 
  }

  init() {
  }
}
