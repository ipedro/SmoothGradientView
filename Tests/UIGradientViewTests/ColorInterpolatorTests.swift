//  Copyright (c) 2022 Pedro Almeida
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
@testable import UIGradientView

final class ColorInterpolatorTests: XCTestCase {
    func test_linearInterpolationWithZeroSteps_isCorrect() {
        // Given
        let c1: UIColor = .white
        let c2: UIColor = .black
        let sut = ColorInterpolator(
            colors: [c1, c2],
            ease: .linear,
            steps: 0
        )
        
        // When
        let result = sut.interpolate()
        
        // Then
        XCTAssertEqual(
            result.map(\.cgColor.components),
            [
                [1.0, 1.0],
                [0.0, 1.0]
            ]
        )
    }
    
    func test_linearInterpolationWithThreeSteps_isCorrect() {
        // Given
        let c1: UIColor = .init(red: 0, green: 1, blue: 1, alpha: 1)
        let c2: UIColor = .init(red: 0, green: 1, blue: 0, alpha: 1)
        let sut = ColorInterpolator(
            colors: [c1, c2],
            ease: .linear,
            steps: 3
        )
        
        // When
        let result = sut.interpolate()
        
        // Then
        XCTAssertEqual(
            result.map(\.cgColor.components),
            [
                [0.0, 1.0, 1.00, 1.0],
                [0.0, 1.0, 0.75, 1.0],
                [0.0, 1.0, 0.50, 1.0],
                [0.0, 1.0, 0.25, 1.0],
                [0.0, 1.0, 0.00, 1.0]
            ]
        )
    }
}
