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

            Spacer(minLength: 20)
        }
    }
}


struct HomePosts: View {
    var body: some View {
    
        let newPost = [
            Posting(
                id: UUID(), description: "Bag", image: "bag"),
            Posting(
                id: UUID(), description: "Das Leyboard MacTigr", image: "keyboard"),
            Posting(
                id: UUID(), description: "Kids toy (never used!)", image: "kidstoy"),
            Posting(
                id: UUID(), description: "Office Chair", image: "chair"),
            Posting(
                id: UUID(), description: "Cooking pot", image: "pot"),
            Posting(
                id: UUID(), description: "Color pencils", image: "pencilsets"),
            Posting(
                id: UUID(), description: "Moon Lamp Moon Night Light", image: "mood bed light"),
            Posting(
                id: UUID(), description: "2 leg pet dog clothes", image: "dogclothes"),
            Posting(
                id: UUID(), description: "8X10 black rug", image: "carpet")
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
