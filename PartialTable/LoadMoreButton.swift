//
//  LoadMoreButton.swift
//  PartialTable
//
//  Created by Abizer Nasir on 11/06/2019.
//  Copyright © 2019 Jungle Candy Software Ltd. All rights reserved.
//

import SwiftUI

struct LoadMoreButton : View {
    let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        HStack {
            Spacer()
            Text("Load More")
            Spacer()
        }.tapAction(count: 1, action)
    }
}

#if DEBUG
struct LoadMoreButton_Previews : PreviewProvider {
    static var previews: some View {
        LoadMoreButton() {
            print("Action reqested")
        }
    }
}
#endif
