//
//  DataSource.swift
//  PartialTable
//
//  Created by Abizer Nasir on 27/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    private let maximumNumberOfItems = 40
    private let numberOfItemsToAdd = 10
    private var numberOfItems = 10
    
    lazy private var items: [Item] = {
        var list = [Item]()
        for _ in 0 ..< self.maximumNumberOfItems {
            list.append(Item(value: NSUUID().UUIDString))
        }
        
        return list
    }()
    
    
    func getMoreItems() -> () {
        numberOfItems = min(numberOfItems + numberOfItemsToAdd, maximumNumberOfItems)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (numberOfItems < maximumNumberOfItems) {
            return 2
        } else {
            return 1
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return numberOfItems
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(ItemCell.cellIdentifier, forIndexPath: indexPath) as! ItemCell
            cell.configureWithItem(items[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(MoreCell.cellIdentifier, forIndexPath: indexPath) as! MoreCell
            return cell
        }
    }
}
