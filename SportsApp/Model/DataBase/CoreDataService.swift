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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext
        private init() {
             context = appDelegate.persistentContainer.viewContext

    }
   // func deleteSport(_ object: FavouriteDB) {
    func deleteSport(_ object: FavouriteLeague) {
            let deleterequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagues")
       // deleterequest.predicate = NSPredicate.init(format: "id = %@", object.self as! CVarArg)
        let str = object.strLeague?.trimmingCharacters(in: .whitespacesAndNewlines)
        deleterequest.predicate = NSPredicate.init(format: "strLeagues = \(str)")
           // let deleteAll = NSBatchDeleteRequest(fetchRequest: deleterequest)
                do {
                    //try context.execute(deleteAll)
                    let objects = try context.fetch(deleterequest)
                        for ob in objects {
                            context.delete(ob as! NSManagedObject)
                            try context.save()
                            print("deleted")
                        }
                }
            catch {
                print(error.localizedDescription)
        
                }
                   }
    
    
    
    

       
       
    func saveFavouriteLeague(_ favouriteLeague: FavouriteLeague) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                      //let  context = appDelegate.persistentContainer.viewContext
                      let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagues", in: context)
                 
                      let newfavLeague = NSManagedObject(entity: entity!, insertInto: context)
                      let strLeague = favouriteLeague.strLeague
                      let strBadge = favouriteLeague.strBadge
                      let strYourTube = favouriteLeague.strYourTube
                       let strSport = favouriteLeague.strSport
                 
                 
                      newfavLeague.setValue(strLeague, forKey: "strLeagues")
                      newfavLeague.setValue(strBadge, forKey: "strBadges")
                      newfavLeague.setValue(strYourTube, forKey: "strYourTubes")
                      newfavLeague.setValue(strSport, forKey: "strSports")

                          
                      do{
                          try context.save()
                          print("data added successfully")
                      }catch{
                          print("Error")
                      }
                      
                          favLeague.append(favouriteLeague)
                     }
        
    
    
    
    
     
//       func fetchFavouriteLeague() -> [FavouriteLeague] {
//    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"FavouriteLeagues" )
//           var  fetchResult :[FavouriteLeague] = []
//           do {
//           fetchResult = try context.fetch(fetchRequest)
//
//           }catch {
//               print(error.localizedDescription)
//               print(" data couldn't fetch")
//           }
//
//
//
//
//        return fetchResult
//    }

//
    func fetchFavouriteLeague() -> [FavouriteLeague] {

//           let appDelegate = UIApplication.shared.delegate as! AppDelegate
//           let context = appDelegate.persistentContainer.viewContext

        //        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        //                do{
        //                    movies = try viewContext!.fetch(fetch)
        //        for i in stride(from: 0, to: movies!.count, by: 1){
        
              let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagues")
                  //var Favleag: [NSManagedObject] = []

              do{
                 let ReturnedfavLeagues = try context.fetch(fetchRequest)
                var Favleag: [NSManagedObject] = []
                 Favleag = ReturnedfavLeagues
                var favLeague: [FavouriteLeague] = []
                for o in Favleag {
                    var tempLeague = FavouriteLeague()
                    tempLeague.strBadge = o.value(forKey: "strBadges") as! String
                    tempLeague.strLeague = o.value(forKey: "strLeagues") as! String
                    tempLeague.strYourTube = o.value(forKey: "strYourTubes") as! String
                    tempLeague.strSport = o.value(forKey: "strSports") as! String
                     favLeague.append(tempLeague)

                }
                print(ReturnedfavLeagues.count)

                  }catch {
                      print("can not retrive data")
                  }



              return favLeague
    }
    
    
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
}
    
    
      

