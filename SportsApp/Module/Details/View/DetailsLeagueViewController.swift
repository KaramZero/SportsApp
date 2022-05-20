//
//  DetailsLeagueViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class DetailsLeagueViewController: UIViewController ,  UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{


    var leagueName : String?
    
    //outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func backBtn(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    @IBAction func likeBtn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingCollectionView.dataSource = self
         upComingCollectionView.delegate = self
         upComingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 300, height:  200)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        upComingCollectionView!.collectionViewLayout = layout

    }
    
    //functions for collection views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellUpComing = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpComingCollectionViewCell", for: indexPath) as! UpComingCollectionViewCell
        cellUpComing.upCominCellImage.image = UIImage(named: "upcoming")
        cellUpComing.upComingCellEventName.text = "world cup event"
        cellUpComing.upComingCellEventDate.text = "1-1-2001"
        cellUpComing.upComingCellEventTime.text = "1:00 PM"
        cellUpComing.upComingCellTeamOneName.text = "Egypt"
        cellUpComing.upComingCellTeamTwoName.text = "brazil"

        return cellUpComing
    }
    
    
    
    @IBAction func backToDetails(sender : UIStoryboardSegue){
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
