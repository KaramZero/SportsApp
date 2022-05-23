//
//  FavoriteTableViewCell.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    var youtubePressed : (() -> Void)?
    //outlets
    
    @IBOutlet weak var favoriteCellImage: UIImageView!
    
    @IBOutlet weak var favoriteCellName: UILabel!
    
    @IBOutlet weak var favoriteCellButton: UIButton!
    
    
    @IBAction func allLeaguesCellYoutube(_ sender: UIButton) {
        youtubePressed?()
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
