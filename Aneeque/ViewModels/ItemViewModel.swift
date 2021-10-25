//
//  ItemsViewModel.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import Foundation

class ItemViewModel {
    
    let allItems = [
        Item(itemImage: "chair1", itemName: "Hydrogen Chair", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "chair2", itemName: "Oxygen Chair", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "chair3", itemName: "Helium Chair", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "table1", itemName: "Hydrogen Table", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "table2", itemName: "Oxygen Table", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "table3", itemName: "Helium Table", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "lamp2", itemName: "Oxygen Lamp", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$30."),
        Item(itemImage: "lamp3", itemName: "Helium Lamp", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$28."),
        Item(itemImage: "floor1", itemName: "Hydrogen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$299."),
        Item(itemImage: "floor2", itemName: "Oxygen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$327."),
        Item(itemImage: "floor3", itemName: "Helium Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$212."),
    ]
    
    let cartItems = [
        Item(itemImage: "chair1", itemName: "Hydrogen Chair", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "table2", itemName: "Oxygen Table", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$102."),
        Item(itemImage: "lamp3", itemName: "Helium Lamp", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$28."),
        Item(itemImage: "floor1", itemName: "Hydrogen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$299."),
        Item(itemImage: "floor2", itemName: "Oxygen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$327."),
        Item(itemImage: "floor3", itemName: "Helium Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$212.")
    ]
    
    let favoriteItems = [
        Item(itemImage: "floor1", itemName: "Hydrogen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$299."),
        Item(itemImage: "floor2", itemName: "Oxygen Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$327."),
        Item(itemImage: "floor3", itemName: "Helium Floor", itemSeller: "Emar", itemDescription: "Ergonomical for humans body curve", itemPrice: "$212.")
    ]
    
}
