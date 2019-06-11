//
//  ContentView.swift
//  PartialTable
//
//  Created by Abizer Nasir on 10/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject private var dataSource: DataSource

    var body: some View {
        List {
            ForEach(dataSource.items, content: ItemRow.init)
            if dataSource.hasMore {
                LoadMoreButton() { self.dataSource.loadMore() }
            }
        }
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
