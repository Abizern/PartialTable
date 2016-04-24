//
//  ItemCell.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!

    static let reuseIdentifier = "ItemCell"

    func configureWithItem(item: Item) -> () {
        label.text = item.value
    }
}
