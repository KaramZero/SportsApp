//
//  YoutubeRemoteSource.swift
//  SportsApp
//
//  Created by Karam Ibrahim on 5/16/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

class YoutebeRemoteSource: YoutubeSearch {
    
    
    private let source : YoutubeSearchApi = ApiBaseSource()
    
    static let sharedObject = YoutebeRemoteSource()
    private let decoder = JSONDecoder()
    
    private init(){
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getYoutubeVideoID(keyWord : String , complition : @escaping (String?) -> Void){
        let keyWord = keyWord.replacingOccurrences(of: " ", with: "%20")

        source.getYoutubeSearchResponse(keyWord: keyWord){res in
            do{
                                  let response = try self.decoder.decode(YoutubeSearchListResponse.self, from: res!)
                                  print("All YoutubeSearchResponse are here")
                                  complition(response.items![0].id?.videoId)
                              }catch let error{
                                  print("All YoutubeSearchResponse are not Here")
                                  print(error.localizedDescription)
                              }
            
        }
        
    }

    
}
