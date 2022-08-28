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

import UIKit

public struct ColorInterpolator: Hashable {
    var colors: [UIColor]
    var ease: Ease
    var steps: UInt
    
    public init(colors: [UIColor], ease: Ease, steps: UInt) {
        self.colors = colors
        self.ease = ease
        self.steps = steps
    }
    
    public func interpolate() -> [UIColor] {
        colors
            .enumerated()
            .map { offset, color -> [UIColor] in
                guard
                    offset < colors.count - 1,
                    steps > .zero
                else {
                    return [color]
                }
                let nextColor = colors[offset + 1]
                return steps(from: color, to: nextColor)
            }
            .flatMap { $0 }
    }
    
    private func steps(from c1: UIColor, to c2: UIColor) -> [UIColor] {
        (0...steps).map { offset in
            let ratio = CGFloat(offset) / CGFloat(steps + 1)
            let easing = ease.calculate(ratio)
            return c1.mix(with: c2, ratio: easing)
        }
    }
}
