//
//  TableViewController.swift
//  PartialTable
//
//  Created by Abizer Nasir on 07/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    fileprivate var tableDataSource = DataSource()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {

        case 1:
            let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            tableDataSource.getMoreItems()

            let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            let shouldHaveMoreButton = tableDataSource.numberOfSections(in: tableView) == 2
            var newIndexPaths = [IndexPath]()
            for n in numberOfItems ..< newNumberOfItems {
                newIndexPaths.append(IndexPath(row: n, section: 0))
            }

            tableView.beginUpdates()

            tableView.insertRows(at: newIndexPaths, with: .top)

            if !shouldHaveMoreButton {
                tableView.deleteSections(IndexSet(integer: 1), with: .top)
            }

            tableView.endUpdates()

            let scrollPointIndexPath: IndexPath

            if shouldHaveMoreButton {
                scrollPointIndexPath = indexPath
            } else {
                scrollPointIndexPath = IndexPath(row: numberOfItems - 1, section: 0)
            }

            DispatchQueue.main.async { () -> Void in
                tableView.scrollToRow(at: scrollPointIndexPath, at: .top, animated: true)

                guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }

            return

        default:
            return
        }
    }
}
