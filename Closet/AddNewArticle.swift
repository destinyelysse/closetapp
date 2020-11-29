//
//  AddNewArticle.swift
//  Closet
//
//  Created by Destiny Serna on 11/28/20.
//

import SwiftUI

struct AddNewArticle: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var closet: Closet
    
    @State private var name = ""
    @State private var color = ""
    @State private var type = ""
    @State private var subtype = ""
    @State private var favorite = ""
    @State private var timesWorn = ""
    @State private var condition = ""
    @State private var status = ""
    @State private var price = ""
    @State private var brand = ""
    @State private var store = ""
    @State private var size = ""
    @State private var rating = ""
    
    static let types = ["Shirt", "Pants", "Skirt", "Dress", "Jacket", "Shoes", "Socks", "Accessory"]
    static let conditions = ["New", "Almost New", "Used", "Worn", "H&M"]
    static let sizes = ["xs", "s", "m", "l", "xl"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField ("Name", text: $name)
                TextField ("Color", text: $color)
                TextField ("Type", text: $type)
                TextField ("Subtype", text: $subtype)
                //TextField ("Favorite", text: $favorite)
                //TextField ("Times Worn", text: $timesWorn)
                TextField ("Condition", text: $condition)
                TextField ("Status", text: $status)
                //TextField ("Price", text: $price)
                TextField ("Brand", text: $brand)
                TextField ("Store", text: $store)
                TextField ("Size", text: $size)
                TextField ("Rating", text: $rating)
            }
            .navigationBarTitle("Add New")
            .navigationBarItems(trailing:
                Button("Save"){
                    let article = articleOfClothing(
                        name: self.name,
                        color: self.color,
                        type: self.type,
                        subtype: self.subtype,
                        favorite: self.favorite,
                        timesWorn: self.timesWorn,
                        condition: self.condition,
                        status: self.status,
                        price: self.price,
                        brand: self.brand,
                        store: self.store,
                        size: self.size,
                        rating: self.rating
                    )
                    self.closet.clothes.append(article)
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddNewArticle_Previews: PreviewProvider {
    static var previews: some View {
        AddNewArticle(closet: Closet())
    }
}
