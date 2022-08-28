import CoreGraphics
import Foundation

/// Easing functions specify the rate of change of a parameter over time.
protocol EasingFunction {
    func calculate(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat
}

/// A concrete easing function implementation.
public struct Ease: EasingFunction, Hashable {
    typealias LerpFunction = (_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat
    
    private let lerp: LerpFunction
    
    private let identifier = UUID()
    
    init(_ lerp: @escaping LerpFunction) {
        self.lerp = lerp
    }
    
    public static func == (lhs: Ease, rhs: Ease) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    func calculate(_ t: CGFloat, _ b: CGFloat = 0, _ c: CGFloat = 1, _ d: CGFloat = 1) -> CGFloat {
        return lerp(t, b, c, d)
    }
}

// MARK: - CaseIterable

extension Ease: CaseIterable {
    public static var allCases: [Ease] { [
        .easeInBack,
        .easeInOutBack,
        .easeOutBack,
        .easeInBounce,
        .easeInOutBounce,
        .easeOutBounce,
        .easeInCirc,
        .easeInOutCirc,
        .easeOutCirc,
        .easeInCubic,
        .easeInOutCubic,
        .easeOutCubic,
        .easeInElastic,
        .easeInOutElastic,
        .easeOutElastic,
        .easeInExpo,
        .easeInOutExpo,
        .easeOutExpo,
        .easeInQuad,
        .easeInOutQuad,
        .easeOutQuad,
        .easeInQuart,
        .easeInOutQuart,
        .easeOutQuart,
        .easeInQuint,
        .easeInOutQuint,
        .easeOutQuint,
        .easeInSine,
        .easeInOutSine,
        .easeOutSine,
        .linear]
    }
}

// MARK: - CustomDebugStringConvertible

extension Ease: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .linear: return "Linear"
        case .easeInBack: return "Back Ease In"
        case .easeInOutBack: return "Back Ease In/Out"
        case .easeOutBack: return "Back Ease Out"
        case .easeInBounce: return "Bounce Ease In"
        case .easeInOutBounce: return "Bounce Ease In/Out"
        case .easeOutBounce: return "Bounce Ease Out"
        case .easeInCirc: return "Circular Ease In"
        case .easeInOutCirc: return "Circular Ease In/Out"
        case .easeOutCirc: return "Circular Ease Out"
        case .easeInCubic: return "Cubic Ease In"
        case .easeInOutCubic: return "Cubic Ease In/Out"
        case .easeOutCubic: return "Cubic Ease Out"
        case .easeInElastic: return "Elastic Ease In"
        case .easeInOutElastic: return "Elastic Ease In/Out"
        case .easeOutElastic: return "Elastic Ease Out"
        case .easeInExpo: return "Expo Ease In"
        case .easeInOutExpo: return "Expo Ease In/Out"
        case .easeOutExpo: return "Expo Ease Out"
        case .easeInQuad: return "Quadratic Ease In"
        case .easeInOutQuad: return "Quadratic Ease In/Out"
        case .easeOutQuad: return "Quadratic Ease Out"
        case .easeInQuart: return "Quartic Ease In"
        case .easeInOutQuart: return "Quartic Ease In/Out"
        case .easeOutQuart: return "Quartic Ease Out"
        case .easeInQuint: return "Quintic Ease In"
        case .easeInOutQuint: return "Quintic Ease In/Out"
        case .easeOutQuint: return "Quintic Ease Out"
        case .easeInSine: return "Sine Ease In"
        case .easeInOutSine: return "Sine Ease In/Out (Default)"
        case .easeOutSine: return "Sine Ease Out"
        default: return "Other"
        }
    }
}
    
// MARK: - Easing Functions

public extension Ease {
    // MARK: - Linear
    
    /// This function averages values uniformly over time.
    static let linear = Ease { (t,b,c,d) -> CGFloat in
        return c*(t/d)+b
    }
    
    // MARK: - Quadratic
    
