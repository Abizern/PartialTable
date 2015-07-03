//
//  ItemCell.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

private let CellIdentifier = "ItemCell"

class ItemCell: UITableViewCell {
    
    @IBOutlet private weak var label: UILabel!
    
    
    class var cellIdentifier: String {
        return CellIdentifier
    }
    
    
    func configureWithItem(item: Item) -> () {
        label.text = item.value
    }
}
