//
//  FavoriteViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

protocol FavoriteLeagueViewProtocol {
    func updateUI(result :[CountryLeague])
}

class FavoriteViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource , FavoriteLeagueViewProtocol {


    var presenter :  FavoriteLeaguePresenter?
    
    var favoriteArr : [FavouriteLeague]?
    var leaguesArr : [CountryLeague]?
    //outlets
    @IBOutlet weak var favoriteTableView: UITableView!
    
    @IBOutlet weak var internetImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internetImage.isHidden = true
        self.favoriteTableView.reloadData()
        
        presenter = FavoriteLeaguePresenter(repo: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), coreData: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), view : self)
        
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.delegate = self
        DispatchQueue.main.async {
        self.favoriteArr = self.presenter?.fetchFavouriteLeague()
            if(self.favoriteArr?.count == 0)
            {self.internetImage.isHidden = false
                self.favoriteTableView.isHidden = true
            }
            else{
                self.favoriteTableView.reloadData()
            }
        self.favoriteTableView.reloadData()
        }
        
        //core trial
        print(favoriteArr?.count)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteTableView.reloadData()
        DispatchQueue.main.async {
        self.favoriteArr = self.presenter?.fetchFavouriteLeague()
            if(self.favoriteArr?.count == 0)
            {self.internetImage.isHidden = false
                self.favoriteTableView.isHidden = true
            }
            else{
                self.internetImage.isHidden = true
                self.favoriteTableView.isHidden = false
                self.favoriteTableView.reloadData()
                print("COUNT ARRAY")
                print(self.favoriteArr?.count)
            }
        self.favoriteTableView.reloadData()
        }
        self.favoriteTableView.reloadData()
    }
    
    func updateUI(result :[CountryLeague]){
                DispatchQueue.main.async {
                self.leaguesArr = result
        }

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        let favorite = favoriteArr?[indexPath.row] ?? nil
        let process = RoundCornerImageProcessor(cornerRadius: 20.0)
        cell.favoriteCellImage?.kf.setImage(with:URL(string: (favorite?.imageUrl)!),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
        cell.favoriteCellName.text = favorite?.name
        cell.youtubePressed = {
            print("youtube is pressed")
            let youtubeRepo : YoutubeSearchRepo = Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject)
            youtubeRepo.getYoutubeVideoID(keyWord:favorite?.ytLink ?? "youtube"){res in
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
        }

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted from view")
        let favorite = (favoriteArr?[indexPath.row] ?? nil)
        presenter?.deleteSport(favorite!)
        favoriteArr?.remove(at: indexPath.row)
       //favoriteArr =  presenter.fetchFavouriteLeague()
        self.favoriteTableView.reloadData()
        if(self.favoriteArr?.count == 0)
        {self.internetImage.isHidden = false
            self.favoriteTableView.isHidden = true
        }
        
      }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailsVC : DetailsLeagueViewController = segue.destination as! DetailsLeagueViewController
        let cell = sender as! UITableViewCell
        let index = favoriteTableView.indexPath(for: cell)
        detailsVC.leagueName = favoriteArr?[index?.row ?? 0].name
        detailsVC.leagueID = favoriteArr?[index?.row ?? 0].id
        
        detailsVC.favLeagueItem = favoriteArr?[index?.row ?? 0]

        detailsVC.isLiked = true
        self.present(detailsVC, animated: true)
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
