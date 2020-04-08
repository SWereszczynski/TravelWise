//
//  CampTableViewCell.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

final class CampTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView |> styleRounded(8)
    }
    
    
    func render(_ camp: Camp) {
        nameLabel |> styleText(camp.name)
        addressLabel |> styleText(camp.address)
    }
    
}
