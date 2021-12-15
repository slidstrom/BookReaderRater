//
//  BookPreview.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import SwiftUI

struct BookPreview: View {
    
    var book:Book
    
    var body: some View {
        
        // Create Card Preview
        ZStack {
            Rectangle().foregroundColor(.white)
                .opacity(0.5)
                .cornerRadius(15).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            VStack(alignment: .leading){
                
                HStack{
                    Text(book.title).bold().font(.title)
                    Spacer()
                    
                    // MARK: Show Star if favorited
                    if book.isFavourite {
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                }
                
                Text(book.author).italic()
                
                Image("cover" + String(book.id)).resizable().scaledToFit()
                
                
                
            }.padding()
        }.multilineTextAlignment(.leading).padding()
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book: model.books[0])
    }
}
