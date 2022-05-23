//
//  FavouriteLeague.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

struct FavouriteLeague{

    let image: Data?
    let name: String?
    let ytLink: String?
    let id: String?
    let imageUrl: String?
    
    static func toFavoriteLeague (league : CountryLeague ) -> FavouriteLeague {
        var img = "sportsApp"
        
        var fav = FavouriteLeague(image : img.data(using : .utf8) , name : league.strLeague , ytLink : league.strYoutube , id: league.idLeague , imageUrl: league.strBadge)
        return fav
    }
}

