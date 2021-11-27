//
//  Cat.swift
//  TZ1ByAristazh
//
//  Created by Yaroslav Monastyrev on 27.11.2021.
//

import SwiftUI

struct Cat: Identifiable {
    let imageUrl: String
    let id: Int
}

struct ArrayOfCats {
    static let cats: [Cat] = [
        Cat(imageUrl: "cat0", id: 0),
        Cat(imageUrl: "cat1", id: 1),
        Cat(imageUrl: "cat2", id: 2),
        Cat(imageUrl: "cat3", id: 3),
        Cat(imageUrl: "cat4", id: 4),
        Cat(imageUrl: "cat5", id: 5),
        Cat(imageUrl: "cat6", id: 6),
    ]
}
