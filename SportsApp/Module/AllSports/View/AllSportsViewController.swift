//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher


protocol AllSportsViewProtocol {
    func updateUI (result : [Sport])
}

class AllSportsViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , AllSportsViewProtocol{
    
    //testing ui using direct call from repo - will be deleted later
    var presenter : AllSportsPresenter?
    var sportArr : [Sport]?
   // var fromSportsToLeagueProtocol :FromSportsToLeagueProtocol?
    

    //outlets
    @IBOutlet weak var allSportsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AllSportsPresenter(repo: Repo.getSharedRepo(remoteSource: RemoteSource.sharedObject), view: self)
       // CoreDataService.saveFavouriteLeague()
        
        allSportsCollectionView.dataSource = self
        allSportsCollectionView.delegate = self
        allSportsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

        //allSportsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
        // calling api from repo temporary - will be deleted later
        presenter?.getAllSports()
        
        
        
                //result in
//                DispatchQueue.main.async {
//                    self.sportArr = result
//                    self.allSportsCollectionView.reloadData()
//                }
            
    
        
 
    }
    
    func updateUI (result : [Sport]){
        DispatchQueue.main.async {
            self.sportArr = result
            self.allSportsCollectionView.reloadData()
        }
    }
    
    
    //collection view functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allSportsCollectionView.dequeueReusableCell(withReuseIdentifier: "AllSportsCollectionViewCell", for: indexPath) as! AllSportsCollectionViewCell
        let sport = sportArr?[indexPath.row] ?? nil
        cell.allSportsCellName?.text = sport?.strSport
        let process = RoundCornerImageProcessor(cornerRadius: 20.0)
        cell.allSportsCellImage?.kf.setImage(with:URL(string: (sport?.strSportThumb)!),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
        cell.allSportsCellImage.layer.cornerRadius = 20.0
        return cell
    }
    
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = UIScreen.main.bounds.width / 2.5
            return CGSize(width: width, height: 150)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AllLeaguesVC : AllLeaguesViewController = segue.destination as! AllLeaguesViewController
        let  cell = sender as! UICollectionViewCell
        let index = allSportsCollectionView.indexPath(for : cell)
        AllLeaguesVC.sportName = sportArr?[index?.row ?? 0].strSport
        self.present(AllLeaguesVC,animated: true)
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
