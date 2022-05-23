//
//  FavoriteLeaguePresenter.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/22/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
class FavoriteLeaguePresenter{
    
    var coreData : CoreDataRepo
    var repo : Repo
    var view : FavoriteLeagueViewProtocol
    
    init(repo : Repo , coreData : CoreDataRepo ,view : FavoriteLeagueViewProtocol ) {
        self.coreData = coreData
        self.repo = repo
        self.view = view
    }
    
    func fetchFavouriteLeague() -> [FavouriteLeague] {
        return coreData.fetchFavouriteLeague()
    }
    
    func deleteSport(_ object: FavouriteLeague) {
        coreData.deleteSport(object)
    }
    
    
    func getLeagues(sportName : String){
            repo.getLeagues(sportName : sportName){ leagues in
                //complition(leagues)
                self.view.updateUI(result: leagues ?? [])
            }
    
    }
    
}
