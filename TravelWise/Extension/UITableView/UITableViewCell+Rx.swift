//
//  UITableViewCell+Rx.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxCocoa
import RxSwift

extension Reactive where Base: UITableView {

    func reusableItems<S: Sequence, Cell: UITableViewCell, O: ObservableType>
        (cellType: Cell.Type)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable where O.Element == S {
            return items(cellIdentifier: String(describing: Cell.self), cellType: Cell.self)
    }

    var allowsSelection: AnyObserver<Bool> {
        return Binder(base) { tableView, allowsSelection in
            tableView.allowsSelection = allowsSelection
            }.asObserver()
    }
}
