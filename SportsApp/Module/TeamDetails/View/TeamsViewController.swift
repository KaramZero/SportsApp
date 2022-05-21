//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/21/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class TeamsViewController: UIViewController {
    
    var teamName : String?
    var leagueName : String?
    var foundedYear : String?
    var staduimName : String?
    var websiteURL : String?
    var facebookURL : String?
    var twitterURL : String?
    var instgramURL : String?
    var countryName : String?
    var teambadge : String?
    var teamShirt : String?
    var staduimThumb : String?

    //outlets
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var staduimImage: UIImageView!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var staduimNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var teamShirtImage: UIImageView!
    @IBOutlet weak var facebookImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let process = RoundCornerImageProcessor(cornerRadius: 20.0)
        staduimImage?.kf.setImage(with:URL(string: (staduimThumb) ?? "staduim"),placeholder: UIImage(named: "staduim"), options: [.processor(process)], progressBlock: nil)
        staduimImage.layer.cornerRadius = 20.0

        teamImage?.kf.setImage(with:URL(string: (teambadge) ?? "field"),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
        teamImage.layer.cornerRadius = 20.0


        teamShirtImage?.kf.setImage(with:URL(string: (teamShirt) ?? "shirt"),placeholder: UIImage(named: "shirt"), options: [.processor(process)], progressBlock: nil)
        teamShirtImage.layer.cornerRadius = 20.0
        
        
        
        teamNameLabel.text = teamName
        staduimNameLabel.text = staduimName
        yearLabel.text = foundedYear
        countryNameLabel.text = countryName
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        facebookImage.addGestureRecognizer(tapGR)
        facebookImage.isUserInteractionEnabled = true
        

    }
    

    @IBAction func backFromTeams(sender : UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                    print("UIImageView tapped")
            }
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
