
import Foundation

struct CountryLeague: Codable {

  var idLeague           : String? = nil
  var idSoccerXML        : String? = nil
  var idAPIfootball      : String? = nil
  var strSport           : String? = nil
  var strLeague          : String? = nil
  var strLeagueAlternate : String? = nil
  var intDivision        : String? = nil
  var idCup              : String? = nil
  var strCurrentSeason   : String? = nil
  var intFormedYear      : String? = nil
  var dateFirstEvent     : String? = nil
  var strGender          : String? = nil
  var strCountry         : String? = nil
  var strWebsite         : String? = nil
  var strFacebook        : String? = nil
  var strInstagram       : String? = nil
  var strTwitter         : String? = nil
  var strYoutube         : String? = nil
  var strRSS             : String? = nil
  var strDescriptionEN   : String? = nil
  var strDescriptionDE   : String? = nil
  var strDescriptionFR   : String? = nil
  var strDescriptionIT   : String? = nil
  var strDescriptionCN   : String? = nil
  var strDescriptionJP   : String? = nil
  var strDescriptionRU   : String? = nil
  var strDescriptionES   : String? = nil
  var strDescriptionPT   : String? = nil
  var strDescriptionSE   : String? = nil
  var strDescriptionNL   : String? = nil
  var strDescriptionHU   : String? = nil
  var strDescriptionNO   : String? = nil
  var strDescriptionPL   : String? = nil
  var strDescriptionIL   : String? = nil
  var strTvRights        : String? = nil
  var strFanart1         : String? = nil
  var strFanart2         : String? = nil
  var strFanart3         : String? = nil
  var strFanart4         : String? = nil
  var strBanner          : String? = nil
  var strBadge           : String? = nil
  var strLogo            : String? = nil
  var strPoster          : String? = nil
  var strTrophy          : String? = nil
  var strNaming          : String? = nil
  var strComplete        : String? = nil
  var strLocked          : String? = nil

  enum CodingKeys: String, CodingKey {

