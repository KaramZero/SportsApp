//
//  CoreDataManger.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

protocol CoreDataManager {
    
    func saveFavouriteLeague(_ favouriteLeague:FavouriteLeague)
       
  func fetchFavouriteLeague() -> [NSManagedObject]
  func deleteSport(_ object :NSManagedObject)
   
}
