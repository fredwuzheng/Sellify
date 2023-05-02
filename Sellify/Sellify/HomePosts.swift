//
//  HomePosts.swift
//  Sellify
//
//  Created by Eojin Kim on 4/30/23.
//

import Foundation
import SwiftUI

struct Person {
    
    var name: String
    var grade: String
    var img: String
    var age: Int
    var hometown: String
}

struct Posting: Identifiable {
    var id: UUID
    var description: String
    var category: String
    var image: String
    var contacts: String
    var cost: Double
}

struct PersonView: View{
    var person: Person
    var body: some View{
        HStack{
            VStack{
                Text(person.name).font(.headline)
                Text(person.grade)
                Text(String(person.age))
                Text(person.hometown)
            }.padding(.leading)
            Image(person.img).resizable().scaledToFit().cornerRadius(50).padding(10)
            

        }.background(Color.cyan).cornerRadius(50).padding(.leading)
    }
}

struct PostingView: View {
    var newPost: Posting
    var body: some View {
        VStack {
            
            Image(newPost.image).resizable().scaledToFit()
            Text(newPost.description).multilineTextAlignment(.center)
            let formattedPrice = String(format: "%.2f", newPost.cost)
            Text("$ " + formattedPrice).multilineTextAlignment(.center)
            Text(newPost.contacts).multilineTextAlignment(.center)

            Spacer(minLength: 20)
        }
    }
}

struct PostingView2: View {
    var products: Posting
    var body: some View {
        VStack {
            
            Image(products.image).resizable().scaledToFit()
            Text(products.description).multilineTextAlignment(.center)
            let formattedPrice = String(format: "%.2f", products.cost)
            Text("$ " + formattedPrice).multilineTextAlignment(.center)
            Text(products.contacts).multilineTextAlignment(.center)

            Spacer(minLength: 20)
        }
    }
}


struct HomePosts: View {
    var body: some View {
        
        let newPost = [
            Posting(
                id: UUID(), description: "Bag", category: "Fashion", image: "bag", contacts: "123-456-7890", cost: 50),
            Posting(
                id: UUID(), description: "Das Leyboard MacTigr", category: "Electronics", image: "keyboard", contacts: "734-574-1245", cost: 219),
            Posting(
                id: UUID(), description: "Kids toy (never used!)", category: "Kids", image: "kidstoy", contacts: "123-461-7420", cost: 30),
            Posting(
                id: UUID(), description: "Office Chair", category: "Furniture", image: "chair", contacts: "321-456-4435", cost: 102),
            Posting(
                id: UUID(), description: "Cooking pot", category: "Kitchen", image: "pot", contacts: "133-479-0042", cost: 25),
            Posting(
                id: UUID(), description: "Color pencils", category: "Arts", image: "pencilsets", contacts: "754-456-1324", cost: 10),
            Posting(
                id: UUID(), description: "Moon Lamp Moon Night Light", category: "Home Decor", image: "mood bed light", contacts: "188-093-1296", cost: 42),
            Posting(
                id: UUID(), description: "2 leg pet dog clothes", category: "Pets", image: "dogclothes", contacts: "143-486-7891", cost: 20),
            Posting(
                id: UUID(), description: "8X10 black rug", category: "Home Decor", image: "carpet", contacts: "103-457-7832", cost: 50)
        ]
        
        
        
        
        
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            
        ]
        
        
        //let my_name = Person(name: "", grade: "", img: "", age: , hometown: "")
        
        
        
        
        ScrollView {
            //PersonView(person: my_name)
            Spacer(minLength: 40)
            
            Text("Recent Posts").fontWeight(.heavy)
            Spacer(minLength: 10)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(newPost) { item in
                    
                    PostingView(newPost: item)
                }
            }
            .padding(.horizontal)
        }
        
    }
}


struct Shop: View {
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        
        let categories = ["All", "Arts", "Beauty", "Electronics", "Home Decor", "Fashion", "Furniture", "Kitchen", "Music", "Pets", "Outdoor", "Sports", "Kids"]
        
