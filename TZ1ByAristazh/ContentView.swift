//
//  ContentView.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 23.11.2021.
//

import SwiftUI
import QGrid

struct Cat: Identifiable{
    let id: Int
    let urlImage: String
    var isBigger = false
}

//struct ContentView: View {
//    let arrayOfCats: [Cat] = [
//        Cat(id: 0, urlImage: "cat0"),
//        Cat(id: 1, urlImage: "cat1"),
//        Cat(id: 2, urlImage: "cat2"),
//        Cat(id: 3, urlImage: "cat3"),
//        Cat(id: 4, urlImage: "cat4"),
//        Cat(id: 5, urlImage: "cat5"),
//        Cat(id: 6, urlImage: "cat6")
//    ]
//    var body: some View {
//        NavigationView {
//            QGrid(arrayOfCats, columns: 1, vSpacing: 20) { value  in
//                CatView(cat: value, animate: false)
//                    .navigationTitle("Cats")
//            }
//        }
//    }
//
//}

struct ContentView: View {
    let arrayOfCats: [Cat] = [
        Cat(id: 0, urlImage: "cat0"),
        Cat(id: 1, urlImage: "cat1"),
        Cat(id: 2, urlImage: "cat2"),
        Cat(id: 3, urlImage: "cat3"),
        Cat(id: 4, urlImage: "cat4"),
        Cat(id: 5, urlImage: "cat5"),
        Cat(id: 6, urlImage: "cat6")
    ]
    
    private var oneColumnGrid = [GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: oneColumnGrid, spacing: 20) {
                    ForEach((arrayOfCats.indices), id: \.self) { item in
                        CatView(cat: arrayOfCats[item])
                    }
                }.navigationTitle("Cats")
            }

        }
    }
    
}

struct ZommedCat: View {
    let cat: Cat
    var body: some View {
        Image(cat.urlImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CatView: View {
    var cat: Cat
    @State var animate: Bool = false
    var body: some View {
        VStack(alignment: .trailing) {
            ImageView(urlImage: cat.urlImage)
                .frame(width: self.animate ? 250 : 170, height: self.animate ? 250 : 170)
            
            NavigationLink(destination: ZommedCat(cat: cat)) {
                Text("Zoom")
                    .font(.title)
                    .bold()
            }.opacity(animate ? 1 : 0)
        }
        .frame(width: self.animate ? 250 : 170, height: self.animate ? 250 : 170)
        .onTapGesture {
            withAnimation {
                self.animate.toggle()
            }
        }
        .padding(.top, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageView: View {
    var urlImage: String
    var body: some View {
        Image(urlImage)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}
