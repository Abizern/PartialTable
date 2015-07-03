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
    
    private struct Static {
        static let identifier = "ItemCell"
    }
    
    class var cellIdentifier: String {
        return Static.identifier
    }
    
    func configureWithItem(item: Item) -> () {
        label.text = item.value
    }
}
