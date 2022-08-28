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
@testable import SmoothGradientView

final class ColorMixerTests: XCTestCase {
    func test_mixWhiteAndBlack_gray() {
        // Given
        let white: UIColor = .white
        let black: UIColor = .black
        let sut = ColorMixer(c1: white, c2: black, ratio: 0.25)
        
        // When
        let result = sut.mix()
        
        // Then
        XCTAssertEqual(result.cgColor.components, [0.75, 0.75, 0.75, 1])
    }
    
    func test_mixRGBWhiteAndBlack_gray() {
        // Given
        let rgbWhite: UIColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        let rbgBlack: UIColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        let sut = ColorMixer(c1: rgbWhite, c2: rbgBlack, ratio: 0.75)
        
        // When
        let result = sut.mix()
        
        // Then
        XCTAssertEqual(result.cgColor.components, [0.25, 0.25, 0.25, 1])
    }
    
    func test_mixBlueAndGreen_green() {
        // Given
        let blue: UIColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
        let green: UIColor = .init(red: 0, green: 1, blue: 1, alpha: 1)
        let sut = ColorMixer(c1: blue, c2: green, ratio: 1)
        
        // When
        let result = sut.mix()
        
        // Then
        XCTAssertEqual(result.cgColor.components, [0, 1, 1, 1])
    }
    
    func test_mixBlueAndGreen_blue() {
        // Given
        let blue: UIColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
        let green: UIColor = .init(red: 0, green: 1, blue: 1, alpha: 1)
        
        // When
        let result = blue.mix(with: green, ratio: 0.5)
        
        // Then
        XCTAssertEqual(result.cgColor.components, [0, 0.5, 1, 1])
    }
}