    case idLeague           = "idLeague"
    case idSoccerXML        = "idSoccerXML"
    case idAPIfootball      = "idAPIfootball"
    case strSport           = "strSport"
    case strLeague          = "strLeague"
    case strLeagueAlternate = "strLeagueAlternate"
    case intDivision        = "intDivision"
    case idCup              = "idCup"
    case strCurrentSeason   = "strCurrentSeason"
    case intFormedYear      = "intFormedYear"
    case dateFirstEvent     = "dateFirstEvent"
    case strGender          = "strGender"
    case strCountry         = "strCountry"
    case strWebsite         = "strWebsite"
    case strFacebook        = "strFacebook"
    case strInstagram       = "strInstagram"
    case strTwitter         = "strTwitter"
    case strYoutube         = "strYoutube"
    case strRSS             = "strRSS"
    case strDescriptionEN   = "strDescriptionEN"
    case strDescriptionDE   = "strDescriptionDE"
    case strDescriptionFR   = "strDescriptionFR"
    case strDescriptionIT   = "strDescriptionIT"
    case strDescriptionCN   = "strDescriptionCN"
    case strDescriptionJP   = "strDescriptionJP"
    case strDescriptionRU   = "strDescriptionRU"
    case strDescriptionES   = "strDescriptionES"
    case strDescriptionPT   = "strDescriptionPT"
    case strDescriptionSE   = "strDescriptionSE"
    case strDescriptionNL   = "strDescriptionNL"
    case strDescriptionHU   = "strDescriptionHU"
    case strDescriptionNO   = "strDescriptionNO"
    case strDescriptionPL   = "strDescriptionPL"
    case strDescriptionIL   = "strDescriptionIL"
    case strTvRights        = "strTvRights"
    case strFanart1         = "strFanart1"
    case strFanart2         = "strFanart2"
    case strFanart3         = "strFanart3"
    case strFanart4         = "strFanart4"
    case strBanner          = "strBanner"
    case strBadge           = "strBadge"
    case strLogo            = "strLogo"
    case strPoster          = "strPoster"
    case strTrophy          = "strTrophy"
    case strNaming          = "strNaming"
    case strComplete        = "strComplete"
    case strLocked          = "strLocked"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    idLeague           = try values.decodeIfPresent(String.self , forKey: .idLeague           )
    idSoccerXML        = try values.decodeIfPresent(String.self , forKey: .idSoccerXML        )
    idAPIfootball      = try values.decodeIfPresent(String.self , forKey: .idAPIfootball      )
    strSport           = try values.decodeIfPresent(String.self , forKey: .strSport           )
    strLeague          = try values.decodeIfPresent(String.self , forKey: .strLeague          )
    strLeagueAlternate = try values.decodeIfPresent(String.self , forKey: .strLeagueAlternate )
    intDivision        = try values.decodeIfPresent(String.self , forKey: .intDivision        )
    idCup              = try values.decodeIfPresent(String.self , forKey: .idCup              )
    strCurrentSeason   = try values.decodeIfPresent(String.self , forKey: .strCurrentSeason   )
    intFormedYear      = try values.decodeIfPresent(String.self , forKey: .intFormedYear      )
    dateFirstEvent     = try values.decodeIfPresent(String.self , forKey: .dateFirstEvent     )
    strGender          = try values.decodeIfPresent(String.self , forKey: .strGender          )
    strCountry         = try values.decodeIfPresent(String.self , forKey: .strCountry         )
    strWebsite         = try values.decodeIfPresent(String.self , forKey: .strWebsite         )
    strFacebook        = try values.decodeIfPresent(String.self , forKey: .strFacebook        )
    strInstagram       = try values.decodeIfPresent(String.self , forKey: .strInstagram       )
    strTwitter         = try values.decodeIfPresent(String.self , forKey: .strTwitter         )
    strYoutube         = try values.decodeIfPresent(String.self , forKey: .strYoutube         )
    strRSS             = try values.decodeIfPresent(String.self , forKey: .strRSS             )
    strDescriptionEN   = try values.decodeIfPresent(String.self , forKey: .strDescriptionEN   )
    strDescriptionDE   = try values.decodeIfPresent(String.self , forKey: .strDescriptionDE   )
    strDescriptionFR   = try values.decodeIfPresent(String.self , forKey: .strDescriptionFR   )
    strDescriptionIT   = try values.decodeIfPresent(String.self , forKey: .strDescriptionIT   )
    strDescriptionCN   = try values.decodeIfPresent(String.self , forKey: .strDescriptionCN   )
    strDescriptionJP   = try values.decodeIfPresent(String.self , forKey: .strDescriptionJP   )
    strDescriptionRU   = try values.decodeIfPresent(String.self , forKey: .strDescriptionRU   )
    strDescriptionES   = try values.decodeIfPresent(String.self , forKey: .strDescriptionES   )
    strDescriptionPT   = try values.decodeIfPresent(String.self , forKey: .strDescriptionPT   )
    strDescriptionSE   = try values.decodeIfPresent(String.self , forKey: .strDescriptionSE   )
    strDescriptionNL   = try values.decodeIfPresent(String.self , forKey: .strDescriptionNL   )
    strDescriptionHU   = try values.decodeIfPresent(String.self , forKey: .strDescriptionHU   )
    strDescriptionNO   = try values.decodeIfPresent(String.self , forKey: .strDescriptionNO   )
    strDescriptionPL   = try values.decodeIfPresent(String.self , forKey: .strDescriptionPL   )
    strDescriptionIL   = try values.decodeIfPresent(String.self , forKey: .strDescriptionIL   )
    strTvRights        = try values.decodeIfPresent(String.self , forKey: .strTvRights        )
    strFanart1         = try values.decodeIfPresent(String.self , forKey: .strFanart1         )
    strFanart2         = try values.decodeIfPresent(String.self , forKey: .strFanart2         )
    strFanart3         = try values.decodeIfPresent(String.self , forKey: .strFanart3         )
    strFanart4         = try values.decodeIfPresent(String.self , forKey: .strFanart4         )
    strBanner          = try values.decodeIfPresent(String.self , forKey: .strBanner          )
    strBadge           = try values.decodeIfPresent(String.self , forKey: .strBadge           )
    strLogo            = try values.decodeIfPresent(String.self , forKey: .strLogo            )
    strPoster          = try values.decodeIfPresent(String.self , forKey: .strPoster          )
    strTrophy          = try values.decodeIfPresent(String.self , forKey: .strTrophy          )
    strNaming          = try values.decodeIfPresent(String.self , forKey: .strNaming          )
    strComplete        = try values.decodeIfPresent(String.self , forKey: .strComplete        )
    strLocked          = try values.decodeIfPresent(String.self , forKey: .strLocked          )
 
  }

  init() {

  }

}