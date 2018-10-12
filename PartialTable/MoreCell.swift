//
//  MoreCell.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

final class MoreCell: UITableViewCell {
    static let reuseIdentifier = "MoreCell"

    @IBOutlet private var label: UILabel! {
        didSet {
            label.text = NSLocalizedString("Load More Button", value: "Load More", comment: "Text for Load More button")
        }
    }
}
