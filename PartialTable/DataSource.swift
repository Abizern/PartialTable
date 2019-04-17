//
//  DataSource.swift
//  PartialTable
//
//  Created by Abizer Nasir on 27/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

import UIKit

final class DataSource: NSObject, UITableViewDataSource {

    private let maximumNumberOfItems = 40
    private let numberOfItemsToAdd = 10
    private var numberOfItems = 10

    // This just generates a list of Items that are just UUIDs
    lazy private var items: [Item] = {
        let iterator = AnyIterator {
            return Item(value: UUID().uuidString)
        }
        
        return Array(iterator.prefix(maximumNumberOfItems))
    }()


    func getMoreItems() {
        numberOfItems = min(numberOfItems + numberOfItemsToAdd, maximumNumberOfItems)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return (numberOfItems < maximumNumberOfItems) ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return numberOfItems
        case 1:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell
            cell.configure(with: items[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCell.reuseIdentifier, for: indexPath) as! MoreCell
            return cell
        }
    }
}
