import Foundation

/// Passes the result of an function as the first parameter of previous function.
///
/// - Parameters:
///   - a: Result of previous function.
///   - f: Function that will be apply on result of previous function.
/// - Returns: Result of last function.
@discardableResult
func |> <A, B>(_ a: A, _ f: @escaping (A) -> (B)) -> B {
    return f(a)
}

/// Overload version to apply for styling.
@discardableResult
func |> <A> (_ value: A, _ f: @escaping (A) -> Void) -> A where A: AnyObject {
    f(value)
    return value
}
