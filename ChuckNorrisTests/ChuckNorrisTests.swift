//
//  ChuckNorrisTests.swift
//  ChuckNorrisTests
//
//  Created by Caique on 13/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import XCTest
@testable import ChuckNorris

class ChuckNorrisTests: XCTestCase {
    var piadasViewModel: PiadasViewModel!
    
    override func setUp() {
        super.setUp()
        piadasViewModel = PiadasViewModel()
        
    }
    
    override func tearDown() {
        super.tearDown()
        piadasViewModel = nil
    }
    
    func testCategorias() {
        piadasViewModel.buscaCategorias() { (response) in
            XCTAssert(self.piadasViewModel.getCategorias().count > 0, "Retorno invalido" )
        }
    }
    func testPiada() {
        piadasViewModel.buscaPiada() { (response) in
            XCTAssertTrue(self.piadasViewModel.getPiada() != nil , "Retorno invalido" )
            XCTAssert(self.piadasViewModel.getPiada()?.icon_url != nil , "Retorno invalido(sem icone)" )
            XCTAssert(self.piadasViewModel.getPiada()?.value != nil , "Retorno invalido(sem texto da piada)" )
            XCTAssert(self.piadasViewModel.getPiada()?.url != nil , "Retorno invalido(sem link da piada)" )
        }
    }
    func testUtils() {
        Utils
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
