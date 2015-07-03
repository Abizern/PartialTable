//
//  TableViewController.swift
//  PartialTable
//
//  Created by Abizer Nasir on 07/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var tableDataSource = DataSource()

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        switch section {
        case 1:
            let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            tableDataSource.getMoreItems()
            
            let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            let shouldHaveMoreButton = tableDataSource.numberOfSectionsInTableView(tableView) == 2
            var newIndexPaths = [NSIndexPath]()
            for n in numberOfItems ..< newNumberOfItems  {
                newIndexPaths.append(NSIndexPath(forRow: n, inSection: 0))
            }
            
            tableView.beginUpdates()
            
            tableView.insertRowsAtIndexPaths(newIndexPaths, withRowAnimation: .Top)
            
            if !shouldHaveMoreButton {
                tableView.deleteSections(NSIndexSet(index: 1), withRowAnimation: .Top)
            }

            tableView.endUpdates()
            
            var scrollPointIndexPath: NSIndexPath
            
            if shouldHaveMoreButton {
                scrollPointIndexPath = indexPath
            } else {
                scrollPointIndexPath = NSIndexPath(forRow: numberOfItems - 1, inSection: 0)
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                () -> Void in
                tableView.scrollToRowAtIndexPath(scrollPointIndexPath, atScrollPosition: .Top, animated: true)
                if let selectedIndexPath = tableView.indexPathForSelectedRow() {
                    tableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
                }
            }
            return
            
        default:
            return
        }
    }
}
