//
//  YoutubeProtocols.swift
//  SportsApp
//
//  Created by Karam Ibrahim on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

protocol YoutubeSearch {
    func getYoutubeVideoID(keyWord : String , complition : @escaping (String?) -> Void)
}
