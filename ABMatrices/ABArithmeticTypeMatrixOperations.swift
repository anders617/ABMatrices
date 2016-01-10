import Foundation

/**
 ABMatrixOperableType ABMatrix addition.
*/
@warn_unused_result public func +<T:ABMatrixOperableType>(lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) -> ABMatrix<T> {
    assert(lhs.rowCount==rhs.rowCount && lhs.columnCount==rhs.columnCount, "Summands in ABMatrix addition must have same dimensions.")
    var newABMatrix = ABMatrix<T>(rowCount: lhs.rowCount, columnCount: lhs.columnCount, withValue: lhs[0,0])
    for row in 0..<lhs.rowCount {
        for col in 0..<lhs.columnCount {
            newABMatrix[row,col] = lhs[row,col] + rhs[row,col]
        }
    }
    return newABMatrix
}

@warn_unused_result public func +=<T:ABMatrixOperableType>(inout lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) {
    lhs = lhs + rhs
}

/**
 ABMatrixOperableType ABMatrix subtraction.
*/
@warn_unused_result public func -<T:ABMatrixOperableType>(lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) -> ABMatrix<T> {
    assert(lhs.rowCount==rhs.rowCount && lhs.columnCount==rhs.columnCount, "Minuend and subtrahend in ABMatrix subtraction must have same dimensions.")
    var newABMatrix = ABMatrix<T>(rowCount: lhs.rowCount, columnCount: lhs.columnCount, withValue: lhs[0,0])
    for row in 0..<lhs.rowCount {
        for col in 0..<lhs.columnCount {
            newABMatrix[row,col] = lhs[row,col] - rhs[row,col]
        }
    }
    return newABMatrix
}

@warn_unused_result public func -=<T:ABMatrixOperableType>(inout lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) {
    lhs = lhs - rhs
}

/**
 Scalar ABMatrixOperableType ABMatrix multiplication.
*/
@warn_unused_result public func *<T:ABMatrixOperableType>(lhs:T,_ rhs:ABMatrix<T>) -> ABMatrix<T> {
    var newABMatrix = ABMatrix<T>(rowCount: rhs.rowCount, columnCount: rhs.columnCount, withValue: rhs[0,0])
    for row in 0..<rhs.rowCount {
        for col in 0..<rhs.columnCount {
            newABMatrix[row,col] = lhs * rhs[row,col]
        }
    }
    return newABMatrix
}

/**
 Scalar ABMatrixOperableType ABMatrix multiplication.
*/
@warn_unused_result public func *<T:ABMatrixOperableType>(lhs:ABMatrix<T>,_ rhs:T) -> ABMatrix<T> {
    return rhs * lhs
}

@warn_unused_result public func *=<T:ABMatrixOperableType>(inout lhs:ABMatrix<T>,_ rhs:T) {
    lhs = lhs * rhs
}

/**
 ABMatrix ABMatrixOperableType Multiplication
*/
@warn_unused_result public func *<T:ABMatrixOperableType>(lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) -> ABMatrix<T> {
    typealias Thing = T
    assert(lhs.columnCount==rhs.rowCount, "Left hand column dimension must equal right hand row dimension in ABMatrix multiplication.")
    var newABMatrix = ABMatrix<T>(rowCount: lhs.rowCount, columnCount: rhs.columnCount, withValue: lhs[0,0])
    let row = lhs.row
    let column = rhs.column
    for rowNum in 0..<newABMatrix.rowCount {
        for colNum in 0..<newABMatrix.columnCount {
            newABMatrix[rowNum,colNum] = row[rowNum] * column[colNum]
        }
    }
    return newABMatrix
}

@warn_unused_result public func *=<T:ABMatrixOperableType>(inout lhs:ABMatrix<T>,_ rhs:ABMatrix<T>) {
    lhs = lhs * rhs
}


@warn_unused_result public func ∘<T:ABMatrixOperableType>(lhs:ABMatrix<ArithmeticFunction<T>>,_ rhs:ABVector<T>) -> ABMatrix<T> {
    var newABMatrix = ABMatrix<T>(rowCount: lhs.rowCount, columnCount: lhs.columnCount, withValue: T.defaultValue)
    for rowNum in 0..<newABMatrix.rowCount {
        for columnNum in 0..<newABMatrix.columnCount {
            newABMatrix[rowNum,columnNum] = lhs[rowNum,columnNum].function(rhs)
        }
    }
    return newABMatrix
}


