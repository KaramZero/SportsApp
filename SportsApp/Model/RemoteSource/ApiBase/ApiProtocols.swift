//
//  ApiProtocols.swift
//  SportsApp
//
//  Created by Karam Ibrahim on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

protocol SportsApi {
     func getResponse(url : String, complition : @escaping (Data?) -> Void)
}

protocol YoutubeSearchApi {
     func getYoutubeSearchResponse(keyWord : String, complition : @escaping (Data?) -> Void)
}
