//
//  AllSportsPresenter.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
class AllSportsPresenter {

    var repo : AllSportsRepo
    var view : AllSportsViewProtocol
    
    init(repo : AllSportsRepo , view : AllSportsViewProtocol ) {
        self.repo = repo
        self.view = view
    }
    
    func getAllSports() {
            repo.getAllSports(){ sports in
                //complition(sports)
                self.view.updateUI(result: sports ?? [])
            }
    } 
}
