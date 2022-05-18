//
//  AllLeaguesViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class AllLeaguesViewController: UIViewController ,  UITableViewDelegate , UITableViewDataSource {
    
    //testing ui using direct call from repo - will be deleted later
    var presenter = AllLeaguesPresenter(repo: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject))
    var sportName : String?
    var leaguesArr : [CountryLeague]?

    //outlets
    @IBOutlet weak var allLeaguesTable: UITableView!
    @IBAction func backToSportsButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.allLeaguesTable.dataSource = self
        self.allLeaguesTable.delegate = self
        
       print("SPORTNAME\(String(describing: self.sportName))")
            // calling api from repo temporary - will be deleted later
        presenter.getLeagues(sportName: sportName ?? ""){
                result in  for _ in result!{
                    DispatchQueue.main.async {
                        self.leaguesArr = result
                        self.allLeaguesTable.reloadData()
                    }
                }
        }
        
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allLeaguesTable.dequeueReusableCell(withIdentifier: "AllLeaguesTableViewCell", for: indexPath) as! AllLeaguesTableViewCell
        let league = leaguesArr?[indexPath.row] ?? nil
        let process = RoundCornerImageProcessor(cornerRadius: 20.0)
        cell.allLeaguesCellName.text = league?.strLeague
        cell.allLeaguesCellImage?.kf.setImage(with:URL(string: (league?.strBadge)!),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
        
        return cell
    }
    


//    //protocol functions
//    func FromSportsToLeague(sportName: String) {
//        self.sportName = sportName
//        print("from all leagues \(String(describing: self.sportName))")
//        allLeaguesTable.reloadData()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
