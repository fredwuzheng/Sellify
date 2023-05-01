//
//  Shop.swift
//  Sellify
//
//  Created by Eojin Kim on 5/1/23.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}

struct Shop: View {
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil
    
    let categories = ["All", "Arts", "Beauty", "Books", "Electronics", "Home Decor", "Fashion", "Furniture", "Kitchen", "Movies & TV", "Music", "Pets", "Outdoor", "Sports", "Kids"]
    
    let products = [
        // Electronics
            Product(name: "iPhone 13", category: "Electronics"),
            Product(name: "MacBook Pro", category: "Electronics"),
            Product(name: "AirPods", category: "Electronics"),
            Product(name: "Smartwatch", category: "Electronics"),
            Product(name: "Smart TV", category: "Electronics"),
            Product(name: "Wireless Charger", category: "Electronics"),
            
            // Beauty
            Product(name: "Facial Cleanser", category: "Beauty"),
            Product(name: "Lipstick", category: "Beauty"),
            Product(name: "Mascara", category: "Beauty"),
            Product(name: "Hair Straightener", category: "Beauty"),
            Product(name: "Perfume", category: "Beauty"),
            Product(name: "Nail Polish", category: "Beauty"),
            
            // Books
            Product(name: "To Kill a Mockingbird", category: "Books"),
            Product(name: "The Great Gatsby", category: "Books"),
            Product(name: "1984", category: "Books"),
            Product(name: "The Hobbit", category: "Books"),
            Product(name: "The Catcher in the Rye", category: "Books"),
            Product(name: "Pride and Prejudice", category: "Books"),
            
            // Home Decor
            Product(name: "Throw Pillow", category: "Home Decor"),
            Product(name: "Wall Art", category: "Home Decor"),
            Product(name: "Area Rug", category: "Home Decor"),
            Product(name: "Table Lamp", category: "Home Decor"),
            Product(name: "Decorative Vase", category: "Home Decor"),
            Product(name: "Moon Lamp Moon Night Light", category: "Home Decor"),
            
            // Fashion
            Product(name: "Leather Boots", category: "Fashion"),
            Product(name: "Denim Jacket", category: "Fashion"),
            Product(name: "Turtleneck Sweater", category: "Fashion"),
            Product(name: "Crossbody Bag", category: "Fashion"),
            Product(name: "Sunglasses", category: "Fashion"),
            Product(name: "Scarf", category: "Fashion"),
            
            // Furniture
            Product(name: "Sectional Sofa", category: "Furniture"),
            Product(name: "Dining Table and Chairs", category: "Furniture"),
            Product(name: "Bed Frame and Mattress", category: "Furniture"),
            Product(name: "Bookshelf", category: "Furniture"),
            Product(name: "Coffee Table", category: "Furniture"),
            Product(name: "Accent Table", category: "Furniture"),
            
            // Kitchen
            Product(name: "Stand Mixer", category: "Kitchen"),
            Product(name: "Cast Iron Skillet", category: "Kitchen"),
            Product(name: "Food Processor", category: "Kitchen"),
            Product(name: "Coffee Maker", category: "Kitchen"),
            Product(name: "Blender", category: "Kitchen"),
            Product(name: "Dinnerware Set", category: "Kitchen"),
            
            // Movies & TV
            Product(name: "The Godfather", category: "Movies & TV"),
            Product(name: "Breaking Bad", category: "Movies & TV"),
            Product(name: "Friends", category: "Movies & TV"),
            Product(name: "Game of Thrones", category: "Movies & TV"),
            Product(name: "The Matrix", category: "Movies & TV"),
            Product(name: "The Sopranos", category: "Movies & TV"),
            
            
    ]
    
    var filteredProducts: [Product] {
        if let selectedCategory = selectedCategory {
            if selectedCategory == "All" {
                return products
            } else {
                return products.filter { $0.category == selectedCategory }
            }
        } else {
            return products
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {
                    searchText = ""
                    selectedCategory = nil
                }, label: {
                    Text("Clear")
                })
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .foregroundColor(category == selectedCategory ? .white : .blue)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(category == selectedCategory ? Color.blue : Color(.systemGray6))
                                .cornerRadius(10)
                        })
                    }
                }
            }
            .padding()
            
            ScrollView {
                ForEach(filteredProducts.filter {
                    searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                }) { product in
                    Text(product.name)
                }
            }
            
        }
    }
}
