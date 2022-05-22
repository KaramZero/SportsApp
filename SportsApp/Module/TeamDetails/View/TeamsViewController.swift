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
    @IBOutlet weak var generalCard: UIView!
    @IBOutlet weak var tshirtCard: UIView!
    @IBOutlet weak var socialCard: UIView!
    @IBOutlet weak var twitterImage: UIImageView!
    @IBOutlet weak var instgramImage: UIImageView!
    @IBOutlet weak var websiteImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let process = RoundCornerImageProcessor(cornerRadius: 20.0)
        staduimImage?.kf.setImage(with:URL(string: (staduimThumb) ?? "staduim"),placeholder: UIImage(named: "staduim"), options: [.processor(process)], progressBlock: nil)
        staduimImage.layer.cornerRadius = 20.0

        teamImage?.kf.setImage(with:URL(string: (teambadge) ?? "field"),placeholder: UIImage(named: "field"), options: [.processor(process)], progressBlock: nil)
        teamImage.layer.cornerRadius = 20.0


        teamShirtImage?.kf.setImage(with:URL(string: (teamShirt) ?? "shirt"),placeholder: UIImage(named: "shirt"), options: [.processor(process)], progressBlock: nil)
        teamShirtImage.layer.cornerRadius = 20.0
        
        facebookImage.layer.cornerRadius = facebookImage.frame.size.width / 2
        facebookImage.clipsToBounds = true
        //facebookImage.layer.borderColor = UIColor.white as! CGColor
        //facebookImage.layer.borderWidth = 3
        
        twitterImage.layer.cornerRadius = twitterImage.frame.size.width / 2
        twitterImage.clipsToBounds = true
       // twitterImage.layer.borderWidth = 3
        
        instgramImage.layer.cornerRadius = instgramImage.frame.size.width / 2
        instgramImage.clipsToBounds = true
       // instgramImage.layer.borderWidth = 3
        
        websiteImage.layer.cornerRadius = websiteImage.frame.size.width / 2
        websiteImage.clipsToBounds = true
       // websiteImage.layer.borderWidth = 3
        
        
        
        
        teamNameLabel.text = teamName
        staduimNameLabel.text = staduimName
        yearLabel.text = foundedYear
        countryNameLabel.text = countryName
        
        //facebook
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.facebookTapped))
        facebookImage.addGestureRecognizer(tapGR)
        facebookImage.isUserInteractionEnabled = true
        //twitter
        let tapGRT = UITapGestureRecognizer(target: self, action: #selector(self.twitterTapped))
        twitterImage.addGestureRecognizer(tapGRT)
        twitterImage.isUserInteractionEnabled = true
        //instgram
        let tapGRI = UITapGestureRecognizer(target: self, action: #selector(self.instgramTapped))
        instgramImage.addGestureRecognizer(tapGRI)
        instgramImage.isUserInteractionEnabled = true
        //website
        let tapGRW = UITapGestureRecognizer(target: self, action: #selector(self.websiteTapped))
        websiteImage.addGestureRecognizer(tapGRW)
        websiteImage.isUserInteractionEnabled = true
    }
    

    @IBAction func backFromTeams(sender : UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
    
    //facebook
    @objc func facebookTapped(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                    print("UIImageView tapped")
                openURL(facebookURL ?? "https://www.facebook.com")
                print(facebookURL)
                //"https://"
            }
    }
    //twitter
    @objc func twitterTapped(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                    print("UIImageView tapped")
                openURL(twitterURL ?? "https://www.twitter.com")
            }
    }
    
    //instgram
    @objc func instgramTapped(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                    print("UIImageView tapped")
                openURL(instgramURL ?? "https://www.instagram.com")
            }
    }
    //website
    @objc func websiteTapped(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                    print("UIImageView tapped")
                openURL(websiteURL ?? "https://www.google.com")
            }
    }
    
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: "https://" + urlString) else {
            return
        }
        UIApplication.shared.open(url, completionHandler: { success in
            if success {
                print("opened")
            } else {
                print("failed")
            }
        })
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
