//
//  CoreDataManger.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataManager {
    
    func saveFavouriteLeague(_ favouriteLeague:FavouriteLeague)
    
    func fetchFavouriteLeague() -> [FavouriteLeague]
    func deleteSport(_ object :NSManagedObject)
    
    
   
}
