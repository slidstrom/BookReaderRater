//
//  BookContent.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import SwiftUI

struct BookContent: View {
    
    @EnvironmentObject var model:BookModel
    @State private var page = 0
    var book:Book
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices){ index in
                VStack(alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear{
            page = book.currentPage
        }
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        let book = model.books[0]
        BookContent(book: book)
    }
}
