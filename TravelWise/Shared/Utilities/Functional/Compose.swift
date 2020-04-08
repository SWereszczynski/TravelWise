import Foundation

/// Combine functions.
///
/// - Parameters:
///   - f: First function that will be apply on parameter.
///   - g: Second function that will be apply on the result of first function.
/// - Returns: Function combined from first and second function.
func >>> <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return { input in
        g(f(input))
    }
}
