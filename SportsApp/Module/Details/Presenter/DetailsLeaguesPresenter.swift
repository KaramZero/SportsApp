//
//  DetailsLeaguesPresenter.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/20/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
class DetailsLeaguesPresenter{

    var repo : Repo
   // var repoT : TeamsRepo
    var coreData : CoreDataRepo
    
    init(repo : Repo , coreData : CoreDataRepo ) {
       // , repoT : TeamsRepo
        self.repo = repo
        self.coreData = coreData
        //self.repoT = repoT
    }
    
    func getLastEventsByLeagueID(leagueID : String , complition : @escaping ([Event]?) -> Void){
                repo.getLastEventsByLeagueID(leagueID: leagueID ){ events in
                    complition(events)
                }
            
        }
    
    func getAllTeams(leagueName : String , complition : @escaping ([Team]?) -> Void) {
            repo.getAllTeams(leagueName: leagueName){ teams in
                complition(teams)
            }
    }
    
    //core
    func saveFavouriteLeague(_ favouriteLeague: FavouriteLeague) {
        coreData.saveFavouriteLeague(favouriteLeague)
    }
    
    
    func deleteSport(_ object: FavouriteLeague) {
        coreData.deleteSport(object)
    }
    
}
