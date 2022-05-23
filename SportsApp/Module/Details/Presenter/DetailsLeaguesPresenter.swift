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
    var view : DetailsViewProtocol
    
    init(repo : Repo , coreData : CoreDataRepo ,view : DetailsViewProtocol ) {
       // , repoT : TeamsRepo
        self.repo = repo
        self.coreData = coreData
        //self.repoT = repoT
        self.view = view
    }
    
    func getLastEventsByLeagueID(leagueID : String){
                repo.getLastEventsByLeagueID(leagueID: leagueID ){ events in
                    //complition(events)
                    self.view.updateUILeagues(result: events ?? [])
                }
            
        }
    
    func getAllTeams(leagueName : String) {
            repo.getAllTeams(leagueName: leagueName){ teams in
               // complition(teams)
                self.view.updateUITeams(result: teams ?? [])
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
