//
//  DetailsLeagueViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

protocol DetailsViewProtocol {
    func updateUILeagues(result :[Event])
    func updateUITeams (result : [Team])
}

class DetailsLeagueViewController: UIViewController ,  UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , DetailsViewProtocol {


    var leagueName : String?
    var leagueID : String?
    var leagueObj : CountryLeague?
    var presenter : DetailsLeaguesPresenter?
   // ,repoT: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject)
    var eventsArr : [Event]?
    var teamsArr : [Team]?
    //declare 2 arrays for upcoming and latest events untill calling the other API
    var upComingArr : [Event]?
    var latesetArr : [Event]?
    let diposeBag = DisposeBag()
    //like button
    var flag : Bool = true
    var fav : FavouriteLeague?
    var isLiked : Bool = false
    var favLeagueItem : FavouriteLeague?
    
    
    
    //outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func backBtn(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBAction func likeBtn(_ sender: UIButton) {
//        if(flag){
//            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//            print("\n LIKED \n")
//            fav = FavouriteLeague.toFavoriteLeague(league: leagueObj!)
//            presenter?.saveFavouriteLeague(fav!)
//            flag = false
//        }else{
//            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
//            print("\n UNLIKED \n")
//            fav = FavouriteLeague.toFavoriteLeague(league: leagueObj!)
//             presenter?.deleteSport(fav!)
//            flag = true
//        }
        if(flag){
            if(isLiked){
                likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                print("\n UNLIKED \n")
                presenter?.deleteSport(favLeagueItem!)
                flag = false
            }else{
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            print("\n UNLIKED \n")
            fav = FavouriteLeague.toFavoriteLeague(league: leagueObj!)
            presenter?.deleteSport(fav!)
                flag = false
                
            }
        }else{
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("\n LIKED \n")
            fav = FavouriteLeague.toFavoriteLeague(league: leagueObj!)
            presenter?.saveFavouriteLeague(fav!)
            flag = true
        }
        
        
        
        
    }
    
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = DetailsLeaguesPresenter(repo: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), coreData: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), view : self)
        //try for like button
        if (isLiked == false){
            fav = FavouriteLeague.toFavoriteLeague(league: leagueObj!)
             var res = presenter?.checkForFavLeagueInCoreData(league: fav!)
            if (res == 1){
                likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                flag = true
            }else{
               likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                flag = false
            }
        }else{
           likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            flag = true
        }
                
        

  //////////////////////////////////////////////// case 1 ///////////////////////////////////////////////////////
        upComingCollectionView.dataSource = self
         upComingCollectionView.delegate = self
         upComingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 300, height:  200)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 4
        layout.scrollDirection = .horizontal
        upComingCollectionView!.collectionViewLayout = layout
        
  //////////////////////////////////////////////// case 2 ///////////////////////////////////////////////////////
        
         latestCollectionView.dataSource = self
         latestCollectionView.delegate = self
         latestCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let layoutL: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutL.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layoutL.itemSize = CGSize(width: 400, height:  250)
        layoutL.minimumInteritemSpacing = 5
        layoutL.minimumLineSpacing = 4
        layoutL.scrollDirection = .vertical
        latestCollectionView!.collectionViewLayout = layoutL
        
  //////////////////////////////////////////////// case 3 ///////////////////////////////////////////////////////
        
         teamsCollectionView.dataSource = self
         teamsCollectionView.delegate = self
         teamsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layoutT: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutT.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layoutT.itemSize = CGSize(width: 200, height:  200)
        layoutT.minimumInteritemSpacing = 5
        layoutT.minimumLineSpacing = 4
        layoutT.scrollDirection = .horizontal
        teamsCollectionView!.collectionViewLayout = layoutT
        
        ///rest of the code calling api and setting it to array
        // calling api from repo temporary - will be deleted later
        //calling events
        presenter?.getLastEventsByLeagueID(leagueID: leagueID ?? "")
//        {
//            result in  for _ in result!{
//                DispatchQueue.main.async {
//                    self.eventsArr = result
//                    self.upComingCollectionView.reloadData()
//                    self.latestCollectionView.reloadData()
//                }
//            }
//        }
        //calling teams
        presenter?.getAllTeams(leagueName:leagueName ?? "")
//        {
//            result in  for _ in result!{
//                DispatchQueue.main.async {
//                    self.teamsArr = result
//                    self.teamsCollectionView.reloadData()
//                }
//            }
//        }
        //divise the the array into two arrays
//        let observable = Observable.of(eventsArr)
//        observable.take(20).subscribe(onNext: { (value) in
//            self.upComingArr = value
//            }).disposed(by: diposeBag)
//
//        observable.takeLast(20).subscribe(onNext: { (value) in
//            self.latesetArr = value
//            }).disposed(by: diposeBag)
 
        
    }
    

    func updateUILeagues(result :[Event]){
        DispatchQueue.main.async {
            self.eventsArr = result
            if(self.eventsArr?.count == 0 ){
                self.upComingCollectionView.isHidden = true
                self.latestCollectionView.isHidden = true
            }else{
            self.upComingCollectionView.reloadData()
                self.latestCollectionView.reloadData()}
        }
    }
    func updateUITeams (result : [Team]){
        DispatchQueue.main.async {
            self.teamsArr = result
            if(self.teamsArr?.count == 0 ){
                self.teamsCollectionView.isHidden = true
            }else{
                self.teamsCollectionView.reloadData()}
        }
    }
    
    
    //functions for collection views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
