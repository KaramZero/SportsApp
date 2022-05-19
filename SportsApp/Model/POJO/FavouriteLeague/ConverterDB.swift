//
//  Converter.swift
//  SportsApp
//
//  Created by daliamansour on 5/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import CoreData
extension FavouriteDB{
    
    func decodeToFavouriteLeague ()-> FavouriteLeague{
        
        
        let newLaegue = FavouriteLeague()
        newLaegue.strLeague = self.strLeague
        newLaegue.strBadge = self.strBadge
        newLaegue.strYourTube = self.strYourTube
        newLaegue.strSport = self.strSport
        return newLaegue

        
    }
}



extension FavouriteLeague{
func incodeToFavouriteDB(managedContext : NSManagedObjectContext)-> FavouriteDB  {
        
    let newLaegue = FavouriteDB(context:  managedContext)
               newLaegue.strLeague = self.strLeague
               newLaegue.strBadge = self.strBadge
               newLaegue.strYourTube = self.strYourTube
                newLaegue.strSport = self.strSport
                 newLaegue.strSport = self.strSport

               
        return newLaegue
    }
}