        let products = [
            Posting(
                id: UUID(), description: "Bag", category: "Fashion", image: "bag", contacts: "123-456-7890", cost: 50),
            Posting(
                id: UUID(), description: "Das Leyboard MacTigr", category: "Electronics", image: "keyboard", contacts: "734-574-1245", cost: 219),
            Posting(
                id: UUID(), description: "Kids toy (never used!)", category: "Kids", image: "kidstoy", contacts: "123-461-7420", cost: 30),
            Posting(
                id: UUID(), description: "Office Chair", category: "Furniture", image: "chair", contacts: "321-456-4435", cost: 102),
            Posting(
                id: UUID(), description: "Cooking pot", category: "Kitchen", image: "pot", contacts: "133-479-0042", cost: 25),
            Posting(
                id: UUID(), description: "Color pencils", category: "Arts", image: "pencilsets", contacts: "754-456-1324", cost: 10),
            Posting(
                id: UUID(), description: "Moon Lamp Moon Night Light", category: "Home Decor", image: "mood bed light", contacts: "188-093-1296", cost: 42),
            Posting(
                id: UUID(), description: "2 leg pet dog clothes", category: "Pets", image: "dogclothes", contacts: "143-486-7891", cost: 20),
            Posting(
                id: UUID(), description: "8X10 black rug", category: "Home Decor", image: "carpet", contacts: "103-457-7832", cost: 50),
            
            // New postings for Arts
            Posting(id: UUID(), description: "Watercolor Paint Set", category: "Arts", image: "paint_set", contacts: "123-456-7890", cost: 25),
            Posting(id: UUID(), description: "Easel Stand", category: "Arts", image: "easel_stand", contacts: "368-834-7890", cost: 80),
            Posting(id: UUID(), description: "Sketch Pad", category: "Arts", image: "sketch_pad", contacts: "123-935-6523", cost: 11),
            Posting(id: UUID(), description: "Acrylic Paint Set", category: "Arts", image: "acrylic_paint_set", contacts: "634-456-7890", cost: 32),
            Posting(id: UUID(), description: "Oil Paint Set", category: "Arts", image: "oil_paint_set", contacts: "135-456-7890", cost: 47),
            Posting(id: UUID(), description: "Drawing Pencils", category: "Arts", image: "drawing_pencils", contacts: "153-456-7434", cost: 15),
            
            // Electronics
            
            Posting(id: UUID(),description: "Smartwatch", category: "Electronics", image: "smartwatch", contacts: "734-574-1245", cost: 300),
            Posting(id: UUID(),description: "Smart TV", category: "Electronics", image: "smart_tv", contacts: "264-456-3522", cost: 2590),
            Posting(id: UUID(),description: "Wireless Charger", category: "Electronics", image: "wireless_charger", contacts: "145-456-3646", cost: 30),
            
            // Beauty
            Posting(id: UUID(),description: "Lipstick", category: "Beauty", image: "lipstick", contacts: "734-574-1245", cost: 50),
            Posting(id: UUID(),description: "Mascara", category: "Beauty", image: "mascara", contacts: "123-456-7890", cost: 32),
            Posting(id: UUID(),description: "Hair Straightener", category: "Beauty", image: "hair_straightener", contacts: "109-456-2750", cost: 20),
            Posting(id: UUID(),description: "Nail Polish", category: "Beauty", image: "nail_polish", contacts: "763-456-0844", cost: 4),
            
            
            
            // Home Decor
            Posting(id: UUID(),description: "Throw Pillow", category: "Home Decor", image: "throw_pillow", contacts: "130-456-1123", cost: 52),
            Posting(id: UUID(),description: "Area Rug", category: "Home Decor", image: "area_rug", contacts: "660-456-6437", cost: 166),
            Posting(id: UUID(),description: "Table Lamp", category: "Home Decor", image: "table_lamp", contacts: "123-456-7890", cost: 79),
            
            
            
            // Fashion
            Posting(id: UUID(),description: "Leather Boots", category: "Fashion", image: "leather_boots", contacts: "572-456-7740", cost: 50),
            Posting(id: UUID(),description: "Denim Jacket", category: "Fashion", image: "denim_jacket", contacts: "734-574-1245", cost: 32),
            Posting(id: UUID(),description: "Turtleneck Sweater", category: "Fashion", image: "turtleneck_sweater", contacts: "580-456-7890", cost: 33),
            
            
            
            // Furniture
            Posting(id: UUID(),description: "Sectional Sofa", category: "Furniture", image: "sectional_sofa", contacts: "664-456-7890", cost: 1700),
            Posting(id: UUID(),description: "Dining Table", category: "Furniture", image: "dining_table", contacts: "734-574-1245", cost: 490),
            Posting(id: UUID(),description: "Bed Frame", category: "Furniture", image: "bed_Frame", contacts: "714-456-7332", cost: 399),
            
            
            
            // Kitchen
            Posting(id: UUID(),description: "Stand Mixer", category: "Kitchen", image: "stand_mixer", contacts: "644-456-7890", cost: 269),
            Posting(id: UUID(),description: "Iron Skillet", category: "Kitchen", image: "iron_skillet", contacts: "734-574-1245", cost: 39),
            Posting(id: UUID(),description: "knife", category: "Kitchen", image: "knife", contacts: "123-456-3315", cost: 50),
            
            
            // New postings for Music
            Posting(id: UUID(), description: "Acoustic Guitar", category: "Music", image: "acoustic_guitar", contacts: "714-456-7860", cost: 200),
            Posting(id: UUID(), description: "Electric Guitar", category: "Music", image: "electric_guitar", contacts: "734-574-1245", cost: 300),
            Posting(id: UUID(), description: "Piano Keyboard", category: "Music", image: "piano_keyboard", contacts: "714-456-0325", cost: 150),
            Posting(id: UUID(), description: "Drum Set", category: "Music", image: "drum_set", contacts: "123-142-7890", cost: 400),
            
            
            // New postings for Pets
            Posting(id: UUID(), description: "Cat Tree", category: "Pets", image: "cat_tree", contacts: "123-456-7890", cost: 100),
            Posting(id: UUID(), description: "Dog Bed", category: "Pets", image: "dog_bed", contacts: "734-574-1305", cost: 40),
            Posting(id: UUID(), description: "Fish Tank", category: "Pets", image: "fish_tank", contacts: "170-456-7890", cost: 120),
            Posting(id: UUID(), description: "Pet Carrier", category: "Pets", image: "pet_carrier", contacts: "142-456-7834", cost: 50),
            
            
            // New postings for Outdoor
            Posting(id: UUID(), description: "Tent", category: "Outdoor", image: "tent", contacts: "123-456-7890", cost: 100),
            Posting(id: UUID(), description: "Sleeping Bag", category: "Outdoor", image: "sleeping_bag", contacts: "734-574-1245", cost: 60),
            Posting(id: UUID(), description: "Camping Chair", category: "Outdoor", image: "camping_chair", contacts: "775-456-7890", cost: 30),
            Posting(id: UUID(), description: "Hiking Backpack", category: "Outdoor", image: "hiking_backpack", contacts: "713-456-7890", cost: 90),
            
            
            // New postings for Sports
            Posting(id: UUID(), description: "Basketball", category: "Sports", image: "basketball", contacts: "645-423-7854", cost: 25),
            Posting(id: UUID(), description: "Soccer Ball", category: "Sports", image: "soccer_ball", contacts: "734-574-8995", cost: 30),
            Posting(id: UUID(), description: "Tennis Racket", category: "Sports", image: "tennis_racket", contacts: "765-456-1123", cost: 70),
            Posting(id: UUID(), description: "Yoga Mat", category: "Sports", image: "yoga_mat", contacts: "114-647-9223", cost: 20),
            
            
            
            
            // New postings for Kids
            Posting(id: UUID(), description: "Stuffed Animal", category: "Kids", image: "stuffed_animal", contacts: "713-456-7770", cost: 20),
            Posting(id: UUID(), description: "Baby Pad", category: "Kids", image: "baby_pad", contacts: "554-456-8462", cost: 30),
            Posting(id: UUID(), description: "Puzzle", category: "Kids", image: "puzzle", contacts: "132-456-1120", cost: 15),
            
            
        ]
        
        var filteredProducts: [Posting] {
            if let selectedCategory = selectedCategory {
                if selectedCategory == "All" {
                    
                    return products
                    
                    //let my_name = Person(name: "", grade: "", img: "", age: , hometown: "")
                    
                    
                    
                } else {
                    return products.filter { $0.category == selectedCategory }
                }
            } else {
                return products
            }
        }
        
        var body: some View {
            VStack {
                Text("Search").font(.largeTitle)
                    .bold()
                HStack {
                    TextField("Search Itmes You Want!", text: $searchText)
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
                                if selectedCategory == category {
                                    selectedCategory = nil
                                } else {
                                    selectedCategory = category
                                }
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
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredProducts.filter {
                            searchText.isEmpty ? true : $0.description.lowercased().contains(searchText.lowercased())
                        }) { product in
                            PostingView2(products: product)
                        }
                    }
                    .padding(.horizontal)
                }
//                ScrollView {
//                    ForEach(filteredProducts.filter {
//                        searchText.isEmpty ? true : $0.description.lowercased().contains(searchText.lowercased())
//                    }) { product in
//                        Text(product.description)
//                    }
//                }
//
            }
        }
    }






