import Foundation

infix operator |>: ForwardPipe
infix operator <>: TypeCompose
infix operator >>>: Compose

precedencegroup ForwardPipe {
    associativity: left
    higherThan: AdditionPrecedence
}

precedencegroup TypeCompose {
    associativity: left
    higherThan: AdditionPrecedence
}

precedencegroup Compose {
    associativity: left
    higherThan: AdditionPrecedence
}
