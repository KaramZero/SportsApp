//
//  ApiBaseSource.swift
//  SportsPlayGround
//
//  Created by Karam Ibrahim on 5/13/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import Alamofire

class ApiBaseSource{
    
    func getResponse(url : String, complition : @escaping (Data?) -> Void) {
        Alamofire.request(URLs.BASE_URL + url).responseJSON { response in
            complition(response.data)
        }
    }
}
