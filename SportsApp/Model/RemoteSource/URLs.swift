//
//  ApiBaseSource.swift
//  SportsPlayGround
//
//  Created by Karam Ibrahim on 5/13/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation


struct URLs {
    static let BASE_URL = "https://www.thesportsdb.com/api/v1/json/2/"
    static let GET_ALL_SPORTS = "all_sports.php?"
    static let GET_ALL_LEAGUES = "all_leagues.php?"
    static let GET_TEAM_DETAILS = "search_all_teams.php?"
    static let GET_UPCOMING_EVENTS="eventsseason.php?"
    static let GET_LATEST_EVENT = "eventsseason.php?"
    static let GET_EVENTS = "eventsseason.php?"
    static let GET_ALL_COUNTRIES = "all_countries.php?"
    static let GET_ALL_SEASONS_IN_LEAGUE = "search_all_seasons.php?id="
    static let GET_ALL_TEAMS_IN_LEAGUE = "search_all_teams.php?l="
    static let GET_TABLE = "lookuptable.php?l="
    static let GET_LAST5_EVENTS_BY_TEAM_ID = "eventslast.php?id="
}

struct ErrorMessage {
    static let genericError = "Something went wrong, Please try again!"
}
