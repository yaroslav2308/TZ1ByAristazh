//
//  ContentView.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 23.11.2021.
//

import SwiftUI


struct CatsMainView: View {
    
    let cats: [Cat] = ArrayOfCats.cats
    
    @ObservedObject var index = Index()
    
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

class Index: ObservableObject {
    @Published var id = -1
}


struct CatView: View {
    @ObservedObject var index: Index
    let cat: Cat
    var body: some View {
        VStack(alignment: .trailing) {
            CatImageView(cat: cat, index: index)
            DetailLinkView(cat: cat, index: index)
        }
    }
}



struct CatImageView: View {
    let cat: Cat
    @ObservedObject var index: Index
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
    let cat: Cat
    @ObservedObject var index: Index
    var body: some View {
        NavigationLink(destination: DetailCatView(cat: cat)) {
            Text("Zoom")
                .font(.title)
                .bold()
        }.opacity(index.id == cat.id ? 1 : 0)
    }
}

struct CatsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatsMainView()
    }
}
