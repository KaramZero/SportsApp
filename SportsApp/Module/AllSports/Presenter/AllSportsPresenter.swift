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
    
    init(repo : AllSportsRepo) {
        self.repo = repo
    }
    
    func getAllSports(complition : @escaping ([Sport]?) -> Void) {
            repo.getAllSports(){ sports in
                complition(sports)
            }
    } 
}
