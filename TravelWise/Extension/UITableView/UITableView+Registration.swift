//
//  UITableView+Registration.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<C: UITableViewCell>(cell: C.Type) {
        let cellName = String(describing: cell)
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        } else {
            register(cell, forCellReuseIdentifier: cellName)
        }
    }

    func register<H: UITableViewHeaderFooterView>(headerOrFooter: H.Type) {
        let headerFooterName = String(describing: headerOrFooter)
        if Bundle.main.path(forResource: headerFooterName, ofType: "nib") != nil {
            register(UINib(nibName: headerFooterName, bundle: nil), forHeaderFooterViewReuseIdentifier: headerFooterName)
        } else {
            register(headerOrFooter, forHeaderFooterViewReuseIdentifier: headerFooterName)
        }
    }

    func dequeue<C>(cell: C.Type, for indexPath: IndexPath) -> C where C: UITableViewCell {
        return dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath) as! C
    }

    func dequeue<H>(headerOrFooter: H.Type) -> H where H: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: headerOrFooter)) as! H
    }
}
