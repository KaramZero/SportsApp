//
//  RemoteSourceTests.swift
//  SportsAppTests
//
//  Created by Karam Ibrahim on 5/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import XCTest
@testable import SportsApp



class RemoteSourceTests: XCTestCase {

    
    private let remoteSource = RemoteSource.sharedObject
    private let youtubeSource : YoutubeSearch = YoutebeRemoteSource.sharedObject

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testGetAllSports(){
       
        let expect = expectation(description: "Waiting for API response ")
        remoteSource.getAllSports(){ sports in
            guard let items = sports else{
                XCTFail()
                expect.fulfill()
                return
            }
            
            XCTAssert(items.count > 0, "test faild")
            expect.fulfill()
            return
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    
    func testGetEvents(){
        
        let expect = expectation(description: "Waiting for API response ")
        remoteSource.getUpcomingEventsByLeagueID(leagueID: "4328"){ events in
            guard let items = events else{
                XCTFail()
                expect.fulfill()
                return
            }
            
            XCTAssert( true , "test faild")
            expect.fulfill()
            return
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        
    }
    
    

    func testGetAllTeams(){
        let expect = expectation(description: "Waiting for API response ")
             remoteSource.getAllTeams(leagueName: "English Premier League"){ events in
                 guard let items = events else{
                     XCTFail()
                     expect.fulfill()
                     return
                 }
                 
                XCTAssert( items.count == 20 , "test faild")
                 expect.fulfill()
                 return
             }
             
             waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetAllLeagues(){
        
        let expect = expectation(description: "Waiting for API response ")
                   remoteSource.getAllLeagues(){ events in
                       guard let items = events else{
                           XCTFail()
                           expect.fulfill()
                           return
                       }
                       
                      XCTAssert( items.count == 896 , "test faild")
                       expect.fulfill()
                       return
                   }
                   
                   waitForExpectations(timeout: 5, handler: nil)
        
    }

    func testGetAllCountries(){
        
        let expect = expectation(description: "Waiting for API response ")
                         remoteSource.getAllCountries(){ events in
                             guard let items = events else{
                                 XCTFail()
                                 expect.fulfill()
                                 return
                             }
                             
                            XCTAssert( items.count == 257 , "test faild")
                             expect.fulfill()
                             return
                         }
                         
                         waitForExpectations(timeout: 5, handler: nil)
        
    }
    
        
}