    /// [Reference](https://easings.net/#easeInQuad)
    static let easeInQuad = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return c*t*t + b
    }
    
    /// [Reference](https://easings.net/#easeOutQuad)
    static let easeOutQuad = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return -c * t*(t-2) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutQuad)
    static let easeInOutQuad = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/(d/2)
        if t < 1 {
            return c/2*t*t + b;
        }
        let t1 = t-1
        let t2 = t1-2
        return -c/2 * ((t1)*(t2) - 1) + b;
    }
    
    // MARK: - Cubic
    
    /// [Reference](https://easings.net/#easeInCubic)
    static let easeInCubic = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return c*t*t*t + b
    }
    
    /// [Reference](https://easings.net/#easeOutCubic)
    static let easeOutCubic = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d-1
        return c*(t*t*t + 1) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutCubic)
    static let easeInOutCubic = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/(d/2)
        if t < 1{
            return c/2*t*t*t + b;
        }
        t -= 2
        return c/2*(t*t*t + 2) + b;
    }
    
    // MARK: - Quartic
    
    /// [Reference](https://easings.net/#easeInQuart)
    static let easeInQuart = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return c*t*t*t*t + b
    }
    
    /// [Reference](https://easings.net/#easeOutQuart)
    static let easeOutQuart = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d-1
        return -c * (t*t*t*t - 1) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutQuart)
    static let easeInOutQuart = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/(d/2)
        
        if t < 1{
            return c/2*t*t*t*t + b;
        }
        t -= 2
        return -c/2 * (t*t*t*t - 2) + b;
    }

    // MARK: - Quintic
    
    /// [Reference](https://easings.net/#easeInQuint)
    static let easeInQuint = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return c*t*t*t*t*t + b
    }
    
    /// [Reference](https://easings.net/#easeOutQuint)
    static let easeOutQuint = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d-1
        return c*(t*t*t*t*t + 1) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutQuint)
    static let easeInOutQuint = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/(d/2)
        if t < 1 {
            return c/2*t*t*t*t*t + b;
        }
        t -= 2
        return c/2*(t*t*t*t*t + 2) + b;
    }
    
    // MARK: - Back
    
    /// [Reference](https://easings.net/#easeInBack)
    static let easeInBack = Ease { (_t,b,c,d) -> CGFloat in
        let s: CGFloat = 1.70158
        let t = _t/d
        return c*t*t*((s+1)*t - s) + b
    }
    
    /// [Reference](https://easings.net/#easeOutBack)
    static let easeOutBack = Ease { (_t,b,c,d) -> CGFloat in
        let s: CGFloat = 1.70158
        let t = _t/d-1
        return c*(t*t*((s+1)*t + s) + 1) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutBack)
    static let easeInOutBack = Ease { (_t,b,c,d) -> CGFloat in
        var s: CGFloat = 1.70158
        var t = _t/(d/2)
        if t < 1{
            s *= (1.525)
            return c/2*(t*t*((s+1)*t - s)) + b;
        }
        s *= 1.525
        t -= 2
        return c/2*(t*t*((s+1)*t + s) + 2) + b;
    }
    
    // MARK: - Bounce
    
    /// [Reference](https://easings.net/#easeInBounce)
    static let easeInBounce = Ease { (t,b,c,d) -> CGFloat in
        return c - easeOutBounce.calculate(d-t, b, c, d) + b
    }
    
    /// [Reference](https://easings.net/#easeOutBounce)
    static let easeOutBounce = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/d
        if t < (1/2.75){
            return c*(7.5625*t*t) + b;
        } else if t < (2/2.75) {
            t -= 1.5/2.75
            return c*(7.5625*t*t + 0.75) + b;
        } else if t < (2.5/2.75) {
            t -= 2.25/2.75
            return c*(7.5625*t*t + 0.9375) + b;
        } else {
            t -= 2.625/2.75
            return c*(7.5625*t*t + 0.984375) + b;
        }
    }
    
    /// [Reference](https://easings.net/#easeInOutBounce)
    static let easeInOutBounce = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t
        if t < d/2 {
            return easeInBounce.calculate(t*2, 0, c, d) * 0.5 + b
        }
        return easeOutBounce.calculate(t*2-d, 0, c, d) * 0.5 + c*0.5 + b
    }
    
    // MARK: - Circular
    
    /// [Reference](https://easings.net/#easeInCirc)
    static let easeInCirc = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d
        return -c * (sqrt(1 - t*t) - 1) + b
    }
    
    /// [Reference](https://easings.net/#easeOutCirc)
    static let easeOutCirc = Ease { (_t,b,c,d) -> CGFloat in
        let t = _t/d-1
        return c * sqrt(1 - t*t) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutCirc)
    static let easeInOutCirc = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t/(d/2)
        if t < 1{
            return -c/2 * (sqrt(1 - t*t) - 1) + b;
        }
        t -= 2
        return c/2 * (sqrt(1 - t*t) + 1) + b;
    }
    
    // MARK: - Elastic
    
    /// [Reference](https://easings.net/#easeInElastic)
    static let easeInElastic = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t
        
        if t==0{ return b }
        t/=d
        if t==1{ return b+c }
        
        let p = d * 0.3
        let a = c
        let s = p/4
        
        t -= 1
        return -(a*pow(2,10*t) * sin( (t*d-s)*(2*CGFloat.pi)/p )) + b;
    }
    
    /// [Reference](https://easings.net/#easeOutElastic)
    static let easeOutElastic = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t
        
        if t==0{ return b }
        t/=d
        if t==1{ return b+c}
        
        let p = d * 0.3
        let a = c
        let s = p/4
        
        return (a*pow(2,-10*t) * sin( (t*d-s)*(2*CGFloat.pi)/p ) + c + b);
    }
    
    /// [Reference](https://easings.net/#easeInOutElastic)
    static let easeInOutElastic = Ease { (_t,b,c,d) -> CGFloat in
        var t = _t
        if t==0{ return b}
        
        t = t/(d/2)
        if t==2{ return b+c }
        
        let p = d * (0.3*1.5)
        let a = c
        let s = p/4
        
        if t < 1 {
            t -= 1
            return -0.5*(a*pow(2,10*t) * sin((t*d-s)*(2*CGFloat.pi)/p )) + b;
        }
        t -= 1
        return a*pow(2,-10*t) * sin( (t*d-s)*(2*CGFloat.pi)/p )*0.5 + c + b;
    }
    
    // MARK: - Expo
    
    /// [Reference](https://easings.net/#easeInExpo)
    static let easeInExpo = Ease { (_t,b,c,d) -> CGFloat in
        return (_t==0) ? b : c * pow(2, 10 * (_t/d - 1)) + b
    }
    
    /// [Reference](https://easings.net/#easeOutExpo)
    static let easeOutExpo = Ease { (_t,b,c,d) -> CGFloat in
        return (_t==d) ? b+c : c * (-pow(2, -10 * _t/d) + 1) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutExpo)
    static let easeInOutExpo = Ease { (_t,b,c,d) -> CGFloat in
        if _t==0{ return b }
        if _t==d{ return b+c}
        
        var t = _t/(d/2)
        
        if t < 1{
            return c/2 * pow(2, 10 * (_t - 1)) + b;
        }
        let t1 = t-1
        return c/2 * (-pow(2, -10 * t1) + 2) + b;
    }
    
    // MARK: - Sine
    
    /// [Reference](https://easings.net/#easeInSine)
    static let easeInSine = Ease { (_t,b,c,d) -> CGFloat in
        return -c * cos(_t/d * (CGFloat.pi/2)) + c + b
    }
    
    /// [Reference](https://easings.net/#easeOutSine)
    static let easeOutSine = Ease { (_t,b,c,d) -> CGFloat in
        return c * sin(_t/d * (CGFloat.pi/2)) + b
    }
    
    /// [Reference](https://easings.net/#easeInOutSine)
    static let easeInOutSine = Ease { (_t,b,c,d) -> CGFloat in
        return -c/2 * (cos(CGFloat.pi*_t/d) - 1) + b
    }
}
