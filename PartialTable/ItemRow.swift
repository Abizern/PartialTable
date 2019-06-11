//
//  ItemRow.swift
//  PartialTable
//
//  Created by Abizer Nasir on 11/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import SwiftUI

struct ItemRow : View {
    let item: Item

    init(_ item: Item) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Item Number:")
                Spacer()
                Text(item.title)
            }
            .font(.headline)
            Text(item.subtitle)
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct ItemRow_Previews : PreviewProvider {
    static var previews: some View {
        ItemRow(DataSource().items[0])
    }
}
#endif
