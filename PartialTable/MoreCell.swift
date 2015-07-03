//
//  MoreCell.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

private let CellIdentifier = "MoreCell"

class MoreCell: UITableViewCell {
    
    @IBOutlet private weak var label: UILabel!
    
    lazy private var textColour = {
        UIColor(red: 0.196, green: 0.3098, blue: 0.52, alpha: 1.0)
    }()

    
    override func awakeFromNib() {
        label.textColor = textColour
        label.text = NSLocalizedString("Load More Button", value: "Load More", comment: "String for Load More button")
    }
    
    
    class var cellIdentifier: String {
        return CellIdentifier
    }
    
}
