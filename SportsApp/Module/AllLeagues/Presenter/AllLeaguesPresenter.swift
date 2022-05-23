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
    var view : AllLeaguesViewProtocol
    
    init(repo : LeaguesRepo , view : AllLeaguesViewProtocol) {
        self.repo = repo
        self.view = view
    }
        
    func getLeagues(sportName : String){
            repo.getLeagues(sportName : sportName){ leagues in
                //complition(leagues)
                self.view.updateUI(result: leagues ?? [])
            }
    
    }}
