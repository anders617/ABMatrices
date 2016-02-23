
import XCTest
@testable import ABMatrices

class ABMatrixTests: XCTestCase {
    var matrix: ABMatrix<Int> = ABMatrix(rowCount: 1, columnCount: 1, withValue: 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        matrix = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGet() {
        XCTAssert(matrix[2,1] == 8, "Get failed")
        
    }
    
    func testABMatrixSize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(matrix.rowCount == 3)
        XCTAssert(matrix.columnCount == 3)
    }
    
    func testRowInsertion() {
        matrix.insertRow([5,5,5], atIndex: 3)
        XCTAssert(matrix == [
                [1,2,3],
                [4,5,6],
                [7,8,9],
                [5,5,5]
            ],
            "Row insertion failed")
    }
    
    func testColumnInsertion() {
        matrix.insertColumn([5,5,5], atIndex: 1)
        XCTAssert(matrix == [
                [1,5,2,3],
                [4,5,5,6],
                [7,5,8,9]
            ],
            "Column insertion failed")
    }
    
    func testRowAppend() {
        matrix.appendRow([5,5,5])
        XCTAssert(matrix == [
                [1,2,3],
                [4,5,6],
                [7,8,9],
                [5,5,5]
            ],
            "Row append failed")
    }
    
    func testColumnAppend() {
        matrix.appendColumn([5,5,5])
        XCTAssert(matrix == [
                [1,2,3,5],
                [4,5,6,5],
                [7,8,9,5]
            ],
            "Column append failed")
    }
    
    func testRowRemove() {
        matrix.removeRow(0)
        XCTAssert(matrix == [
                [4,5,6],
                [7,8,9]
            ],
            "Row remove failed")
    }
    
    func testColumnRemove() {
        matrix.removeColumn(0)
        XCTAssert(matrix == [
                [2,3],
                [5,6],
                [8,9]
            ],
            "Column remove failed")
    }
    
    func testMerge() {
        let vertical = matrix.merge([[5,5,5]], onSide: .Bottom)
        XCTAssert(vertical == [
                [1,2,3],
                [4,5,6],
                [7,8,9],
                [5,5,5]
            ],
            "Vertical Merge failed")
        let horizontal = matrix.merge([[5],[5],[5]], onSide: .Right)
        XCTAssert(horizontal == [
                [1,2,3,5],
                [4,5,6,5],
                [7,8,9,5]
            ],
            "Horizontal Merge failed")
    }
    
    func testTranspose() {
        XCTAssert(matrix.transpose == [
                [1,4,7],
                [2,5,8],
                [3,6,9]
            ],
            "Transpose failed")
    }
}
