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

// MARK: - Local Coordinates

/// A view that draws a color gradient over its background color, filling the shape of the view (including rounded corners)
///
/// You use a gradient view to create a color gradient containing an arbitrary number of colors. By default, the colors are spread uniformly across the frame, but you can optionally specify locations for control over the color positions through the gradient.
public final class UIGradientView: UIView {
    // MARK: - Properties
    /// An array defining the color of each gradient stop.
    public var colors: [UIColor] = [] {
        didSet { setNeedsDisplay() }
    }
    
    /// Defines the style of the gradient. Default is **vertical()**.
    public var configuration: Configuration = .vertical() {
        didSet { setNeedsDisplay() }
    }
    
    public override class var layerClass: AnyClass { CAGradientLayer.self }
    
    private var gradient: CAGradientLayer { layer as! CAGradientLayer }

    // MARK: - Init
    
    public convenience init(colors: [UIColor], configuration: Configuration) {
        self.init(frame: .zero)
        self.colors = colors
        self.configuration = configuration
    }
    
    // MARK: - Overrides
    
    public override func draw(_ rect: CGRect) {
        gradient.colors = interpolateColors().map(\.cgColor)
        gradient.endPoint = configuration.end
        gradient.startPoint = configuration.start
        gradient.type = configuration.type
    }
    
    private func interpolateColors() -> [UIColor] {
        ColorInterpolator(
            colors: colors,
            ease: configuration.ease,
            steps: configuration.smoothness
        ).interpolate()
    }
}

#if DEBUG
// MARK: - Preview

import SwiftUI

@available(iOS 14.0, *)
struct UIGradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientPreviewProvider.previews
    }
}
#endif
