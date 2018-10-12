//
//  ItemCell.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
    static let reuseIdentifier = "ItemCell"

    @IBOutlet private var label: UILabel!

    func configure(with string: String) {
        label.text = string
    }
}

extension ItemCell {
    func configure(with item: Item) {
        configure(with: item.value)
    }
}
