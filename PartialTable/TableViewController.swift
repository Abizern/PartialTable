//
//  TableViewController.swift
//  PartialTable
//
//  Created by Abizer Nasir on 07/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    private var tableDataSource = DataSource()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        
        let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
        tableDataSource.getMoreItems()
        
        let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
        let shouldHaveMoreButton = tableDataSource.numberOfSections(in: tableView) == 2
        
        let newIndexPaths = Array(numberOfItems ..< newNumberOfItems).map { (n) -> IndexPath in
            IndexPath(row: n, section: 0)
        }
        
        tableView.performBatchUpdates({
            tableView.insertRows(at: newIndexPaths, with: .top)
            
            if !shouldHaveMoreButton {
                tableView.deleteSections(IndexSet(integer: 1), with: .top)
            }
        }) { _ in
            let scrollPointIndexPath = shouldHaveMoreButton ? indexPath : IndexPath(row: numberOfItems - 1, section: 0)
            
            tableView.scrollToRow(at: scrollPointIndexPath, at: .top, animated: true)
            
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
