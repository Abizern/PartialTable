//
//  DataSource.swift
//  PartialTable
//
//  Created by Abizer Nasir on 10/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import Foundation

final class DataSource {
    let items: [Item]

    init() {
        items = [1...10].map { value in
            return Item("Item nr \(value)")
        }
    }
}
