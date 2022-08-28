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
import SwiftUI

public struct ColorMixer: Hashable {
    var c1: UIColor
    var c2: UIColor
    var ratio: CGFloat
    
    public init(c1: UIColor, c2: UIColor, ratio: CGFloat) {
        self.c1 = c1
        self.c2 = c2
        self.ratio = ratio
    }
    
    public func mix() -> UIColor {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        if 4 == c1.cgColor.components?.count {
            c1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        } else {
            c1.getWhite(&r1, alpha: &a1)
            b1 = r1
            g1 = r1
        }
        
        if 4 == c2.cgColor.components?.count {
            c2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        } else {
            c2.getWhite(&r2, alpha: &a2)
            b2 = r2
            g2 = r2
        }
        
        let r = bezierCurve(t: ratio, p0: r1, p1: r2)
        let g = bezierCurve(t: ratio, p0: g1, p1: g2)
        let b = bezierCurve(t: ratio, p0: b1, p1: b2)
        let a = bezierCurve(t: ratio, p0: a1, p1: a2)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    private func bezierCurve(t: CGFloat, p0: CGFloat, p1: CGFloat) -> CGFloat {
        (1.0 - t) * p0 + t * p1
    }
}

extension UIColor {
    /// Mixes two colors with a ratio.
    /// - Parameters:
    ///   - color: Another color to be mixed.
    ///   - ratio: A ratio between 0.0 - 1.0.
    /// - Returns: The interpolated color.
    func mix(with color: UIColor, ratio: CGFloat = 0.5) -> UIColor {
        ColorMixer(c1: self, c2: color, ratio: ratio).mix()
    }
}
