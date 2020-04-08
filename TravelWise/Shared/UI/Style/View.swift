//
//  View.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

func styleBordered(color: UIColor, width: CGFloat) -> (UIView) -> Void {
    return { view in
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
}

func styleRounded(_ cornerRadius: CGFloat) -> (UIView) -> Void {
    return { view in
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
}

func styleCorners(_ corners: UIRectCorner, radius: CGSize) -> (UIView) -> Void {
    return { view in
        let maskPath1 = UIBezierPath(roundedRect: view.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: radius)
        
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = view.bounds
        maskLayer1.path = maskPath1.cgPath
        view.layer.mask = maskLayer1
    }
}

func styleBackgorundColor(_ color: UIColor) -> (UIView) -> Void {
    return { view in
        view.backgroundColor = color
    }
}

func styleIsHidden(_ isHidden: Bool) -> (UIView) -> Void {
    return { view in
        view.isHidden = isHidden
    }
}

func styleAlpha(_ value: CGFloat) -> (UIView) -> Void {
    return { view in
        view.alpha = value
    }
}

func disabledTranslatesAutoresizingMaskIntoConstraints(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGSize) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: radius)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
