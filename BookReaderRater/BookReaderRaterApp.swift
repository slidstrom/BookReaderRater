//
//  BookReaderRaterApp.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import SwiftUI

@main
struct BookReaderRaterApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryView().environmentObject(BookModel())
        }
    }
}
