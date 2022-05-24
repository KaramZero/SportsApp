//
//  AllLeaguesViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher
import Network

protocol AllLeaguesViewProtocol {
    func updateUI(result :[CountryLeague])
}

class AllLeaguesViewController: UIViewController ,  UITableViewDelegate , UITableViewDataSource , AllLeaguesViewProtocol{
    
    //testing ui using direct call from repo - will be deleted later
    var presenter : AllLeaguesPresenter?
    var sportName : String?
    var leaguesArr : [CountryLeague]?
    let monitor = NWPathMonitor()

    //outlets
    @IBOutlet weak var allLeaguesTable: UITableView!
    @IBAction func backToSportsButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var internetImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internetImage.isHidden = false
        
        presenter = AllLeaguesPresenter(repo: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), view : self)

        self.allLeaguesTable.dataSource = self
        self.allLeaguesTable.delegate = self
        
       print("SPORTNAME\(String(describing: self.sportName))")
            // calling api from repo temporary - will be deleted later
        presenter?.getLeagues(sportName: sportName ?? "")//{
//                result in  for _ in result!{
//                    DispatchQueue.main.async {
//                        self.leaguesArr = result
//                        self.allLeaguesTable.reloadData()
//                    }
//                }
       // }
        
    }
    

    
    func updateUI(result :[CountryLeague]){
        DispatchQueue.main.async {
            self.leaguesArr = result
            if(self.leaguesArr?.count == 0){
                self.allLeaguesTable.isHidden = true
                var dialogMessage = UIAlertController(title: "Confirm", message: "Please Connect To The Network", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                    self.internetImage.isHidden = false
                    self.dismiss(animated: true, completion: nil)

                 })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }else{
            self.allLeaguesTable.reloadData()
            }}
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
        
        //youtube button not handled yet
        cell.youtubePressed = {
            print("youtube is pressed")
            let youtubeRepo : YoutubeSearchRepo = Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject)
            youtubeRepo.getYoutubeVideoID(keyWord:league?.strYoutube ?? "youtube"){res in
                if (res != nil){
                    var youtubeUrl = NSURL(string:"youtube://\(res!)")!
                    if UIApplication.shared.canOpenURL(youtubeUrl as URL){
                        print("open app")
                        UIApplication.shared.openURL(youtubeUrl as URL)
                    } else{
                        youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(res!)")!
                        print("open web")
                        UIApplication.shared.openURL(youtubeUrl as URL)
                    }
                }
                else{
                    var dialogMessage = UIAlertController(title: "Confirm", message: "Please Connect To The Network", preferredStyle: .alert)
                             let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                                 print("Ok button tapped")

                              })
                             dialogMessage.addAction(ok)
                             self.present(dialogMessage, animated: true, completion: nil)
                             
                }
         
             }
        }
        return cell

    }


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let detailsVC : DetailsLeagueViewController = segue.destination as! DetailsLeagueViewController
    let cell = sender as! UITableViewCell
    let index = allLeaguesTable.indexPath(for: cell)
    detailsVC.leagueName = leaguesArr?[index?.row ?? 0].strLeague
    detailsVC.leagueID = leaguesArr?[index?.row ?? 0].idLeague
    detailsVC.leagueObj = leaguesArr?[index?.row ?? 0]
    self.present(detailsVC, animated: true)
}
    
    @IBAction func backToAllSports(sender : UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
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
