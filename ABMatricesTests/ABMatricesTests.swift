//
//  ABMatrixTests.swift
//  ABMatrixTests
//
//  Created by Anders Boberg on 1/1/16.
//  Copyright © 2016 Anders boberg. All rights reserved.
//

import XCTest
@testable import ABMatrices

class ABMatrixTests: XCTestCase {
    var matrix: ABMatrix<Int> = ABMatrix(rowCount: 1, columnCount: 1, withValue: 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        matrix = [[1,2,3],
            [4,5,6],
            [7,8,9]]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testABMatrixSize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(matrix.rowCount == 3)
        XCTAssert(matrix.columnCount == 3)
    }
    
    
    func testTranspose() {
        XCTAssert(matrix.transpose == [[1,4,7],[2,5,8],[3,6,9]])
    }
}
