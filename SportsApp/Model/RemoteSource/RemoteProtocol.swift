//
//  RemoteProtocol.swift
//  SportsApp
//
//  Created by Karam Ibrahim on 5/15/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation


protocol RemoteApi{
    func getAllSports(complition : @escaping ([Sport]?) -> Void)
    
    func getEvents(complition : @escaping ([Event]?) -> Void)
    
    func getLastEventsByTeamID(teamID : String , complition : @escaping ([Event]?) -> Void)
    
    func getAllTeams(leagueName : String , complition : @escaping ([Team]?) -> Void)
    
    func getAllLeagues(complition : @escaping ([League]?) -> Void)
    
    func getAllCountries(complition : @escaping ([Country]?) -> Void)
    
    func gatAllSeasonsInLeague(leagueID : String ,complition : @escaping ([Season]?) -> Void)
    
    func gatTable(leagueID : String,season : String ,complition : @escaping ([Table]?) -> Void)
}
