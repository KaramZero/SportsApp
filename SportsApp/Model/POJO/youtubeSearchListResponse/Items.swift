
import Foundation

struct Items: Codable {

  var kind    : String?  = nil
  var etag    : String?  = nil
  var id      : Id?      = Id()
  var snippet : Snippet? = Snippet()

  enum CodingKeys: String, CodingKey {

    case kind    = "kind"
    case etag    = "etag"
    case id      = "id"
    case snippet = "snippet"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    kind    = try values.decodeIfPresent(String.self  , forKey: .kind    )
    etag    = try values.decodeIfPresent(String.self  , forKey: .etag    )
    id      = try values.decodeIfPresent(Id.self      , forKey: .id      )
    snippet = try values.decodeIfPresent(Snippet.self , forKey: .snippet )
 
  }

  init() {

  }

}