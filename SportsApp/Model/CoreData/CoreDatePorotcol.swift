//
//  CoreDatePorotcol.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//


import Foundation


protocol CoreDataProtocol {
    func insertLeagueToCoreData(league : FavouriteLeague) -> Int
    func getAllFavLeagueFromCoreData() -> [FavouriteLeague]
    func deleteFavLeagueFromCoreData(league: FavouriteLeague) -> Int
    func checkForFavLeagueInCoreData(league: FavouriteLeague) -> Int
}
