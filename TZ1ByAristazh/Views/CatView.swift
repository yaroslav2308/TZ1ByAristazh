//
//  CatView.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 27.11.2021.
//

import Foundation
import SwiftUI

struct CatView: View {
    @ObservedObject var index: IndexViewModel
    let cat: CatModel
    var body: some View {
        VStack(alignment: .trailing) {
            CatImageView(cat: cat, index: index)
            DetailLinkView(cat: cat, index: index)
        }
    }
}

struct CatImageView: View {
    let cat: CatModel
    @ObservedObject var index: IndexViewModel
    var body: some View {
        Image(cat.imageUrl)
            .resizable()
            .frame(width: index.id == cat.id ? 250 : 170, height: index.id == cat.id ? 250 : 170)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
            .onTapGesture {
                withAnimation {
                    if index.id == cat.id {
                        index.id = -1
                    } else {
                        index.id = cat.id
                    }
                }
            }
    }
}

struct DetailLinkView: View {
    let cat: CatModel
    @ObservedObject var index: IndexViewModel
    var body: some View {
        NavigationLink(destination: DetailCatView(cat: cat)) {
            Text("Zoom")
                .font(.title)
                .bold()
        }.opacity(index.id == cat.id ? 1 : 0)
    }
}
