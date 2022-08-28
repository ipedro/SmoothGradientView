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

#if DEBUG
import SwiftUI

enum GradientPreviews: String, Hashable, CaseIterable, PreviewProvider {
    case Vertical, Horizontal, Radial, Conic
    
    var configuration: UIGradientView.Configuration {
        switch self {
        case .Vertical: return .vertical()
        case .Horizontal: return .horizontal()
        case .Radial: return .radial()
        case .Conic: return .init(type: .conic, start: .center, end: .bottomRight)
        }
    }
    
    private var colors: [UIColor] {
        [.systemYellow, .systemGreen, .systemBlue, .systemPurple, .systemRed]
    }
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: .init(repeating: GridItem(.flexible(), spacing: 16, alignment: .top), count: 3)
                ) {
                    ForEach(Ease.allCases, id: \.self) { ease in
                        LazyVStack {
                            GradientView(
                                configuration: {
                                    var configuration = configuration
                                    configuration.ease = ease
                                    return configuration
                                }(),
                                colors: colors)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(16)
                            
                            Text(ease.debugDescription)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 24)
                    }
                }
                .padding(8)
            }
            .navigationTitle(rawValue.localizedCapitalized)
            .previewDisplayName(rawValue.localizedCapitalized)
            .previewLayout(.sizeThatFits)
        }
    }
    
    static var previews: some View {
        Group {
            ForEach(allCases, id: \.self) { variation in
                variation.body
            }
        }
        .colorScheme(.dark)
        .background(Color(.black))
    }
}
#endif
