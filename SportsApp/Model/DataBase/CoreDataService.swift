//
//  CoreDataService.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import UIKit
import  CoreData

class CoreDataService :CoreDataManager{


    static let sharedCoreDataService = CoreDataService()
    
        var favLeague: [FavouriteLeague] = []
       var context : NSManagedObjectContext!
        
        private init() {}

        func saveFavouriteLeague(_ favouriteLeague: FavouriteLeague) {
       
                 let appDelegate = UIApplication.shared.delegate as! AppDelegate
                 let  context = appDelegate.persistentContainer.viewContext
                 let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagues", in: context)
            
                 let newfavLeague = NSManagedObject(entity: entity!, insertInto: context)
                 let strLeague = favouriteLeague.strLeague
                 let strBadge = favouriteLeague.strBadge
                 let strYourTube = favouriteLeague.strYourTube
                  let isFavourite = favouriteLeague.isFavourite
            
            
                 newfavLeague.setValue(strLeague, forKey: "strLeagues")
                 newfavLeague.setValue(strBadge, forKey: "strBadges")
                 newfavLeague.setValue(strYourTube, forKey: "strYourTubes")
                 newfavLeague.setValue(isFavourite, forKey: "isFavourite")

                     
                 do{
                     try context.save()
                     print("data added successfully")
                 }catch{
                     print("Error")
                 }
                 
                     favLeague.append(favouriteLeague)
                }

    
    
    func fetchFavouriteLeague() -> [FavouriteLeague] {
    
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let context = appDelegate.persistentContainer.viewContext
          
              let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagues")
                   var Favleag: [NSManagedObject] = []

        
              do{
                 let ReturnedfavLeagues = try context.fetch(fetchRequest)
                 Favleag = ReturnedfavLeagues
                print(ReturnedfavLeagues.count)
            
                  }catch {
                      print("can not retrive data")
                  }
         
        var favLeague: [FavouriteLeague] = []
        for o in Favleag {
            var tempLeague = FavouriteLeague()
            tempLeague.strBadge = o.value(forKey: "strBadge") as! String
            tempLeague.strLeague = o.value(forKey: "strLeague") as! String
            tempLeague.strYourTube = o.value(forKey: "strYourTube") as! String
            tempLeague.isFavourite = o.value(forKey: "isFavourite") as! Bool
        }
       
              return favLeague
    }
    
    
    func deleteSport(_ object :  NSManagedObject) {
        
        context.delete(object)
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
            
        }
       }
       
}

