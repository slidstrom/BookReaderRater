//
//  BookView.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import SwiftUI

struct BookView: View {
    
    @EnvironmentObject var model:BookModel
    @State private var rating = 2
    var book:Book
    
    
    
    var body: some View {
        
        // Will need another navigation link to get to the scrollable pages view... maybe a button?
        
        
        VStack(spacing: 20){
            // MARK: Read Now and Book Cover (link/button)
            
            
            NavigationLink {
                BookContent(book: book)
            } label: {
                VStack{
                    Text("Read Now!").font(.title2)
                    Image("cover" + String(book.id)).resizable().scaledToFit().padding()
                }
            }
            
            Spacer()
            // MARK: Mark for later text with a star toggle underneath
            Text("Mark for later!")
            Spacer()
            
            // MARK: Star Button
            Button(action: { model.updateFav(forId: book.id) }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
            


            Spacer()
            // MARK: Rating for the Book
            Text("Rate \(book.title)")
            Picker("Rating", selection: $rating){
                ForEach(1..<6){ index in
                    Text("\(index)").tag(index)
                }
            }.pickerStyle(.segmented)
                .onChange(of: rating ,perform: { value in
                    model.updateRating(forId: book.id, rating: rating)
                })
            
            
        }.onAppear{rating = book.rating}
        .padding().navigationBarTitle(book.title)
        
        
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookView(book: model.books[0])
    }
}
