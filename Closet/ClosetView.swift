//
//  Closet.swift
//  Closet App
//
//  Created by Destiny Serna on 11/28/20.
//

import SwiftUI

// ClothingItem describes each article of clothing
struct articleOfClothing: Identifiable, Codable {
    let id = UUID()
    var name: String
    var color: String
    var type: String
    var subtype: String
    var favorite: String
    var timesWorn: String
    var condition: String
    var status: String
    var price: String
    var brand: String
    var store: String
    var size: String
    var rating: String
}

// Closet contains a collection of ClothingItems
class Closet: ObservableObject {
    
    // Closet attempts to receive clothes data from UserDefaults
    init() {
        if let clothes = UserDefaults.standard.data(forKey: "Clothes") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([articleOfClothing].self, from: clothes) {
                self.clothes = decoded
                return
            }
        }
        
        // if failed, the clothing collection is set empty.
        self.clothes = []
    }
    
    // changes to the clothes are saved in UserDefaults.
    @Published var clothes = [articleOfClothing]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(clothes) {
                UserDefaults.standard.set(encoded, forKey: "Clothes")
            }
        }
    }
}

// the view
struct ClosetView: View {
    
    // the closet is brought in and accessible across the app
    @ObservedObject var closet = Closet()
    
    // property to bring up new article view
    @State private var showingAddNewArticle = false
    
    var body: some View {
        NavigationView {
            
            // display the name, type, and condition of each article of clothing.
            List {
                ForEach (closet.clothes) {
                    article in
                    HStack {
                        Text(article.name)
                        Spacer()
                        VStack {
                            Text(article.type)
                            Text(article.condition)
                        }
                    }
                }
                .onDelete(perform: deleteClothing)
            }
            .navigationBarTitle("Closet")
            // edit button and button to add new article of clothing
            .navigationBarItems(leading: EditButton(),
                trailing: Button(action: { self.showingAddNewArticle = true
            })
                {
                    Image(systemName: "plus")
            })
        }
        // show new clothing article sheet
        .sheet(isPresented: $showingAddNewArticle) {
            AddNewArticle(closet: self.closet)
        }
    }
    
    // removes article from closet
    func deleteClothing (at offsets: IndexSet) {
        closet.clothes.remove(atOffsets: offsets)
    }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}
