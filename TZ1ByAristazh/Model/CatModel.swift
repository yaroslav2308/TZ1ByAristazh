//
//  CatModel.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 27.11.2021.
//

import SwiftUI

struct CatModel: Identifiable {
    let imageUrl: String
    let id: Int
}

struct ArrayOfCats {
    static let cats: [CatModel] = [
        CatModel(imageUrl: "cat0", id: 0),
        CatModel(imageUrl: "cat1", id: 1),
        CatModel(imageUrl: "cat2", id: 2),
        CatModel(imageUrl: "cat3", id: 3),
        CatModel(imageUrl: "cat4", id: 4),
        CatModel(imageUrl: "cat5", id: 5),
        CatModel(imageUrl: "cat6", id: 6),
    ]
}
