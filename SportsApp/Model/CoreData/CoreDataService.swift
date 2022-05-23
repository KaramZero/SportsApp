//
//  CoreDataService.swift
//  SportsApp
//
//  Created by daliamansour on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//


import Foundation
import CoreData
import UIKit


class CoreDataService: CoreDataProtocol {
    var managedObjectContext : NSManagedObjectContext!
    
    static var coreDataServiceIntanace = CoreDataService()
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    
    func insertLeagueToCoreData(league : FavouriteLeague) -> Int{
        let entity = NSEntityDescription.entity(forEntityName: "LeagueCore", in: managedObjectContext)
        
        let leagueData = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
        let imagetStrBase64 = league.image!.base64EncodedString(options: .lineLength64Characters)
        
        leagueData.setValue(league.name, forKey: "name")
        leagueData.setValue(imagetStrBase64, forKey: "image")
        leagueData.setValue(league.ytLink, forKey: "ytLink")
        leagueData.setValue(league.id, forKey: "id")
        leagueData.setValue(league.imageUrl, forKey: "imageUrl")
        
        do{
            try managedObjectContext.save()
            print("Insert Done")
        }catch{
            print(error.localizedDescription)
            print("Insert Fail")
            return 0
        }
        
        return 1
    }
    
    func getAllFavLeagueFromCoreData() -> [FavouriteLeague]{
        var favList : [FavouriteLeague] = []
        let data = NSFetchRequest<NSManagedObject>(entityName: "LeagueCore")
        
        do{
            let returnedArray = try managedObjectContext.fetch(data)
            
            for i in 0..<returnedArray.count{
                let name = returnedArray[i].value(forKey: "name") as? String
                let image = returnedArray[i].value(forKey: "image") as? String
                let ytLink = returnedArray[i].value(forKey: "ytLink") as? String
                let id = returnedArray[i].value(forKey: "id") as? String
                let imageUrl = returnedArray[i].value(forKey: "imageUrl") as? String
                let imageData = Data(base64Encoded: image!, options: .ignoreUnknownCharacters)
                
                let obj = FavouriteLeague(image: imageData!, name: name!, ytLink: ytLink!, id: id!, imageUrl: imageUrl!)
                
                favList.append(obj)
            }
        }catch{
            print("Retrieveing Fail")
            print(error.localizedDescription)
            return favList
        }
        
        return favList
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague) -> Int{
        let obj = searchByObject(league: league)
        guard let object = obj else{
            return 0
        }
        
        managedObjectContext.delete(object)
        return 1
    }
    
    func checkForFavLeagueInCoreData(league: FavouriteLeague) -> Int{
        let obj = searchByObject(league: league)
        guard obj != nil else{
            return 0
        }
        
        return 1
    }
    
    func searchByObject(league: FavouriteLeague) -> NSManagedObject? {
        let data = NSFetchRequest<NSManagedObject>(entityName: "LeagueCore")
        
        do{
            let returnedArray = try managedObjectContext.fetch(data)
            
            for i in 0..<returnedArray.count{
                let name = returnedArray[i].value(forKey: "name") as? String
                let image = returnedArray[i].value(forKey: "image") as? String
                let ytLink = returnedArray[i].value(forKey: "ytLink") as? String
                let id = returnedArray[i].value(forKey: "id") as? String
                let imageData = NSData(base64Encoded: image ?? "", options: .ignoreUnknownCharacters)
                
                
                if id == league.id{
                    return returnedArray[i]
                }
            }
        }catch{
            print("Retrieveing Fail")
            print(error.localizedDescription)
            return nil
        }
        
        return nil
    }
}


/*  //// 3nd l controller
 let imageData: NSData =  cell.leagueImage.image!.pngData() as! NSData
 
 
 
 // 3nd l controller
 cell.imageView?.image = UIImage(data: Data(base64Encoded: x, options: .ignoreUnknownCharacters)!)  ?? UIImage(named:"apple.png")
 
 print("Image Data: \(imageData)")
 */
