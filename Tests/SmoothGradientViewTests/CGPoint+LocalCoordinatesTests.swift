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
import CoreGraphics

final class CGPointLocalCoordinatesTests: XCTestCase {
    func test_topLeft_isCorrect() {
        XCTAssertEqual(CGPoint.topLeft, CGPoint(x: 0.0, y: 0.0))
    }
    
    func test_top_isCorrect() {
        XCTAssertEqual(CGPoint.top, CGPoint(x: 0.5, y: 0.0))
    }
    
    func test_topRight_isCorrect() {
        XCTAssertEqual(CGPoint.topRight, CGPoint(x: 1.0, y: 0.0))
    }
    
    func test_centerLeft_isCorrect() {
        XCTAssertEqual(CGPoint.left, CGPoint(x: 0.0, y: 0.5))
    }
    
    func test_center_isCorrect() {
        XCTAssertEqual(CGPoint.center, CGPoint(x: 0.5, y: 0.5))
    }
    
    func test_centerRight_isCorrect() {
        XCTAssertEqual(CGPoint.right, CGPoint(x: 1.0, y: 0.5))
    }
    
    func test_bottomLeft_isCorrect() {
        XCTAssertEqual(CGPoint.bottomLeft, CGPoint(x: 0.0, y: 1.0))
    }
    
    func test_bottom_isCorrect() {
        XCTAssertEqual(CGPoint.bottom, CGPoint(x: 0.5, y: 1.0))
    }
    
    func test_bottomRight_isCorrect() {
        XCTAssertEqual(CGPoint.bottomRight, CGPoint(x: 1.0, y: 1.0))
    }
}