//////////////////////////////////////////////// case 1 ///////////////////////////////////////////////////////
        case upComingCollectionView:
            //return upComingArr?.count ?? 0
            return eventsArr?.count ?? 0
//////////////////////////////////////////////// case 2 ///////////////////////////////////////////////////////
        case latestCollectionView:
            //return latesetArr?.count ?? 0
            return eventsArr?.count ?? 0
//////////////////////////////////////////////// case 3 ///////////////////////////////////////////////////////
        case teamsCollectionView:
            return teamsArr?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
//////////////////////////////////////////////// case 1 ///////////////////////////////////////////////////////
        case upComingCollectionView:
            
    let cellUpComing = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpComingCollectionViewCell", for: indexPath) as! UpComingCollectionViewCell
    let upComing = eventsArr?[indexPath.row] ?? nil
    let process = RoundCornerImageProcessor(cornerRadius: 20.0)
    cellUpComing.upCominCellImage?.kf.setImage(with:URL(string: (upComing?.strThumb) ?? "upcoming"),placeholder: UIImage(named: "upcoming"), options: [.processor(process)], progressBlock: nil)
    cellUpComing.upCominCellImage.layer.cornerRadius = 20.0
    cellUpComing.upComingCellEventName.text = upComing?.strEvent
    cellUpComing.upComingCellEventTime.text = upComing?.strTime
    cellUpComing.upComingCellEventDate.text = upComing?.dateEvent
    cellUpComing.upComingCellTeamOneName.text = upComing?.strHomeTeam
    cellUpComing.upComingCellTeamTwoName.text = upComing?.strAwayTeam
            return cellUpComing
            
//////////////////////////////////////////////// case 2 ///////////////////////////////////////////////////////
        case latestCollectionView:
            
            let cellLatest = latestCollectionView.dequeueReusableCell(withReuseIdentifier: "LatestCollectionViewCell", for: indexPath) as! LatestCollectionViewCell
            let latest = eventsArr?[indexPath.row] ?? nil
            let processL = RoundCornerImageProcessor(cornerRadius: 20.0)
            cellLatest.latestCellImage?.kf.setImage(with:URL(string: (latest?.strThumb) ?? "upcoming"),placeholder: UIImage(named: "upcoming"), options: [.processor(processL)], progressBlock: nil)
            cellLatest.latestCellImage.layer.cornerRadius = 20.0
            cellLatest.latestCellTeamOneName.text = latest?.strHomeTeam
            cellLatest.latestCellTeamTwoName.text = latest?.strAwayTeam
            cellLatest.latestCellTeamOneScore.text = latest?.intHomeScore
            cellLatest.latestCellTeamTwoScore.text = latest?.intAwayScore

            return cellLatest
 //////////////////////////////////////////////// case 3 ///////////////////////////////////////////////////////
        case teamsCollectionView:
            
            let cellTeams = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
            let teams = teamsArr?[indexPath.row] ?? nil
            let process = RoundCornerImageProcessor(cornerRadius: 20.0)
            cellTeams.teamsCellImage?.kf.setImage(with:URL(string: (teams?.strTeamBadge) ?? "field"),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
            cellTeams.teamsCellImage.layer.cornerRadius = 20.0
            cellTeams.teamsCellName.text = teams?.strTeam
            return cellTeams
            
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    
    @IBAction func backToDetails(sender : UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let teamVC : TeamsViewController = segue.destination as! TeamsViewController
        let cell = sender as! UICollectionViewCell
        let index = teamsCollectionView.indexPath(for: cell)
        teamVC.leagueName = teamsArr?[index?.row ?? 0].strLeague
        teamVC.teamName = teamsArr?[index?.row ?? 0].strTeam
        teamVC.foundedYear = teamsArr?[index?.row ?? 0].intFormedYear
        teamVC.staduimName = teamsArr?[index?.row ?? 0].strStadium
        teamVC.websiteURL = teamsArr?[index?.row ?? 0].strWebsite
        teamVC.facebookURL = teamsArr?[index?.row ?? 0].strFacebook
        teamVC.twitterURL = teamsArr?[index?.row ?? 0].strTwitter
        teamVC.instgramURL = teamsArr?[index?.row ?? 0].strInstagram
        teamVC.countryName = teamsArr?[index?.row ?? 0].strCountry
        teamVC.teambadge = teamsArr?[index?.row ?? 0].strTeamBadge
        teamVC.teamShirt = teamsArr?[index?.row ?? 0].strTeamJersey
        teamVC.staduimThumb = teamsArr?[index?.row ?? 0].strStadiumThumb
        self.present(teamVC, animated: true)
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
