//
//  AllLeaguesTableViewCell.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class AllLeaguesTableViewCell: UITableViewCell {

    //outlets
    
    @IBOutlet weak var allLeaguesCellImage: UIImageView!
    @IBOutlet weak var allLeaguesCellName: UILabel!
    @IBAction func allLeaguesCellYoutube(_ sender: UIButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
