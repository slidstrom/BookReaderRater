//
//  ContentView.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model:BookModel
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Text("My Library")
                    .bold()
                    .font(.title)
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.books) { book in
                            
                            NavigationLink {
                                BookView(book: book)
                            } label: {
                                BookPreview(book: book)
                            }
                        }
                    }
                }
                
            }
            .navigationBarHidden(true)
            .padding()
            .foregroundColor(.black)
            
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView().environmentObject(BookModel())
    }
}
