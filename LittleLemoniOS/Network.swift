//
//  MenuItem.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 02/12/2024.
//


struct MenuNetwork: Codable {
    let menu: [MenuItemNetwork]
}

struct MenuItemNetwork: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
