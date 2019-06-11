//
//  ContentView.swift
//  PartialTable
//
//  Created by Abizer Nasir on 10/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    private var items = DataSource().items

    var body: some View {
        List {
            ForEach(items, content: ItemRow.init)
            LoadMoreButton() { print("Load More Requested") }
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
