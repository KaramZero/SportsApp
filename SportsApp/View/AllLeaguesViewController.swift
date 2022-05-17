//
//  AllLeaguesViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class AllLeaguesViewController: UIViewController ,  UITableViewDelegate , UITableViewDataSource , FromSportsToLeagueProtocol{
    
    //testing ui using direct call from repo - will be deleted later
    var repo = Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject)
    var sportName : String?
    var leaguesArr : [League]?

    //outlets
    @IBOutlet weak var allLeaguesTable: UITableView!
    @IBAction func backToSportsButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.allLeaguesTable.dataSource = self
        self.allLeaguesTable.delegate = self
        
            // calling api from repo temporary - will be deleted later
            repo.getAllLeagues(){
                result in  for _ in result!{
                    DispatchQueue.main.async {
                        //self.sportArr = result
                        self.allLeaguesTable.reloadData()
                    }
                }
        }
        
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allLeaguesTable.dequeueReusableCell(withIdentifier: "AllLeaguesTableViewCell", for: indexPath) as! AllLeaguesTableViewCell
        return cell
    }
    


    //protocol functions
    func FromSportsToLeague(sportName: String) {
        self.sportName = sportName
        print("from all leagues \(String(describing: self.sportName))")
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
