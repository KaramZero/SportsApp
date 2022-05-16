
import Foundation

struct Snippet: Codable {

  var publishedAt          : String?     = nil
  var channelId            : String?     = nil
  var title                : String?     = nil
  var description          : String?     = nil
  var thumbnails           : Thumbnails? = Thumbnails()
  var channelTitle         : String?     = nil
  var liveBroadcastContent : String?     = nil
  var publishTime          : String?     = nil

  enum CodingKeys: String, CodingKey {

    case publishedAt          = "publishedAt"
    case channelId            = "channelId"
    case title                = "title"
    case description          = "description"
    case thumbnails           = "thumbnails"
    case channelTitle         = "channelTitle"
    case liveBroadcastContent = "liveBroadcastContent"
    case publishTime          = "publishTime"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    publishedAt          = try values.decodeIfPresent(String.self     , forKey: .publishedAt          )
    channelId            = try values.decodeIfPresent(String.self     , forKey: .channelId            )
    title                = try values.decodeIfPresent(String.self     , forKey: .title                )
    description          = try values.decodeIfPresent(String.self     , forKey: .description          )
    thumbnails           = try values.decodeIfPresent(Thumbnails.self , forKey: .thumbnails           )
    channelTitle         = try values.decodeIfPresent(String.self     , forKey: .channelTitle         )
    liveBroadcastContent = try values.decodeIfPresent(String.self     , forKey: .liveBroadcastContent )
    publishTime          = try values.decodeIfPresent(String.self     , forKey: .publishTime          )
 
  }

  init() {

  }

}