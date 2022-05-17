//
//  RemoteSource.swift
//  SportsPlayGround
//
//  Created by Karam Ibrahim on 5/13/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation


class RemoteSource : RemoteApi{
    
    static let sharedObject = RemoteSource()
    private let source : SportsApi = ApiBaseSource()
    private let decoder = JSONDecoder()
    
    private init(){
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getEvents(complition : @escaping ([Event]?) -> Void) {
        
    }
    
    func getLastEventsByTeamID(teamID : String , complition : @escaping ([Event]?) -> Void) {
        
        source.getResponse(url: URLs.GET_LAST5_EVENTS_BY_TEAM_ID + teamID) {(res) in
                   do{
                       let response = try self.decoder.decode(Events.self, from: res!)
                       print("All LastEventsByTeamID are here")
                       complition(response.events)
                       
                   }catch let error{
                       print("All LastEventsByTeamID are not Here")
                       print(error.localizedDescription)
                   }
               }
    }
    
    
    func getAllTeams(leagueName : String , complition : @escaping ([Team]?) -> Void) {
        let leagueName = leagueName.replacingOccurrences(of: " ", with: "%20")
        source.getResponse(url: URLs.GET_ALL_TEAMS_IN_LEAGUE + leagueName) {(res) in
            do{
                let response = try self.decoder.decode(Teams.self, from: res!)
                print("All Teams are here")
                complition(response.teams)
                
            }catch let error{
                print("All Teams are not Here")
                print(error.localizedDescription)
            }
        }
    }
    
    func getAllSports(complition : @escaping ([Sport]?) -> Void) {
        
        source.getResponse(url: URLs.GET_ALL_SPORTS) {(res) in
            do{
                let response = try self.decoder.decode(Sports.self, from: res!)
                print("All Sports are here")
                complition(response.sports)
                
            }catch let error{
                print("All Sports are not Here")
                print(error.localizedDescription)
            }
        }
        
    }
    
    func getAllLeagues(complition : @escaping ([League]?) -> Void) {
        
        source.getResponse(url: URLs.GET_ALL_LEAGUES) {(res) in
            do{
                let response = try self.decoder.decode(Leagues.self, from: res!)
                print("All Leagues are here")
                complition(response.leagues)
                
            }catch let error{
                print("All Leagues are not Here")
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    func getLeagues(countryName : String , complition : @escaping ([CountryLeague]?) -> Void){
        let countryName = countryName.replacingOccurrences(of: " ", with: "%20")
       
        source.getResponse(url: URLs.SEARCH_LEAGUE + "c=" + countryName) {(res) in
                  do{
                      let response = try self.decoder.decode(CountryLeagues.self, from: res!)
                      print("All Leagues are here")
                    complition(response.countryLeagues)
                      
                  }catch let error{
                      print("All Leagues are not Here")
                      print(error.localizedDescription)
                  }
              }
    }
    
    func getLeagues(countryName : String , sportName : String , complition : @escaping ([CountryLeague]?) -> Void){
        let countyrName = countryName.replacingOccurrences(of: " ", with: "%20")
        let sportName = sportName.replacingOccurrences(of: " ", with: "%20")
        source.getResponse(url: URLs.SEARCH_LEAGUE + "c=" + countryName + "&s="+sportName) {(res) in
                         do{
                             let response = try self.decoder.decode(CountryLeagues.self, from: res!)
                             print("All Leagues are here")
                           complition(response.countryLeagues)
                             
                         }catch let error{
                             print("All Leagues are not Here")
                             print(error.localizedDescription)
                         }
                     }
    }
      
    func getLeagues(sportName : String , complition : @escaping ([CountryLeague]?) -> Void){
        let sportName = sportName.replacingOccurrences(of: " ", with: "%20")
             
               source.getResponse(url: URLs.SEARCH_LEAGUE + "s=" + sportName) {(res) in
                                do{
                                    let response = try self.decoder.decode(CountryLeagues.self, from: res!)
                                    print("All Leagues are here")
                                  complition(response.countryLeagues)
                                    
                                }catch let error{
                                    print("All Leagues are not Here")
                                    print(error.localizedDescription)
                                }
                            }
    }
    
    
    func getAllCountries(complition : @escaping ([Country]?) -> Void) {
        
        source.getResponse(url: URLs.GET_ALL_COUNTRIES) {(res) in
            do{
                let response = try self.decoder.decode(Countries.self, from: res!)
                print("All Counties are here ")
                complition(response.countries)
                
            }catch let error{
                print("All Countries are not Here")
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    func gatAllSeasonsInLeague(leagueID : String ,complition : @escaping ([Season]?) -> Void) {
        
        source.getResponse(url: URLs.GET_ALL_SEASONS_IN_LEAGUE + leagueID) {(res) in
            do{
                let response = try self.decoder.decode(Seasons.self, from: res!)
                print("All Seasons are here")
                complition(response.seasons)
                
            }catch let error{
                print("All Seasons are not Here")
                print(error.localizedDescription)
            }
        }
        
    }
    
    func gatTable(leagueID : String,season : String ,complition : @escaping ([Table]?) -> Void) {
        
        source.getResponse(url: URLs.GET_TABLE + leagueID+"&s="+season) {(res) in
            do{
                let response = try self.decoder.decode(Tables.self, from: res!)
                print("All Tables are here")
                complition(response.tables)
                
            }catch let error{
                print("All Tables are not Here")
                print(error.localizedDescription)
            }
        }
    }
    
    
}
