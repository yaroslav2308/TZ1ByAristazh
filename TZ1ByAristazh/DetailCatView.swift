//
//  DetailCatView.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 27.11.2021.
//

import SwiftUI

struct DetailCatView: View {
    let cat: Cat
    var body: some View {
        Image(cat.imageUrl)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
