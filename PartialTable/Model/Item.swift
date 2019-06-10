//
//  Item.swift
//  PartialTable
//
//  Created by Abizer Nasir on 10/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    let title: String
    let subtitle: String
    let id = UUID()

    init(_ title: String) {
        self.title = title
        self.subtitle = id.description
    }
}
