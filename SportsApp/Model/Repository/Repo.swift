
//
//  Repo.swift
//  SportsPlayGround
//
//  Created by Karam Ibrahim on 5/14/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import Network


class Repo{
    
    private static var sharedRepo : Repo?
    private var remoteSource : RemoteSource?
    private let monitor = NWPathMonitor()
    private var isConnected = true
    
    private init(remoteSource : RemoteSource){
        self.remoteSource = remoteSource
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.isConnected = true
            } else {
                print("There's no internet connection.")
                self.isConnected = false
            }
        }
        let netQueue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.start(queue: netQueue)
        
    }
    
    static func getSharedRepo(remoteSource : RemoteSource)-> Repo{
        if sharedRepo == nil {
            sharedRepo = Repo(remoteSource: remoteSource)
        }
        
        return sharedRepo!
    }
    
    
    func getEvents(complition : @escaping ([Event]?) -> Void) {
        if isConnected {
            remoteSource?.getEvents(){ events in
                complition(events)
            }
        }else {
            complition(nil)
        }
    }
    
    func getAllTeams(leagueName : String , complition : @escaping ([Team]?) -> Void) {
        if isConnected {
            remoteSource?.getAllTeams(leagueName: leagueName){ teams in
                complition(teams)
            }
        }else {
            complition(nil)
        }
    }
    
    func getAllSports(complition : @escaping ([Sport]?) -> Void) {
        if isConnected {
            remoteSource?.getAllSports(){ sports in
                complition(sports)
            }
        }else {
            complition(nil)
        }
    }
    
    func getAllLeagues(complition : @escaping ([League]?) -> Void) {
        if isConnected {
            remoteSource?.getAllLeagues(){ leagues in
                complition(leagues)
            }
        }else {
            complition(nil)
        }
        
    }
    
    func getAllCountries(complition : @escaping ([Country]?) -> Void) {
        
        if isConnected {
            remoteSource?.getAllCountries(){ countries in
                complition(countries)
            }
        }else {
            complition(nil)
        }
        
    }
    
    func gatAllSeasonsInLeague(leagueID : String ,complition : @escaping ([Season]?) -> Void) {
        
        if isConnected {
            remoteSource?.gatAllSeasonsInLeague(leagueID : leagueID){ seasons in
                complition(seasons)
            }
        }else {
            complition(nil)
        }
        
    }
    
    func gatTable(leagueID : String,season : String ,complition : @escaping ([Table]?) -> Void) {
        if isConnected {
            remoteSource?.gatTable(leagueID: leagueID, season: season){table in
                complition(table)
            }
        }else {
            complition(nil)
        }
    }
    
    
}
