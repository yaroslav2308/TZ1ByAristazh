//
//  CatsMainView.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 23.11.2021.
//

import SwiftUI

struct CatsMainView: View {
    
    let cats: [CatModel] = ArrayOfCats.cats
    
    @ObservedObject var index = IndexViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cats, id: \.id) { cat in
                        CatView(index: index, cat: cat)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Cats")
        }
    }
    
}

struct CatsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatsMainView()
    }
}
