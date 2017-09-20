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
            list.append(Item(value: UUID().uuidString))
        }

        return list
    }()


    func getMoreItems() {
        numberOfItems = min(numberOfItems + numberOfItemsToAdd, maximumNumberOfItems)
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        switch (numberOfItems < maximumNumberOfItems) {
        case true:
            return 2
        case false:
            return 1
        }
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
