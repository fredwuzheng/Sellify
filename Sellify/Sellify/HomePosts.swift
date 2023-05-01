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
    var image: String
    var contacts: String
    var cost: Int
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
            Text("$ \(newPost.cost)").multilineTextAlignment(.center)
            Text(newPost.contacts).multilineTextAlignment(.center)

            Spacer(minLength: 20)
        }
    }
}


struct HomePosts: View {
    var body: some View {
    
        let newPost = [
            Posting(
                id: UUID(), description: "Bag", image: "bag", contacts: "123-456-7890", cost: 50),
            Posting(
                id: UUID(), description: "Das Leyboard MacTigr", image: "keyboard", contacts: "734-574-1245", cost: 219),
            Posting(
                id: UUID(), description: "Kids toy (never used!)", image: "kidstoy", contacts: "123-461-7420", cost: 30),
            Posting(
                id: UUID(), description: "Office Chair", image: "chair", contacts: "321-456-4435", cost: 102),
            Posting(
                id: UUID(), description: "Cooking pot", image: "pot", contacts: "133-479-0042", cost: 25),
            Posting(
                id: UUID(), description: "Color pencils", image: "pencilsets", contacts: "754-456-1324", cost: 10),
            Posting(
                id: UUID(), description: "Moon Lamp Moon Night Light", image: "mood bed light", contacts: "188-093-1296", cost: 42),
            Posting(
                id: UUID(), description: "2 leg pet dog clothes", image: "dogclothes", contacts: "143-486-7891", cost: 20),
            Posting(
                id: UUID(), description: "8X10 black rug", image: "carpet", contacts: "103-457-7832", cost: 50)
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
