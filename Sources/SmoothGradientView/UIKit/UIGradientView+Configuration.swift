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

extension UIGradientView {
    /// Configuration of the gradient drawn.
    public struct Configuration {
        /// Describes an easing function. Default is **easeInOutSine**
        public var ease: Ease
        /// Defines the number of intermediary colors that will be computed to smoothen the gradient. Default is **24**.
        public var smoothness: UInt
        /// The kind of gradient that will be drawn.
        ///
        /// **Linear/Axial gradient**
        ///
        /// A linear gradient (called by Apple an axial gradient) varies along an axis between two defined end points. All points that lie on a line perpendicular to the axis have the same color value.
        ///
        /// **Radial gradient**
        ///
        /// The gradient is defined as an ellipse with its
        /// center at 'start' and its width and height defined by
        /// '(end.x - start.x) * 2' and '(end.y - start.y) *
        /// 2' respectively.
        ///
        /// **Conic gradient**
        ///
        /// The gradient is centered at 'start' and its 0-degrees
        /// direction is defined by a vector spanned between 'start' and
        /// 'end'. When 'start' and 'end' overlap the results are
        /// undefined. The gradient's angle increases in the direction of rotation of
        /// positive x-axis towards positive y-axis.
        public var type: CAGradientLayerType
        /// The start point of the gradient when drawn in the layer’s local coordinate space.
        public var start: CGPoint
        /// The end point of the gradient when drawn in the layer’s local coordinate space.
        public var end: CGPoint
        
        public init(type: CAGradientLayerType, start: CGPoint, end: CGPoint, ease: Ease = .easeInOutSine, smoothness: UInt = 24) {
            self.ease = ease
            self.smoothness = smoothness
            self.type = type
            self.start = start
            self.end = end
        }
    }
}

public extension CAGradientLayerType {
    /// Semantic typealias for ``CAGradientLayerType.axial``.
    static var linear: Self { .axial }
}

public extension UIGradientView.Configuration {
    /// A linear gradient that starts at the top and ends at the bottom of the view.
    static func vertical() -> Self {
        .init(
            type: .linear,
            start: .top,
            end: .bottom
        )
    }
    
    /// A linear gradient that starts at the left and ends at the right of the view.
    static func horizontal() -> Self {
        .init(
            type: .linear,
            start: .left,
            end: .right
        )
    }
    
    /// A radial gradient that starts at the center and ends at top right of the view.
    static func radial() -> Self {
        .init(
            type: .radial,
            start: .center,
            end: .topRight
        )
    }
    
    /// A conic gradient that starts at the center and ends at top right of the view.
    static func conic() -> Self {
        .init(
            type: .conic,
            start: .center,
            end: .topRight
        )
    }
}
