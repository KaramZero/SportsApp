//
//  FavoriteViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    var presenter = FavoriteLeaguePresenter(coreData: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject))
    
    var favoriteArr : [FavouriteLeague]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        favoriteArr = presenter.fetchFavouriteLeague()
       // if favoriteArr != nil {
            print(favoriteArr)
            
            //hena karam ali en a3reed el soura wara low howa b nil
//        }
//        else{
//            print("empty")
//        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
