//
//  TableViewController.swift
//  PartialTable
//
//  Created by Abizer Nasir on 07/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let numberOfItems: Int = 40
    private let cellIdentifier = "ItemCell"
    private var numberOfItemsToDisplay: Int = 10
    
    lazy private var items: [String] = {
        var list = [String]()
        for _ in 0 ..< self.numberOfItems {
            list.append(NSUUID().UUIDString)
        }
        
        return list
    }()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if shouldDisplayMoreButton() {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return numberOfItemsToDisplay
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = items[indexPath.row]
            cell.textLabel?.textAlignment = .Left
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(14.0)
            
        default:
            cell.textLabel?.text = "More"
            cell.textLabel?.textColor = UIColor(red: 0.196, green: 0.3098, blue: 0.52, alpha: 1.0)
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(14.0)
        }
        
        return cell
        
    }
    
    func shouldDisplayMoreButton() -> Bool {
        return numberOfItemsToDisplay <= numberOfItems
    }
}
