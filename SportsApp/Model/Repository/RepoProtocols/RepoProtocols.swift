//
//  RepoProtocols.swift
//  SportsApp
//
//  Created by Karam Ibrahim on 5/15/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

protocol AllSportsRepo {
     func getAllSports(complition : @escaping ([Sport]?) -> Void)
}

protocol EventsRepo {
     func getEvents(complition : @escaping ([Event]?) -> Void)
}

protocol TeamsRepo {
    func getAllTeams(leagueName : String , complition : @escaping ([Team]?) -> Void)
}

protocol LeaguesRepo {
     func getAllLeagues(complition : @escaping ([League]?) -> Void)
}

protocol CountriesRepo {
    func getAllCountries(complition : @escaping ([Country]?) -> Void)
}


protocol SeasonsRepo {
      func gatAllSeasonsInLeague(leagueID : String ,complition : @escaping ([Season]?) -> Void)
}

protocol TableRepo {
     func gatTable(leagueID : String,season : String ,complition : @escaping ([Table]?) -> Void)
}
