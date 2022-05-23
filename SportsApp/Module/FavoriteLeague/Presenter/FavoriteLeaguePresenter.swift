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
    
    
    init(coreData : CoreDataRepo) {
        self.coreData = coreData
    }
    
    func fetchFavouriteLeague() -> [FavouriteLeague] {
        return coreData.fetchFavouriteLeague()
    }
    
    func deleteSport(_ object: FavouriteLeague) {
        coreData.deleteSport(object)
    }
}
