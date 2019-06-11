//
//  DataSource.swift
//  PartialTable
//
//  Created by Abizer Nasir on 10/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import Combine
import SwiftUI

final class DataSource: BindableObject{
    let didChange = PassthroughSubject<DataSource, Never>()

    private(set) var items: [Item] {
        didSet {
            hasMore = items.count < max
        }
    }

    private(set) var hasMore = true
    
    let max: Int
    let batchSize: Int

    init(initialNumberOfItems initial: Int = 10, maximumNumberOfItems maximum: Int = 40, batchSize: Int = 10) {
        items = (1...initial).map { Item(String(describing: $0)) }
        max = maximum > initial ? maximum : initial
        self.batchSize = batchSize
    }

    func loadMore() {
        let count = items.count
        let start = count + 1
        var end = items.count + batchSize
        if end > max {
            end = max
        }

        let new = (start...end).map { Item(String(describing: $0)) }
        items = items + new
        
        didChange.send(self)
    }
}
