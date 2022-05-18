//
//  AllLeaguesPresenter.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
class AllLeaguesPresenter {
    
    var repo : LeaguesRepo
    
    init(repo : LeaguesRepo) {
        self.repo = repo
    }
        
    func getLeagues(sportName : String , complition : @escaping ([CountryLeague]?) -> Void){
            repo.getLeagues(sportName : sportName){ leagues in
                complition(leagues)
            }
    
    }}
