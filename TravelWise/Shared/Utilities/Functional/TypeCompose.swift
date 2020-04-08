import Foundation

/// Compose function that will be applaied on parameter.
///
/// - Parameters:
///   - f: First function.
///   - g: Second function.
/// - Returns: Paramter that was applaied of both functions.
func <> <A>(_ f: @escaping (A) -> Void, _ g: @escaping (A) -> Void) -> (A) -> Void where A: AnyObject {
    return { input in
        f(input)
        g(input)
    }
}
