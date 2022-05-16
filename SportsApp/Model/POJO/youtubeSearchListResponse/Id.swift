
import Foundation

struct Id: Codable {

  var kind    : String? = nil
  var videoId : String? = nil

  enum CodingKeys: String, CodingKey {

    case kind    = "kind"
    case videoId = "videoId"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    kind    = try values.decodeIfPresent(String.self , forKey: .kind    )
    videoId = try values.decodeIfPresent(String.self , forKey: .videoId )
 
  }

  init() {

  }

}