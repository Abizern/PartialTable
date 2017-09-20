//
//  Item.swift
//  PartialTable
//
//  Created by Abizer Nasir on 08/02/2015.
//  Copyright (c) 2015 Jungle Candy Software Ltd. All rights reserved.
//

struct Item: Equatable {
    let value: String
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.value == rhs.value
    }
}

