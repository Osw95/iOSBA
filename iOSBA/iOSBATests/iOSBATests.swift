//
//  iOSBATests.swift
//  iOSBATests
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import XCTest
@testable import iOSBA

final class iOSBATests: XCTestCase {
    
    private var sut:MovieTableViewModel!

    override func setUpWithError() throws {
        super.setUp()
        
        sut = MovieTableViewModel()
        
        let dataLoad = dataManager().movies
        
        let tvshowList = try? JSONDecoder().decode([tvshow].self, from: dataLoad)
        
        guard let dataTest = tvshowList?[0] else { return }
        
        _ = sut.addCoreData(dataFav: dataTest)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        
        super.tearDown()
    
    }
    
    func testOfMethod_addCoreData_getTrue(){
        
        let dataLoad = dataManager().movies
        
        let tvshowList = try? JSONDecoder().decode([tvshow].self, from: dataLoad)
        
        guard let dataTest = tvshowList?[1] else { return }
            
        XCTAssertTrue(sut.addCoreData(dataFav: dataTest))
        
        
    }

    func testOfMethod_deleteCoreData_getTrue() throws {
        
        let dataLoad = dataManager().movies
        
        let tvshowList = try? JSONDecoder().decode([tvshow].self, from: dataLoad)
        
        guard let dataTest = tvshowList?[0] else { return }
            
        XCTAssertTrue(sut.deleteCoredata(dataTest))
            
        
    }

}
