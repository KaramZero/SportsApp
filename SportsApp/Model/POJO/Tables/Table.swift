
import Foundation

struct Table: Codable {

  var idStanding        : String? = nil
  var intRank           : String? = nil
  var idTeam            : String? = nil
  var strTeam           : String? = nil
  var strTeamBadge      : String? = nil
  var idLeague          : String? = nil
  var strLeague         : String? = nil
  var strSeason         : String? = nil
  var strForm           : String? = nil
  var strDescription    : String? = nil
  var intPlayed         : String? = nil
  var intWin            : String? = nil
  var intLoss           : String? = nil
  var intDraw           : String? = nil
  var intGoalsFor       : String? = nil
  var intGoalsAgainst   : String? = nil
  var intGoalDifference : String? = nil
  var intPoints         : String? = nil
  var dateUpdated       : String? = nil

  enum CodingKeys: String, CodingKey {

    case idStanding        = "idStanding"
    case intRank           = "intRank"
    case idTeam            = "idTeam"
    case strTeam           = "strTeam"
    case strTeamBadge      = "strTeamBadge"
    case idLeague          = "idLeague"
    case strLeague         = "strLeague"
    case strSeason         = "strSeason"
    case strForm           = "strForm"
    case strDescription    = "strDescription"
    case intPlayed         = "intPlayed"
    case intWin            = "intWin"
    case intLoss           = "intLoss"
    case intDraw           = "intDraw"
    case intGoalsFor       = "intGoalsFor"
    case intGoalsAgainst   = "intGoalsAgainst"
    case intGoalDifference = "intGoalDifference"
    case intPoints         = "intPoints"
    case dateUpdated       = "dateUpdated"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    idStanding        = try values.decodeIfPresent(String.self , forKey: .idStanding        )
    intRank           = try values.decodeIfPresent(String.self , forKey: .intRank           )
    idTeam            = try values.decodeIfPresent(String.self , forKey: .idTeam            )
    strTeam           = try values.decodeIfPresent(String.self , forKey: .strTeam           )
    strTeamBadge      = try values.decodeIfPresent(String.self , forKey: .strTeamBadge      )
    idLeague          = try values.decodeIfPresent(String.self , forKey: .idLeague          )
    strLeague         = try values.decodeIfPresent(String.self , forKey: .strLeague         )
    strSeason         = try values.decodeIfPresent(String.self , forKey: .strSeason         )
    strForm           = try values.decodeIfPresent(String.self , forKey: .strForm           )
    strDescription    = try values.decodeIfPresent(String.self , forKey: .strDescription    )
    intPlayed         = try values.decodeIfPresent(String.self , forKey: .intPlayed         )
    intWin            = try values.decodeIfPresent(String.self , forKey: .intWin            )
    intLoss           = try values.decodeIfPresent(String.self , forKey: .intLoss           )
    intDraw           = try values.decodeIfPresent(String.self , forKey: .intDraw           )
    intGoalsFor       = try values.decodeIfPresent(String.self , forKey: .intGoalsFor       )
    intGoalsAgainst   = try values.decodeIfPresent(String.self , forKey: .intGoalsAgainst   )
    intGoalDifference = try values.decodeIfPresent(String.self , forKey: .intGoalDifference )
    intPoints         = try values.decodeIfPresent(String.self , forKey: .intPoints         )
    dateUpdated       = try values.decodeIfPresent(String.self , forKey: .dateUpdated       )
 
  }

  init() {

  }

}